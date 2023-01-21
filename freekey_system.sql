-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: freekey_system
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `c_banner`
--

DROP TABLE IF EXISTS `c_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_banner` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `image` varchar(64) NOT NULL,
  `link` varchar(128) DEFAULT NULL,
  `desc` varchar(64) DEFAULT NULL,
  `sort` int DEFAULT '0',
  `status` tinyint unsigned DEFAULT '1' COMMENT '1open 2close',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_banner`
--

LOCK TABLES `c_banner` WRITE;
/*!40000 ALTER TABLE `c_banner` DISABLE KEYS */;
INSERT INTO `c_banner` VALUES (2,'test','/image/p005.gif','https://google.com','',0,1,'2022-12-28 08:58:38');
/*!40000 ALTER TABLE `c_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_admin`
--

DROP TABLE IF EXISTS `s_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int NOT NULL,
  `uname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unread_msg_num` int unsigned DEFAULT '0',
  `pwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `rid` (`rid`),
  KEY `unread_msg_num` (`unread_msg_num`),
  CONSTRAINT `s_admin_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `s_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_admin`
--

LOCK TABLES `s_admin` WRITE;
/*!40000 ALTER TABLE `s_admin` DISABLE KEYS */;
INSERT INTO `s_admin` VALUES (1,1,'ciel',25,'$2a$10$bWpBXp967TyNderVKIElPeAVJFY9gL77sU4WoJJUzhMVCVHObGlya','I\'m ciel','','',1,'2022-03-07 16:59:33','2023-01-20 00:29:00'),(42,1,'admin',64,'$2a$10$d2PbGXoRkbOZ.VVTHRgc6umhihYTZIqCRCoP1/v.vf7f9tIhbzW8q','admin','','',1,'2022-07-02 11:28:52','2023-01-21 00:30:50'),(51,1,'admin1',0,'$2a$10$tVS3xC9Fsiqk4Yx11Mp.AOwoXE48rOhhNqdbvhyeEQI0.OiTumYH6','admin122','','',1,'2023-01-15 21:00:07','2023-01-19 11:31:22');
/*!40000 ALTER TABLE `s_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_admin_login_log`
--

DROP TABLE IF EXISTS `s_admin_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_admin_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL COMMENT '{"label":"用户id","searchType":1,"hide":1,"disabled":1,"required":1}',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' {"label":"登录IP","notShow":0,"fieldType":"text","editHide":0,"editDisabled":0,"required":1}',
  `area` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '{"searchType":2,"hide":1}',
  `status` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `s_admin_login_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `s_admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_admin_login_log`
--

LOCK TABLES `s_admin_login_log` WRITE;
/*!40000 ALTER TABLE `s_admin_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_admin_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_admin_message`
--

DROP TABLE IF EXISTS `s_admin_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_admin_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aid` bigint unsigned NOT NULL,
  `type` tinyint unsigned DEFAULT '1' COMMENT '1 系统消息',
  `title` varchar(128) NOT NULL,
  `content` text,
  `url` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_admin_message`
--

LOCK TABLES `s_admin_message` WRITE;
/*!40000 ALTER TABLE `s_admin_message` DISABLE KEYS */;
INSERT INTO `s_admin_message` VALUES (13,1,1,'用户user33创建了10.00充值订单','','/admin/walletTopUpApplication?trans_id=MR-tK9lQIqj9SfSL','2022-12-27 20:24:39');
/*!40000 ALTER TABLE `s_admin_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_api`
--

DROP TABLE IF EXISTS `s_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_api` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(64) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `method` int DEFAULT NULL COMMENT '1 get 2 post 3 put 4 delete',
  `desc` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_api`
--

LOCK TABLES `s_api` WRITE;
/*!40000 ALTER TABLE `s_api` DISABLE KEYS */;
INSERT INTO `s_api` VALUES (1,'管理员','/backend/getCaptcha',1,'获取验证码','2023-01-16 17:04:25','2023-01-19 15:35:00'),(2,'管理员','/backend/login',2,'管理员登录','2023-01-16 17:07:50','2023-01-16 17:07:50'),(3,'管理员','/backend/admin/getInfo',1,'获取登录信息','2023-01-16 17:08:19','2023-01-16 17:08:19'),(4,'管理员','/backend/admin/getMenu',1,'获取菜单信息','2023-01-16 09:08:55','2023-01-17 15:23:33'),(5,'菜单','/backend/menu',1,NULL,'2023-01-16 17:08:55','2023-01-16 17:08:55'),(6,'菜单','/backend/menu/list',1,NULL,'2023-01-16 17:08:55','2023-01-16 17:08:55'),(7,'菜单','/backend/menu',2,NULL,'2023-01-16 17:08:55','2023-01-16 17:08:55'),(8,'菜单','/backend/menu',3,NULL,'2023-01-16 17:08:55','2023-01-16 17:08:55'),(9,'菜单','/backend/menu',4,NULL,'2023-01-16 17:08:55','2023-01-16 17:08:55'),(10,'菜单','/backend/menu/sort',1,'菜单排序','2023-01-16 17:08:55','2023-01-16 17:08:55'),(11,'API','/backend/api',1,NULL,'2023-01-16 09:12:32','2023-01-18 08:18:09'),(12,'API','/backend/api/list',1,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(13,'API','/backend/api',2,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(14,'API','/backend/api',3,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(15,'API','/backend/api',4,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(16,'角色','/backend/role',1,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(17,'角色','/backend/role/list',1,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(18,'角色','/backend/role',2,NULL,'2023-01-16 17:12:32','2023-01-16 17:12:32'),(19,'角色','/backend/role',3,NULL,'2023-01-16 17:13:02','2023-01-16 17:13:02'),(20,'角色','/backend/role',4,NULL,'2023-01-16 17:13:02','2023-01-16 17:13:02'),(21,'角色','/backend/roleApi',1,NULL,'2023-01-16 17:13:02','2023-01-16 17:13:02'),(22,'角色','/backend/roleApi/list',1,NULL,'2023-01-16 17:13:02','2023-01-16 17:13:02'),(23,'角色','/backend/roleApi',2,NULL,'2023-01-16 17:13:02','2023-01-16 17:13:02'),(24,'角色','/backend/roleApi',3,NULL,'2023-01-16 17:14:31','2023-01-16 17:14:31'),(25,'角色','/backend/roleApi',4,NULL,'2023-01-16 17:14:31','2023-01-16 17:14:31'),(26,'角色','/backend/roleMenu',1,NULL,'2023-01-16 19:36:56','2023-01-16 19:36:56'),(27,'角色','/backend/roleMenu',1,NULL,'2023-01-16 19:36:56','2023-01-16 19:36:56'),(28,'角色','/backend/roleMenu',2,NULL,'2023-01-16 19:36:56','2023-01-16 19:36:56'),(29,'角色','/backend/roleMenu',3,NULL,'2023-01-16 19:36:56','2023-01-16 19:36:56'),(30,'角色','/backend/roleMenu',4,NULL,'2023-01-16 19:36:56','2023-01-19 15:35:05'),(31,'管理员','/backend/admin/updateUname',3,'修改管理员账户','2023-01-16 23:10:52','2023-01-17 15:13:36'),(32,'管理员','/backend/adminn/updatePass',3,'修改管理员密码','2023-01-17 15:20:31','2023-01-17 15:20:31'),(43,'角色','/backend/role',1,'','2023-01-19 16:48:39','2023-01-19 16:48:39'),(44,'角色','/backend/role/list',1,'','2023-01-19 16:48:39','2023-01-19 16:48:39'),(45,'角色','/backend/role',2,'','2023-01-19 16:48:39','2023-01-19 16:48:39'),(46,'角色','/backend/role',3,'','2023-01-19 16:48:39','2023-01-19 16:48:39'),(47,'角色','/backend/role',4,'','2023-01-19 16:48:39','2023-01-19 16:48:39'),(48,'字典','/backend/dict',1,'','2023-01-19 16:59:11','2023-01-19 16:59:11'),(49,'字典','/backend/dict/list',1,'','2023-01-19 16:59:11','2023-01-19 16:59:11'),(50,'字典','/backend/dict',2,'','2023-01-19 16:59:11','2023-01-19 16:59:11'),(51,'字典','/backend/dict',3,'','2023-01-19 16:59:11','2023-01-19 16:59:11'),(52,'字典','/backend/dict',4,'','2023-01-19 16:59:11','2023-01-19 16:59:11'),(53,'文件','/backend/file',1,'','2023-01-19 16:59:57','2023-01-19 16:59:57'),(54,'文件','/backend/file/list',1,'','2023-01-19 16:59:57','2023-01-19 16:59:57'),(55,'文件','/backend/file',2,'','2023-01-19 16:59:57','2023-01-19 16:59:57'),(56,'文件','/backend/file',3,'','2023-01-19 16:59:57','2023-01-19 16:59:57'),(57,'文件','/backend/file',4,'','2023-01-19 16:59:57','2023-01-19 16:59:57'),(58,'文件','/backend/file/upload',2,'上传文件','2023-01-19 17:01:43','2023-01-19 17:01:43'),(59,'操作日志','/backend/operationLog',1,'','2023-01-19 17:02:02','2023-01-19 17:02:02'),(60,'操作日志','/backend/operationLog/list',1,'','2023-01-19 17:02:02','2023-01-19 17:02:02'),(61,'操作日志','/backend/operationLog',2,'','2023-01-19 17:02:02','2023-01-19 17:02:02'),(62,'操作日志','/backend/operationLog',3,'','2023-01-19 17:02:02','2023-01-19 17:02:02'),(63,'操作日志','/backend/operationLog',4,'','2023-01-19 17:02:02','2023-01-19 17:02:02'),(64,'操作日志','/backend/operationLog/delClear',4,'清空','2023-01-19 17:02:23','2023-01-19 17:02:23'),(65,'登陆日志','/backend/adminLoginLog',1,'','2023-01-19 17:02:52','2023-01-19 17:02:52'),(66,'登陆日志','/backend/adminLoginLog/list',1,'','2023-01-19 17:02:52','2023-01-19 17:02:52'),(67,'登陆日志','/backend/adminLoginLog',2,'','2023-01-19 17:02:52','2023-01-19 17:02:52'),(68,'登陆日志','/backend/adminLoginLog',3,'','2023-01-19 17:02:52','2023-01-19 17:02:52'),(69,'登陆日志','/backend/adminLoginLog',4,'','2023-01-19 17:02:52','2023-01-19 17:02:52'),(70,'登陆日志','/backend/adminLoginLog/delClear',4,'清空','2023-01-19 17:03:51','2023-01-19 17:03:51'),(71,'banner','/backend/banner',1,'','2023-01-19 17:04:02','2023-01-19 17:04:02'),(72,'banner','/backend/banner/list',1,'','2023-01-19 17:04:02','2023-01-19 17:04:02'),(73,'banner','/backend/banner',2,'','2023-01-19 17:04:02','2023-01-19 17:04:02'),(74,'banner','/backend/banner',3,'','2023-01-19 17:04:02','2023-01-19 17:04:02'),(75,'banner','/backend/banner',4,'','2023-01-19 17:04:02','2023-01-19 17:04:02'),(76,'用户','/backend/user',1,'','2023-01-19 17:04:39','2023-01-19 17:04:39'),(77,'用户','/backend/user/list',1,'','2023-01-19 17:04:39','2023-01-19 17:04:39'),(78,'用户','/backend/user',2,'','2023-01-19 17:04:39','2023-01-19 17:04:39'),(79,'用户','/backend/user',3,'','2023-01-19 17:04:39','2023-01-19 17:04:39'),(80,'用户','/backend/user',4,'','2023-01-19 17:04:39','2023-01-19 17:04:39'),(81,'用户','/backend/user/updateUname',3,'修改用户名','2023-01-19 17:05:03','2023-01-19 17:05:03'),(82,'用户','/backend/user/updatePass',3,'修改密码','2023-01-19 17:05:34','2023-01-19 17:05:34'),(83,'用户登录日志','/backend/userLoginLog',1,'','2023-01-19 17:06:30','2023-01-19 17:06:30'),(84,'用户登录日志','/backend/userLoginLog/list',1,'','2023-01-19 17:06:30','2023-01-19 17:06:30'),(85,'用户登录日志','/backend/userLoginLog',2,'','2023-01-19 17:06:30','2023-01-19 17:06:30'),(86,'用户登录日志','/backend/userLoginLog',3,'','2023-01-19 17:06:30','2023-01-19 17:06:30'),(87,'用户登录日志','/backend/userLoginLog',4,'','2023-01-19 17:06:30','2023-01-19 17:06:30'),(88,'钱包','/backend/wallet',1,'','2023-01-19 17:07:15','2023-01-19 17:07:15'),(89,'钱包','/backend/wallet/list',1,'','2023-01-19 17:07:15','2023-01-19 17:07:15'),(90,'钱包','/backend/wallet',2,'','2023-01-19 17:07:15','2023-01-19 17:07:15'),(91,'钱包','/backend/wallet',3,'','2023-01-19 17:07:15','2023-01-19 17:07:15'),(92,'钱包','/backend/wallet',4,'','2023-01-19 17:07:15','2023-01-19 17:07:15'),(93,'钱包','/backend/wallet/updatePass',3,'修改密码','2023-01-19 17:07:57','2023-01-19 17:07:57'),(94,'钱包','/backend/wallet/updateByAdmin',3,'管理员充值','2023-01-19 17:08:21','2023-01-19 17:08:21'),(95,'账变类型','/backend/walletChangeType',1,'','2023-01-19 17:11:30','2023-01-19 17:11:30'),(96,'账变类型','/backend/walletChangeType/list',1,'','2023-01-19 17:11:30','2023-01-19 17:11:30'),(97,'账变类型','/backend/walletChangeType',2,'','2023-01-19 17:11:30','2023-01-19 17:11:30'),(98,'账变类型','/backend/walletChangeType',3,'','2023-01-19 17:11:30','2023-01-19 17:11:30'),(99,'账变类型','/backend/walletChangeType',4,'','2023-01-19 17:11:30','2023-01-19 17:11:30'),(100,'账变记录','/backend/walletChangeLog',1,'','2023-01-19 17:11:55','2023-01-19 17:11:55'),(101,'账变记录','/backend/walletChangeLog/list',1,'','2023-01-19 17:11:55','2023-01-19 17:11:55'),(102,'账变记录','/backend/walletChangeLog',2,'','2023-01-19 17:11:55','2023-01-19 17:11:55'),(103,'账变记录','/backend/walletChangeLog',3,'','2023-01-19 17:11:55','2023-01-19 17:11:55'),(104,'账变记录','/backend/walletChangeLog',4,'','2023-01-19 17:11:55','2023-01-19 17:11:55'),(105,'充值订单','/backend/walletTopUpApplication',1,'','2023-01-19 17:13:59','2023-01-19 17:13:59'),(106,'充值订单','/backend/walletTopUpApplication/list',1,'','2023-01-19 17:13:59','2023-01-19 17:13:59'),(107,'充值订单','/backend/walletTopUpApplication',2,'','2023-01-19 17:13:59','2023-01-19 17:13:59'),(108,'充值订单','/backend/walletTopUpApplication',3,'','2023-01-19 17:13:59','2023-01-19 17:13:59'),(109,'充值订单','/backend/walletTopUpApplication',4,'','2023-01-19 17:13:59','2023-01-19 17:13:59'),(110,'菜单','/backend/api/addGroup',2,'','2023-01-19 18:50:11','2023-01-19 18:50:11');
/*!40000 ALTER TABLE `s_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_dict`
--

DROP TABLE IF EXISTS `s_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_dict` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `k` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `v` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sys',
  `status` int DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1 文本，2 img',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `k` (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_dict`
--

LOCK TABLES `s_dict` WRITE;
/*!40000 ALTER TABLE `s_dict` DISABLE KEYS */;
INSERT INTO `s_dict` VALUES (11,'API分组选项','api_group','菜单\r\nAPI\r\n角色\r\n管理员\r\n字典\r\n文件\r\n操作日志\r\n登陆日志\r\n备忘录\r\n管理员消息\r\n用户\r\n用户登录日志\r\n金币\r\n充值类型\r\n账变纪录\r\n账变统计\n书籍分类\n书籍作者\n书籍\n章节\n书籍列表\n百科\n语录\n外链\n阅读\n阅读分类\n英语文章\n英语关卡\n英语文章段落\n英语文章单词\n问与答\n问与答分类\nquestion\nwallet_top_up_application\nadmin_message\nbanner','API分组选项','1',1,1,'2022-02-27 20:40:57','2022-12-29 00:46:37'),(42,'系统白名单','white_ips','','多个ip用小写逗号隔开','1',1,1,'2022-07-23 19:04:44','2022-09-03 20:42:02'),(44,'欢迎语','great','hello2',NULL,'2',1,1,'2022-12-28 12:25:41','2023-01-17 15:46:08'),(49,'宽度','width','1060px','','1',1,1,'2023-01-20 20:20:20','2023-01-20 20:20:20');
/*!40000 ALTER TABLE `s_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_file`
--

DROP TABLE IF EXISTS `s_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_file` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_file`
--

LOCK TABLES `s_file` WRITE;
/*!40000 ALTER TABLE `s_file` DISABLE KEYS */;
INSERT INTO `s_file` VALUES (87,'/icon/icon01.png',1,1,'2022-12-25 23:13:53','2022-12-25 23:13:53'),(88,'/icon/icon02.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(103,'/icon/icon03.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(104,'/icon/icon04.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(105,'/icon/icon05.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(106,'/icon/icon06.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(107,'/icon/icon07.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(108,'/icon/icon08.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(109,'/icon/icon09.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(110,'/icon/icon10.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(111,'/icon/icon11.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(112,'/icon/icon12.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(113,'/icon/icon13.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(114,'/icon/icon14.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(115,'/icon/icon15.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(116,'/icon/icon16.png',1,1,'2022-12-26 13:17:06','2022-12-26 13:17:06'),(117,'/icon/icon17.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(118,'/icon/icon18.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(119,'/icon/icon19.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(120,'/icon/icon20.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(121,'/icon/icon21.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(122,'/icon/icon22.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(123,'/icon/icon23.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(124,'/icon/icon24.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(125,'/icon/icon25.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(126,'/icon/icon26.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(127,'/icon/icon27.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(128,'/icon/icon28.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(129,'/icon/icon29.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(130,'/icon/icon30.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(131,'/icon/icon31.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(133,'/icon/icon33.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(134,'/icon/icon34.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(135,'/icon/icon35.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(136,'/icon/icon36.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(137,'/icon/icon37.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(138,'/icon/icon38.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(139,'/icon/icon39.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(140,'/icon/icon40.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(141,'/icon/icon41.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(142,'/icon/icon42.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(143,'/icon/icon43.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(144,'/icon/icon44.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(145,'/icon/icon45.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(146,'/icon/icon46.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(147,'/icon/icon47.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(148,'/icon/icon48.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(149,'/icon/icon49.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50'),(150,'/icon/icon50.png',1,1,'2022-12-26 13:35:50','2022-12-26 13:35:50');
/*!40000 ALTER TABLE `s_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_menu`
--

DROP TABLE IF EXISTS `s_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bg_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` decimal(7,2) NOT NULL DEFAULT '0.00',
  `type` int NOT NULL DEFAULT '1' COMMENT '1normal 2group',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_menu`
--

LOCK TABLES `s_menu` WRITE;
/*!40000 ALTER TABLE `s_menu` DISABLE KEYS */;
INSERT INTO `s_menu` VALUES (1,-1,'','','系统','/',1.00,2,'','',1,'2022-06-18 06:18:55','2023-01-20 01:14:45'),(2,1,'/image/p005.gif','','菜单','/backend/sys/menu',1.10,1,'这里是菜单页面','',2,'2022-02-15 03:14:13','2023-01-19 06:56:33'),(3,1,'/image/p002.png','','角色','/backend/sys/role',1.30,1,'角色权限管理，在这里可以创建新的角色','',1,'2022-03-04 08:57:14','2023-01-17 06:05:52'),(4,1,'/image/p003.png','','API','/backend/sys/api',1.20,1,'系统所有api在此页面展示。开发人员在添加新分组后，需要到根目录下的.env文件 `API_GROUP=`添加新的分组名称','',1,'2022-07-03 06:25:52','2023-01-19 11:24:09'),(5,1,'/image/p004.png','','管理员','/backend/sys/admin',1.40,1,'','',1,'2022-03-07 23:45:04','2023-01-17 06:05:52'),(28,1,'/image/p005.gif','','字典','/backend/sys/dict',1.50,1,'字典页面','',1,'2022-03-06 23:45:04','2023-01-19 07:05:12'),(30,1,'/image/p006.gif','','文件','/backend/sys/file',1.60,1,'','',1,'2022-03-08 08:05:30','2023-01-17 06:05:52'),(78,1,'/image/p007.png','','操作日志','/backend/sys/operationLog',1.80,1,'','',1,'2022-06-13 11:59:57','2023-01-17 06:05:52'),(139,1,'/image/test.png','','登录日志','/backend/sys/adminLoginLog',1.90,1,'这里是登陆日志页面可以对数据进行相应的操作。','',1,'2022-07-11 11:06:26','2023-01-19 11:46:17'),(171,-1,'','','用户','',5.00,2,'','',1,'2022-09-01 14:24:18','2023-01-14 09:10:02'),(172,171,'','','用户列表','/backend/user',5.10,1,'这里是用户管理页面','',1,'2022-08-31 22:24:18','2023-01-18 06:13:30'),(173,171,'','','登录日志','/backend/user/userLoginLog',5.20,1,'','',1,'2022-09-02 14:47:17','2023-01-18 05:50:27'),(174,171,'','','钱包','/backend/user/wallet',5.30,1,'','',1,'2022-09-03 20:32:44','2023-01-18 07:39:27'),(175,-1,'','','配置','/',2.00,2,'','',1,'2022-09-04 23:02:32','2023-01-19 11:24:33'),(176,175,'','','账变类型','/backend/setting/walletChangeType',2.10,1,'','',1,'2022-09-04 07:02:32','2023-01-18 05:36:10'),(177,171,'','','账变记录','/backend/user/walletChangeLog',5.40,1,'','',1,'2022-09-04 19:09:03','2023-01-18 05:50:17'),(178,-1,'','','统计','',4.00,2,'','',1,'2022-09-05 03:15:18','2022-12-28 16:49:59'),(179,178,'','','账变统计','/backend/user/walletStatisticsLog',4.10,1,'','',1,'2022-09-04 19:15:18','2023-01-18 12:00:47'),(180,178,'','','账变报表','/backend/user/walletReport',4.20,1,'','',1,'2022-09-05 22:14:24','2023-01-18 12:46:19'),(202,171,'','','充值订单','/backend/user/walletTopUpApplication',5.50,1,'','',1,'2022-12-25 19:35:13','2023-01-18 05:53:09'),(204,-1,'','','通用','',3.00,2,'','',1,'2022-12-28 16:46:37','2022-12-28 16:48:10'),(205,204,'','','Banner','/backend/common/banner',3.10,1,'','',1,'2022-12-28 00:46:37','2023-01-18 05:48:13'),(230,1,'','','文档与测试','/backend/sys/test?name=CSS',1.91,1,'','',0,'2023-01-19 11:42:54','2023-01-20 12:08:58');
/*!40000 ALTER TABLE `s_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_operation_log`
--

DROP TABLE IF EXISTS `s_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_operation_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_time` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_operation_log`
--

LOCK TABLES `s_operation_log` WRITE;
/*!40000 ALTER TABLE `s_operation_log` DISABLE KEYS */;
INSERT INTO `s_operation_log` VALUES (2725,42,'http://localhost:2033/backend/operationLog/delClear','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/operationLog/delClear','::1',6,'2023-01-19 19:31:34'),(2726,42,'{\"id\":28,\"name\":\"测试管理员\",\"createdAt\":\"2023-01-16 06:10:16\",\"updatedAt\":\"2023-01-17 14:04:25\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/role','::1',8,'2023-01-19 19:34:57'),(2727,42,'{\"id\":1,\"pid\":-1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"系统\",\"path\":\"/\",\"sort\":1,\"type\":2,\"desc\":\"\",\"filePath\":\"\",\"status\":1,\"createdAt\":\"2022-06-18 14:18:55\",\"updatedAt\":\"2023-01-19 14:57:01\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',7,'2023-01-19 19:35:44'),(2728,42,'{\"pid\":\"1\",\"name\":\"测试页面\",\"path\":\"/backend/sys/test\",\"type\":\"1\",\"sort\":\"1.91\"}','{\"code\":0,\"message\":\"\",\"data\":null}','POST','/backend/menu','::1',6,'2023-01-19 19:42:54'),(2729,42,'{\"id\":139,\"pid\":1,\"icon\":\"/image/test.png\",\"bgImg\":\"\",\"name\":\"登录日志\",\"path\":\"/backend/sys/adminLoginLog\",\"sort\":1.9,\"type\":1,\"desc\":\"这里是登陆日志页面可以对数据进行相应的操作。\",\"filePath\":\"\",\"status\":1,\"createdAt\":\"2022-07-11 19:06:26\",\"updatedAt\":\"2023-...','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',7,'2023-01-19 19:46:17'),(2730,42,'{\"rid\":\"1\",\"mids\":[\"230\"]}','{\"code\":0,\"message\":\"\",\"data\":null}','POST','/backend/roleMenu/addRoleMenus','::1',4,'2023-01-19 19:47:14'),(2731,42,'{\"id\":230,\"pid\":1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"文档与测试\",\"path\":\"/backend/sys/test\",\"sort\":1.91,\"type\":1,\"desc\":\"\",\"filePath\":\"\",\"status\":0,\"createdAt\":\"2023-01-19 19:42:54\",\"updatedAt\":\"2023-01-19 19:42:54\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',7,'2023-01-19 20:03:26'),(2732,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:12:29'),(2733,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:12:39'),(2734,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:13:17'),(2735,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:13:19'),(2736,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:13:28'),(2737,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:14:36'),(2738,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:14:48'),(2739,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:14:51'),(2740,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"success\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:14:54'),(2741,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"success\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:14:56'),(2742,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"success\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:15:20'),(2743,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:15:31'),(2744,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"info\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:15:33'),(2745,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"success\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:15:35'),(2746,42,'{\"toUname\":\"admin\",\"msg\":\"hello\",\"type\":\"success\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:15:36'),(2747,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:17:53'),(2748,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:03'),(2749,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:18:11'),(2750,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:17'),(2751,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:18'),(2752,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:18:18'),(2753,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:18'),(2754,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:19'),(2755,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',12,'2023-01-20 00:18:19'),(2756,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:18:19'),(2757,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:19'),(2758,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:18:20'),(2759,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:20'),(2760,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:18:20'),(2761,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:18:20'),(2762,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:18:20'),(2763,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:18:20'),(2764,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:18:21'),(2765,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:18:21'),(2766,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:19:02'),(2767,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:20:14'),(2768,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:20:16'),(2769,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:20:17'),(2770,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:20:26'),(2771,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:20:31'),(2772,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:20:57'),(2773,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:21:00'),(2774,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:21:06'),(2775,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:21:08'),(2776,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 00:22:08'),(2777,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:22:09'),(2778,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:22:12'),(2779,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:22:15'),(2780,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:22:17'),(2781,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:22:17'),(2782,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"hello\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:22:18'),(2783,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:22:43'),(2784,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:22:44'),(2785,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:22:46'),(2786,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:22:47'),(2787,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:22:47'),(2788,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:22:47'),(2789,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:22:47'),(2790,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:22:48'),(2791,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:22:52'),(2792,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:22:52'),(2793,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:22:52'),(2794,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:23:21'),(2795,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:23:25'),(2796,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:23:27'),(2797,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:23:31'),(2798,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:23:38'),(2799,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:23:39'),(2800,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:23:39'),(2801,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:23:39'),(2802,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:23:39'),(2803,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin2\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:23:42'),(2804,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:23:45'),(2805,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:23:47'),(2806,42,'{\"toUname\":\"admin3\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":-1,\"msg\":\"用户数据不存在\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:23:58'),(2807,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:01'),(2808,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:24:03'),(2809,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:24:03'),(2810,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:04'),(2811,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:04'),(2812,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:24:06'),(2813,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:07'),(2814,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:07'),(2815,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:24:07'),(2816,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:07'),(2817,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:07'),(2818,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:07'),(2819,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:24:09'),(2820,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:24:09'),(2821,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:10'),(2822,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:24:13'),(2823,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:28'),(2824,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:24:29'),(2825,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:29'),(2826,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:30'),(2827,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:30'),(2828,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:24:30'),(2829,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:24:30'),(2830,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:35'),(2831,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:36'),(2832,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:36'),(2833,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:24:36'),(2834,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:36'),(2835,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:24:51'),(2836,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:52'),(2837,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:24:52'),(2838,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:53'),(2839,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:24:53'),(2840,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:25:17'),(2841,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:25:18'),(2842,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:25:18'),(2843,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:25:18'),(2844,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:25:18'),(2845,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:25:37'),(2846,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:25:46'),(2847,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:25:47'),(2848,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',12,'2023-01-20 00:25:53'),(2849,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:25:54'),(2850,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',11,'2023-01-20 00:25:54'),(2851,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:25:55'),(2852,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:25:55'),(2853,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:25:56'),(2854,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:25:56'),(2855,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:25:56'),(2856,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:25:56'),(2857,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',12,'2023-01-20 00:25:56'),(2858,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:01'),(2859,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:04'),(2860,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:04'),(2861,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:04'),(2862,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:26:05'),(2863,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:07'),(2864,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:08'),(2865,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:08'),(2866,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:08'),(2867,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:08'),(2868,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:09'),(2869,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:09'),(2870,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:09'),(2871,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:21'),(2872,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:21'),(2873,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:26:21'),(2874,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:22'),(2875,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:22'),(2876,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:22'),(2877,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:22'),(2878,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:23'),(2879,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:26:36'),(2880,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:26:37'),(2881,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:39'),(2882,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:26:39'),(2883,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:26:39'),(2884,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:26:40'),(2885,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:40'),(2886,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:50'),(2887,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:26:51'),(2888,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:26:51'),(2889,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:26:51'),(2890,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:26:51'),(2891,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:51'),(2892,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:26:51'),(2893,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:26:51'),(2894,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:26:52'),(2895,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:26:52'),(2896,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:27:26'),(2897,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:27'),(2898,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:27:27'),(2899,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:27'),(2900,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:27:27'),(2901,42,'{\"toUname\":\"admin\",\"type\":\"error\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:28'),(2902,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:27:34'),(2903,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:27:35'),(2904,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:36'),(2905,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:27:36'),(2906,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:36'),(2907,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:27:38'),(2908,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:38'),(2909,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:38'),(2910,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:50'),(2911,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:51'),(2912,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:27:52'),(2913,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:52'),(2914,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:27:52'),(2915,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:27:52'),(2916,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:27:53'),(2917,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:53'),(2918,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:27:53'),(2919,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:27:53'),(2920,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:27:53'),(2921,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:27:54'),(2922,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:27:54'),(2923,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 00:27:54'),(2924,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:27:54'),(2925,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:27:54'),(2926,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:27:54'),(2927,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:55'),(2928,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:27:55'),(2929,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',13,'2023-01-20 00:28:06'),(2930,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:28:24'),(2931,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:28:42'),(2932,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:28:44'),(2933,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:28:45'),(2934,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:28:45'),(2935,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:29:01'),(2936,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:29:02'),(2937,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 00:29:02'),(2938,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:29:03'),(2939,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:29:03'),(2940,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 00:29:07'),(2941,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 00:29:18'),(2942,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:19'),(2943,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 00:29:19'),(2944,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:29:19'),(2945,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:29:19'),(2946,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:20'),(2947,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:20'),(2948,42,'{\"toUname\":\"admin\",\"type\":\"info\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:29:20'),(2949,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:29:34'),(2950,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:35'),(2951,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 00:29:35'),(2952,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:35'),(2953,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:35'),(2954,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:36'),(2955,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 00:29:41'),(2956,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 00:29:49'),(2957,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 07:40:52'),(2958,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 07:40:54'),(2959,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 07:40:56'),(2960,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 07:41:03'),(2961,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',11,'2023-01-20 07:41:13'),(2962,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 07:50:09'),(2963,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 07:50:14'),(2964,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',11,'2023-01-20 07:50:15'),(2965,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 08:04:13'),(2966,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',16,'2023-01-20 08:04:14'),(2967,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:04:15'),(2968,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:04:15'),(2969,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 08:04:19'),(2970,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 08:05:21'),(2971,42,'{\"toUname\":\"admin\",\"type\":\"warning\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:05:24'),(2972,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',15,'2023-01-20 08:07:33'),(2973,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 08:07:52'),(2974,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',2,'2023-01-20 08:18:48'),(2975,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',10,'2023-01-20 08:18:51'),(2976,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 08:21:36'),(2977,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 08:21:45'),(2978,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":-1,\"msg\":\"The ToUname field is required\"}','POST','/backend/ws/noticeAdmins','::1',3,'2023-01-20 08:22:08'),(2979,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',4,'2023-01-20 08:23:04'),(2980,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-20 08:23:10'),(2981,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-20 08:23:12'),(2982,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 08:23:42'),(2983,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',19,'2023-01-20 08:23:58'),(2984,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 08:24:00'),(2985,42,'{\"type\":\"\",\"msg\":\"Hello Everyone3\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',24,'2023-01-20 08:24:05'),(2986,42,'{\"type\":\"\",\"msg\":\"Hello Everyone3\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',8,'2023-01-20 08:24:08'),(2987,42,'{\"type\":\"\",\"msg\":\"Hello Everyone3\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',8,'2023-01-20 08:24:10'),(2988,42,'{\"type\":\"\",\"msg\":\"Hello Everyone3\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',6,'2023-01-20 08:24:11'),(2989,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',6,'2023-01-20 08:24:41'),(2990,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 08:24:43'),(2991,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',15,'2023-01-20 08:24:43'),(2992,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',7,'2023-01-20 08:24:44'),(2993,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-20 08:24:44'),(2994,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:24:47'),(2995,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',8,'2023-01-20 08:25:05'),(2996,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',5,'2023-01-20 08:25:11'),(2997,42,'{\"type\":\"\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',14,'2023-01-20 08:25:14'),(2998,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',5,'2023-01-20 08:25:41'),(2999,42,'{\"type\":\"error\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',12,'2023-01-20 08:25:47'),(3000,42,'{\"type\":\"warning\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 08:25:51'),(3001,42,'{\"id\":1,\"pass\":\"1\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/admin/updatePass','::1',132,'2023-01-20 08:26:22'),(3002,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',15,'2023-01-20 08:26:36'),(3003,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',18,'2023-01-20 08:26:42'),(3004,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',16,'2023-01-20 08:26:46'),(3005,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 08:26:49'),(3006,42,'{\"toUname\":\"ciel\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:26:53'),(3007,42,'{\"toUname\":\"ciel\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 08:26:55'),(3008,42,'{\"toUname\":\"ciel\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 08:26:55'),(3009,42,'{\"toUname\":\"ciel\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:26:56'),(3010,42,'{\"toUname\":\"ciel\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 08:26:56'),(3011,42,'{\"toUname\":\"ciel\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 08:26:56'),(3012,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',10,'2023-01-20 08:27:01'),(3013,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',28,'2023-01-20 08:27:03'),(3014,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 08:27:04'),(3015,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',12,'2023-01-20 08:27:04'),(3016,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',6,'2023-01-20 08:27:04'),(3017,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:27:29'),(3018,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',11,'2023-01-20 08:27:30'),(3019,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',19,'2023-01-20 08:27:33'),(3020,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',11,'2023-01-20 08:27:43'),(3021,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',10,'2023-01-20 08:27:44'),(3022,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 08:27:44'),(3023,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',10,'2023-01-20 08:27:44'),(3024,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 08:27:46'),(3025,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-20 08:27:46'),(3026,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',10,'2023-01-20 08:27:47'),(3027,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',10,'2023-01-20 08:27:47'),(3028,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:27:53'),(3029,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',8,'2023-01-20 08:27:56'),(3030,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-20 08:27:56'),(3031,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',8,'2023-01-20 08:27:57'),(3032,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"bottom-left\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 08:27:57'),(3033,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',16,'2023-01-20 08:28:10'),(3034,42,'{\"type\":\"warning\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',6,'2023-01-20 08:28:14'),(3035,42,'{\"type\":\"warning\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',12,'2023-01-20 08:28:20'),(3036,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',27,'2023-01-20 08:28:23'),(3037,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 08:28:28'),(3038,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',10,'2023-01-20 08:28:44'),(3039,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',14,'2023-01-20 08:28:46'),(3040,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',17,'2023-01-20 08:28:54'),(3041,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 08:28:56'),(3042,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',23,'2023-01-20 08:28:59'),(3043,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',10,'2023-01-20 08:29:00'),(3044,42,'{\"id\":1,\"pid\":-1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"系统\",\"path\":\"/\",\"sort\":1,\"type\":2,\"desc\":\"\",\"filePath\":\"\",\"status\":1,\"createdAt\":\"2022-06-18 14:18:55\",\"updatedAt\":\"2023-01-19 19:35:44\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',16,'2023-01-20 09:14:35'),(3045,42,'{\"id\":1,\"pid\":-1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"系统\",\"path\":\"/2\",\"sort\":1,\"type\":2,\"desc\":\"\",\"filePath\":\"\",\"status\":1,\"createdAt\":\"2022-06-18 14:18:55\",\"updatedAt\":\"2023-01-20 09:14:35\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',13,'2023-01-20 09:14:41'),(3046,42,'{\"id\":1,\"pid\":-1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"系统\",\"path\":\"/\",\"sort\":1,\"type\":2,\"desc\":\"\",\"filePath\":\"\",\"status\":1,\"createdAt\":\"2022-06-18 14:18:55\",\"updatedAt\":\"2023-01-20 09:14:41\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',19,'2023-01-20 09:14:45'),(3047,42,'http://localhost:2033/backend/userLoginLog/delClear','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/userLoginLog/delClear','::1',12,'2023-01-20 09:41:19'),(3048,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 09:43:42'),(3049,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-20 09:43:44'),(3050,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 09:45:11'),(3051,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-20 09:45:13'),(3052,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 10:02:56'),(3053,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 10:03:06'),(3054,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 10:03:07'),(3055,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 10:03:07'),(3056,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 10:03:07'),(3057,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 10:03:07'),(3058,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-20 10:03:09'),(3059,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 10:03:10'),(3060,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',5,'2023-01-20 10:03:12'),(3061,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',10,'2023-01-20 10:03:13'),(3062,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',22,'2023-01-20 10:03:13'),(3063,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',6,'2023-01-20 10:03:13'),(3064,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',10,'2023-01-20 10:03:55'),(3065,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 10:03:59'),(3066,42,'{\"type\":\"success\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',12,'2023-01-20 10:04:07'),(3067,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',5,'2023-01-20 10:04:25'),(3068,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',6,'2023-01-20 10:04:27'),(3069,42,'{\"type\":\"error\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',10,'2023-01-20 10:04:31'),(3070,42,'{\"type\":\"warning\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',8,'2023-01-20 10:04:33'),(3071,42,'{\"type\":\"warning\",\"msg\":\"Hello Everyone22\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 10:04:36'),(3072,42,'{\"type\":\"warning\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',12,'2023-01-20 10:04:40'),(3073,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',12,'2023-01-20 12:42:00'),(3074,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-20 12:42:01'),(3075,42,'{\"id\":230,\"pid\":1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"文档与测试\",\"path\":\"/backend/sys/test?name=Document\",\"sort\":1.91,\"type\":1,\"desc\":\"\",\"filePath\":\"\",\"status\":0,\"createdAt\":\"2023-01-19 19:42:54\",\"updatedAt\":\"2023-01-19 20:03:26\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',12,'2023-01-20 14:16:29'),(3076,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',13,'2023-01-20 15:16:43'),(3077,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 15:16:46'),(3078,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',4,'2023-01-20 15:16:49'),(3079,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',10,'2023-01-20 16:10:40'),(3080,42,'{\"id\":16,\"uname\":\"user33\",\"pass\":\"$2a$10$D6Z5432ylg4RCXZvwaL9yezMTcHsTH8FFonCSbPU4qlC4xaLl84Uq\",\"nickname\":\"user33\",\"icon\":\"icon/icon43.png\",\"summary\":\"\",\"desc\":\"22\",\"joinIp\":\"127.0.0.1\",\"device\":\"\",\"phone\":\"\",\"email\":\"2\",\"status\":\"1...','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/user','::1',13,'2023-01-20 16:11:07'),(3081,42,'{\"id\":16,\"uname\":\"user33\",\"pass\":\"$2a$10$D6Z5432ylg4RCXZvwaL9yezMTcHsTH8FFonCSbPU4qlC4xaLl84Uq\",\"nickname\":\"user33\",\"icon\":\"icon/icon43.png\",\"summary\":\"\",\"desc\":\"22\",\"joinIp\":\"127.0.0.1\",\"device\":\"\",\"phone\":\"\",\"email\":\"2\",\"status\":\"请...','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/user','::1',16,'2023-01-20 16:11:12'),(3082,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',9,'2023-01-20 19:57:59'),(3083,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',13,'2023-01-20 19:58:01'),(3084,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-20 19:58:06'),(3085,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-20 20:07:53'),(3086,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',4,'2023-01-20 20:07:55'),(3087,42,'{\"id\":230,\"pid\":1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"文档与测试\",\"path\":\"/backend/sys/test?name=Css\",\"sort\":1.91,\"type\":1,\"desc\":\"\",\"filePath\":\"\",\"status\":0,\"createdAt\":\"2023-01-19 19:42:54\",\"updatedAt\":\"2023-01-20 14:16:29\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',13,'2023-01-20 20:08:41'),(3088,42,'{\"id\":230,\"pid\":1,\"icon\":\"\",\"bgImg\":\"\",\"name\":\"文档与测试\",\"path\":\"/backend/sys/test?name=CSS\",\"sort\":1.91,\"type\":1,\"desc\":\"\",\"filePath\":\"\",\"status\":0,\"createdAt\":\"2023-01-19 19:42:54\",\"updatedAt\":\"2023-01-20 20:08:41\"}','{\"code\":0,\"message\":\"\",\"data\":null}','PUT','/backend/menu','::1',7,'2023-01-20 20:08:58'),(3089,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',12,'2023-01-20 20:11:10'),(3090,42,'{\"title\":\"宽度\",\"k\":\"width\",\"v\":\"1060px\",\"type\":\"1\",\"status\":\"1\",\"group\":\"1\"}','{\"code\":0,\"message\":\"\",\"data\":null}','POST','/backend/dict','::1',13,'2023-01-20 20:20:20'),(3091,42,'http://localhost:2033/backend/walletTopUpApplication?id=18','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=18','::1',5,'2023-01-20 20:24:52'),(3092,42,'http://localhost:2033/backend/walletTopUpApplication?id=17','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=17','::1',6,'2023-01-20 20:24:53'),(3093,42,'http://localhost:2033/backend/walletTopUpApplication?id=16','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=16','::1',6,'2023-01-20 20:24:53'),(3094,42,'http://localhost:2033/backend/walletTopUpApplication?id=15','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=15','::1',6,'2023-01-20 20:24:54'),(3095,42,'http://localhost:2033/backend/walletTopUpApplication?id=14','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=14','::1',6,'2023-01-20 20:24:55'),(3096,42,'http://localhost:2033/backend/walletTopUpApplication?id=13','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=13','::1',5,'2023-01-20 20:24:58'),(3097,42,'http://localhost:2033/backend/walletTopUpApplication?id=12','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=12','::1',8,'2023-01-20 20:25:01'),(3098,42,'http://localhost:2033/backend/walletTopUpApplication?id=11','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=11','::1',12,'2023-01-20 20:25:01'),(3099,42,'http://localhost:2033/backend/walletTopUpApplication?id=9','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/walletTopUpApplication?id=9','::1',8,'2023-01-20 20:25:02'),(3100,42,'{\"url\":\"2\",\"method\":\"1\",\"group\":\"菜单\"}','{\"code\":0,\"message\":\"\",\"data\":null}','POST','/backend/api','::1',6,'2023-01-21 08:29:43'),(3101,42,'http://localhost:2033/backend/api?id=111','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/api?id=111','::1',13,'2023-01-21 08:29:46'),(3102,42,'http://localhost:2033/backend/adminLoginLog/delClear','{\"code\":0,\"message\":\"\",\"data\":null}','DELETE','/backend/adminLoginLog/delClear','::1',3,'2023-01-21 08:29:50'),(3103,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',4,'2023-01-21 08:29:58'),(3104,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',6,'2023-01-21 08:29:59'),(3105,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',19,'2023-01-21 08:30:29'),(3106,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-21 08:30:29'),(3107,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',8,'2023-01-21 08:30:38'),(3108,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',7,'2023-01-21 08:30:41'),(3109,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',4,'2023-01-21 08:30:43'),(3110,42,'{\"type\":\"info\",\"msg\":\"Hello Everyone\",\"position\":\"top-center\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/noticeAdmins','::1',9,'2023-01-21 08:30:50'),(3111,42,'{\"toUname\":\"admin\",\"type\":\"success\",\"msg\":\"Hello Admin\"}','{\"code\":0,\"msg\":\"ok\"}','POST','/backend/ws/sendMsg','::1',3,'2023-01-21 08:30:51');
/*!40000 ALTER TABLE `s_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role`
--

DROP TABLE IF EXISTS `s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role`
--

LOCK TABLES `s_role` WRITE;
/*!40000 ALTER TABLE `s_role` DISABLE KEYS */;
INSERT INTO `s_role` VALUES (1,'超级管理员','2022-02-16 11:12:41','2022-09-02 12:22:24'),(22,'系统管理员','2022-07-22 16:45:05','2023-01-15 08:36:37'),(28,'测试管理员','2023-01-15 22:10:16','2023-01-19 11:34:57');
/*!40000 ALTER TABLE `s_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role_api`
--

DROP TABLE IF EXISTS `s_role_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_role_api` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int DEFAULT NULL,
  `aid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  CONSTRAINT `s_role_api_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `s_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role_api`
--

LOCK TABLES `s_role_api` WRITE;
/*!40000 ALTER TABLE `s_role_api` DISABLE KEYS */;
INSERT INTO `s_role_api` VALUES (1327,1,14);
/*!40000 ALTER TABLE `s_role_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role_menu`
--

DROP TABLE IF EXISTS `s_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int DEFAULT NULL,
  `mid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `mid` (`mid`),
  CONSTRAINT `s_role_menu_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `s_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `s_role_menu_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `s_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role_menu`
--

LOCK TABLES `s_role_menu` WRITE;
/*!40000 ALTER TABLE `s_role_menu` DISABLE KEYS */;
INSERT INTO `s_role_menu` VALUES (197,1,1),(198,1,2),(199,1,3),(201,1,5),(202,1,28),(203,1,30),(204,1,78),(207,1,139),(209,1,171),(210,1,172),(211,1,4),(212,1,173),(213,1,174),(214,1,175),(215,1,176),(216,1,177),(217,1,178),(218,1,179),(219,1,180),(241,1,202),(243,1,204),(244,1,205),(250,22,3),(252,22,78),(253,22,5),(254,22,28),(255,22,30),(256,22,1),(260,22,139),(262,22,2),(263,22,4),(264,22,175),(265,22,176),(266,22,204),(267,22,205),(268,22,178),(269,22,179),(270,22,180),(271,22,171),(272,22,172),(273,22,173),(274,22,174),(337,1,230);
/*!40000 ALTER TABLE `s_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_user`
--

DROP TABLE IF EXISTS `u_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `join_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册IP',
  `device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `pass_error_count` tinyint unsigned DEFAULT '0' COMMENT '密码错误次数',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `uname_2` (`uname`),
  KEY `join_ip` (`join_ip`),
  KEY `status` (`status`),
  KEY `phone` (`phone`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user`
--

LOCK TABLES `u_user` WRITE;
/*!40000 ALTER TABLE `u_user` DISABLE KEYS */;
INSERT INTO `u_user` VALUES (4,'freekey','$2a$10$DyEqv63stEpvh.1QJS31N.hPzk5I62cJGYEfcRaNbpK8QAHcDblc2','freekey admin','icon/icon02.png','','','127.0.0.1','','','',1,0,'2022-09-04 16:13:08','2022-12-26 13:50:47'),(10,'ciel2','$2a$10$q.zZ/t5/6tWNZ4fIk7Zki.8IVau7h3mwZ3zjAopiAfVyEyOAOtXTu','ciel2','icon/icon01.png','','','78.138.12.130','','','',1,0,'2022-11-02 13:30:28','2023-01-18 14:15:30'),(16,'user33','$2a$10$D6Z5432ylg4RCXZvwaL9yezMTcHsTH8FFonCSbPU4qlC4xaLl84Uq','user33','icon/icon43.png','','22','127.0.0.1','','','2',1,0,'2022-12-24 13:14:51','2023-01-20 16:11:12');
/*!40000 ALTER TABLE `u_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_user_login_log`
--

DROP TABLE IF EXISTS `u_user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_user_login_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user_login_log`
--

LOCK TABLES `u_user_login_log` WRITE;
/*!40000 ALTER TABLE `u_user_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_wallet`
--

DROP TABLE IF EXISTS `u_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_wallet` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `balance` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `pass` varchar(64) DEFAULT NULL,
  `pass_err_count` tinyint unsigned DEFAULT '0' COMMENT '密码输错次数',
  `desc` text,
  `status` tinyint unsigned DEFAULT '1' COMMENT '金库状态 0 设置密码 1正常,2 锁定',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`),
  KEY `balance` (`balance`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户金库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_wallet`
--

LOCK TABLES `u_wallet` WRITE;
/*!40000 ALTER TABLE `u_wallet` DISABLE KEYS */;
INSERT INTO `u_wallet` VALUES (1,4,20308.00,'',0,'',0,'2022-09-04 16:13:08','2022-12-24 14:32:21'),(7,10,44.00,'$2a$10$L7WvNV9F1UOHbolBrVYrtORXEGF03KwqUhu4a0D5kf4zorOAXXlG6',0,'',0,'2022-11-01 13:30:28','2023-01-18 16:02:51'),(13,16,1000302.00,'$2a$10$cjtyGC/7cKeE9KBVFYD.IuRm/dYGquj6EFt.LiTIohyN9kzWxipRO',0,'1',1,'2022-12-25 13:14:51','2023-01-19 08:02:55');
/*!40000 ALTER TABLE `u_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_wallet_change_log`
--

DROP TABLE IF EXISTS `u_wallet_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_wallet_change_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trans_id` varchar(64) NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1人工充值,2支付宝充值,3微信充值,4paypal充值,5人工扣除',
  `desc` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `amount` (`amount`),
  KEY `balance` (`balance`),
  KEY `type` (`type`),
  KEY `desc` (`desc`),
  KEY `trans_id` (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账变记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_wallet_change_log`
--

LOCK TABLES `u_wallet_change_log` WRITE;
/*!40000 ALTER TABLE `u_wallet_change_log` DISABLE KEYS */;
INSERT INTO `u_wallet_change_log` VALUES (63,'1d0vq7rxoh0cp9uff5uvo7c200xyw9kl',10,33.00,33.00,1,'人工充值','2022-12-24 14:44:48'),(64,'1uj3ztpy9r0cp9vbwm117tk200h20u7o',10,-1.00,32.00,5,'人工扣除','2022-12-24 15:27:14'),(65,'1uj3ztpy9r0cp9vc7cvrt2840019805x',10,-20.00,12.00,5,'人工扣除','2022-12-24 15:27:37'),(66,'1uj3ztpyda0cp9vedk0pzug200j71jka',10,20.00,32.00,1,'人工充值','2022-12-24 15:30:27'),(67,'1uj3ztpyda0cp9vein12oh4400mm42jd',10,-20.00,12.00,5,'人工扣除3','2022-12-24 15:31:28'),(68,'kyped7015f7cparj927wkts200yg173l',10,33.00,45.00,2,'333','2022-12-25 16:41:25'),(69,'kyped7015k0cparmle8h8bk2006s4ots',10,-1.00,44.00,5,'人工扣除','2022-12-25 16:45:47'),(71,'MR-tK9lQIqj9SfSL',16,10.00,10.00,2,'','2022-12-28 15:46:34'),(78,'ppu18i07vi0cpv71dmnrgps200t7ryrr',16,1.00,13.00,1,'','2023-01-18 17:03:41'),(79,'ppu18i07vi0cpv71pevw26o400lrhsvf',16,1.00,14.00,1,'','2023-01-18 17:04:07'),(80,'ppu18i07vi0cpv71vqu0mm86009cky3v',16,1.00,15.00,2,'','2023-01-18 17:04:21'),(81,'ppu18i07vi0cpv72e0sje3k80060lyx6',16,1.00,16.00,1,'','2023-01-18 17:05:00'),(82,'ppu18i07vi0cpv73v1p25mga00feje8p',16,1.00,17.00,5,'','2023-01-18 17:06:56'),(83,'ppu18i07vi0cpv74fhgyh7kc00h73dz7',16,-1.00,16.00,5,'','2023-01-18 17:07:40'),(86,'ppu18i07y10cpv771fhtzag300t5m5uu',16,100.00,100.00,1,'22','2023-01-18 09:11:05'),(87,'3lkfya01k40cpvak9r25r8o200xlce3b',16,133.00,233.00,2,'','2023-01-18 19:49:25'),(88,'3lkfya01vs0cpvb3ij7odd42001cv6ez',16,1000000.00,1000233.00,3,'','2023-01-18 20:14:33'),(89,'MR-hUhLLI6DIOH5h',16,10.00,1000243.00,1,'','2023-01-19 07:41:55'),(90,'MR-9TW4A2M6CKYVHWNJTCWJJ1B',16,10.00,1000253.00,1,'1','2023-01-18 23:47:00'),(91,'MR-LYXPY4U7TB8XJBQOZSQNI8Z',16,10.00,1000263.00,1,'','2023-01-19 07:55:03'),(92,'MR-ZKMGSZMSWDN0HJ22ZSHY0RN',16,10.00,1000273.00,1,'','2023-01-19 07:56:27'),(93,'MR-VERBMEPUZRXXPCSQR7RIEGW',16,10.00,1000283.00,1,'','2023-01-19 07:57:03'),(94,'MR-JVOCZVTSPSLH4U0OFBYCDBF',16,10.00,1000293.00,1,'','2023-01-19 08:01:29'),(95,'MR-0A07SKYDCTALBFELZZMCCUH',16,10.00,1000303.00,1,'','2023-01-19 08:02:06'),(96,'32uqrm043r0cpvq5vwn2qe8400zbwq1q',16,-1.00,1000302.00,5,'','2023-01-19 08:02:55');
/*!40000 ALTER TABLE `u_wallet_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_wallet_change_type`
--

DROP TABLE IF EXISTS `u_wallet_change_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_wallet_change_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `sub_title` varchar(64) DEFAULT NULL,
  `type` tinyint unsigned DEFAULT '1' COMMENT '1 add; 2 reduce',
  `class` varchar(16) DEFAULT NULL,
  `desc` text,
  `status` tinyint unsigned DEFAULT '1',
  `count_status` tinyint DEFAULT '1' COMMENT 'Whether this field needs statistics, 1 true 2 false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='充值类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_wallet_change_type`
--

LOCK TABLES `u_wallet_change_type` WRITE;
/*!40000 ALTER TABLE `u_wallet_change_type` DISABLE KEYS */;
INSERT INTO `u_wallet_change_type` VALUES (1,'支付宝充值',NULL,1,'tag-primary','',1,1),(2,'微信充值','',1,'tag-success','',1,1),(3,'银行卡充值',NULL,1,'tag-warning',NULL,1,1),(4,'PayPal充值','',1,'tag-info','',1,1),(5,'人工扣除','',2,'tag-danger','',1,1);
/*!40000 ALTER TABLE `u_wallet_change_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_wallet_statistics_log`
--

DROP TABLE IF EXISTS `u_wallet_statistics_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_wallet_statistics_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `t1` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t2` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t3` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t4` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t5` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t6` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t7` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t8` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t9` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t10` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t11` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t12` decimal(12,2) NOT NULL DEFAULT '0.00',
  `t13` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_wallet_statistics_log`
--

LOCK TABLES `u_wallet_statistics_log` WRITE;
/*!40000 ALTER TABLE `u_wallet_statistics_log` DISABLE KEYS */;
INSERT INTO `u_wallet_statistics_log` VALUES (3,4,10063.00,33.00,33.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2022-10-31'),(4,10,53.00,0.00,0.00,0.00,74.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2022-12-24'),(5,4,0.00,0.00,0.00,0.00,33.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2022-12-24'),(6,10,0.00,33.00,0.00,0.00,1.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2022-12-25'),(8,16,0.00,10.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2022-12-28'),(9,16,103.00,134.00,1000000.00,0.00,203.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2023-01-18'),(15,16,20.00,0.00,0.00,0.00,1.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2023-01-19');
/*!40000 ALTER TABLE `u_wallet_statistics_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_wallet_top_up_application`
--

DROP TABLE IF EXISTS `u_wallet_top_up_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_wallet_top_up_application` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trans_id` varchar(64) DEFAULT NULL,
  `uid` bigint unsigned NOT NULL,
  `change_type` int unsigned NOT NULL,
  `money` decimal(8,2) unsigned DEFAULT NULL,
  `ip` varchar(64) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  `aid` bigint unsigned DEFAULT '0',
  `status` tinyint unsigned DEFAULT '1' COMMENT '1 wait 2 success 3 fail',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `trans_id` (`trans_id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `description` (`description`),
  KEY `ip` (`ip`),
  KEY `aid` (`aid`),
  KEY `change_type` (`change_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_wallet_top_up_application`
--

LOCK TABLES `u_wallet_top_up_application` WRITE;
/*!40000 ALTER TABLE `u_wallet_top_up_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_wallet_top_up_application` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-21  8:49:04
