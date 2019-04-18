-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.48 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for newdemodb
CREATE DATABASE IF NOT EXISTS `newdemodb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `newdemodb`;

-- Dumping structure for table newdemodb.app2_bbmadmin
CREATE TABLE IF NOT EXISTS `app2_bbmadmin` (
  `adminemail` varchar(255) NOT NULL,
  `adminame` varchar(255) NOT NULL,
  `adminphone` bigint(20) NOT NULL,
  `adminid_id` int(11) NOT NULL,
  `adminpassword` varchar(255) NOT NULL,
  `adminotp` varchar(255),
  `adminotptime` varchar(255),
  PRIMARY KEY (`adminemail`),
  UNIQUE KEY `adminPhone` (`adminphone`),
  KEY `app2_bbmadmin_adminid_id_752f3ea4_fk_app2_bbmuser1_roleid` (`adminid_id`),
  CONSTRAINT `app2_bbmadmin_adminid_id_752f3ea4_fk_app2_bbmuser1_roleid` FOREIGN KEY (`adminid_id`) REFERENCES `app2_bbmuser1` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmadmin: ~0 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_bbmadmin` ENABLE KEYS */;

-- Dumping structure for table newdemodb.app2_bbmbankmanager
CREATE TABLE IF NOT EXISTS `app2_bbmbankmanager` (
  `manageremail` varchar(255) NOT NULL,
  `managername` varchar(255) NOT NULL,
  `managerphone` bigint(20) NOT NULL,
  `managerid_id` int(11) NOT NULL,
  `managerpassword` varchar(255) NOT NULL,
  `managerotp` varchar(255),
  `managerotptime` varchar(255),
  PRIMARY KEY (`manageremail`),
  UNIQUE KEY `managerPhone` (`managerphone`),
  KEY `app2_bbmbankmanager_managerid_id_665d7ab8_fk_app2_bbmu` (`managerid_id`),
  CONSTRAINT `app2_bbmbankmanager_managerid_id_665d7ab8_fk_app2_bbmu` FOREIGN KEY (`managerid_id`) REFERENCES `app2_bbmuser1` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmbankmanager: ~1 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmbankmanager` DISABLE KEYS */;
INSERT INTO `app2_bbmbankmanager` (`manageremail`, `managername`, `managerphone`, `managerid_id`, `managerpassword`, `managerotp`, `managerotptime`) VALUES
	('abhi@gmail.com', 'Abhi', 9090909090, 3, 'abhi@123', '', '');
/*!40000 ALTER TABLE `app2_bbmbankmanager` ENABLE KEYS */;

-- Dumping structure for table newdemodb.app2_bbmblood
CREATE TABLE IF NOT EXISTS `app2_bbmblood` (
  `bloodCode` int(11) NOT NULL AUTO_INCREMENT,
  `bloodCost` bigint(20) NOT NULL,
  `bloodType` varchar(255) NOT NULL,
  `bloodId_id` varchar(255) NOT NULL,
  `bloodDonarName` varchar(255) NOT NULL,
  PRIMARY KEY (`bloodCode`),
  KEY `app2_bbmblood_bloodId_id_9f0c713e_fk_app2_bbmdonar_donaremail` (`bloodId_id`),
  CONSTRAINT `app2_bbmblood_bloodId_id_9f0c713e_fk_app2_bbmdonar_donaremail` FOREIGN KEY (`bloodId_id`) REFERENCES `app2_bbmdonar` (`donaremail`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmblood: ~5 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmblood` DISABLE KEYS */;
INSERT INTO `app2_bbmblood` (`bloodCode`, `bloodCost`, `bloodType`, `bloodId_id`, `bloodDonarName`) VALUES
	(1, 250, 'a(-ve)', 'abhiabhi111@gmail.com', 'abhishek'),
	(2, 110, 'b(-ve)', 'abhiabhi@gmail.com', 'abhishek abhi'),
	(3, 221, 'ab(-ve)', 'sp@mail.com', 'sangam'),
	(4, 110, 'b(-ve)', 'mrmnv2864868@gmail.com', 'manav '),
	(5, 234, 'a(-ve)', 'abhisheksingh7397@gmail.com', 'abhi');
/*!40000 ALTER TABLE `app2_bbmblood` ENABLE KEYS */;

-- Dumping structure for table newdemodb.app2_bbmbloodbank
CREATE TABLE IF NOT EXISTS `app2_bbmbloodbank` (
  `bbkBloodType` varchar(255) NOT NULL,
  `bbkAvailable` varchar(255) NOT NULL,
  `bbkId_id` int(11) NOT NULL,
  `bbkhosId_id` varchar(255) NOT NULL,
  `bbkmgId_id` varchar(255) NOT NULL,
  PRIMARY KEY (`bbkBloodType`),
  KEY `app2_bbmbloodbank_bbkhosId_id_028f846a_fk_app2_bbmh` (`bbkhosId_id`),
  KEY `app2_bbmbloodbank_bbkmgId_id_d45c73c1_fk_app2_bbmb` (`bbkmgId_id`),
  KEY `app2_bbmbloodbank_bbkId_id_cdef8c51_fk` (`bbkId_id`),
  CONSTRAINT `app2_bbmbloodbank_bbkhosId_id_028f846a_fk_app2_bbmh` FOREIGN KEY (`bbkhosId_id`) REFERENCES `app2_bbmhospitals` (`hosName`),
  CONSTRAINT `app2_bbmbloodbank_bbkId_id_cdef8c51_fk` FOREIGN KEY (`bbkId_id`) REFERENCES `app2_bbmblood` (`bloodCode`),
  CONSTRAINT `app2_bbmbloodbank_bbkmgId_id_d45c73c1_fk_app2_bbmb` FOREIGN KEY (`bbkmgId_id`) REFERENCES `app2_bbmbankmanager` (`managerEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmbloodbank: ~0 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmbloodbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_bbmbloodbank` ENABLE KEYS */;

-- Dumping structure for table newdemodb.app2_bbmdonar
CREATE TABLE IF NOT EXISTS `app2_bbmdonar` (
  `donarname` varchar(255) NOT NULL,
  `donaremail` varchar(255) NOT NULL,
  `donarpassword` varchar(255) NOT NULL,
  `donarcontactno` bigint(20) NOT NULL,
  `donarage` bigint(20) NOT NULL,
  `donarimage` varchar(255) DEFAULT NULL,
  `donarid_id` int(11) NOT NULL,
  `donarotp` varchar(255),
  `donarotptime` varchar(255),
  PRIMARY KEY (`donaremail`),
  UNIQUE KEY `donarcontactno` (`donarcontactno`),
  KEY `app2_bbmdonar_donarid_id_5860232a_fk_app2_bbmuser1_roleid` (`donarid_id`),
  CONSTRAINT `app2_bbmdonar_donarid_id_5860232a_fk_app2_bbmuser1_roleid` FOREIGN KEY (`donarid_id`) REFERENCES `app2_bbmuser1` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmdonar: ~7 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmdonar` DISABLE KEYS */;
INSERT INTO `app2_bbmdonar` (`donarname`, `donaremail`, `donarpassword`, `donarcontactno`, `donarage`, `donarimage`, `donarid_id`, `donarotp`, `donarotptime`) VALUES
	('abhishekk sharma', 'abhiabhi111@gmail.com', 'pbkdf2_sha256$100000$LOueQjFGKtvZ$xRslbs0h37djNV5IkDY6y9ss5S/BY7yGoOniTfkfBkk=', 4531123567, 21, 'IMG_4453.JPG', 2, '', ''),
	('abhishekk', 'abhiabhi@gmail.com', 'pbkdf2_sha256$100000$83ANENu5eZpx$I1YcgvQCmcajxP4vMfPx8i4tV7vf8tIO/r2R12/Tx/Y=', 9948981133, 22, 'IMG_4448.JPG', 2, '', ''),
	('abhi', 'abhisheksingh7397@gmail.com', 'pbkdf2_sha256$100000$FRiDepbNjqJ4$9AVXrzGXuoCAgIKvIx4JodxOEnCv45xRAI0TW5RKUxU=', 8168247639, 22, 'IMG_20170911_064553.JPG', 2, '282654', '2019-04-18 12:20:14.645962'),
	('manav', 'mrmnv2864868@gmail.com', 'pbkdf2_sha256$100000$iD7zZOh3F7Ys$g5z8MTpMwP+zdOx0tN5McVAFs9i50oVgdJ8bBfNmME8=', 6836864811, 22, '1503226190584.jpg', 2, '', ''),
	('raman singh', 'ramannetweb1@gmail.com', 'pbkdf2_sha256$100000$PX0JpqkENnVY$fl6By0wq9QwzZVT1hTliq2S1o+0XWu10zDpd5Cu2woc=', 97675645344, 22, 'IMG_4443.JPG', 2, '', ''),
	('raman', 'ramannetweb@gmail.com', 'pbkdf2_sha256$100000$AAySkmu3Ts8K$qgZ+NgTnF6vuECeUKPv+uX5/Zb8uA0dOGbCH8AMZ+P8=', 35465756858, 22, 'IMG_4444.JPG', 2, '', ''),
	('sp', 'sp@mail.com', 'pbkdf2_sha256$100000$eGJ6SZBmPwAn$Mcdxk0+wPxEv8OBBn4OobJv5SJ9cr4BdOVGzNLEc7E8=', 123, 100, 'IMG_4457.JPG', 2, '', '');
/*!40000 ALTER TABLE `app2_bbmdonar` ENABLE KEYS */;

-- Dumping structure for table newdemodb.app2_bbmhospitals
CREATE TABLE IF NOT EXISTS `app2_bbmhospitals` (
  `hosName` varchar(255) NOT NULL,
  `hosPhone` bigint(20) NOT NULL,
  `hosAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`hosName`),
  UNIQUE KEY `hosPhone` (`hosPhone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmhospitals: ~0 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmhospitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `app2_bbmhospitals` ENABLE KEYS */;

-- Dumping structure for table newdemodb.app2_bbmuser1
CREATE TABLE IF NOT EXISTS `app2_bbmuser1` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) NOT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.app2_bbmuser1: ~3 rows (approximately)
/*!40000 ALTER TABLE `app2_bbmuser1` DISABLE KEYS */;
INSERT INTO `app2_bbmuser1` (`roleid`, `rolename`) VALUES
	(1, 'Admin'),
	(3, 'Blood Bank Manager'),
	(2, 'Donar');
/*!40000 ALTER TABLE `app2_bbmuser1` ENABLE KEYS */;

-- Dumping structure for table newdemodb.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table newdemodb.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table newdemodb.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.auth_permission: ~42 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add user', 2, 'add_user'),
	(5, 'Can change user', 2, 'change_user'),
	(6, 'Can delete user', 2, 'delete_user'),
	(7, 'Can add permission', 3, 'add_permission'),
	(8, 'Can change permission', 3, 'change_permission'),
	(9, 'Can delete permission', 3, 'delete_permission'),
	(10, 'Can add group', 4, 'add_group'),
	(11, 'Can change group', 4, 'change_group'),
	(12, 'Can delete group', 4, 'delete_group'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add bbm bank manager', 7, 'add_bbmbankmanager'),
	(20, 'Can change bbm bank manager', 7, 'change_bbmbankmanager'),
	(21, 'Can delete bbm bank manager', 7, 'delete_bbmbankmanager'),
	(22, 'Can add bbm blood bank', 8, 'add_bbmbloodbank'),
	(23, 'Can change bbm blood bank', 8, 'change_bbmbloodbank'),
	(24, 'Can delete bbm blood bank', 8, 'delete_bbmbloodbank'),
	(25, 'Can add bbm blood', 9, 'add_bbmblood'),
	(26, 'Can change bbm blood', 9, 'change_bbmblood'),
	(27, 'Can delete bbm blood', 9, 'delete_bbmblood'),
	(28, 'Can add bbm hospitals', 10, 'add_bbmhospitals'),
	(29, 'Can change bbm hospitals', 10, 'change_bbmhospitals'),
	(30, 'Can delete bbm hospitals', 10, 'delete_bbmhospitals'),
	(31, 'Can add bbm user1', 11, 'add_bbmuser1'),
	(32, 'Can change bbm user1', 11, 'change_bbmuser1'),
	(33, 'Can delete bbm user1', 11, 'delete_bbmuser1'),
	(34, 'Can add bbm donar', 12, 'add_bbmdonar'),
	(35, 'Can change bbm donar', 12, 'change_bbmdonar'),
	(36, 'Can delete bbm donar', 12, 'delete_bbmdonar'),
	(37, 'Can add bbm admin', 13, 'add_bbmadmin'),
	(38, 'Can change bbm admin', 13, 'change_bbmadmin'),
	(39, 'Can delete bbm admin', 13, 'delete_bbmadmin'),
	(40, 'Can add bbm donar1', 14, 'add_bbmdonar1'),
	(41, 'Can change bbm donar1', 14, 'change_bbmdonar1'),
	(42, 'Can delete bbm donar1', 14, 'delete_bbmdonar1');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table newdemodb.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.auth_user: ~4 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$eLEiuhJnB9di$qzozg8jykARINouCrT0dg6tjxzyP5a7FSOJTb1O438I=', '2019-03-28 08:13:12', 1, 'bbm1234', '', '', 'abhisheksingh7397@gmail.com', 1, 1, '2019-03-28 08:12:11'),
	(2, 'pbkdf2_sha256$100000$UAOmEw9KvPJ5$iBl5CcelhNl6ZzU9oFA1G7NkCD9cvwAn8TEfPj2GUqA=', '2019-04-08 06:18:08', 1, 'bbm2231', '', '', 'abhisheksingh7397@gmail.com', 1, 1, '2019-04-03 18:54:54'),
	(3, 'pbkdf2_sha256$100000$oPEgUnUAZ5iI$+PHUZkwdzHm+IYNJxpfIiuevvdancin18yu1wzVj+DA=', '2019-04-05 07:39:19', 1, 'admin', '', '', '', 1, 1, '2019-04-05 07:39:03'),
	(4, 'pbkdf2_sha256$100000$4ZYluUHNTh9R$SUdt/UoncPAF+vyBRGwvTsub7K7Dwa0QMs3CTakErbw=', '2019-04-09 06:06:40', 1, 'abhishek', '', '', '', 1, 1, '2019-04-09 06:05:56');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table newdemodb.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table newdemodb.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table newdemodb.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.django_admin_log: ~4 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-04-05 07:43:34', 'abhi@gmail.com', 'bbmBankManager object (abhi@gmail.com)', 1, '[{"added": {}}]', 7, 3),
	(2, '2019-04-08 06:18:35', '1', 'User object (1)', 1, '[{"added": {}}]', 15, 2),
	(3, '2019-04-08 06:18:47', '2', 'User object (2)', 1, '[{"added": {}}]', 15, 2),
	(4, '2019-04-08 06:18:57', '3', 'User object (3)', 1, '[{"added": {}}]', 15, 2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table newdemodb.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.django_content_type: ~15 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(13, 'app2', 'bbmadmin'),
	(7, 'app2', 'bbmbankmanager'),
	(9, 'app2', 'bbmblood'),
	(8, 'app2', 'bbmbloodbank'),
	(12, 'app2', 'bbmdonar'),
	(10, 'app2', 'bbmhospitals'),
	(11, 'app2', 'bbmuser1'),
	(4, 'auth', 'group'),
	(3, 'auth', 'permission'),
	(2, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(14, 'myapp1', 'bbmdonar1'),
	(15, 'myapp1', 'user'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table newdemodb.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.django_migrations: ~28 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-03-28 08:03:44'),
	(2, 'auth', '0001_initial', '2019-03-28 08:03:46'),
	(3, 'admin', '0001_initial', '2019-03-28 08:03:47'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-03-28 08:03:47'),
	(5, 'app2', '0001_initial', '2019-03-28 08:03:51'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-28 08:03:52'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-28 08:03:52'),
	(8, 'auth', '0003_alter_user_email_max_length', '2019-03-28 08:03:52'),
	(9, 'auth', '0004_alter_user_username_opts', '2019-03-28 08:03:52'),
	(10, 'auth', '0005_alter_user_last_login_null', '2019-03-28 08:03:53'),
	(11, 'auth', '0006_require_contenttypes_0002', '2019-03-28 08:03:53'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-28 08:03:53'),
	(13, 'auth', '0008_alter_user_username_max_length', '2019-03-28 08:03:53'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-28 08:03:54'),
	(15, 'sessions', '0001_initial', '2019-03-28 08:03:54'),
	(16, 'myapp1', '0001_initial', '2019-04-03 17:15:33'),
	(17, 'app2', '0002_auto_20190405_1153', '2019-04-05 06:23:49'),
	(18, 'app2', '0003_auto_20190405_1220', '2019-04-05 06:50:19'),
	(19, 'app2', '0004_auto_20190405_1222', '2019-04-05 06:52:23'),
	(20, 'app2', '0005_auto_20190408_1217', '2019-04-08 06:47:45'),
	(21, 'app2', '0006_auto_20190408_1235', '2019-04-08 07:05:30'),
	(22, 'app2', '0007_auto_20190409_1131', '2019-04-09 06:01:27'),
	(23, 'app2', '0008_auto_20190409_1146', '2019-04-09 06:16:29'),
	(24, 'app2', '0009_bbmblood_blooddonarname', '2019-04-09 06:22:44'),
	(25, 'app2', '0010_auto_20190412_1141', '2019-04-12 06:11:48'),
	(26, 'app2', '0011_auto_20190412_1402', '2019-04-12 08:32:48'),
	(27, 'app2', '0012_bbmdonar_donarotp', '2019-04-16 05:00:43'),
	(28, 'app2', '0013_bbmdonar_donarotptime', '2019-04-18 05:00:50');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table newdemodb.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.django_session: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('w97wp2qksof68lerx2fkqq1ik3injg3n', 'MDNlOGMxNTg0MzM2YTU5ZTNhYTIyYThjMTJlYzc1M2Q1YWRkOTc0ZTp7ImVtYWlsaWQiOiJhYmhpc2hla3NpbmdoNzM5N0BnbWFpbC5jb20iLCJfYXV0aF91c2VyX2hhc2giOiI3NjhlODc5MGFhNzlhYmVlNDExNzNmNGFhMWNhMjRkZjZjOGRlYWY0IiwiQXV0aGVudGljYXRlZCI6dHJ1ZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCJ9', '2019-05-02 06:50:07');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table newdemodb.myapp1_admin
CREATE TABLE IF NOT EXISTS `myapp1_admin` (
  `adminemail` varchar(255) NOT NULL,
  `adminame` varchar(255) NOT NULL,
  `adminpassword` varchar(255) NOT NULL,
  `adminphone` bigint(20) NOT NULL,
  `adminimage` varchar(255) DEFAULT NULL,
  `adminid_id` int(11) NOT NULL,
  PRIMARY KEY (`adminemail`),
  UNIQUE KEY `adminphone` (`adminphone`),
  KEY `myapp1_admin_adminid_id_85798038_fk_myapp1_user_roleid` (`adminid_id`),
  CONSTRAINT `myapp1_admin_adminid_id_85798038_fk_myapp1_user_roleid` FOREIGN KEY (`adminid_id`) REFERENCES `myapp1_user` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.myapp1_admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `myapp1_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp1_admin` ENABLE KEYS */;

-- Dumping structure for table newdemodb.myapp1_bbmdonar1
CREATE TABLE IF NOT EXISTS `myapp1_bbmdonar1` (
  `donarname` varchar(255) NOT NULL,
  `donaremail` varchar(255) NOT NULL,
  `donarpassword` varchar(255) NOT NULL,
  `donarcontactno` bigint(20) NOT NULL,
  `donarage` bigint(20) NOT NULL,
  `donarimage` varchar(255) DEFAULT NULL,
  `donarid_id` int(11) NOT NULL,
  PRIMARY KEY (`donaremail`),
  UNIQUE KEY `donarcontactno` (`donarcontactno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.myapp1_bbmdonar1: ~0 rows (approximately)
/*!40000 ALTER TABLE `myapp1_bbmdonar1` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp1_bbmdonar1` ENABLE KEYS */;

-- Dumping structure for table newdemodb.myapp1_manager
CREATE TABLE IF NOT EXISTS `myapp1_manager` (
  `manageremail` varchar(255) NOT NULL,
  `managername` varchar(255) NOT NULL,
  `managerpassword` varchar(255) NOT NULL,
  `managerphone` bigint(20) NOT NULL,
  `managerimage` varchar(255) DEFAULT NULL,
  `managerid_id` int(11) NOT NULL,
  PRIMARY KEY (`manageremail`),
  UNIQUE KEY `managerphone` (`managerphone`),
  KEY `myapp1_manager_managerid_id_999a2e29_fk_myapp1_user_roleid` (`managerid_id`),
  CONSTRAINT `myapp1_manager_managerid_id_999a2e29_fk_myapp1_user_roleid` FOREIGN KEY (`managerid_id`) REFERENCES `myapp1_user` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.myapp1_manager: ~0 rows (approximately)
/*!40000 ALTER TABLE `myapp1_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp1_manager` ENABLE KEYS */;

-- Dumping structure for table newdemodb.myapp1_user
CREATE TABLE IF NOT EXISTS `myapp1_user` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) NOT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table newdemodb.myapp1_user: ~3 rows (approximately)
/*!40000 ALTER TABLE `myapp1_user` DISABLE KEYS */;
INSERT INTO `myapp1_user` (`roleid`, `rolename`) VALUES
	(1, 'Admin'),
	(2, 'Donar'),
	(3, 'Manager');
/*!40000 ALTER TABLE `myapp1_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
