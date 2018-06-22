-- TEST DATA

-- INSERT INTO USER (ADMIN_USER and REGULAR will be updated too)
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('Francisco', 'Duran', 'fgalindo', 'fgalindo@talend.com', 'devops', 'atl', '5e884898da28047151d0e56f8dc62927', 'US', '0', '0', '', '');
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('Abdoul Karim', 'Diallo', 'adiallo', 'adiallo@talend.com', 'escalations', 'atl', '5e884898da28047151d0e56f8dc62927', 'US', '0', '0', '', '');
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('AiMing', 'Chen', 'achen', 'achen@talend.com', 'escalations', 'atl', '5e884898da28047151d0e56f8dc62927', 'APAC', '0', '0', '', '');

-- UPDATE USER SET to admin
UPDATE `self_service_db`.`USER` SET `admin`='1' WHERE `username`='fgalindo';


-- INSERT INTO TEMPLATE and TALEND_TEMPLATE

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
-- MySQL
-- 8.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000013', 'mysql8.0-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000013', 'debian', '9-slim', '8.0', 'mysql');
-- 5.7
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000014', 'mysql5.7-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000014', 'debian', '9-slim', '5.7', 'mysql');
-- 5.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000015', 'mysql5.6-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000015', 'debian', '9-slim', '5.6', 'mysql');
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000016', 'mysql5.5-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000016', 'debian', '9-slim', '5.5', 'mysql');

-- Oracle
-- 11.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000017', 'oracle11.2-oraclelinux7.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000017', 'oraclelinux', '7-slim', '11.2', 'oracle');
-- 12.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000018', 'oracle12.1-oraclelinux7.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000018', 'oraclelinux', '7-slim', '12.1', 'oracle');
-- 12.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000019', 'oracle12.2-oraclelinux7.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000019', 'oraclelinux', '7-slim', '12.2', 'oracle');

-- IBM DB2 Express-C
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000020', 'ibmdb2expressc10.5-centos7', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000020', 'centos', '7.1', '10.5', 'ibmdb2expressc');

-- PostgreSQL
-- 9.3
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000021', 'postgres9.3-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000021', 'debian', '9-slim', '9.3', 'postgres');
-- 9.4
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000022', 'postgres9.4-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000022', 'debian', '9-slim', '9.4', 'postgres');
-- 9.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000023', 'postgres9.5-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000023', 'debian', '9-slim', '9.5', 'postgres');
-- 9.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000024', 'postgres9.6-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000024', 'debian', '9-slim', '9.6', 'postgres');
-- 10
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000025', 'postgres10-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000025', 'debian', '9-slim', '10', 'postgres');
-- 11
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000026', 'postgres11-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000026', 'debian', '9-slim', '11', 'postgres');

-- MariaDB
-- 10.3
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000027', 'mariadb10.3-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000027', 'debian', '8', '10.3', 'mariadb');
-- 10.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000028', 'mariadb10.2-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000028', 'debian', '8', '10.2', 'mariadb');
-- 10.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000029', 'mariadb10.1-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000029', 'debian', '8', '10.1', 'mariadb');
-- 10.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000030', 'mariadb10.0-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000030', 'debian', '8', '10.0', 'mariadb');
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000031', 'mariadb5.5-debian7', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000031', 'debian', '7', '5.5', 'mariadb');

-- Apache Cassandra
-- 2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000032', 'cassandra2.1-debian8.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000032', 'debian', '8-slim', '2.1', 'cassandra');
-- 2.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000033', 'cassandra2.2-debian8.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000033', 'debian', '8-slim', '2.2', 'cassandra');
-- 3.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000034', 'cassandra3.0-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000034', 'debian', '9-slim', '3.0', 'cassandra');
-- 3.11
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000035', 'cassandra3.11-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000035', 'debian', '9-slim', '3.11', 'cassandra');

-- MongoDB
-- 3.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000036', 'mongo3.2-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000036', 'debian', '7', '3.2', 'mongo');
-- 3.4
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000037', 'mongo3.4-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000037', 'debian', '7', '3.4', 'mongo');
-- 3.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000038', 'mongo3.6-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000038', 'debian', '7', '3.6', 'mongo');
-- 3.7
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000039', 'mongo3.7-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000039', 'debian', '7', '3.7', 'mongo');
-- 4.0.rc
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000040', 'mongo4.0.rc-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000040', 'debian', '7', '4.0-rc', 'mongo');


-- INSERT REQUESTS
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
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000013' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000013');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000014' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000014');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000015' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000015');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000016' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000016');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000017' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000017');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000018' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000018');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000019' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000019');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000020' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000020');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000021' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000021');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000022' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000022');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000023' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000023');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000024' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000024');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000025' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000025');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000026' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000026');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000027' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000027');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000028' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000028');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000029' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000029');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000030' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000030');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000031' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000031');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000032' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000032');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000033' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000033');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000034' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000034');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000035' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000035');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000036' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000036');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000037' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000037');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000038' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000038');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000039' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000039');

COMMIT;
