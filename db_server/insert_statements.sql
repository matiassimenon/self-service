-- TEST DATA

-- INSERT USER (ADMIN_USER and REGULAR will be updated too)
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('John', 'Chen', 'jchen', 'jchen@talend.com', 'support', 'atl', '51e962d6ab13595a734614ba35fb5e27', 'APAC', '0', '0', 'What is the first and last name of your first boyfriend or girlfriend?', '7e9986c8debc197bcaf5e94468623b8b');

-- UPDATE USER SET to admin
UPDATE `self_service_db`.`USER` SET `admin`=1 WHERE `username`='jchen';

-- INSERT TEMPLATE
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('1', 'tac601-ubuntu1204-jdk8u151', 'jchen', '2018-03-29', '2018-03-29', 'ubuntu', '12.04', '6.0.1', 'tac', '8', '151', '8.0');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('2', 'tac601-ubuntu1404-jdk8u151', 'jchen', '2018-03-29', '2018-03-29', 'ubuntu', '14.04', '6.0.1', 'tac', '8', '151', '7.0');

-- INSERT REQUESTS
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000001' , '04-03-18', 'fulfilled', '00012345', 'fgalindo', '00000001');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000002' , '04-03-18', 'fulfilled', '00012345', 'fgalindo', '00000002');

-- INSERT IMAGESIMAGE
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('00000001', 'tac601-ubuntu1204-jdk8u151', '00000001.Dockerfile');
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('00000002', 'tac601-ubuntu1404-jdk8u151', '00000002.Dockerfile');

COMMIT;
