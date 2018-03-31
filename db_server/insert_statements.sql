-- TEST DATA

-- INSERT USER (ADMIN_USER and REGULAR will be updated too)
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`,`city`, `firstname`, `lastname`, `password`, `region`) VALUES ('fgalindo@talend.com', 'fgalindo', 'rnd', '1', '1', 'atl', 'francisco', 'galindo', '5e884898da28047151d0e56f8dc62927', 'US');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('adiallo@talend.com', 'adiallo', 'support', '0', '0', 'atl', 'abdoul', 'diallo', '5e884898da28047151d0e56f8dc62927', 'US');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('nregonda@talend.com', 'nregonda', 'support', '0', '0', 'atl', 'nitesh', 'regonda', '5e884898da28047151d0e56f8dc62927', 'US');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('aarnoult@talend.com', 'aarnoult', 'support', '0', '0', 'sur', 'anne', 'arnoult', '5e884898da28047151d0e56f8dc62927', 'EMEA');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('klokala@talend.com', 'klokala', 'support', '0', '0', 'blr', 'karthick', 'lokala', '5e884898da28047151d0e56f8dc62927', 'APAC');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('cchaumont@talend.com', 'cchaumont', 'escalation', '0', '0', 'irv', 'corinne', 'chaumont', '5e884898da28047151d0e56f8dc62927', 'EMEA');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('djoshi@talend.com', 'djoshi', 'support', '0', '0', 'blr', 'dinesh', 'joshi', '5e884898da28047151d0e56f8dc62927', 'APAC');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('hschueler@talend.com', 'hschueler', 'support', '0', '0', 'irv', 'harrison', 'schueler', '5e884898da28047151d0e56f8dc62927', 'US');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('rohit.patel@talend.com', 'rohit.patel', 'support', '0', '0', 'atl', 'rohit', 'patel', '5e884898da28047151d0e56f8dc62927', 'US');
INSERT INTO `self_service_db`.`USER` (`email`, `username`, `department`, `admin`, `admin_request`, `city`, `firstname`, `lastname`, `password`, `region`) VALUES ('rpatel@talend.com', 'rpatel', 'support', '0', '0', 'blr', 'robin', 'patel', '5e884898da28047151d0e56f8dc62927', 'APAC');

-- UPDATE USER SET to admin
UPDATE `self_service_db`.`USER` SET `admin`=1 WHERE `username`='adiallo';

-- INSERT TEMPLATE
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('123456789', 'tac641-ubuntu16-jdk8u144', 'adiallo', '2017-12-01', '2017-12-01', 'ubuntu', '16.04', '6.4.1', 'tac', '8', '144', '8.5');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('234567890', 'tac641-ubuntu16-jdk8u144', 'fgalindo', '2017-12-01', '2017-12-01', 'ubuntu', '16.04', '6.4.1', 'tac', '8', '144', '8.5');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('345678901', 'tac641-centos73-jdk8u144', 'cchaumont', '2017-12-01', '2017-12-01', 'centos', '7.3', '6.4.1', 'tac', '8', '144', '8.5');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('456789012', 'cmdline621-centos74-jdk8u144', 'aarnoult', '2017-12-01', '2017-12-01', 'centos', '7.4', '6.2.1', 'cmdline', '8', '144');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('567890123', 'jobserver611-ubuntu14-jdk8u144', 'klokala', '2017-12-01', '2017-12-01', 'ubuntu', '14.04', '6.1.1', 'jobserver', '8', '144');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `jdk_version`, `jdk_update`) VALUES ('678901234', 'oracle12c-centos74-jdk8u144', 'djoshi', '2017-12-01', '2017-12-01', 'centos', '7.4', '8', '144');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `jdk_version`, `jdk_update`) VALUES ('789012345', 'mysql57-ubuntu17-jdk8u151', 'hschueler', '2017-12-01', '2017-12-01', 'ubuntu', '17.10', '8', '151');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('890123456', 'cmdline631-centos74-jdk8u144', 'rohit.patel', '2017-12-01', '2017-12-01', 'centos', '7.4', '6.3.1', 'cmdline', '8', '144');
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('901234567', 'cibuilder6341-ubuntu17-jdk8u144', 'rpatel', '2017-12-01', '2017-12-01', 'centos', '17.10', '6.4.1', 'cibuilder', '8', '144');

-- INSERT REQUESTS
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('123456789', '2017-12-02', 'pending', '0001234567', 'fgalindo', '567890123');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('234567890', '2017-12-02', 'fulfilled', '0002345678', 'adiallo', '678901234');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('345678901', '2017-12-02', 'pending', '0001234567', 'nregonda', '789012345');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('456789012', '2017-12-02', 'fulfilled', '0009876543', 'hschueler', '890123456');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('567890123', '2017-12-02', 'pending', '0009878765', 'rpatel', '901234567');


-- INSERT IMAGESIMAGE
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('123456789', 'image-1', 'Dockerfile.1234');
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('234567890', 'image-2', 'Dockerfile.2345');
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('456789012', 'image-3', 'Dockerfile.3456');

COMMIT;
