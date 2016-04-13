CREATE DATABASE  IF NOT EXISTS `jumper.wwebs.admin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jumper.wwebs.admin`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 192.168.0.240    Database: jumper.wwebs.admin
-- ------------------------------------------------------
-- Server version	5.5.47-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tab_admin_role`
--

DROP TABLE IF EXISTS `tab_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_admin_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id,主键',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '记录创建时间',
  `updateTime` timestamp NULL DEFAULT NULL COMMENT '记录修改时间',
  `createBy` bigint(20) DEFAULT '0' COMMENT '记录创建者id',
  `updateBy` bigint(20) DEFAULT '0' COMMENT '记录修改者id',
  `name` varchar(64) DEFAULT '""' COMMENT '角色名称',
  `description` varchar(200) DEFAULT '""' COMMENT '角色描述',
  `parentId` bigint(20) DEFAULT '0' COMMENT '父角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理系统用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_admin_role`
--

LOCK TABLES `tab_admin_role` WRITE;
/*!40000 ALTER TABLE `tab_admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jumper.wwebs.admin'
--

--
-- Dumping routines for database 'jumper.wwebs.admin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-24 10:41:58
