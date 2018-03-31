import os
import smtplib
import subprocess
import mysql.connector
from shutil import copyfile
import authentication.credentials as credentials

repo_suffix = "repo"
port = '443'
protocol = 'https'
project_dir = '/Users/francisco/talend-dev/self-service/build_server'
docker_utils_dir = f'{project_dir}/docker_utils'
templates_dir = f'{docker_utils_dir}/templates'
docker_build_dir = f'{docker_utils_dir}/docker_build'
docker_user = credentials.docker['docker_user']
docker_password = credentials.docker['docker_password']
email_file = 'email_template.txt'


def handle_request(request):
    username = request['username']
    firstname = request['firstname']
    user_region = request['region']
    template_dictionary = create_request_dictionary(request)
    template_name = request['template_name']
    request_uuid = request['request_uuid']
    talend_component = request['talend_component']

    dockerfile_name = request_uuid + '.Dockerfile'

    is_dockerfile_present = create_dockerfile_template_copy(talend_component, dockerfile_name)

    # Re-routing push depending on users's Region.
    if user_region == 'apac' or user_region == 'APAC':
        repo = 'apac'
        is_repo_valid = True
    elif user_region == 'emea' or user_region == 'EMEA':
        repo = 'emea'
        is_repo_valid = True
    elif user_region == 'us' or user_region == 'US':
        repo = 'us'
        is_repo_valid = True
    else:
        is_repo_valid = False

    if is_dockerfile_present and is_repo_valid:
        replace_placeholders_in_file(f'{docker_build_dir}/{talend_component}', dockerfile_name, template_dictionary)
        # build
        try:
            print(f"cd {docker_build_dir}/{talend_component}; "
                     f"docker build -f {dockerfile_name} "
                     f"-t {repo}-{repo_suffix}:{port}/{username}/{template_name} .")

            update_request_status('processing', request_uuid)

            bash_cmd(f"cd {docker_build_dir}/{talend_component}; "
                     f"docker build -f {dockerfile_name} "
                     f"-t {repo}-{repo_suffix}:{port}/{username}/{template_name} .")
            # login
            bash_cmd(f"docker login {protocol}://{repo}-{repo_suffix}:{port} "
                     f"-u {docker_user} -p {docker_password}")
            # push
            bash_cmd(f"cd {docker_build_dir}; "
                     f"docker push {repo}-{repo_suffix}:{port}/{username}/{template_name}")
        except subprocess.CalledProcessError as e:
            update_request_status('error', request_uuid)
            print(e.output)


    # Remove dockerfile
    bash_cmd(f"sudo rm -rf {docker_build_dir}/{talend_component}/{dockerfile_name}")

    # Crete email dictionary
    email_dictionary = create_email_dictionary(firstname.capitalize(), user_region.lower(), template_name)

    # Email template
    email_template_string = file_into_string(f'{templates_dir}/email', email_file)
    email_message = replace_placeholders_in_string(email_template_string, email_dictionary)
    send_email_to_user(username, email_message)

    # Update Request Status
    update_request_status('fulfilled', request_uuid)


def create_email_dictionary(firstname, region, image_name):
    email_dictionary = {'<firstname_placeholder>': firstname,
                        '<repository_placeholder>': region,
                        '<image_name_placeholder>': image_name}

    return email_dictionary


def send_email_to_user(talend_username, message):
    sender = credentials.smtp['outlook_send_on_behalf_of']
    sender_email = credentials.smtp['outlook_sender_email']
    sender_email_password = credentials.smtp['outlook_sender_password']
    receiver_email = talend_username + '@talend.com'
    subject = 'Devops Request'
    smtp_server = credentials.smtp['outlook_smtp_server']
    smtp_port = credentials.smtp['outlook_smtp_port']

    body = '\r\n'.join([f'To: {receiver_email}',
                        f'From: {sender}',
                        f'Subject: {subject}',
                        '', message])

    # creates SMTP session in Outlook
    s = smtplib.SMTP(smtp_server, smtp_port)

    # start TLS for security
    s.ehlo()
    s.starttls()
    s.ehlo()

    # Authentication
    s.login(sender_email, sender_email_password)

    # Sending the email
    try:
        s.SentOnBehalfOfName = sender
        s.sendmail(sender_email, [receiver_email], body)
        print(f'Email sent to {talend_username}')
    except ValueError:
        print('Error sending email')

    # terminating the session
    s.quit()


