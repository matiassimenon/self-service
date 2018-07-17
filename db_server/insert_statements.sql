-- TEST DATA

-- INSERT INTO USER (ADMIN_USER and REGULAR will be updated too)
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('Francisco', 'Duran', 'fgalindo', 'fgalindo@talend.com', 'devops', 'atl', '5e884898da28047151d0e56f8dc62927', 'US', '0', '0', '', '');
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('Abdoul Karim', 'Diallo', 'adiallo', 'adiallo@talend.com', 'escalations', 'atl', '5e884898da28047151d0e56f8dc62927', 'US', '0', '0', '', '');
INSERT INTO `self_service_db`.`USER` (`firstname`, `lastname`, `username`, `email`, `department`, `city`, `password`, `region`, `admin`, `admin_request`, `question`, `answer`) VALUES ('AiMing', 'Chen', 'achen', 'achen@talend.com', 'escalations', 'atl', '5e884898da28047151d0e56f8dc62927', 'APAC', '0', '0', '', '');

-- UPDATE USER SET to admin
UPDATE `self_service_db`.`USER` SET `admin`='1' WHERE `username`='fgalindo';


-- INSERT INTO TEMPLATE and TALEND_TEMPLATE

-- TAC ------------------------------------------------------------------
-- ubuntu
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
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000007', 'tac7.0.1-ubuntu17.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000007', 'ubuntu', '17.04', '7.0.1', 'tac', '8', '151', '8.0');

-- centos
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000008', 'tac6.0.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000008', 'centos', '6.6', '6.0.1', 'tac', '8', '151', '8.0');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000009', 'tac6.1.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000009', 'centos', '6.6', '6.1.1', 'tac', '8', '151', '8.0');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000010', 'tac6.2.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000010', 'centos', '6.7', '6.2.1', 'tac', '8', '151', '7.0');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000011', 'tac6.3.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000011', 'centos', '6.7', '6.3.1', 'tac', '8', '151', '8.0');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000012', 'tac6.4.1-centos6.8-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000012', 'centos', '6.8', '6.4.1', 'tac', '8', '151', '8.0');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000013', 'tac6.5.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000013', 'centos', '6.7', '6.5.1', 'tac', '8', '151', '8.0');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000014', 'tac7.0.1-centos7.4-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000014', 'centos', '7.4', '7.0.1', 'tac', '8', '151', '8.0');


-- MDM -----------------------------------------------------------------
-- ubuntu
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000015', 'mdm6.0.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000015', 'ubuntu', '12.04', '6.0.1', 'mdm', '8', '151', '8.0');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000016', 'mdm6.1.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000016', 'ubuntu', '14.04', '6.1.1', 'mdm', '8', '151', '8.0');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000017', 'mdm6.2.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000017', 'ubuntu', '16.04', '6.2.1', 'mdm', '8', '151', '7.0');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000018', 'mdm6.3.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000018', 'ubuntu', '16.04', '6.3.1', 'mdm', '8', '151', '8.0');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000019', 'mdm6.4.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`,`os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000019', 'ubuntu', '14.04', '6.4.1', 'mdm', '8', '151', '7.0');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000020', 'mdm6.5.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000020', 'ubuntu', '12.04', '6.5.1', 'mdm', '8', '151', '8.0');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000021', 'mdm7.0.1-ubuntu17.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000021', 'ubuntu', '17.04', '7.0.1', 'mdm', '8', '151', '8.0');

