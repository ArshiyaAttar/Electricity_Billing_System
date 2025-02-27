CREATE DATABASE  IF NOT EXISTS `ebill` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ebill`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: ebill
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `e_calbill`
--

DROP TABLE IF EXISTS `e_calbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_calbill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `zone` varchar(45) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `tamt` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `dues` int(11) DEFAULT NULL,
  `amtpaid` int(11) DEFAULT NULL,
  `dateandtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_calbill`
--

LOCK TABLES `e_calbill` WRITE;
/*!40000 ALTER TABLE `e_calbill` DISABLE KEYS */;
INSERT INTO `e_calbill` VALUES (54,1001,205,'shivaji nagar ','January',1640,'huma','PAID','2020',0,1640,'2021-01-13 05:45:15','2021-01-13 11:14:09'),(55,1033,209,'Pune','January',1672,'Sheeba','PAID','2020',0,1672,'2021-01-13 05:52:13','2021-01-13 11:17:22'),(56,1049,164,'Demo Street ','January',1148,'Demodemo','Not Paid','2020',0,NULL,'2021-01-13 05:53:49','2021-01-13 11:23:49'),(57,1050,55,'SHIVAJI NAGAR','January',110,'Abcd','PAID','2020',0,110,'2021-01-14 09:15:28','2021-01-14 14:44:22');
/*!40000 ALTER TABLE `e_calbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_unit`
--

DROP TABLE IF EXISTS `e_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge1` int(11) DEFAULT NULL,
  `charge2` int(11) DEFAULT NULL,
  `charge3` int(11) DEFAULT NULL,
  `charge4` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_unit`
--

LOCK TABLES `e_unit` WRITE;
/*!40000 ALTER TABLE `e_unit` DISABLE KEYS */;
INSERT INTO `e_unit` VALUES (1,8,6,5,2),(2,10,8,6,0),(3,10,9,7,2),(4,10,8,7,2);
/*!40000 ALTER TABLE `e_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_user`
--

DROP TABLE IF EXISTS `e_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `useremail` varchar(225) NOT NULL,
  `userphone` varchar(225) NOT NULL,
  `useraddress` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`,`useremail`,`userphone`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_user`
--

LOCK TABLES `e_user` WRITE;
/*!40000 ALTER TABLE `e_user` DISABLE KEYS */;
INSERT INTO `e_user` VALUES (1001,'Huma','khanhuma1021994@gmail.com','9999999989','shivaji nagar ','abcd',2),(1033,'Sheeba','s@gmail.com','9595959595','Pune','sheeba',2),(1049,'Demodemo','demo@yahoo.com','8888888888','Demo Street ','demo',2),(1050,'Abcd','abc@gmail.com','8806793321','SHIVAJI NAGAR','huma',2),(10001,'admin','admin@yahoo.com','8888888888','Shivaji nagar','admin123',1);
/*!40000 ALTER TABLE `e_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-17 11:39:50
