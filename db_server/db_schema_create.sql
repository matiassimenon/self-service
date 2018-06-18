CREATE USER IF NOT EXISTS 'TALEND_USER'@'%' IDENTIFIED BY 'TALEND_USER/talend123!';

DROP DATABASE IF EXISTS `self_service_db`;
SET default_storage_engine=InnoDB;
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS `self_service_db`
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;
USE self_service_db;

GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'TALEND_USER'@'%';
GRANT ALL PRIVILEGES ON `TALEND_USER`.* TO 'TALEND_USER'@'%';
GRANT ALL PRIVILEGES ON `self_service_db`.* TO 'TALEND_USER'@'%';
FLUSH PRIVILEGES;

-- Tables ---------------------------------------------------------------------
CREATE TABLE `USER` (
  `firstname` VARCHAR(30) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `department` CHAR(12) NOT NULL,
  `city` CHAR(20) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `region` CHAR(4) NOT NULL,
  `admin` TINYINT(1) NOT NULL,
  `admin_request` TINYINT(1) NOT NULL,
  `question` VARCHAR(100) DEFAULT "",
  `answer` VARCHAR(32) DEFAULT "",
  UNIQUE (email),
  PRIMARY KEY (`username`)
);

CREATE TABLE `TEMPLATE` (
  `template_uuid` VARCHAR(30) NOT NULL,
  `template_name` VARCHAR(63) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `creation_date` DATE NOT NULL,
  `last_edit` DATE NOT NULL,
  PRIMARY KEY (`template_uuid`,`username`)
  -- FOREIGN KEY (`username`) REFERENCES `USER` (`username`)
);

CREATE TABLE `TALEND_TEMPLATE` (
  `template_uuid` VARCHAR(30) NOT NULL,
  `os` VARCHAR(20) NOT NULL,
  `os_version` CHAR(10) NOT NULL,
  `talend_version` CHAR(10) NOT NULL,
  `talend_component` VARCHAR(12) NULL,
  `jdk_version` CHAR(2) NOT NULL,
  `jdk_update` CHAR(3) NOT NULL,
  `tomcat_version` CHAR(4) NOT NULL,
  PRIMARY KEY (`template_uuid`)
  -- FOREIGN KEY (`template_uuid`) REFERENCES `TEMPLATE` (`template_uuid`)
);

CREATE TABLE `DB_TEMPLATE` (
  `template_uuid` VARCHAR(30) NOT NULL,
  `os` VARCHAR(20) NOT NULL,
  `os_version` CHAR(10) NOT NULL,
  `db_version` CHAR(10) NOT NULL,
  `db` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`template_uuid`)
  -- FOREIGN KEY (`template_uuid`) REFERENCES `TEMPLATE` (`template_uuid`)
);

CREATE TABLE `REQUEST` (
  `request_uuid` VARCHAR(30) NOT NULL,
  `request_date` DATE NOT NULL,
  `request_status` VARCHAR(50) NOT NULL,
  `salesforce_case` CHAR(10) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `template_uuid` CHAR(9) NOT NULL,
  PRIMARY KEY (`request_uuid`)
  -- FOREIGN KEY (`username`) REFERENCES `USER` (`username`)
  -- FOREIGN KEY (template_uuid) REFERENCES `TEMPLATE` (template_uuid)
);

CREATE TABLE `IMAGE` (
  `template_uuid` VARCHAR(30) NOT NULL,
  `image_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`template_uuid`)
  -- FOREIGN KEY (template_uuid) REFERENCES `TEMPLATE` (template_uuid)
);

CREATE TABLE `REGULAR_USER` (
  `username` VARCHAR(30) NOT NULL,
  UNIQUE (`username`)
  -- FOREIGN KEY (`username`) REFERENCES `USER` (`username`)
);

CREATE TABLE `ADMIN_USER` (
  `username` VARCHAR(30) NOT NULL,
  UNIQUE (`username`)
  -- FOREIGN KEY (`username`) REFERENCES `USER` (`username`)
);

-- Trigger for INSERT ON `USER`
delimiter ||
CREATE TRIGGER TRGGR_insert_username_into_REGULAR_USER_or_ADMIN_USER AFTER INSERT ON `USER`
FOR EACH ROW
BEGIN
IF (NEW.`admin` = 0) THEN
	INSERT INTO `REGULAR_USER` (`username`) VALUES (NEW.`username`);
ELSE
	INSERT INTO `ADMIN_USER` (`username`) VALUES (NEW.`username`);
END IF;
END ||
delimiter ;


-- Constraints: Foreign Keys: FK_CHILD_TABLE_child_Column_PATENT_TABLE_parent_Column
ALTER TABLE `TEMPLATE`
  ADD CONSTRAINT FK_TEMPLATE_username_USER_username FOREIGN KEY (`username`) REFERENCES `USER`(`username`) ON DELETE CASCADE;

ALTER TABLE `TALEND_TEMPLATE`
  ADD CONSTRAINT FK_TALEND_TEMPLATE_template_uuid_TEMPLATE_template_uuid FOREIGN KEY (`template_uuid`) REFERENCES `TEMPLATE`(`template_uuid`) ON DELETE CASCADE;

ALTER TABLE `DB_TEMPLATE`
  ADD CONSTRAINT FK_DB_TEMPLATE_template_uuid_TEMPLATE_template_uuid FOREIGN KEY (`template_uuid`) REFERENCES `TEMPLATE`(`template_uuid`) ON DELETE CASCADE;

ALTER TABLE `IMAGE`
  ADD CONSTRAINT FK_IMAGE_template_uuid_TEMPLATE_UUID_template FOREIGN KEY (`template_uuid`) REFERENCES `TEMPLATE`(`template_uuid`) ON DELETE CASCADE;

ALTER TABLE `REQUEST`
  ADD CONSTRAINT FK_REQUEST_username_USER_username FOREIGN KEY (`username`) REFERENCES `USER`(`username`) ON DELETE CASCADE,
  ADD CONSTRAINT FK_REQUEST_template_uuid_TEMPLATE_template_uuid FOREIGN KEY (`template_uuid`) REFERENCES `TEMPLATE`(`template_uuid`) ON DELETE CASCADE;

ALTER TABLE `REGULAR_USER`
  ADD CONSTRAINT FK_REGULAR_USER_username_USER_username FOREIGN KEY (`username`) REFERENCES `USER`(`username`) ON DELETE CASCADE;

ALTER TABLE `ADMIN_USER`
  ADD CONSTRAINT FK_ADMIN_USER_username_USER_username FOREIGN KEY (`username`) REFERENCES `USER`(`username`) ON DELETE CASCADE;

COMMIT;