def create_request_dictionary(request):
    op_sys = request['os']
    os_version = request['os_version']
    talend_component = request['talend_component']
    talend_semantic_version = request['talend_version']
    jdk_version = request['jdk_version']
    jdk_update = request['jdk_update']
    jdk_distro_arch = 'linux-x64'
    jdk_build = None
    tomcat_version = request['tomcat_version']
    talend_installer = None
    talend_version = None
    update_os_and_install_tools = None
    add_executables_to_path = None
    clean_cached_files = None

    _601_version = '20150908_1633-V6.0.1'
    _611_version = '20151214_1327-V6.1.1'
    _621_version = '20160704_1411-V6.2.1'
    _631_version = '20161216_1026-V6.3.1'
    _641_version = '20170623_1246-V6.4.1'
    _651_version = '20180116_1512-V6.5.1'
    
    if tomcat_version == '7' or tomcat_version == '7.0':
        # http://mirror.reverse.net/pub/apache/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.tar.gz
        tomcat_major = '7'
        tomcat_version = '7.0.85'
    elif tomcat_version == '8' or tomcat_version == '8.0':
        # http://mirror.reverse.net/pub/apache/tomcat/tomcat-8/v8.0.50/bin/apache-tomcat-8.0.50.tar.gz
        tomcat_major = '8'
        tomcat_version = '8.0.50'
    elif tomcat_version == '8.5':
        # http://mirror.reverse.net/pub/apache/tomcat/tomcat-8/v8.5.29/bin/apache-tomcat-8.5.29.tar.gz
        tomcat_major = '8'
        tomcat_version = '8.5.29'
    elif tomcat_version == '9' or tomcat_version == '9.0':
        # http://mirror.reverse.net/pub/apache/tomcat/tomcat-9/v9.0.6/bin/apache-tomcat-9.0.6.tar.gz
        tomcat_major = '9'
        tomcat_version = '9.0.6'
    else:
        tomcat_major = None
        tomcat_version = None

    if jdk_version == '8':
        if jdk_update == '141':
            jdk_build = 'b15'
        elif jdk_update == '144':
            jdk_build = 'b01'
        elif jdk_update == '152':
            jdk_build = 'b16'
        elif jdk_update == '151' or jdk_update == '161' or jdk_update == '162':
            jdk_build = 'b12'

    if op_sys == 'centos':

        if os_version == '7.4':
            os_version = os_version + '.1708'
        elif os_version == '7.3':
            os_version = os_version + '.1611'
        elif os_version == '7.2':
            os_version = os_version + '.1511'
        elif os_version == '7.1':
            os_version = os_version + '.1503'
        elif os_version == '7.0':
            os_version = os_version + '.1406'

        update_os_and_install_tools = 'yum update -y && ' \
                                      'yum install -y wget tar unzip vim'

        add_executables_to_path = 'alternatives --install "/usr/bin/java" "java" "/opt/java/bin/java" 1 && ' \
                                  'alternatives --set "java" "/opt/java/bin/java" && ' \
                                  'alternatives --install "/usr/bin/javac" "javac" "/opt/java/bin/javac" 1 && ' \
                                  'alternatives --set "javac" "/opt/java/bin/javac" && ' \
                                  'alternatives --install "/usr/bin/keytool" "keytool" "/opt/java/bin/keytool" 1 && ' \
                                  'alternatives --set "keytool" "/opt/java/bin/keytool" '
        clean_cached_files = 'yum clean all'
    elif op_sys == 'ubuntu':

        if os_version == '14':
            os_version = '14.04'
        elif os_version == '16':
            os_version = '16.04'
        elif os_version == '17':
            os_version = '17.10'
        elif os_version == '18':
            os_version = '18.04'

        update_os_and_install_tools = 'apt-get update && ' \
                                      'apt-get install -y software-properties-common wget tar unzip vim'
        add_executables_to_path = 'update-alternatives --install "/usr/bin/java" "java" "/opt/java/bin/java" 1 && ' \
                                  'update-alternatives --set "java" "/opt/java/bin/java" && ' \
                                  'update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/bin/javac" 1 && ' \
                                  'update-alternatives --set "javac" "/opt/java/bin/javac" && ' \
                                  'update-alternatives --install "/usr/bin/keytool" ' \
                                  '"keytool" "/opt/java/bin/keytool" 1 && ' \
                                  'update-alternatives --set "keytool" "/opt/java/bin/keytool" '
        clean_cached_files = 'apt-get clean all'

    if talend_semantic_version == '6.0.1':
        talend_version = '601'
        if talend_component == 'tac':
            talend_installer = 'Talend-AdministrationCenter-' + _601_version
        elif talend_component == 'cmdline':
            talend_installer = 'Talend-Studio-' + _601_version
        elif talend_component == 'jobserver':
            talend_installer = 'Talend-JobServer-' + _601_version
    elif talend_semantic_version == '6.1.1':
        talend_version = '611'
        if talend_component == 'tac':
            talend_installer = 'Talend-AdministrationCenter-' + _611_version
        elif talend_component == 'cmdline':
            talend_installer = 'Talend-Studio-' + _611_version
        elif talend_component == 'jobserver':
            talend_installer = 'Talend-JobServer-' + _611_version
    elif talend_semantic_version == '6.2.1':
        talend_version = '621'
        if talend_component == 'tac':
            talend_installer = 'Talend-AdministrationCenter-' + _621_version
        elif talend_component == 'cmdline':
            talend_installer = 'Talend-Studio-' + _621_version
        elif talend_component == 'jobserver':
            talend_installer = 'Talend-JobServer-' + _621_version
    elif talend_semantic_version == '6.3.1':
        talend_version = '631'
        if talend_component == 'tac':
            talend_installer = 'Talend-AdministrationCenter-' + _631_version
        elif talend_component == 'cmdline':
            talend_installer = 'Talend-Studio-' + _631_version
        elif talend_component == 'jobserver':
            talend_installer = 'Talend-JobServer-' + _631_version
    elif talend_semantic_version == '6.4.1':
        talend_version = '641'
        if talend_component == 'tac':
            talend_installer = 'Talend-AdministrationCenter-' + _641_version
        elif talend_component == 'cmdline':
            talend_installer = 'Talend-Studio-' + _641_version
        elif talend_component == 'jobserver':
            talend_installer = 'Talend-JobServer-' + _641_version
    elif talend_semantic_version == '6.5.1':
        talend_version = '651'
        if talend_component == 'tac':
            talend_installer = 'Talend-AdministrationCenter-' + _651_version
        elif talend_component == 'cmdline':
            talend_installer = 'Talend-Studio-' + _651_version
        elif talend_component == 'jobserver':
            talend_installer = 'Talend-JobServer-' + _651_version

    template_dictionary = {'<os_placeholder>': op_sys,
                           '<os_version_placeholder>': os_version,
                           '<update_os_and_install_tools_placeholder>': update_os_and_install_tools,
                           '<jdk_version_placeholder>': jdk_version,
                           '<jdk_update_placeholder>': jdk_update,
                           '<jdk_build_placeholder>': jdk_build,
                           '<jdk_distro_arch_placeholder>': jdk_distro_arch,
                           '<add_executables_to_path_place_holder>': add_executables_to_path,
                           '<clean_cached_files_placeholder>': clean_cached_files,
                           '<talend_installer_placeholder>': talend_installer,
                           '<talend_version_placeholder>': talend_version,
                           '<talend_semantic_version_placeholder>': talend_semantic_version,
                           '<tomcat_major_placeholder>': tomcat_major,
                           '<tomcat_version_placeholder>': tomcat_version}

    return template_dictionary