-- centos
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000022', 'mdm6.0.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000022', 'centos', '6.6', '6.0.1', 'mdm', '8', '151', '8.0');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000023', 'mdm6.1.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000023', 'centos', '6.6', '6.1.1', 'mdm', '8', '151', '8.0');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000024', 'mdm6.2.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000024', 'centos', '6.7', '6.2.1', 'mdm', '8', '151', '7.0');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000025', 'mdm6.3.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000025', 'centos', '6.7', '6.3.1', 'mdm', '8', '151', '8.0');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000026', 'mdm6.4.1-centos6.8-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000026', 'centos', '6.8', '6.4.1', 'mdm', '8', '151', '8.0');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000027', 'mdm6.5.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000027', 'centos', '6.7', '6.5.1', 'mdm', '8', '151', '8.0');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000028', 'mdm6.5.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`, `tomcat_version`) VALUES ('00000028', 'centos', '6.7', '6.5.1', 'mdm', '8', '151', '8.0');


-- Runtime  ------------------------------------------------------------
-- ubuntu
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000029', 'runtime6.0.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000029', 'ubuntu', '12.04', '6.0.1', 'runtime', '8', '151');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000030', 'runtime6.1.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000030', 'ubuntu', '14.04', '6.1.1', 'runtime', '8', '151');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000031', 'runtime6.2.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000031', 'ubuntu', '16.04', '6.2.1', 'runtime', '8', '151');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000032', 'runtime6.3.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000032', 'ubuntu', '16.04', '6.3.1', 'runtime', '8', '151');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000033', 'runtime6.4.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`,`os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000033', 'ubuntu', '14.04', '6.4.1', 'runtime', '8', '151');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000034', 'runtime6.5.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000034', 'ubuntu', '12.04', '6.5.1', 'runtime', '8', '151');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000035', 'runtime7.0.1-ubuntu17.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000035', 'ubuntu', '17.04', '7.0.1', 'runtime', '8', '151');

-- centos
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000036', 'runtime6.0.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000036', 'centos', '6.6', '6.0.1', 'runtime', '8', '151');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000037', 'runtime6.1.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000037', 'centos', '6.6', '6.1.1', 'runtime', '8', '151');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000038', 'runtime6.2.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000038', 'centos', '6.7', '6.2.1', 'runtime', '8', '151');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000039', 'runtime6.3.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000039', 'centos', '6.7', '6.3.1', 'runtime', '8', '151');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000040', 'runtime6.4.1-centos6.8-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000040', 'centos', '6.8', '6.4.1', 'runtime', '8', '151');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000041', 'runtime6.5.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000041', 'centos', '6.7', '6.5.1', 'runtime', '8', '151');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000042', 'runtime7.0.1-centos7.4-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000042', 'centos', '7.4', '7.0.1', 'runtime', '8', '151');


-- Log Server  --------------------------------------------------------
-- ubuntu
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000029', 'logserver6.0.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000029', 'ubuntu', '12.04', '6.0.1', 'logserver', '8', '151');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000030', 'logserver6.1.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000030', 'ubuntu', '14.04', '6.1.1', 'logserver', '8', '151');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000031', 'logserver6.2.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000031', 'ubuntu', '16.04', '6.2.1', 'logserver', '8', '151');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000032', 'logserver6.3.1-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000032', 'ubuntu', '16.04', '6.3.1', 'logserver', '8', '151');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000033', 'logserver6.4.1-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`,`os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('000000033', 'ubuntu', '14.04', '6.4.1', 'logserver', '8', '151');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000034', 'logserver6.5.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000034', 'ubuntu', '12.04', '6.5.1', 'logserver', '8', '151');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000035', 'logserver7.0.1-ubuntu17.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000035', 'ubuntu', '17.04', '7.0.1', 'logserver', '8', '151');

-- centos
-- 6.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000036', 'logserver6.0.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000036', 'centos', '6.6', '6.0.1', 'logserver', '8', '151');
-- 6.1.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000037', 'logserver6.1.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000037', 'centos', '6.6', '6.1.1', 'logserver', '8', '151');
-- 6.2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000038', 'logserver6.2.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000038', 'centos', '6.7', '6.2.1', 'logserver', '8', '151');
-- 6.3.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000039', 'logserver6.3.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000039', 'centos', '6.7', '6.3.1', 'logserver', '8', '151');
-- 6.4.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000040', 'logserver6.4.1-centos6.8-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000040', 'centos', '6.8', '6.4.1', 'logserver', '8', '151');
-- 6.5.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000041', 'logserver6.5.1-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000041', 'centos', '6.7', '6.5.1', 'logserver', '8', '151');
-- 7.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000042', 'logserver7.0.1-centos7.4-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000042', 'centos', '7.4', '7.0.1', 'logserver', '8', '151');


-- Remote Engine  --------------------------------------------------
-- ubuntu
-- 2.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000043', 'remoteengine2.0.1-ubuntu12.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000043', 'ubuntu', '12.04', '2.0.1', 'remoteengine', '8', '151');
-- 2.1.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000044', 'remoteengine2.1.0-ubuntu14.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000044', 'ubuntu', '14.04', '2.1.0', 'remoteengine', '8', '151');
-- 2.2.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000045', 'remoteengine2.2.0-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000045', 'ubuntu', '16.04', '2.2.0', 'remoteengine', '8', '151');
-- 2.3.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000046', 'remoteengine2.3.0-ubuntu16.04-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000046', 'ubuntu', '16.04', '2.3.0', 'remoteengine', '8', '151');

-- centos
-- 2.0.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000047', 'remoteengine2.0.1-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000047', 'centos', '6.6', '2.0.1', 'remoteengine', '8', '151');
-- 2.1.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000048', 'remoteengine2.1.0-centos6.6-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000048', 'centos', '6.6', '2.1.0', 'remoteengine', '8', '151');
-- 2.2.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000049', 'remoteengine2.2.0-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000049', 'centos', '6.7', '2.2.0', 'remoteengine', '8', '151');
-- 2.3.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000050', 'remoteengine2.3.0-centos6.7-jdk8u151', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`TALEND_TEMPLATE` (`template_uuid`, `os`, `os_version`, `talend_version`, `talend_component`, `jdk_version`, `jdk_update`) VALUES ('00000050', 'centos', '6.7', '2.3.0', 'remoteengine', '8', '151');


-- INSERT INTO TEMPLATE and DB_TEMPLATE
-- MySQL --------------------------------------------------------------
-- 8.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000051', 'mysql8.0-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000051', 'debian', '9-slim', '8.0', 'mysql');
-- 5.7
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000052', 'mysql5.7-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000052', 'debian', '9-slim', '5.7', 'mysql');
-- 5.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000053', 'mysql5.6-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000053', 'debian', '9-slim', '5.6', 'mysql');
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000054', 'mysql5.5-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000054', 'debian', '9-slim', '5.5', 'mysql');

-- Oracle --------------------------------------------------------
-- 11.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000055', 'oracle11.2-oraclelinux7.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000055', 'oraclelinux', '7-slim', '11.2', 'oracle');
-- 12.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000056', 'oracle12.1-oraclelinux7.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000056', 'oraclelinux', '7-slim', '12.1', 'oracle');
-- 12.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000057', 'oracle12.2-oraclelinux7.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000057', 'oraclelinux', '7-slim', '12.2', 'oracle');

-- IBM DB2 Express-C --------------------------------------
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000058', 'ibmdb2expressc10.5-centos7', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000058', 'centos', '7.1', '10.5', 'ibmdb2expressc');

-- PostgreSQL -----------------------------------------------
-- 9.3
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000059', 'postgres9.3-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000059', 'debian', '9-slim', '9.3', 'postgres');
-- 9.4
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000060', 'postgres9.4-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000060', 'debian', '9-slim', '9.4', 'postgres');
-- 9.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000061', 'postgres9.5-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000061', 'debian', '9-slim', '9.5', 'postgres');
-- 9.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000062', 'postgres9.6-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000062', 'debian', '9-slim', '9.6', 'postgres');
-- 10
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000063', 'postgres10-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000063', 'debian', '9-slim', '10', 'postgres');
-- 11
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000064', 'postgres11-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000064', 'debian', '9-slim', '11', 'postgres');

-- MariaDB ----------------------------------------------------
-- 10.3
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000065', 'mariadb10.3-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000065', 'debian', '8', '10.3', 'mariadb');
-- 10.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000066', 'mariadb10.2-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000066', 'debian', '8', '10.2', 'mariadb');
-- 10.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000067', 'mariadb10.1-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000067', 'debian', '8', '10.1', 'mariadb');
-- 10.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000068', 'mariadb10.0-debian8', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000068', 'debian', '8', '10.0', 'mariadb');
-- 5.5
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000069', 'mariadb5.5-debian7', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000069', 'debian', '7', '5.5', 'mariadb');

-- Apache Cassandra --------------------------------------
-- 2.1
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000070', 'cassandra2.1-debian8.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000070', 'debian', '8-slim', '2.1', 'cassandra');
-- 2.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000071', 'cassandra2.2-debian8.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000071', 'debian', '8-slim', '2.2', 'cassandra');
-- 3.0
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000072', 'cassandra3.0-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000072', 'debian', '9-slim', '3.0', 'cassandra');
-- 3.11
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000073', 'cassandra3.11-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000073', 'debian', '9-slim', '3.11', 'cassandra');

-- MongoDB ---------------------------------------------------
-- 3.2
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000074', 'mongo3.2-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000074', 'debian', '7', '3.2', 'mongo');
-- 3.4
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000075', 'mongo3.4-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000075', 'debian', '7', '3.4', 'mongo');
-- 3.6
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000076', 'mongo3.6-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000076', 'debian', '7', '3.6', 'mongo');
-- 3.7
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000077', 'mongo3.7-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000077', 'debian', '7', '3.7', 'mongo');
-- 4.0.rc
INSERT INTO `self_service_db`.`TEMPLATE` (`template_uuid`, `template_name`, `username`, `creation_date`, `last_edit`) VALUES ('00000078', 'mongo4.0.rc-debian9.slim', 'fgalindo', '2018-05-29', '2018-05-29');
INSERT INTO `self_service_db`.`DB_TEMPLATE` (`template_uuid`, `os`, `os_version`, `db_version`, `db`) VALUES ('00000078', 'debian', '7', '4.0-rc', 'mongo');


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
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000040' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000040');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000041' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000041');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000042' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000042');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000043' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000043');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000044' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000044');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000045' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000045');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000046' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000046');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000047' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000047');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000048' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000048');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000049' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000049');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000050' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000050');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000051' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000051');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000052' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000052');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000053' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000053');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000054' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000054');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000055' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000055');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000056' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000056');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000057' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000057');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000058' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000058');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000059' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000059');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000060' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000060');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000061' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000061');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000062' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000062');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000063' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000063');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000064' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000064');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000065' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000065');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000066' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000066');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000067' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000067');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000068' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000068');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000069' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000069');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000070' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000070');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000071' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000071');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000072' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000072');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000073' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000073');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000074' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000074');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000075' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000075');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000076' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000076');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000077' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000077');
INSERT INTO `self_service_db`.`REQUEST` (`request_uuid`, `request_date`, `request_status`, `salesforce_case`, `username`, `template_uuid`) VALUES ('00000078' , '04-03-18', 'pending', '00012345', 'fgalindo', '00000078');
COMMIT;
