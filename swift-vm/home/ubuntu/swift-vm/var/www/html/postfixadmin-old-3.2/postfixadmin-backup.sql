-- MySQL dump 10.13  Distrib 8.0.25, for Linux (aarch64)
--
-- Host: localhost    Database: postfixadmin
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `superadmin` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `token_validity` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Admins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin@admin.com','$1$9473baa1$WWn0SIfg8l7ZWLfaWzJRn1',1,'2020-12-30 07:34:01','2020-12-30 07:34:01',0,'','','','2020-12-30 02:34:01'),('patrick@isellemails.com','$1$e47d5b8f$XDGfqyGV6yvoZn8oHe5YK/',0,'2021-01-16 18:41:20','2021-01-16 18:41:20',1,'','','','2021-01-16 13:41:20'),('vinny@isellemails.com','$1$ce8221c6$92Jaq888tonUA7J4ewHkk1',1,'2021-05-29 15:53:55','2021-05-29 15:53:55',1,'','','','2021-05-29 11:53:55'),('wini@isellemails.com','$1$b280752e$dDEdcuRMIh/oDKKAfiofJ1',1,'2022-02-21 18:09:01','2022-02-21 18:09:01',1,'','','','2022-02-21 13:09:01'),('winicius@gmail.com','$1$917d1671$ubSzheBQVkTWWYpaJwvhN/',0,'2020-12-18 07:37:32','2021-05-29 15:54:16',0,'','','','2020-12-18 07:37:32');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias`
--

