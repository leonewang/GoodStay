CREATE DATABASE  IF NOT EXISTS `GoodStay` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `GoodStay`;
-- MySQL dump 10.13  Distrib 5.6.41, for macos10.13 (x86_64)
--
-- Host: localhost    Database: GoodStay
-- ------------------------------------------------------
-- Server version	5.6.41

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (2,'Admin','liangge12','wangleone.me@gmail.com','2017-09-24 23:12:46');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friend`
--

DROP TABLE IF EXISTS `Friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `friend_name` varchar(30) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friend`
--

LOCK TABLES `Friend` WRITE;
/*!40000 ALTER TABLE `Friend` DISABLE KEYS */;
INSERT INTO `Friend` VALUES (1,2,1,'Leone','fdb49cb6-2418-4ea4-be70-c3af7e7a089e',0,'2018-09-10 19:27:27');
/*!40000 ALTER TABLE `Friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` blob NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `log_type` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
INSERT INTO `Log` VALUES (1,' Registered account.','addFriend',1,'2018-09-10 19:18:03'),(2,' Logined successfully.','login',1,'2018-09-10 19:18:38'),(3,' Search for keywords: <b>Leone</b>','basicSearch',1,'2018-09-10 19:23:21'),(4,' Registered account.','addFriend',2,'2018-09-10 19:26:21'),(5,' Logined successfully.','login',2,'2018-09-10 19:27:14'),(6,' Search for keywords: <b>Leone</b>','basicSearch',2,'2018-09-10 19:27:19'),(7,' Sent friend request to <b>Leone</b>.','addFriend',2,'2018-09-10 19:27:27'),(8,' Logined successfully.','login',1,'2018-09-10 19:27:48'),(9,' Logined successfully.','login',2,'2018-09-10 19:28:09'),(10,' Liked the post of </b>Leone</b>.','likePost',2,'2018-09-10 19:28:12'),(11,' Logined successfully.','login',1,'2018-09-10 19:28:17'),(12,' Found password via email.','findPass',1,'2018-09-10 19:30:41'),(13,' Found password via email.','findPass',2,'2018-09-10 19:32:29'),(14,' Found password via email.','findPass',2,'2018-09-10 19:34:27'),(15,' Found password via email.','findPass',2,'2018-09-10 19:36:18'),(16,' Logined successfully.','login',2,'2018-09-10 19:36:43'),(17,' Liked the post of </b>Leone</b>.','likePost',2,'2018-09-10 19:36:54'),(18,' Logined successfully.','login',1,'2018-09-10 19:37:02'),(19,' Updated personal profile.','editProfile',1,'2018-09-10 19:37:29'),(20,' Logined successfully.','login',1,'2018-09-10 20:37:19'),(21,' Logined successfully.','login',1,'2018-09-11 21:02:36'),(22,' Posted a new messageBeautiful Room for Rent in Parramatta CBD. Price for 1 person : $235/week (including all bills). Price for 2 people : $275/ week (including all bills)..','post',1,'2018-09-11 21:06:30'),(23,' Search for keywords: <b></b>','basicSearch',1,'2018-09-11 21:06:41'),(24,' Search for keywords: <b></b>','basicSearch',1,'2018-09-11 21:06:51'),(25,' Search for keywords: <b>leone</b>','basicSearch',1,'2018-09-11 21:06:59'),(26,' Advance search for keywords:  [<b>Daisy</b>]','advanceSearch',1,'2018-09-11 21:07:05'),(27,' Search for keywords: <b></b>','basicSearch',1,'2018-09-11 21:07:28'),(28,' Logined successfully.','login',1,'2018-09-11 21:23:16');
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` int(11) NOT NULL,
  `send_from` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `state` int(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification`
--

LOCK TABLES `Notification` WRITE;
/*!40000 ALTER TABLE `Notification` DISABLE KEYS */;
INSERT INTO `Notification` VALUES (1,1,2,' liked your post.',1,'2018-09-10 19:28:12'),(2,1,2,' liked your post.',0,'2018-09-10 19:36:54');
/*!40000 ALTER TABLE `Notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(200) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `post_by` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (1,'Roller Shutters Outdoor Blinds Security Doors - Interest Free ! Please call me today for a genuine upfront best price no obligation quote.','',NULL,2,1,'2018-09-10 19:22:33'),(2,'Beautiful Room for Rent in Parramatta CBD. Price for 1 person : $235/week (including all bills). Price for 2 people : $275/ week (including all bills).','',NULL,0,1,'2018-09-11 21:06:30');
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Leone','liangge','wangleone.me@gmail.com','Leone','male','1995-09-14','18720978691',NULL,'e5532c21-2f39-4082-87aa-6970085ef684',2,'2018-09-10 19:18:03'),(2,'Daisy','liangge','wangleone.me@gmail.com','Daisy','female','1997-10-10',NULL,NULL,'458e5327-a715-4cac-8a4b-9bc8c3f67640',2,'2018-09-10 19:26:21');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-11 21:24:31