# Function to check that the needed templates exist
def is_file_present(absolute_path):
    return os.path.isfile(absolute_path)


# Function to run bash commands
def bash_cmd(cmd):
    # Captures output
    result = subprocess.check_output(cmd, shell=True)
    return result.decode('utf-8')


def create_dockerfile_template_copy(talend_component, dockerfile_name):
    if talend_component == 'tac' or talend_component == 'cmdline' or talend_component == 'jobserver':
        if is_file_present(f'{templates_dir}/{talend_component}/template.Dockerfile'):
            copyfile(f'{templates_dir}/{talend_component}/template.Dockerfile',
                     f'{docker_build_dir}/{talend_component}/{dockerfile_name}')
            return True
        else:
            return False
    else:
        return False


def replace_placeholders_in_file(path, filename, dictionary):
    if is_file_present(f'{path}/{filename}'):
        temp_str = file_into_string(path, filename)
        new_str = replace_placeholders_in_string(temp_str, dictionary)

        file_out = open(path + '/' + filename, 'w')
        file_out.write(new_str)
        file_out.close()


def file_into_string(path, filename):
    if filename:
        file_object = open(f'{path}/{filename}', 'r')
        string_from_file = file_object.read()
        file_object.close()

    return string_from_file


def replace_placeholders_in_string(file_string, dictionary):
    for text_to_search, replacement_text in dictionary.items():
        # print(f'text to search: {text_to_search}')
        # print(f'replacement_text: {replacement_text}')
        # print("")

        if replacement_text is not None:
            file_string = file_string.replace(text_to_search, replacement_text)
    return file_string


def update_request_status(status, request_uuid):
    print(status, request_uuid)
    mysql_cnx = mysql.connector.connect(**credentials.config)

    try:
        cursor = mysql_cnx.cursor(dictionary=True)

        cursor.execute('UPDATE `self_service_db`.`REQUEST` SET `request_status`= %s WHERE `request_uuid`= %s;',
                       (status, request_uuid))
        mysql_cnx.commit()
    except mysql_cnx.Error as e:
        print(e)