DROP TABLE IF EXISTS `alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alias` (
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `goto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`address`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Aliases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias`
--

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
INSERT INTO `alias` VALUES ('abuse@isellemails.com','abuse@isellemails.com,vinny@isellemails.com','isellemails.com','2020-12-21 15:22:11','2021-09-02 14:31:49',1),('alex@isellemails.com','alex@isellemails.com','isellemails.com','2021-07-09 22:42:14','2022-02-06 09:32:23',1),('darren@isellemails.com','darren@isellemails.com','isellemails.com','2021-01-24 05:39:58','2021-07-06 17:39:43',1),('hostmaster@isellemails.com','hostmaster@isellemails.com,vinny@isellemails.com','isellemails.com','2020-12-21 15:22:11','2021-09-02 14:31:37',1),('jc@isellemails.com','jc@isellemails.com','isellemails.com','2021-01-15 22:27:20','2021-01-15 22:27:20',1),('lizzo@isellemails.com','lizzo@isellemails.com','isellemails.com','2021-01-25 01:04:50','2021-01-25 01:04:50',1),('patrick@isellemails.com','patrick@isellemails.com','isellemails.com','2021-01-12 05:07:06','2021-01-12 20:57:00',1),('perryhughes23@isellemails.com','perryhughes23@isellemails.com','isellemails.com','2021-05-27 11:36:01','2021-05-27 11:36:01',1),('postmaster@isellemails.com','postmaster@isellemails.com,vinny@isellemails.com','isellemails.com','2020-12-21 15:22:11','2021-09-02 14:31:11',1),('sarah@isellemails.com','sarah@isellemails.com','isellemails.com','2021-01-15 22:13:05','2021-01-15 22:13:05',1),('shemma@isellemails.com','shemma@isellemails.com','isellemails.com','2021-05-26 07:41:15','2021-05-26 07:41:15',1),('test@isellemails.com','test@isellemails.com','isellemails.com','2022-02-21 20:13:55','2022-02-21 20:13:55',1),('vinny@isellemails.com','vinny@isellemails.com','isellemails.com','2020-12-21 15:23:51','2021-01-15 07:40:32',1),('webmaster@isellemails.com','webmaster@isellemails.com,vinny@isellemails.com','isellemails.com','2020-12-21 15:22:11','2021-09-02 14:31:25',1),('wini@isellemails.com','wini@isellemails.com','isellemails.com','2022-02-03 23:27:22','2022-02-03 23:27:22',1);
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias_domain`
--

DROP TABLE IF EXISTS `alias_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alias_domain` (
  `alias_domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `target_domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`alias_domain`),
  KEY `active` (`active`),
  KEY `target_domain` (`target_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Aliases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias_domain`
--

LOCK TABLES `alias_domain` WRITE;
/*!40000 ALTER TABLE `alias_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `value` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='PostfixAdmin settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'version','1840');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain` (
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aliases` int NOT NULL DEFAULT '0',
  `mailboxes` int NOT NULL DEFAULT '0',
  `maxquota` bigint NOT NULL DEFAULT '0',
  `quota` bigint NOT NULL DEFAULT '0',
  `transport` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Domains';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('ALL','',0,0,0,0,'',0,'2020-12-18 07:37:32','2020-12-18 07:37:32',1),('isellemails.com','',0,0,0,0,'virtual',0,'2020-12-21 15:22:11','2020-12-21 15:22:11',1);
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_admins`
--

DROP TABLE IF EXISTS `domain_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_admins` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Admins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_admins`
--

LOCK TABLES `domain_admins` WRITE;
/*!40000 ALTER TABLE `domain_admins` DISABLE KEYS */;
INSERT INTO `domain_admins` VALUES ('admin@admin.com','ALL','2020-12-30 07:34:01',1),('patrick@isellemails.com','isellemails.com','2021-01-16 18:41:20',1),('vinny@isellemails.com','ALL','2021-05-29 15:53:55',1),('wini@isellemails.com','ALL','2022-02-21 18:09:01',1);
/*!40000 ALTER TABLE `domain_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fetchmail`
--

DROP TABLE IF EXISTS `fetchmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fetchmail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `mailbox` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `src_server` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `src_auth` enum('password','kerberos_v5','kerberos','kerberos_v4','gssapi','cram-md5','otp','ntlm','msn','ssh','any') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `src_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `src_password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `src_folder` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `poll_time` int unsigned NOT NULL DEFAULT '10',
  `fetchall` tinyint unsigned NOT NULL DEFAULT '0',
  `keep` tinyint unsigned NOT NULL DEFAULT '0',
  `protocol` enum('POP3','IMAP','POP2','ETRN','AUTO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usessl` tinyint unsigned NOT NULL DEFAULT '0',
  `sslcertck` tinyint(1) NOT NULL DEFAULT '0',
  `sslcertpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `sslfingerprint` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `extra_options` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `returned_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `mda` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `created` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fetchmail`
--

LOCK TABLES `fetchmail` WRITE;
/*!40000 ALTER TABLE `fetchmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `fetchmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `timestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `domain_timestamp` (`domain`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('2020-12-18 07:37:32','SETUP.PHP (192.168.1.6)','','create_admin','winicius@gmail.com',1),('2020-12-21 15:22:11','winicius@gmail.com (69.84.112.50)','isellemails.com','create_domain','isellemails.com',2),('2020-12-21 15:23:51','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','vinny@isellemails.com',3),('2020-12-21 15:23:51','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','vinny@isellemails.com',4),('2020-12-30 07:30:44','winicius@gmail.com (69.84.112.50)','isellemails.com','edit_alias','vinny@isellemails.com',5),('2020-12-30 07:30:44','winicius@gmail.com (69.84.112.50)','isellemails.com','edit_mailbox','vinny@isellemails.com',6),('2020-12-30 07:34:01','winicius@gmail.com (69.84.112.50)','','create_admin','admin@admin.com',7),('2021-01-06 21:42:49','winicius@gmail.com (69.84.112.50)','','edit_password','winicius@gmail.com',8),('2021-01-12 05:07:06','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','patrick@isellemails.com',9),('2021-01-12 05:07:06','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','patrick@isellemails.com',10),('2021-01-12 05:35:32','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd2@isellemails.com',11),('2021-01-12 05:35:41','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',12),('2021-01-12 08:10:51','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd123@isellemails.com',13),('2021-01-12 08:10:57','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd1234@isellemails.com',14),('2021-01-12 08:15:00','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',15),('2021-01-12 08:15:45','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',16),('2021-01-12 08:15:45','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',17),('2021-01-12 08:16:34','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',18),('2021-01-12 08:56:06','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',19),('2021-01-12 08:57:39','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',20),('2021-01-12 09:03:45','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',21),('2021-01-12 09:38:42','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',22),('2021-01-12 09:41:09','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',23),('2021-01-12 09:44:57','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',24),('2021-01-12 09:46:14','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',25),('2021-01-12 09:46:31','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',26),('2021-01-12 09:46:31','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',27),('2021-01-12 09:46:47','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',28),('2021-01-12 09:53:46','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',29),('2021-01-12 09:55:02','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',30),('2021-01-12 09:56:37','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',31),('2021-01-12 14:45:58','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',32),('2021-01-12 14:54:04','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',33),('2021-01-12 15:12:28','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_alias','awd@isellemails.com',34),('2021-01-12 15:19:00',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',35),('2021-01-12 15:19:00',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',36),('2021-01-12 15:32:59','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',37),('2021-01-12 15:33:45',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',38),('2021-01-12 15:33:45',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',39),('2021-01-12 15:35:48','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',40),('2021-01-12 15:43:18',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',41),('2021-01-12 15:43:18',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',42),('2021-01-12 15:46:57','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',43),('2021-01-12 15:47:28',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',44),('2021-01-12 15:47:28',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',45),('2021-01-12 19:30:02',' (69.84.112.50)','isellemails.com','create_alias','awd2@isellemails.com',46),('2021-01-12 19:30:02',' (69.84.112.50)','isellemails.com','create_mailbox','awd2@isellemails.com',47),('2021-01-12 19:31:33','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',48),('2021-01-12 19:31:39','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd2@isellemails.com',49),('2021-01-12 19:35:15',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',50),('2021-01-12 19:35:15',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',51),('2021-01-12 19:38:06','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',52),('2021-01-12 19:38:39',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',53),('2021-01-12 19:38:40',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',54),('2021-01-12 19:54:16','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',55),('2021-01-12 20:56:11',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',56),('2021-01-12 20:56:11',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',57),('2021-01-12 20:57:00','winicius@gmail.com (69.84.112.50)','isellemails.com','edit_alias','patrick@isellemails.com',58),('2021-01-12 20:57:00','winicius@gmail.com (69.84.112.50)','isellemails.com','edit_mailbox','patrick@isellemails.com',59),('2021-01-12 20:57:14','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',60),('2021-01-12 21:16:21',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',61),('2021-01-12 21:16:22',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',62),('2021-01-12 21:38:57','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',63),('2021-01-12 21:48:46',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',64),('2021-01-12 21:48:46',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',65),('2021-01-12 21:49:33','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',66),('2021-01-12 21:52:19',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',67),('2021-01-12 21:52:19',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',68),('2021-01-12 21:52:44','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',69),('2021-01-12 21:59:34',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',70),('2021-01-12 21:59:34',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',71),('2021-01-12 22:04:29','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',72),('2021-01-12 22:21:58',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',73),('2021-01-12 22:21:58',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',74),('2021-01-12 22:22:12','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',75),('2021-01-12 22:29:46',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',76),('2021-01-12 22:29:46',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',77),('2021-01-12 22:30:07','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',78),('2021-01-12 22:35:03',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',79),('2021-01-12 22:35:03',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',80),('2021-01-12 22:36:23','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',81),('2021-01-12 22:44:07',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',82),('2021-01-12 22:44:07',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',83),('2021-01-12 22:44:42','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',84),('2021-01-12 22:47:02',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',85),('2021-01-12 22:47:02',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',86),('2021-01-12 22:47:15','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',87),('2021-01-12 22:47:59','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',88),('2021-01-12 22:47:59','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',89),('2021-01-12 22:48:49','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',90),('2021-01-12 22:49:20','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',91),('2021-01-12 22:49:20','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',92),('2021-01-12 22:49:31','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',93),('2021-01-13 06:26:08',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',94),('2021-01-13 06:26:08',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',95),('2021-01-13 06:26:26','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',96),('2021-01-13 06:55:28',' (172.58.11.147)','isellemails.com','create_alias','awd@isellemails.com',97),('2021-01-13 06:55:28',' (172.58.11.147)','isellemails.com','create_mailbox','awd@isellemails.com',98),('2021-01-13 07:37:04',' (69.84.112.50)','isellemails.com','create_alias','der@isellemails.com',99),('2021-01-13 07:37:04',' (69.84.112.50)','isellemails.com','create_mailbox','der@isellemails.com',100),('2021-01-13 07:41:06',' (69.84.112.50)','isellemails.com','create_alias','aaa@isellemails.com',101),('2021-01-13 07:41:06',' (69.84.112.50)','isellemails.com','create_mailbox','aaa@isellemails.com',102),('2021-01-13 07:41:44','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','aaa@isellemails.com',103),('2021-01-13 07:41:50','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',104),('2021-01-13 07:41:58','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','der@isellemails.com',105),('2021-01-13 10:16:52',' (172.58.14.249)','isellemails.com','create_alias','xvv@isellemails.com',106),('2021-01-13 10:16:52',' (172.58.14.249)','isellemails.com','create_mailbox','xvv@isellemails.com',107),('2021-01-14 05:12:07',' (69.84.112.50)','isellemails.com','create_alias','awd@isellemails.com',108),('2021-01-14 05:12:07',' (69.84.112.50)','isellemails.com','create_mailbox','awd@isellemails.com',109),('2021-01-14 05:13:50','winicius@gmail.com (69.84.112.50)','isellemails.com','delete_mailbox','awd@isellemails.com',110),('2021-01-15 07:40:32','winicius@gmail.com (69.84.112.50)','isellemails.com','edit_alias','vinny@isellemails.com',111),('2021-01-15 07:40:32','winicius@gmail.com (69.84.112.50)','isellemails.com','edit_mailbox','vinny@isellemails.com',112),('2021-01-15 22:13:05',' (69.84.112.50)','isellemails.com','create_alias','sarah@isellemails.com',113),('2021-01-15 22:13:05',' (69.84.112.50)','isellemails.com','create_mailbox','sarah@isellemails.com',114),('2021-01-15 22:27:20',' (172.58.15.117)','isellemails.com','create_alias','jc@isellemails.com',115),('2021-01-15 22:27:20',' (172.58.15.117)','isellemails.com','create_mailbox','jc@isellemails.com',116),('2021-01-16 18:41:20','winicius@gmail.com (172.58.11.190)','','create_admin','patrick@isellemails.com',117),('2021-01-24 05:39:58','winicius@gmail.com (69.84.112.50)','isellemails.com','create_alias','darren@isellemails.com',118),('2021-01-24 05:39:58','winicius@gmail.com (69.84.112.50)','isellemails.com','create_mailbox','darren@isellemails.com',119),('2021-01-25 01:04:51',' (172.58.12.102)','isellemails.com','create_alias','lizzo@isellemails.com',120),('2021-01-25 01:04:51',' (172.58.12.102)','isellemails.com','create_mailbox','lizzo@isellemails.com',121),('2021-05-26 07:41:15',' (105.112.101.16)','isellemails.com','create_alias','shemma@isellemails.com',122),('2021-05-26 07:41:15',' (105.112.101.16)','isellemails.com','create_mailbox','shemma@isellemails.com',123),('2021-05-27 11:36:01',' (105.112.97.204)','isellemails.com','create_alias','perryhughes23@isellemails.com',124),('2021-05-27 11:36:01',' (105.112.97.204)','isellemails.com','create_mailbox','perryhughes23@isellemails.com',125),('2021-05-29 15:53:55','winicius@gmail.com (69.84.112.50)','','create_admin','vinny@isellemails.com',126),('2021-05-29 15:54:16','winicius@gmail.com (69.84.112.50)','','edit_admin','winicius@gmail.com',127),('2021-07-06 17:39:43','vinny@isellemails.com (172.58.174.249)','isellemails.com','edit_alias','darren@isellemails.com',128),('2021-07-06 17:39:43','vinny@isellemails.com (172.58.174.249)','isellemails.com','edit_mailbox','darren@isellemails.com',129),('2021-07-09 22:42:14','vinny@isellemails.com (172.58.128.158)','isellemails.com','create_alias','alex@isellemails.com',130),('2021-07-09 22:42:14','vinny@isellemails.com (172.58.128.158)','isellemails.com','create_mailbox','alex@isellemails.com',131),('2021-09-02 14:31:11','vinny@isellemails.com (172.58.174.168)','isellemails.com','edit_alias','postmaster@isellemails.com',132),('2021-09-02 14:31:25','vinny@isellemails.com (172.58.174.168)','isellemails.com','edit_alias','webmaster@isellemails.com',133),('2021-09-02 14:31:37','vinny@isellemails.com (172.58.174.168)','isellemails.com','edit_alias','hostmaster@isellemails.com',134),('2021-09-02 14:31:49','vinny@isellemails.com (172.58.174.168)','isellemails.com','edit_alias','abuse@isellemails.com',135),('2022-02-03 20:21:34','vinny@isellemails.com (172.58.129.222)','isellemails.com','create_alias','wini@isellemails.com',136),('2022-02-03 20:22:04','vinny@isellemails.com (172.58.129.222)','isellemails.com','create_mailbox','wini@isellemails.com',137),('2022-02-03 23:19:53','vinny@isellemails.com (69.84.112.50)','isellemails.com','delete_alias','wini@isellemails.com',138),('2022-02-03 23:20:17','vinny@isellemails.com (69.84.112.50)','isellemails.com','create_alias','wini@isellemails.com',139),('2022-02-03 23:20:47','vinny@isellemails.com (69.84.112.50)','isellemails.com','create_mailbox','wini@isellemails.com',140),('2022-02-03 23:21:33','vinny@isellemails.com (69.84.112.50)','isellemails.com','delete_alias','wini@isellemails.com',141),('2022-02-03 23:21:54','vinny@isellemails.com (69.84.112.50)','isellemails.com','create_alias','wini@isellemails.com',142),('2022-02-03 23:22:24','vinny@isellemails.com (69.84.112.50)','isellemails.com','create_mailbox','wini@isellemails.com',143),('2022-02-03 23:25:59','vinny@isellemails.com (69.84.112.50)','isellemails.com','delete_alias','wini@isellemails.com',144),('2022-02-03 23:27:22','vinny@isellemails.com (69.84.112.50)','isellemails.com','create_alias','wini@isellemails.com',145),('2022-02-03 23:27:52','vinny@isellemails.com (69.84.112.50)','isellemails.com','create_mailbox','wini@isellemails.com',146),('2022-02-03 23:30:42','vinny@isellemails.com (69.84.112.50)','isellemails.com','delete_alias','xvv@isellemails.com',147),('2022-02-06 09:32:23','vinny@isellemails.com (172.58.128.153)','isellemails.com','edit_alias','alex@isellemails.com',148),('2022-02-06 09:32:23','vinny@isellemails.com (172.58.128.153)','isellemails.com','edit_mailbox','alex@isellemails.com',149),('2022-02-21 18:09:01','vinny@isellemails.com (69.84.112.50)','','create_admin','wini@isellemails.com',150),('2022-02-21 20:13:55','Wini@isellemails.com (73.1.44.198)','isellemails.com','create_alias','test@isellemails.com',151),('2022-02-21 20:13:56','Wini@isellemails.com (73.1.44.198)','isellemails.com','create_mailbox','test@isellemails.com',152);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox`
--

DROP TABLE IF EXISTS `mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailbox` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maildir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quota` bigint NOT NULL DEFAULT '0',
  `local_part` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `token_validity` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`username`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Mailboxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox`
--

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
INSERT INTO `mailbox` VALUES ('alex@isellemails.com','$1$c08b69be$P..0rq9HWWfwein/kaitv0','Alex','isellemails.com/alex/',2048000000,'alex','isellemails.com','2021-07-09 22:42:14','2022-02-06 09:32:23',1,'','','','2021-07-09 18:42:14'),('darren@isellemails.com','$1$b84511d8$5ShB63LVzqqAe297l.wN.0','Darren','isellemails.com/darren/',2048000000,'darren','isellemails.com','2021-01-24 05:39:58','2021-07-06 17:39:43',1,'','','','2021-01-24 00:39:58'),('jc@isellemails.com','$1$e2ff36f0$KBm44MrQJLVj0O8vYgEfg1','Jean Carlo','isellemails.com/jc/',2048000000,'jc','isellemails.com','2021-01-15 22:27:20','2021-01-15 22:27:20',1,'','','','2021-01-15 17:27:20'),('lizzo@isellemails.com','$1$a2d72311$kxWpsrkidwDFNVqz3/YlK0','Lizzo','isellemails.com/lizzo/',2048000000,'lizzo','isellemails.com','2021-01-25 01:04:51','2021-01-25 01:04:51',1,'','','','2021-01-24 20:04:50'),('patrick@isellemails.com','$1$f6be1673$G2yZykUQWfyQofGtg/Zyv.','Patrick','isellemails.com/patrick/',2048000000,'patrick','isellemails.com','2021-01-12 05:07:06','2021-01-12 20:57:00',1,'','','','2021-01-12 00:07:06'),('perryhughes23@isellemails.com','$1$f3fffd35$hd.Ino2yDnXDqIL5p5LZY.','Hughes Perry','isellemails.com/perryhughes23/',2048000000,'perryhughes23','isellemails.com','2021-05-27 11:36:01','2021-05-27 11:36:01',1,'','ooozone1@gmail.com','','2021-05-27 07:36:01'),('sarah@isellemails.com','$1$fae8ac56$8u5k55yeki64nh.wo.6wP1','Sarah B','isellemails.com/sarah/',2048000000,'sarah','isellemails.com','2021-01-15 22:13:05','2021-01-15 22:13:05',1,'','','','2021-01-15 17:13:04'),('shemma@isellemails.com','$1$W11rBhdT$O7AXFYckgAbOlRsl6dhCF.','Shemma Katja','isellemails.com/shemma/',2048000000,'shemma','isellemails.com','2021-05-26 07:41:15','2021-05-26 07:41:15',1,'','','','2021-05-26 03:41:14'),('test@isellemails.com','$1$27fa3ada$FQ24GwzngIkXLdxv2D.kO0','Test','isellemails.com/test/',1024000,'Test','isellemails.com','2022-02-21 20:13:55','2022-02-21 20:13:55',1,'','Rbourov@hotmail.com','','2022-02-21 15:13:55'),('vinny@isellemails.com','$1$6YieYTvF$UTEw6sVmFwk6o47pc35S90','Vinny Siqueira','isellemails.com/vinny/',8192000000,'vinny','isellemails.com','2020-12-21 15:23:51','2021-01-15 07:40:32',1,'','','','2020-12-21 10:23:11'),('wini@isellemails.com','$1$6f900483$2xRfxVc97dir6XFppLTvq/','Wini','isellemails.com/wini/',102400000,'wini','isellemails.com','2022-02-03 23:27:22','2022-02-03 23:27:22',1,'','','','2022-02-03 18:27:22');
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quota` (
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `path` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `current` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota2`
--

DROP TABLE IF EXISTS `quota2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quota2` (
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bytes` bigint NOT NULL DEFAULT '0',
  `messages` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota2`
--

LOCK TABLES `quota2` WRITE;
/*!40000 ALTER TABLE `quota2` DISABLE KEYS */;
INSERT INTO `quota2` VALUES ('alex@isellemails.com',166009,10),('darren@isellemails.com',1404,1),('jc@isellemails.com',1399,1),('lizzo@isellemails.com',1420,1),('patrick@isellemails.com',3324,2),('perryhughes23@isellemails.com',1476501,131),('sarah@isellemails.com',3331,2),('shemma@isellemails.com',11398281,88),('test@isellemails.com',716,1),('vinny@isellemails.com',1191721600,11800),('wini@isellemails.com',257315,18),('xvv@isellemails.com',1406,1);
/*!40000 ALTER TABLE `quota2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation`
--

DROP TABLE IF EXISTS `vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `activefrom` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `activeuntil` timestamp NOT NULL DEFAULT '2038-01-18 00:00:00',
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `interval_time` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Vacation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation`
--

LOCK TABLES `vacation` WRITE;
/*!40000 ALTER TABLE `vacation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation_notification`
--

DROP TABLE IF EXISTS `vacation_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacation_notification` (
  `on_vacation` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`on_vacation`,`notified`),
  CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Postfix Admin - Virtual Vacation Notifications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation_notification`
--

LOCK TABLES `vacation_notification` WRITE;
/*!40000 ALTER TABLE `vacation_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation_notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-21 21:34:33
