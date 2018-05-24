-- TEST DATA

-- INSERT INTO USER (ADMIN_USER and REGULAR will be updated too)
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('Francisco', 'Duran', 'fgalindo', 'fgalindo@talend.com', 'devops', 'atl', '5e884898da28047151d0e56f8dc62927', 'US', '0', '0', '', '');
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('Abdoul Karim', 'Diallo', 'adiallo', 'fadiallo@talend.com', 'escalation', 'atl', '5e884898da28047151d0e56f8dc62927', 'US', '0', '0', '', '');
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('AiMing', 'Chen', 'achen', 'achen@talend.com', 'escalation', 'atl', '5e884898da28047151d0e56f8dc62927', 'APAC', '0', '0', '', '');

-- UPDATE USER SET to admin
UPDATE `self_service_db`.`USER` SET `admin`='1' WHERE `username`='fgalindo';

-- INSERT INTO TEMPLATE and TALEND_TEMPLATE
-- UBUNTU

-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000001', 'tac6.0.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000001', 'ubuntu', '12.04', '6.0.1', 'tac', '8', '151', '8.0');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000002', 'tac6.1.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000002', 'ubuntu', '14.04', '6.1.1', 'tac', '8', '151', '8.0');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000003', 'tac6.2.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000003', 'ubuntu', '16.04', '6.2.1', 'tac', '8', '151', '7.0');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000004', 'tac6.3.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000004', 'ubuntu', '16.04', '6.3.1', 'tac', '8', '151', '8.0');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000005', 'tac6.4.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`,`os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000005', 'ubuntu', '14.04', '6.4.1', 'tac', '8', '151', '7.0');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000006', 'tac6.5.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000006', 'ubuntu', '12.04', '6.5.1', 'tac', '8', '151', '8.0');

-- CENTOS
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000007', 'tac6.0.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000007', 'centos', '6.6', '6.0.1', 'tac', '8', '151', '8.0');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000008', 'tac6.1.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000008', 'centos', '6.6', '6.1.1', 'tac', '8', '151', '8.0');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000009', 'tac6.2.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000009', 'centos', '6.7', '6.2.1', 'tac', '8', '151', '7.0');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000010', 'tac6.3.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000010', 'centos', '6.7', '6.3.1', 'tac', '8', '151', '8.0');

-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000011', 'tac6.4.1-centos6.8-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000011', 'centos', '6.8', '6.4.1', 'tac', '8', '151', '8.0');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000012', 'tac6.5.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000012', 'centos', '6.7', '6.5.1', 'tac', '8', '151', '8.0');

-- INSERT INTO TEMPLATE and DB_TEMPLATE
-- UBUNTU
-- MySQL
-- 8.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000013', 'mysql80-ubuntu1204-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000013', 'ubuntu', '12.04', '8.0', 'mysql');
-- 5.7
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000014', 'mysql80-ubuntu1404-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000014', 'ubuntu', '14.04', '5.7', 'mysql');
-- 5.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000015', 'mysql80-ubuntu1604-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000015', 'ubuntu', '16.04', '5.6', 'mysql');
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000016', 'mysql80-ubuntu1710-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000016', 'ubuntu', '17.10', '5.5', 'mysql');

-- ORACLE LINUX
-- Oracle
-- 11.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000017', 'oracle11.2-oraclelinux7.slim-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000017', 'oraclelinux', '7.slim', '11.2', 'oracle');
-- 12.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000018', 'oracle12.1-oraclelinux7.slim-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000018', 'oraclelinux', '7.slim', '12.1', 'oracle');
-- 12.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000019', 'oracle12.2-oraclelinux7.slim-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000019', 'oraclelinux', '7.slim', '12.2', 'oracle');

-- CENTOS
-- IBM DB2 Express-c
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000020', 'db2expressc10.5-centos7.1-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000020', 'centos', '7.1', 'db2expressc', '10.5');

-- UBUNTU
-- PostgreSQL
-- 10.4
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000021', 'postgresql10.4-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000021', 'ubuntu', '12.04', '8.0', 'postgresql');
-- 9.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000022', 'postgresql9.6-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000022', 'ubuntu', '14.04', '5.7', 'postgresql');
-- 9.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000023', 'postgresql9.5-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000023', 'ubuntu', '16.04', '5.6', 'postgresql');
-- 9.4
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000024', 'postgresql9.4-ubuntu17.10-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000024', 'ubuntu', '17.10', '5.5', 'postgresql');
-- 9.3
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000025', 'postgresql9.3-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000025', 'ubuntu', '12.04', '5.5', 'postgresql');


-- MariaDB
-- 10.3
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000026', 'mariadb10.3-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000026', 'ubuntu', '12.04', '10.3', 'mariadb');
-- 10.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000027', 'mariadb10.2-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000027', 'ubuntu', '14.04', '10.2', 'mariadb');
-- 10.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000028', 'mariadb10.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000028', 'ubuntu', '16.04', '10.1', 'mariadb');
-- 10.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000029', 'mariadb10.0-ubuntu17.10-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000029', 'ubuntu', '17.10', '10.0', 'mariadb');
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000030', 'mariadb5.5-ubuntu17.10-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000030', 'ubuntu', '17.10', '5.5', 'mariadb');


-- INSERT REQUESTS
-- Ubuntu and Centos Requests
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000001' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000001');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000002' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000002');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000003' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000003');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000004' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000004');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000005' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000005');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000006' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000006');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000007' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000007');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000008' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000008');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000009' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000009');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000010' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000010');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000011' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000011');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000012' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000012');

-- INSERT INTO IMAGES
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('00000001', 'tac601-ubuntu1204-jdk8u151', '00000001.Dockerfile');
INSERT INTO `self_service_db`.`IMAGE` (`template_uuid`, `image_name`, `dockerfile_name`) VALUES ('00000002', 'tac601-ubuntu1404-jdk8u151', '00000002.Dockerfile');

COMMIT;
