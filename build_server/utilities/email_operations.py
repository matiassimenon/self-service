import smtplib

from authentication import credentials as credentials


def send_email(talend_username, message):
    on_behalf_of = credentials.smtp['outlook_send_on_behalf_of']
    sender_email = credentials.smtp['outlook_sender_email']
    sender_password = credentials.smtp['outlook_sender_password']
    receiver_email = talend_username + '@talend.com'
    subject = 'Devops Request'
    smtp_server = credentials.smtp['outlook_smtp_server']
    smtp_port = credentials.smtp['outlook_smtp_port']

    body = '\r\n'.join([f'To: {receiver_email}',
                        f'From: {on_behalf_of}',
                        f'Subject: {subject}',
                        '', message])
    try:
        # Open SMTP connection
        s = smtplib.SMTP(smtp_server, smtp_port)

        # Start TLS for security
        s.ehlo()
        s.starttls()

        # Authentication
        s.login(sender_email, sender_password)

        # Send email
        s.SentOnBehalfOfName = on_behalf_of
        s.sendmail(sender_email, [receiver_email], body)
    except smtplib.SMTPException as e:
        print(f'Email: {e}',  flush=True)
    finally:
        # Terminate the session
        s.quit()


def create_email_dictionary(username, firstname, region, image_name, request):
    email_dictionary = {'<firstname_placeholder>': firstname,
                        '<username_placeholder>': username,
                        '<repository_placeholder>': region,
                        '<image_name_placeholder>': image_name,
                        '<request_placeholder>': request}
    return email_dictionary
