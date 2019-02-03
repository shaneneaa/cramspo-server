-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: db_cramspot
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

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
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability` (
  `space_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `opening` int(11) NOT NULL,
  `closing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`booking id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feed_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
INSERT INTO `feed` VALUES (3,4,'cute','2018-12-13 14:54:57'),(4,4,'ko','2018-12-13 15:16:01'),(5,4,'hehe','2018-12-13 15:16:21'),(6,5,'sasad','2019-01-03 10:06:00'),(7,5,'asdsad','2019-01-03 11:29:01'),(8,5,'looking workspace sa olongapo','2019-01-08 17:05:53');
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user` int(11) NOT NULL,
  `from_user` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `body` varchar(255) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `to_user` (`to_user`),
  KEY `from_user` (`from_user`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`to_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`from_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`space_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opening_hours`
--

DROP TABLE IF EXISTS `opening_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opening_hours` (
  `opening_hours_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL,
  `open` time NOT NULL,
  `close` time NOT NULL,
  `space_id` int(11) NOT NULL,
  PRIMARY KEY (`opening_hours_id`),
  KEY `space_id` (`space_id`),
  CONSTRAINT `opening_hours_ibfk_1` FOREIGN KEY (`space_id`) REFERENCES `workspace` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening_hours`
--

LOCK TABLES `opening_hours` WRITE;
/*!40000 ALTER TABLE `opening_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `opening_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactnum` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'fdsf','adasfasdf','saddsaf','$2b$05$rnV4y6bRVdlv9JWig.yh0OJKOwXWmlnHnf.2dh8s2F55fBzB..HY6',468954),(3,'fdsf','adasfasdf','saddsaf','$2b$05$aiUXRPch7xASQqw47Eov0ej4r66MT2zEMtOPGKBcxNRu4LZhMVTo2',468954),(4,'ver','legaspi','ver@g.com','$2b$05$yTN5uYlAPUfq4eyj0ajpXuqTdgmkUu8cm8c09LWDu.K1nUdcLlayq',29531321),(5,'shane','royena','royenashane@gmail.com','$2b$05$JUXtFvaJ9wzhhL1KNYJbNeOw0MvgxCMIuLNlIK4wr3lfRkblDv1Ze',2147483647);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspace`
--

DROP TABLE IF EXISTS `workspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspace` (
  `space_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `amenities` varchar(255) NOT NULL,
  `location_no` varchar(255) NOT NULL,
  `location_street` varchar(255) NOT NULL,
  `location_barangay` varchar(255) NOT NULL,
  `location_city` varchar(255) NOT NULL,
  `location_province` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rate_type` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `isVerify` tinyint(1) NOT NULL DEFAULT '0',
  `workspace_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `desk_quantity` int(11) NOT NULL,
  PRIMARY KEY (`space_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workspace_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspace`
--

LOCK TABLES `workspace` WRITE;
/*!40000 ALTER TABLE `workspace` DISABLE KEYS */;
INSERT INTO `workspace` VALUES (8,5,'','150','wifi, laptop','61','Lower','Kalaklan','Olongapo City','Zambales','Coworking Space','day',3,1,'http://localhost:3000/images/workspace/5a9dq7vsjpcp6w46.jpg','','',1),(12,5,'','12','qwq','1','wq','wq','wq','qw','Startup Office','day',1,1,'http://localhost:3000/images/workspace/5a9dq68gjqzdnugd.jpg','qwqwqwqw','qwew',1),(13,5,'','120','24/7 Option, Café/ Restaurant, Catering Available, Coffee/ Tea/ Filtered Water','12','Acacia','Gordon Heights','Olongapo City','Zambales','Startup Office','hour',8,1,'http://localhost:3000/images/workspace/5a9dq7kwjr3ia58t.jpg','Elevator Factory','A huddle Room or focus Room or team Room. The huddle rooms are quiet and comfortable. They come with projection which you can hit wirelessly if you have an iOS device.',5),(14,5,'','60','Coffee/ Tea/ Filtered Water, Shared Kitchen, WiFi','21','Gordon Ave','New Kalalake','Olongapo City','Zambales','Coworking Space','hour',5,1,'http://localhost:3000/images/workspace/5a9dq6p4jr81yr1i.png','Outlet Coworking','Outlet Coworking is a community of multi-disciplinary innovative professionals in a beautiful shared work-space in the heart of Midtown Sacramento. Coworking, meeting rooms, desk space, private offices and event space. Convenient Location in Midtown. 2110',12);
/*!40000 ALTER TABLE `workspace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-03 12:43:29
