-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asdf_db
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `customer_charges`
--

DROP TABLE IF EXISTS `customer_charges`;
/*!50001 DROP VIEW IF EXISTS `customer_charges`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_charges` (
  `nfc_id` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `charge` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_data`
--

DROP TABLE IF EXISTS `customer_data`;
/*!50001 DROP VIEW IF EXISTS `customer_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_data` (
  `nfc_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `verif_id` tinyint NOT NULL,
  `birth` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `reserved` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_emails`
--

DROP TABLE IF EXISTS `customer_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_emails` (
  `customer_id` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`email`,`customer_id`),
  KEY `fk_customer_emails_1` (`customer_id`),
  CONSTRAINT `fk_customer_emails_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`nfc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_emails`
--

LOCK TABLES `customer_emails` WRITE;
/*!40000 ALTER TABLE `customer_emails` DISABLE KEYS */;
INSERT INTO `customer_emails` VALUES (14,'audrey@gmail.com'),(7,'bobby97@gmail.com'),(1,'cooldavidlynch@hotmail.com'),(5,'daleacooper@yahoo.com'),(8,'donna.hayward@hotmail.com'),(9,'jacquesren@hotmail.com'),(3,'leland_p@gmail.com'),(2,'lpalmer@gmail.com'),(16,'magi@coco.com'),(10,'nadine@gmail.com'),(13,'notthebeerowner@fischer.com'),(15,'ody@bouf.com'),(9,'renaultrenault@gmail.com'),(1,'romanticdavidlynch@gmail.com'),(11,'ronnette@outlook.com'),(4,'sarahpalmer@gmail.com'),(12,'sherifftruman@outlook.com'),(6,'sj@gmail.com');
/*!40000 ALTER TABLE `customer_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phones`
--

DROP TABLE IF EXISTS `customer_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_phones` (
  `customer_id` int(10) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_num`,`customer_id`),
  KEY `fk_customer_phones_1` (`customer_id`),
  CONSTRAINT `fk_customer_phones_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`nfc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phones`
--

LOCK TABLES `customer_phones` WRITE;
/*!40000 ALTER TABLE `customer_phones` DISABLE KEYS */;
INSERT INTO `customer_phones` VALUES (12,'+1 203-309-4738'),(9,'+1 205-708-6959'),(5,'+1 208-447-7721'),(9,'+1 215-781-4145'),(1,'+1 216-593-1473'),(3,'+1 217-717-2912'),(6,'+1 218-652-9469'),(5,'+1 224-505-4982'),(11,'+1 225-389-0748'),(10,'+1 302-737-6045'),(4,'+1 302-856-7061'),(11,'+1 304-933-6151'),(8,'+1 308-596-1937'),(7,'+1 312-340-8447'),(2,'+1 331-395-8037'),(13,'+1 364-522-9615'),(14,'+1 407-754-2973'),(9,'+1 503-551-5647'),(1,'+1 520-496-1604'),(15,'+30 688 254 8034'),(16,'+30 689 319 1914');
/*!40000 ALTER TABLE `customer_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `nfc_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` enum('M','F','NON_BINARY') NOT NULL,
  `date_of_birth` date NOT NULL,
  `verif_id` varchar(20) NOT NULL,
  `verif_id_type` enum('ID','PASSPORT') NOT NULL,
  `verif_date` date NOT NULL,
  PRIMARY KEY (`nfc_id`),
  UNIQUE KEY `verif_id_UNIQUE` (`verif_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'David','Lynch','M','1946-01-20','2056983201','ID','1982-05-09'),(2,'Laura','Palmer ','F','1996-07-22','L2563248','ID','1999-06-24'),(3,'Leland','Palmer ','M','1964-02-26','L8596475','ID','1975-04-28'),(4,'Sarah','Palmer','F','1963-03-03','S5269632','ID','1974-04-08'),(5,'Dale','Cooper','M','1974-04-19','D5863252','ID','1996-05-21'),(6,'Shelly','Johnson','F','1992-05-30','S8896328','ID','2003-07-31'),(7,'Bob','Briggs','M','1989-03-29','B5684215','ID','2000-02-12'),(8,'Donna','Hayward','F','1992-08-02','D1245896','ID','2003-12-04'),(9,'Jacques','Renault','M','1995-07-10','A8952222','ID','2006-06-12'),(10,'Nadine','Hurley','F','1990-04-03','D5263842','ID','1999-04-06'),(11,'Ronette','Pulaski','F','1995-08-12','AI202114','ID','2006-05-07'),(12,'Harry','Truman','M','1990-02-13','C03004786','PASSPORT','2007-11-02'),(13,'Mark','Fischer','M','1987-11-03','568420','ID','1996-07-17'),(14,'Audrey','Horne','F','1997-08-22','P59462384','PASSPORT','2006-02-03'),(15,'Odysseas','Boufalakis','M','1994-12-13','AI424242','ID','2011-05-06'),(16,'Fragiskos','Kondilakis','M','2000-07-15','AT587482','ID','2009-03-01');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customers_age`
--

DROP TABLE IF EXISTS `customers_age`;
/*!50001 DROP VIEW IF EXISTS `customers_age`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customers_age` (
  `NFC_ID` tinyint NOT NULL,
  `First Name` tinyint NOT NULL,
  `Last Name` tinyint NOT NULL,
  `Age` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enroll_in`
--

DROP TABLE IF EXISTS `enroll_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll_in` (
  `customer_id` int(10) NOT NULL,
  `service_id` int(10) NOT NULL,
  `enroll_date_time` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`service_id`),
  KEY `fk_enroll_in_2_idx` (`service_id`),
  CONSTRAINT `fk_enroll_in_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`nfc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_enroll_in_2` FOREIGN KEY (`service_id`) REFERENCES `register_services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_in`
--

LOCK TABLES `enroll_in` WRITE;
/*!40000 ALTER TABLE `enroll_in` DISABLE KEYS */;
INSERT INTO `enroll_in` VALUES (1,2,'2021-05-15 10:29:10'),(1,7,'2021-05-15 10:29:10'),(2,2,'2021-05-16 16:06:34'),(2,6,'2021-05-16 16:06:34'),(2,7,'2021-05-16 16:06:34'),(3,2,'2021-05-16 16:06:34'),(4,2,'2021-05-16 16:06:34'),(4,7,'2021-05-16 16:06:34'),(5,2,'2021-05-15 04:54:48'),(5,5,'2021-05-15 04:54:48'),(5,6,'2021-05-15 04:54:48'),(6,2,'2021-05-17 22:06:42'),(7,2,'2021-05-18 19:33:55'),(7,6,'2021-05-18 19:33:55'),(8,2,'2021-05-16 10:40:40'),(8,6,'2021-05-16 10:40:40'),(9,2,'2021-05-17 15:39:30'),(9,7,'2021-05-17 15:39:30'),(10,2,'2021-05-16 01:28:54'),(10,5,'2021-05-16 01:28:54'),(11,2,'2021-05-17 17:39:30'),(11,6,'2021-05-17 17:39:30'),(12,2,'2021-05-17 08:27:40'),(13,2,'2021-05-16 12:25:46'),(14,2,'2021-05-17 00:55:16'),(14,5,'2021-05-17 00:55:16'),(14,6,'2021-05-17 00:55:16'),(14,7,'2021-05-17 00:55:16'),(15,2,'2021-05-18 22:54:59'),(15,7,'2021-05-18 22:54:59'),(16,2,'2021-05-16 03:36:20'),(16,6,'2021-05-16 03:36:20');
/*!40000 ALTER TABLE `enroll_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`enroll_in_AFTER_INSERT` AFTER INSERT ON `enroll_in` FOR EACH ROW
BEGIN
	-- new service enrolled
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, p.place_id, NEW.enroll_date_time, NULL
        FROM places p
        WHERE p.offered_service_id = NEW.service_id AND NEW.service_id <> 2;
        
	-- reception
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, 26, NEW.enroll_date_time, NULL
        WHERE NEW.service_id = 2;
        
	-- elevators
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, 11, NEW.enroll_date_time, NULL
        WHERE NEW.service_id = 2;
        
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, 12, NEW.enroll_date_time, NULL
        WHERE NEW.service_id = 2;
        
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, 13, NEW.enroll_date_time, NULL
        WHERE NEW.service_id = 2;
        
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, 14, NEW.enroll_date_time, NULL
        WHERE NEW.service_id = 2;
        
	INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, 15, NEW.enroll_date_time, NULL
        WHERE NEW.service_id = 2;
        
	-- bars
    INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, p.place_id, NEW.enroll_date_time, NULL
        FROM places p
        WHERE p.offered_service_id = 3 AND NEW.service_id = 2;
        
	-- restaurants
    INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, p.place_id, NEW.enroll_date_time, NULL
        FROM places p
        WHERE p.offered_service_id = 4 AND NEW.service_id = 2;
        
	-- hair salon
    INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
		SELECT NEW.customer_id, p.place_id, NEW.enroll_date_time, NULL
        FROM places p
        WHERE p.offered_service_id = 8 AND NEW.service_id = 2;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`enroll_in_AFTER_DELETE` AFTER DELETE ON `enroll_in` FOR EACH ROW
BEGIN
	UPDATE use_charge_log
    SET paid = 1
    WHERE OLD.customer_id = u.customer_id; 
    
    DELETE FROM enroll_in
    WHERE customer_id = OLD.customer_id;
    
    DELETE FROM have_access
    WHERE customer_id = OLD.customer_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `have_access`
--

DROP TABLE IF EXISTS `have_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `have_access` (
  `customer_id` int(10) NOT NULL,
  `place_id` int(10) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`place_id`),
  KEY `fk_have_access_2_idx` (`place_id`),
  CONSTRAINT `fk_have_access_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`nfc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_have_access_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `have_access`
--

LOCK TABLES `have_access` WRITE;
/*!40000 ALTER TABLE `have_access` DISABLE KEYS */;
INSERT INTO `have_access` VALUES (1,11,'2021-05-15 10:29:10',NULL),(1,12,'2021-05-15 10:29:10',NULL),(1,13,'2021-05-15 10:29:10',NULL),(1,14,'2021-05-15 10:29:10',NULL),(1,15,'2021-05-15 10:29:10',NULL),(1,16,'2021-05-15 10:29:10',NULL),(1,17,'2021-05-15 10:29:10',NULL),(1,18,'2021-05-15 10:29:10',NULL),(1,19,'2021-05-15 10:29:10',NULL),(1,20,'2021-05-15 10:29:10',NULL),(1,21,'2021-05-15 10:29:10',NULL),(1,22,'2021-05-15 10:29:10',NULL),(1,23,'2021-05-15 10:29:10',NULL),(1,24,'2021-05-15 10:29:10',NULL),(1,25,'2021-05-15 10:29:10',NULL),(1,26,'2021-05-15 10:29:10',NULL),(1,41,'2021-05-15 10:29:10',NULL),(1,42,'2021-05-15 10:29:10',NULL),(1,43,'2021-05-15 10:29:10',NULL),(1,44,'2021-05-15 10:29:10',NULL),(1,45,'2021-05-15 10:29:10',NULL),(1,46,'2021-05-15 10:29:10',NULL),(1,47,'2021-05-15 10:29:10',NULL),(1,48,'2021-05-15 10:29:10',NULL),(1,49,'2021-05-15 10:29:10',NULL),(1,50,'2021-05-15 10:29:10',NULL),(1,51,'2021-05-15 10:29:10',NULL),(1,54,'2021-05-15 10:29:10','2021-06-10 10:29:10'),(2,11,'2021-05-16 16:06:34',NULL),(2,12,'2021-05-16 16:06:34',NULL),(2,13,'2021-05-16 16:06:34',NULL),(2,14,'2021-05-16 16:06:34',NULL),(2,15,'2021-05-16 16:06:34',NULL),(2,16,'2021-05-16 16:06:34',NULL),(2,17,'2021-05-16 16:06:34',NULL),(2,18,'2021-05-16 16:06:34',NULL),(2,19,'2021-05-16 16:06:34',NULL),(2,20,'2021-05-16 16:06:34',NULL),(2,21,'2021-05-16 16:06:34',NULL),(2,22,'2021-05-16 16:06:34',NULL),(2,23,'2021-05-16 16:06:34',NULL),(2,24,'2021-05-16 16:06:34',NULL),(2,25,'2021-05-16 16:06:34',NULL),(2,26,'2021-05-16 16:06:34',NULL),(2,37,'2021-05-16 16:06:34',NULL),(2,38,'2021-05-16 16:06:34',NULL),(2,39,'2021-05-16 16:06:34',NULL),(2,40,'2021-05-16 16:06:34',NULL),(2,41,'2021-05-16 16:06:34',NULL),(2,42,'2021-05-16 16:06:34',NULL),(2,43,'2021-05-16 16:06:34',NULL),(2,44,'2021-05-16 16:06:34',NULL),(2,45,'2021-05-16 16:06:34',NULL),(2,46,'2021-05-16 16:06:34',NULL),(2,47,'2021-05-16 16:06:34',NULL),(2,48,'2021-05-16 16:06:34',NULL),(2,49,'2021-05-16 16:06:34',NULL),(2,50,'2021-05-16 16:06:34',NULL),(2,51,'2021-05-16 16:06:34',NULL),(2,94,'2021-05-16 16:06:34','2021-06-11 16:06:34'),(3,11,'2021-05-16 16:06:34',NULL),(3,12,'2021-05-16 16:06:34',NULL),(3,13,'2021-05-16 16:06:34',NULL),(3,14,'2021-05-16 16:06:34',NULL),(3,15,'2021-05-16 16:06:34',NULL),(3,16,'2021-05-16 16:06:34',NULL),(3,17,'2021-05-16 16:06:34',NULL),(3,18,'2021-05-16 16:06:34',NULL),(3,19,'2021-05-16 16:06:34',NULL),(3,20,'2021-05-16 16:06:34',NULL),(3,21,'2021-05-16 16:06:34',NULL),(3,22,'2021-05-16 16:06:34',NULL),(3,23,'2021-05-16 16:06:34',NULL),(3,24,'2021-05-16 16:06:34',NULL),(3,25,'2021-05-16 16:06:34',NULL),(3,26,'2021-05-16 16:06:34',NULL),(3,51,'2021-05-16 16:06:34',NULL),(3,94,'2021-05-16 16:06:34','2021-06-11 16:06:34'),(4,11,'2021-05-16 16:06:34',NULL),(4,12,'2021-05-16 16:06:34',NULL),(4,13,'2021-05-16 16:06:34',NULL),(4,14,'2021-05-16 16:06:34',NULL),(4,15,'2021-05-16 16:06:34',NULL),(4,16,'2021-05-16 16:06:34',NULL),(4,17,'2021-05-16 16:06:34',NULL),(4,18,'2021-05-16 16:06:34',NULL),(4,19,'2021-05-16 16:06:34',NULL),(4,20,'2021-05-16 16:06:34',NULL),(4,21,'2021-05-16 16:06:34',NULL),(4,22,'2021-05-16 16:06:34',NULL),(4,23,'2021-05-16 16:06:34',NULL),(4,24,'2021-05-16 16:06:34',NULL),(4,25,'2021-05-16 16:06:34',NULL),(4,26,'2021-05-16 16:06:34',NULL),(4,41,'2021-05-16 16:06:34',NULL),(4,42,'2021-05-16 16:06:34',NULL),(4,43,'2021-05-16 16:06:34',NULL),(4,44,'2021-05-16 16:06:34',NULL),(4,45,'2021-05-16 16:06:34',NULL),(4,46,'2021-05-16 16:06:34',NULL),(4,47,'2021-05-16 16:06:34',NULL),(4,48,'2021-05-16 16:06:34',NULL),(4,49,'2021-05-16 16:06:34',NULL),(4,50,'2021-05-16 16:06:34',NULL),(4,51,'2021-05-16 16:06:34',NULL),(4,94,'2021-05-16 16:06:34','2021-06-11 16:06:34'),(5,11,'2021-05-15 04:54:48',NULL),(5,12,'2021-05-15 04:54:48',NULL),(5,13,'2021-05-15 04:54:48',NULL),(5,14,'2021-05-15 04:54:48',NULL),(5,15,'2021-05-15 04:54:48',NULL),(5,16,'2021-05-15 04:54:48',NULL),(5,17,'2021-05-15 04:54:48',NULL),(5,18,'2021-05-15 04:54:48',NULL),(5,19,'2021-05-15 04:54:48',NULL),(5,20,'2021-05-15 04:54:48',NULL),(5,21,'2021-05-15 04:54:48',NULL),(5,22,'2021-05-15 04:54:48',NULL),(5,23,'2021-05-15 04:54:48',NULL),(5,24,'2021-05-15 04:54:48',NULL),(5,25,'2021-05-15 04:54:48',NULL),(5,26,'2021-05-15 04:54:48',NULL),(5,27,'2021-05-15 04:54:48',NULL),(5,28,'2021-05-15 04:54:48',NULL),(5,29,'2021-05-15 04:54:48',NULL),(5,30,'2021-05-15 04:54:48',NULL),(5,31,'2021-05-15 04:54:48',NULL),(5,32,'2021-05-15 04:54:48',NULL),(5,33,'2021-05-15 04:54:48',NULL),(5,34,'2021-05-15 04:54:48',NULL),(5,35,'2021-05-15 04:54:48',NULL),(5,36,'2021-05-15 04:54:48',NULL),(5,37,'2021-05-15 04:54:48',NULL),(5,38,'2021-05-15 04:54:48',NULL),(5,39,'2021-05-15 04:54:48',NULL),(5,40,'2021-05-15 04:54:48',NULL),(5,51,'2021-05-15 04:54:48',NULL),(5,66,'2021-05-15 04:54:48','2021-06-10 04:54:48'),(6,11,'2021-05-17 22:06:42',NULL),(6,12,'2021-05-17 22:06:42',NULL),(6,13,'2021-05-17 22:06:42',NULL),(6,14,'2021-05-17 22:06:42',NULL),(6,15,'2021-05-17 22:06:42',NULL),(6,16,'2021-05-17 22:06:42',NULL),(6,17,'2021-05-17 22:06:42',NULL),(6,18,'2021-05-17 22:06:42',NULL),(6,19,'2021-05-17 22:06:42',NULL),(6,20,'2021-05-17 22:06:42',NULL),(6,21,'2021-05-17 22:06:42',NULL),(6,22,'2021-05-17 22:06:42',NULL),(6,23,'2021-05-17 22:06:42',NULL),(6,24,'2021-05-17 22:06:42',NULL),(6,25,'2021-05-17 22:06:42',NULL),(6,26,'2021-05-17 22:06:42',NULL),(6,51,'2021-05-17 22:06:42',NULL),(6,157,'2021-05-17 22:06:42','2021-06-15 22:06:42'),(7,11,'2021-05-18 19:33:55',NULL),(7,12,'2021-05-18 19:33:55',NULL),(7,13,'2021-05-18 19:33:55',NULL),(7,14,'2021-05-18 19:33:55',NULL),(7,15,'2021-05-18 19:33:55',NULL),(7,16,'2021-05-18 19:33:55',NULL),(7,17,'2021-05-18 19:33:55',NULL),(7,18,'2021-05-18 19:33:55',NULL),(7,19,'2021-05-18 19:33:55',NULL),(7,20,'2021-05-18 19:33:55',NULL),(7,21,'2021-05-18 19:33:55',NULL),(7,22,'2021-05-18 19:33:55',NULL),(7,23,'2021-05-18 19:33:55',NULL),(7,24,'2021-05-18 19:33:55',NULL),(7,25,'2021-05-18 19:33:55',NULL),(7,26,'2021-05-18 19:33:55',NULL),(7,37,'2021-05-18 19:33:55',NULL),(7,38,'2021-05-18 19:33:55',NULL),(7,39,'2021-05-18 19:33:55',NULL),(7,40,'2021-05-18 19:33:55',NULL),(7,51,'2021-05-18 19:33:55',NULL),(7,157,'2021-05-18 19:33:55','2021-06-15 19:33:55'),(8,11,'2021-05-16 10:40:40',NULL),(8,12,'2021-05-16 10:40:40',NULL),(8,13,'2021-05-16 10:40:40',NULL),(8,14,'2021-05-16 10:40:40',NULL),(8,15,'2021-05-16 10:40:40',NULL),(8,16,'2021-05-16 10:40:40',NULL),(8,17,'2021-05-16 10:40:40',NULL),(8,18,'2021-05-16 10:40:40',NULL),(8,19,'2021-05-16 10:40:40',NULL),(8,20,'2021-05-16 10:40:40',NULL),(8,21,'2021-05-16 10:40:40',NULL),(8,22,'2021-05-16 10:40:40',NULL),(8,23,'2021-05-16 10:40:40',NULL),(8,24,'2021-05-16 10:40:40',NULL),(8,25,'2021-05-16 10:40:40',NULL),(8,26,'2021-05-16 10:40:40',NULL),(8,37,'2021-05-16 10:40:40',NULL),(8,38,'2021-05-16 10:40:40',NULL),(8,39,'2021-05-16 10:40:40',NULL),(8,40,'2021-05-16 10:40:40',NULL),(8,51,'2021-05-16 10:40:40',NULL),(8,144,'2021-05-16 10:40:40','2021-06-14 10:40:40'),(9,11,'2021-05-17 15:39:30',NULL),(9,12,'2021-05-17 15:39:30',NULL),(9,13,'2021-05-17 15:39:30',NULL),(9,14,'2021-05-17 15:39:30',NULL),(9,15,'2021-05-17 15:39:30',NULL),(9,16,'2021-05-17 15:39:30',NULL),(9,17,'2021-05-17 15:39:30',NULL),(9,18,'2021-05-17 15:39:30',NULL),(9,19,'2021-05-17 15:39:30',NULL),(9,20,'2021-05-17 15:39:30',NULL),(9,21,'2021-05-17 15:39:30',NULL),(9,22,'2021-05-17 15:39:30',NULL),(9,23,'2021-05-17 15:39:30',NULL),(9,24,'2021-05-17 15:39:30',NULL),(9,25,'2021-05-17 15:39:30',NULL),(9,26,'2021-05-17 15:39:30',NULL),(9,41,'2021-05-17 15:39:30',NULL),(9,42,'2021-05-17 15:39:30',NULL),(9,43,'2021-05-17 15:39:30',NULL),(9,44,'2021-05-17 15:39:30',NULL),(9,45,'2021-05-17 15:39:30',NULL),(9,46,'2021-05-17 15:39:30',NULL),(9,47,'2021-05-17 15:39:30',NULL),(9,48,'2021-05-17 15:39:30',NULL),(9,49,'2021-05-17 15:39:30',NULL),(9,50,'2021-05-17 15:39:30',NULL),(9,51,'2021-05-17 15:39:30',NULL),(9,52,'2021-05-17 15:39:30','2021-06-12 15:39:30'),(10,11,'2021-05-16 01:28:54',NULL),(10,12,'2021-05-16 01:28:54',NULL),(10,13,'2021-05-16 01:28:54',NULL),(10,14,'2021-05-16 01:28:54',NULL),(10,15,'2021-05-16 01:28:54',NULL),(10,16,'2021-05-16 01:28:54',NULL),(10,17,'2021-05-16 01:28:54',NULL),(10,18,'2021-05-16 01:28:54',NULL),(10,19,'2021-05-16 01:28:54',NULL),(10,20,'2021-05-16 01:28:54',NULL),(10,21,'2021-05-16 01:28:54',NULL),(10,22,'2021-05-16 01:28:54',NULL),(10,23,'2021-05-16 01:28:54',NULL),(10,24,'2021-05-16 01:28:54',NULL),(10,25,'2021-05-16 01:28:54',NULL),(10,26,'2021-05-16 01:28:54',NULL),(10,27,'2021-05-16 01:28:54',NULL),(10,28,'2021-05-16 01:28:54',NULL),(10,29,'2021-05-16 01:28:54',NULL),(10,30,'2021-05-16 01:28:54',NULL),(10,31,'2021-05-16 01:28:54',NULL),(10,32,'2021-05-16 01:28:54',NULL),(10,33,'2021-05-16 01:28:54',NULL),(10,34,'2021-05-16 01:28:54',NULL),(10,35,'2021-05-16 01:28:54',NULL),(10,36,'2021-05-16 01:28:54',NULL),(10,51,'2021-05-16 01:28:54',NULL),(10,71,'2021-05-16 01:28:54','2021-06-13 01:28:54'),(11,11,'2021-05-17 17:39:30',NULL),(11,12,'2021-05-17 17:39:30',NULL),(11,13,'2021-05-17 17:39:30',NULL),(11,14,'2021-05-17 17:39:30',NULL),(11,15,'2021-05-17 17:39:30',NULL),(11,16,'2021-05-17 17:39:30',NULL),(11,17,'2021-05-17 17:39:30',NULL),(11,18,'2021-05-17 17:39:30',NULL),(11,19,'2021-05-17 17:39:30',NULL),(11,20,'2021-05-17 17:39:30',NULL),(11,21,'2021-05-17 17:39:30',NULL),(11,22,'2021-05-17 17:39:30',NULL),(11,23,'2021-05-17 17:39:30',NULL),(11,24,'2021-05-17 17:39:30',NULL),(11,25,'2021-05-17 17:39:30',NULL),(11,26,'2021-05-17 17:39:30',NULL),(11,37,'2021-05-17 17:39:30',NULL),(11,38,'2021-05-17 17:39:30',NULL),(11,39,'2021-05-17 17:39:30',NULL),(11,40,'2021-05-17 17:39:30',NULL),(11,51,'2021-05-17 17:39:30',NULL),(11,304,'2021-05-17 17:39:30','2021-06-10 17:39:30'),(12,11,'2021-05-17 08:27:40',NULL),(12,12,'2021-05-17 08:27:40',NULL),(12,13,'2021-05-17 08:27:40',NULL),(12,14,'2021-05-17 08:27:40',NULL),(12,15,'2021-05-17 08:27:40',NULL),(12,16,'2021-05-17 08:27:40',NULL),(12,17,'2021-05-17 08:27:40',NULL),(12,18,'2021-05-17 08:27:40',NULL),(12,19,'2021-05-17 08:27:40',NULL),(12,20,'2021-05-17 08:27:40',NULL),(12,21,'2021-05-17 08:27:40',NULL),(12,22,'2021-05-17 08:27:40',NULL),(12,23,'2021-05-17 08:27:40',NULL),(12,24,'2021-05-17 08:27:40',NULL),(12,25,'2021-05-17 08:27:40',NULL),(12,26,'2021-05-17 08:27:40',NULL),(12,51,'2021-05-17 08:27:40',NULL),(12,305,'2021-05-17 08:27:40','2021-06-18 08:27:40'),(13,11,'2021-05-16 12:25:46',NULL),(13,12,'2021-05-16 12:25:46',NULL),(13,13,'2021-05-16 12:25:46',NULL),(13,14,'2021-05-16 12:25:46',NULL),(13,15,'2021-05-16 12:25:46',NULL),(13,16,'2021-05-16 12:25:46',NULL),(13,17,'2021-05-16 12:25:46',NULL),(13,18,'2021-05-16 12:25:46',NULL),(13,19,'2021-05-16 12:25:46',NULL),(13,20,'2021-05-16 12:25:46',NULL),(13,21,'2021-05-16 12:25:46',NULL),(13,22,'2021-05-16 12:25:46',NULL),(13,23,'2021-05-16 12:25:46',NULL),(13,24,'2021-05-16 12:25:46',NULL),(13,25,'2021-05-16 12:25:46',NULL),(13,26,'2021-05-16 12:25:46',NULL),(13,51,'2021-05-16 12:25:46',NULL),(13,386,'2021-05-16 12:25:46','2021-06-18 12:25:46'),(14,11,'2021-05-17 00:55:16',NULL),(14,12,'2021-05-17 00:55:16',NULL),(14,13,'2021-05-17 00:55:16',NULL),(14,14,'2021-05-17 00:55:16',NULL),(14,15,'2021-05-17 00:55:16',NULL),(14,16,'2021-05-17 00:55:16',NULL),(14,17,'2021-05-17 00:55:16',NULL),(14,18,'2021-05-17 00:55:16',NULL),(14,19,'2021-05-17 00:55:16',NULL),(14,20,'2021-05-17 00:55:16',NULL),(14,21,'2021-05-17 00:55:16',NULL),(14,22,'2021-05-17 00:55:16',NULL),(14,23,'2021-05-17 00:55:16',NULL),(14,24,'2021-05-17 00:55:16',NULL),(14,25,'2021-05-17 00:55:16',NULL),(14,26,'2021-05-17 00:55:16',NULL),(14,27,'2021-05-17 00:55:16',NULL),(14,28,'2021-05-17 00:55:16',NULL),(14,29,'2021-05-17 00:55:16',NULL),(14,30,'2021-05-17 00:55:16',NULL),(14,31,'2021-05-17 00:55:16',NULL),(14,32,'2021-05-17 00:55:16',NULL),(14,33,'2021-05-17 00:55:16',NULL),(14,34,'2021-05-17 00:55:16',NULL),(14,35,'2021-05-17 00:55:16',NULL),(14,36,'2021-05-17 00:55:16',NULL),(14,37,'2021-05-17 00:55:16',NULL),(14,38,'2021-05-17 00:55:16',NULL),(14,39,'2021-05-17 00:55:16',NULL),(14,40,'2021-05-17 00:55:16',NULL),(14,41,'2021-05-17 00:55:16',NULL),(14,42,'2021-05-17 00:55:16',NULL),(14,43,'2021-05-17 00:55:16',NULL),(14,44,'2021-05-17 00:55:16',NULL),(14,45,'2021-05-17 00:55:16',NULL),(14,46,'2021-05-17 00:55:16',NULL),(14,47,'2021-05-17 00:55:16',NULL),(14,48,'2021-05-17 00:55:16',NULL),(14,49,'2021-05-17 00:55:16',NULL),(14,50,'2021-05-17 00:55:16',NULL),(14,51,'2021-05-17 00:55:16',NULL),(14,230,'2021-05-17 00:55:16','2021-06-21 00:55:16'),(15,11,'2021-05-18 22:54:59',NULL),(15,12,'2021-05-18 22:54:59',NULL),(15,13,'2021-05-18 22:54:59',NULL),(15,14,'2021-05-18 22:54:59',NULL),(15,15,'2021-05-18 22:54:59',NULL),(15,16,'2021-05-18 22:54:59',NULL),(15,17,'2021-05-18 22:54:59',NULL),(15,18,'2021-05-18 22:54:59',NULL),(15,19,'2021-05-18 22:54:59',NULL),(15,20,'2021-05-18 22:54:59',NULL),(15,21,'2021-05-18 22:54:59',NULL),(15,22,'2021-05-18 22:54:59',NULL),(15,23,'2021-05-18 22:54:59',NULL),(15,24,'2021-05-18 22:54:59',NULL),(15,25,'2021-05-18 22:54:59',NULL),(15,26,'2021-05-18 22:54:59',NULL),(15,41,'2021-05-18 22:54:59',NULL),(15,42,'2021-05-18 22:54:59',NULL),(15,43,'2021-05-18 22:54:59',NULL),(15,44,'2021-05-18 22:54:59',NULL),(15,45,'2021-05-18 22:54:59',NULL),(15,46,'2021-05-18 22:54:59',NULL),(15,47,'2021-05-18 22:54:59',NULL),(15,48,'2021-05-18 22:54:59',NULL),(15,49,'2021-05-18 22:54:59',NULL),(15,50,'2021-05-18 22:54:59',NULL),(15,51,'2021-05-18 22:54:59',NULL),(15,229,'2021-05-18 22:54:59','2021-06-28 16:20:00'),(16,11,'2021-05-16 03:36:20',NULL),(16,12,'2021-05-16 03:36:20',NULL),(16,13,'2021-05-16 03:36:20',NULL),(16,14,'2021-05-16 03:36:20',NULL),(16,15,'2021-05-16 03:36:20',NULL),(16,16,'2021-05-16 03:36:20',NULL),(16,17,'2021-05-16 03:36:20',NULL),(16,18,'2021-05-16 03:36:20',NULL),(16,19,'2021-05-16 03:36:20',NULL),(16,20,'2021-05-16 03:36:20',NULL),(16,21,'2021-05-16 03:36:20',NULL),(16,22,'2021-05-16 03:36:20',NULL),(16,23,'2021-05-16 03:36:20',NULL),(16,24,'2021-05-16 03:36:20',NULL),(16,25,'2021-05-16 03:36:20',NULL),(16,26,'2021-05-16 03:36:20',NULL),(16,37,'2021-05-16 03:36:20',NULL),(16,38,'2021-05-16 03:36:20',NULL),(16,39,'2021-05-16 03:36:20',NULL),(16,40,'2021-05-16 03:36:20',NULL),(16,51,'2021-05-16 03:36:20',NULL),(16,391,'2021-05-16 03:36:20','2021-06-20 03:36:20');
/*!40000 ALTER TABLE `have_access` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`have_access_AFTER_INSERT` AFTER INSERT ON `have_access` FOR EACH ROW
BEGIN
	INSERT INTO use_charge_log (customer_id, service_id, use_date_time, description, charge_amount)
		SELECT NEW.customer_id, 2, NEW.start_date_time, 'ROOM RESERVATION',
			DATEDIFF(NEW.end_date_time, NEW.start_date_time) * s.enroll_price
		FROM register_services s, places p
        WHERE s.service_id = 2 AND NEW.place_id = p.place_id AND p.offered_service_id = 2;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `no_register_services`
--

DROP TABLE IF EXISTS `no_register_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_register_services` (
  `service_id` int(10) NOT NULL,
  `service_type` enum('RECEPTION','BAR','RESTAURANT','HAIR_SALON') NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_no_register_services_2_idx` (`service_type`),
  CONSTRAINT `fk_no_register_services_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_no_register_services_2` FOREIGN KEY (`service_type`) REFERENCES `services` (`service_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_register_services`
--

LOCK TABLES `no_register_services` WRITE;
/*!40000 ALTER TABLE `no_register_services` DISABLE KEYS */;
INSERT INTO `no_register_services` VALUES (1,'RECEPTION'),(3,'BAR'),(4,'RESTAURANT'),(8,'HAIR_SALON');
/*!40000 ALTER TABLE `no_register_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `place_id` int(10) NOT NULL AUTO_INCREMENT,
  `place_description` varchar(5) NOT NULL,
  `place_type` enum('ELEVATOR','SERVICE','CORRIDOR','FLOOR') NOT NULL,
  `floor_id` int(10) DEFAULT NULL,
  `corridor_id` int(10) DEFAULT NULL,
  `offered_service_id` int(10) DEFAULT NULL,
  `room_capacity` int(10) NOT NULL,
  PRIMARY KEY (`place_id`),
  KEY `fk_places_1_idx` (`floor_id`),
  KEY `fk_places_2_idx` (`corridor_id`),
  KEY `fk_places_3_idx` (`offered_service_id`),
  CONSTRAINT `fk_places_1` FOREIGN KEY (`floor_id`) REFERENCES `places` (`place_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_places_2` FOREIGN KEY (`corridor_id`) REFERENCES `places` (`place_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_places_3` FOREIGN KEY (`offered_service_id`) REFERENCES `services` (`service_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'FLO0','FLOOR',NULL,NULL,NULL,0),(2,'FLO1','FLOOR',NULL,NULL,NULL,0),(3,'FLO2','FLOOR',NULL,NULL,NULL,0),(4,'FLO3','FLOOR',NULL,NULL,NULL,0),(5,'FLO4','FLOOR',NULL,NULL,NULL,0),(6,'FLO5','FLOOR',NULL,NULL,NULL,0),(7,'N','CORRIDOR',NULL,NULL,NULL,0),(8,'S','CORRIDOR',NULL,NULL,NULL,0),(9,'E','CORRIDOR',NULL,NULL,NULL,0),(10,'W','CORRIDOR',NULL,NULL,NULL,0),(11,'ELE1','ELEVATOR',NULL,NULL,NULL,0),(12,'ELE2','ELEVATOR',NULL,NULL,NULL,0),(13,'ELE3','ELEVATOR',NULL,NULL,NULL,0),(14,'ELE4','ELEVATOR',NULL,NULL,NULL,0),(15,'ELE5','ELEVATOR',NULL,NULL,NULL,0),(16,'RES1','SERVICE',1,7,4,0),(17,'RES2','SERVICE',1,8,4,0),(18,'RES3','SERVICE',1,9,4,0),(19,'RES4','SERVICE',1,10,4,0),(20,'BAR1','SERVICE',1,7,3,0),(21,'BAR2','SERVICE',1,8,3,0),(22,'BAR3','SERVICE',1,9,3,0),(23,'BAR4','SERVICE',1,10,3,0),(24,'BAR5','SERVICE',1,10,3,0),(25,'BAR6','SERVICE',1,9,3,0),(26,'RECP','SERVICE',1,NULL,1,0),(27,'CON1','SERVICE',1,7,5,0),(28,'CON2','SERVICE',1,8,5,0),(29,'CON3','SERVICE',1,9,5,0),(30,'CON4','SERVICE',1,10,5,0),(31,'CON5','SERVICE',1,7,5,0),(32,'CON6','SERVICE',1,8,5,0),(33,'CON7','SERVICE',1,9,5,0),(34,'CON8','SERVICE',1,10,5,0),(35,'CON9','SERVICE',1,7,5,0),(36,'CON10','SERVICE',1,8,5,0),(37,'GYM1','SERVICE',1,7,6,0),(38,'GYM2','SERVICE',1,8,6,0),(39,'GYM3','SERVICE',1,9,6,0),(40,'GYM4','SERVICE',1,10,6,0),(41,'SAU1','SERVICE',1,7,7,0),(42,'SAU2','SERVICE',1,8,7,0),(43,'SAU3','SERVICE',1,9,7,0),(44,'SAU4','SERVICE',1,10,7,0),(45,'SAU5','SERVICE',1,7,7,0),(46,'SAU6','SERVICE',1,8,7,0),(47,'SAU7','SERVICE',1,9,7,0),(48,'SAU8','SERVICE',1,10,7,0),(49,'SAU9','SERVICE',1,7,7,0),(50,'SAU10','SERVICE',1,8,7,0),(51,'HAIR','SERVICE',1,7,8,0),(52,'101W','SERVICE',2,10,2,1),(53,'101N','SERVICE',2,7,2,1),(54,'101S','SERVICE',2,8,2,1),(55,'101E','SERVICE',2,9,2,1),(56,'102W','SERVICE',2,10,2,1),(57,'102N','SERVICE',2,7,2,1),(58,'102S','SERVICE',2,8,2,1),(59,'102E','SERVICE',2,9,2,1),(60,'103W','SERVICE',2,10,2,1),(61,'103N','SERVICE',2,7,2,1),(62,'103S','SERVICE',2,8,2,1),(63,'103E','SERVICE',2,9,2,1),(64,'104W','SERVICE',2,10,2,1),(65,'104N','SERVICE',2,7,2,1),(66,'104S','SERVICE',2,8,2,1),(67,'104E','SERVICE',2,9,2,1),(68,'105W','SERVICE',2,10,2,1),(69,'105N','SERVICE',2,7,2,1),(70,'105S','SERVICE',2,8,2,1),(71,'105E','SERVICE',2,9,2,1),(72,'106W','SERVICE',2,10,2,2),(73,'106N','SERVICE',2,7,2,2),(74,'106S','SERVICE',2,8,2,2),(75,'106E','SERVICE',2,9,2,2),(76,'107W','SERVICE',2,10,2,2),(77,'107N','SERVICE',2,7,2,2),(78,'107S','SERVICE',2,8,2,2),(79,'107E','SERVICE',2,9,2,2),(80,'108W','SERVICE',2,10,2,2),(81,'108N','SERVICE',2,7,2,2),(82,'108S','SERVICE',2,8,2,2),(83,'108E','SERVICE',2,9,2,2),(84,'109W','SERVICE',2,10,2,2),(85,'109N','SERVICE',2,7,2,2),(86,'109S','SERVICE',2,8,2,2),(87,'109E','SERVICE',2,9,2,2),(88,'110W','SERVICE',2,10,2,2),(89,'110N','SERVICE',2,7,2,2),(90,'110S','SERVICE',2,8,2,2),(91,'110E','SERVICE',2,9,2,2),(92,'111W','SERVICE',2,10,2,3),(93,'111N','SERVICE',2,7,2,3),(94,'111S','SERVICE',2,8,2,3),(95,'111E','SERVICE',2,9,2,3),(96,'112W','SERVICE',2,10,2,3),(97,'112N','SERVICE',2,7,2,3),(98,'112S','SERVICE',2,8,2,3),(99,'112E','SERVICE',2,9,2,3),(100,'113W','SERVICE',2,10,2,3),(101,'113N','SERVICE',2,7,2,3),(102,'113S','SERVICE',2,8,2,3),(103,'113E','SERVICE',2,9,2,3),(104,'114W','SERVICE',2,10,2,3),(105,'114N','SERVICE',2,7,2,3),(106,'114S','SERVICE',2,8,2,3),(107,'114E','SERVICE',2,9,2,3),(108,'115W','SERVICE',2,10,2,3),(109,'115N','SERVICE',2,7,2,3),(110,'115S','SERVICE',2,8,2,3),(111,'115E','SERVICE',2,9,2,3),(112,'116W','SERVICE',2,10,2,4),(113,'116N','SERVICE',2,7,2,4),(114,'116S','SERVICE',2,8,2,4),(115,'116E','SERVICE',2,9,2,4),(116,'117W','SERVICE',2,10,2,4),(117,'117N','SERVICE',2,7,2,4),(118,'117S','SERVICE',2,8,2,4),(119,'117E','SERVICE',2,9,2,4),(120,'118W','SERVICE',2,10,2,4),(121,'118N','SERVICE',2,7,2,4),(122,'118S','SERVICE',2,8,2,4),(123,'118E','SERVICE',2,9,2,4),(124,'119W','SERVICE',2,10,2,4),(125,'119N','SERVICE',2,7,2,4),(126,'119S','SERVICE',2,8,2,4),(127,'119E','SERVICE',2,9,2,4),(128,'120W','SERVICE',2,10,2,4),(129,'120N','SERVICE',2,7,2,4),(130,'120S','SERVICE',2,8,2,4),(131,'120E','SERVICE',2,9,2,4),(132,'201W','SERVICE',3,10,2,1),(133,'201N','SERVICE',3,7,2,1),(134,'201S','SERVICE',3,8,2,1),(135,'201E','SERVICE',3,9,2,1),(136,'202W','SERVICE',3,10,2,1),(137,'202N','SERVICE',3,7,2,1),(138,'202S','SERVICE',3,8,2,1),(139,'202E','SERVICE',3,9,2,1),(140,'203W','SERVICE',3,10,2,1),(141,'203N','SERVICE',3,7,2,1),(142,'203S','SERVICE',3,8,2,1),(143,'203E','SERVICE',3,9,2,1),(144,'204W','SERVICE',3,10,2,1),(145,'204N','SERVICE',3,7,2,1),(146,'204S','SERVICE',3,8,2,1),(147,'204E','SERVICE',3,9,2,1),(148,'205W','SERVICE',3,10,2,1),(149,'205N','SERVICE',3,7,2,1),(150,'205S','SERVICE',3,8,2,1),(151,'205E','SERVICE',3,9,2,1),(152,'206W','SERVICE',3,10,2,2),(153,'206N','SERVICE',3,7,2,2),(154,'206S','SERVICE',3,8,2,2),(155,'206E','SERVICE',3,9,2,2),(156,'207W','SERVICE',3,10,2,2),(157,'207N','SERVICE',3,7,2,2),(158,'207S','SERVICE',3,8,2,2),(159,'207E','SERVICE',3,9,2,2),(160,'208W','SERVICE',3,10,2,2),(161,'208N','SERVICE',3,7,2,2),(162,'208S','SERVICE',3,8,2,2),(163,'208E','SERVICE',3,9,2,2),(164,'209W','SERVICE',3,10,2,2),(165,'209N','SERVICE',3,7,2,2),(166,'209S','SERVICE',3,8,2,2),(167,'209E','SERVICE',3,9,2,2),(168,'210W','SERVICE',3,10,2,2),(169,'210N','SERVICE',3,7,2,2),(170,'210S','SERVICE',3,8,2,2),(171,'210E','SERVICE',3,9,2,2),(172,'211W','SERVICE',3,10,2,3),(173,'211N','SERVICE',3,7,2,3),(174,'211S','SERVICE',3,8,2,3),(175,'211E','SERVICE',3,9,2,3),(176,'212W','SERVICE',3,10,2,3),(177,'212N','SERVICE',3,7,2,3),(178,'212S','SERVICE',3,8,2,3),(179,'212E','SERVICE',3,9,2,3),(180,'213W','SERVICE',3,10,2,3),(181,'213N','SERVICE',3,7,2,3),(182,'213S','SERVICE',3,8,2,3),(183,'213E','SERVICE',3,9,2,3),(184,'214W','SERVICE',3,10,2,3),(185,'214N','SERVICE',3,7,2,3),(186,'214S','SERVICE',3,8,2,3),(187,'214E','SERVICE',3,9,2,3),(188,'215W','SERVICE',3,10,2,3),(189,'215N','SERVICE',3,7,2,3),(190,'215S','SERVICE',3,8,2,3),(191,'215E','SERVICE',3,9,2,3),(192,'216W','SERVICE',3,10,2,4),(193,'216N','SERVICE',3,7,2,4),(194,'216S','SERVICE',3,8,2,4),(195,'216E','SERVICE',3,9,2,4),(196,'217W','SERVICE',3,10,2,4),(197,'217N','SERVICE',3,7,2,4),(198,'217S','SERVICE',3,8,2,4),(199,'217E','SERVICE',3,9,2,4),(200,'218W','SERVICE',3,10,2,4),(201,'218N','SERVICE',3,7,2,4),(202,'218S','SERVICE',3,8,2,4),(203,'218E','SERVICE',3,9,2,4),(204,'219W','SERVICE',3,10,2,4),(205,'219N','SERVICE',3,7,2,4),(206,'219S','SERVICE',3,8,2,4),(207,'219E','SERVICE',3,9,2,4),(208,'220W','SERVICE',3,10,2,4),(209,'220N','SERVICE',3,7,2,4),(210,'220S','SERVICE',3,8,2,4),(211,'220E','SERVICE',3,9,2,4),(212,'301W','SERVICE',4,10,2,1),(213,'301N','SERVICE',4,7,2,1),(214,'301S','SERVICE',4,8,2,1),(215,'301E','SERVICE',4,9,2,1),(216,'302W','SERVICE',4,10,2,1),(217,'302N','SERVICE',4,7,2,1),(218,'302S','SERVICE',4,8,2,1),(219,'302E','SERVICE',4,9,2,1),(220,'303W','SERVICE',4,10,2,1),(221,'303N','SERVICE',4,7,2,1),(222,'303S','SERVICE',4,8,2,1),(223,'303E','SERVICE',4,9,2,1),(224,'304W','SERVICE',4,10,2,1),(225,'304N','SERVICE',4,7,2,1),(226,'304S','SERVICE',4,8,2,1),(227,'304E','SERVICE',4,9,2,1),(228,'305W','SERVICE',4,10,2,1),(229,'305N','SERVICE',4,7,2,1),(230,'305S','SERVICE',4,8,2,1),(231,'305E','SERVICE',4,9,2,1),(232,'306W','SERVICE',4,10,2,2),(233,'306N','SERVICE',4,7,2,2),(234,'306S','SERVICE',4,8,2,2),(235,'306E','SERVICE',4,9,2,2),(236,'307W','SERVICE',4,10,2,2),(237,'307N','SERVICE',4,7,2,2),(238,'307S','SERVICE',4,8,2,2),(239,'307E','SERVICE',4,9,2,2),(240,'308W','SERVICE',4,10,2,2),(241,'308N','SERVICE',4,7,2,2),(242,'308S','SERVICE',4,8,2,2),(243,'308E','SERVICE',4,9,2,2),(244,'309W','SERVICE',4,10,2,2),(245,'309N','SERVICE',4,7,2,2),(246,'309S','SERVICE',4,8,2,2),(247,'309E','SERVICE',4,9,2,2),(248,'310W','SERVICE',4,10,2,2),(249,'310N','SERVICE',4,7,2,2),(250,'310S','SERVICE',4,8,2,2),(251,'310E','SERVICE',4,9,2,2),(252,'311W','SERVICE',4,10,2,3),(253,'311N','SERVICE',4,7,2,3),(254,'311S','SERVICE',4,8,2,3),(255,'311E','SERVICE',4,9,2,3),(256,'312W','SERVICE',4,10,2,3),(257,'312N','SERVICE',4,7,2,3),(258,'312S','SERVICE',4,8,2,3),(259,'312E','SERVICE',4,9,2,3),(260,'313W','SERVICE',4,10,2,3),(261,'313N','SERVICE',4,7,2,3),(262,'313S','SERVICE',4,8,2,3),(263,'313E','SERVICE',4,9,2,3),(264,'314W','SERVICE',4,10,2,3),(265,'314N','SERVICE',4,7,2,3),(266,'314S','SERVICE',4,8,2,3),(267,'314E','SERVICE',4,9,2,3),(268,'315W','SERVICE',4,10,2,3),(269,'315N','SERVICE',4,7,2,3),(270,'315S','SERVICE',4,8,2,3),(271,'315E','SERVICE',4,9,2,3),(272,'316W','SERVICE',4,10,2,4),(273,'316N','SERVICE',4,7,2,4),(274,'316S','SERVICE',4,8,2,4),(275,'316E','SERVICE',4,9,2,4),(276,'317W','SERVICE',4,10,2,4),(277,'317N','SERVICE',4,7,2,4),(278,'317S','SERVICE',4,8,2,4),(279,'317E','SERVICE',4,9,2,4),(280,'318W','SERVICE',4,10,2,4),(281,'318N','SERVICE',4,7,2,4),(282,'318S','SERVICE',4,8,2,4),(283,'318E','SERVICE',4,9,2,4),(284,'319W','SERVICE',4,10,2,4),(285,'319N','SERVICE',4,7,2,4),(286,'319S','SERVICE',4,8,2,4),(287,'319E','SERVICE',4,9,2,4),(288,'320W','SERVICE',4,10,2,4),(289,'320N','SERVICE',4,7,2,4),(290,'320S','SERVICE',4,8,2,4),(291,'320E','SERVICE',4,9,2,4),(292,'401W','SERVICE',5,10,2,1),(293,'401N','SERVICE',5,7,2,1),(294,'401S','SERVICE',5,8,2,1),(295,'401E','SERVICE',5,9,2,1),(296,'402W','SERVICE',5,10,2,1),(297,'402N','SERVICE',5,7,2,1),(298,'402S','SERVICE',5,8,2,1),(299,'402E','SERVICE',5,9,2,1),(300,'403W','SERVICE',5,10,2,1),(301,'403N','SERVICE',5,7,2,1),(302,'403S','SERVICE',5,8,2,1),(303,'403E','SERVICE',5,9,2,1),(304,'404W','SERVICE',5,10,2,1),(305,'404N','SERVICE',5,7,2,1),(306,'404S','SERVICE',5,8,2,1),(307,'404E','SERVICE',5,9,2,1),(308,'405W','SERVICE',5,10,2,1),(309,'405N','SERVICE',5,7,2,1),(310,'405S','SERVICE',5,8,2,1),(311,'405E','SERVICE',5,9,2,1),(312,'406W','SERVICE',5,10,2,2),(313,'406N','SERVICE',5,7,2,2),(314,'406S','SERVICE',5,8,2,2),(315,'406E','SERVICE',5,9,2,2),(316,'407W','SERVICE',5,10,2,2),(317,'407N','SERVICE',5,7,2,2),(318,'407S','SERVICE',5,8,2,2),(319,'407E','SERVICE',5,9,2,2),(320,'408W','SERVICE',5,10,2,2),(321,'408N','SERVICE',5,7,2,2),(322,'408S','SERVICE',5,8,2,2),(323,'408E','SERVICE',5,9,2,2),(324,'409W','SERVICE',5,10,2,2),(325,'409N','SERVICE',5,7,2,2),(326,'409S','SERVICE',5,8,2,2),(327,'409E','SERVICE',5,9,2,2),(328,'410W','SERVICE',5,10,2,2),(329,'410N','SERVICE',5,7,2,2),(330,'410S','SERVICE',5,8,2,2),(331,'410E','SERVICE',5,9,2,2),(332,'411W','SERVICE',5,10,2,3),(333,'411N','SERVICE',5,7,2,3),(334,'411S','SERVICE',5,8,2,3),(335,'411E','SERVICE',5,9,2,3),(336,'412W','SERVICE',5,10,2,3),(337,'412N','SERVICE',5,7,2,3),(338,'412S','SERVICE',5,8,2,3),(339,'412E','SERVICE',5,9,2,3),(340,'413W','SERVICE',5,10,2,3),(341,'413N','SERVICE',5,7,2,3),(342,'413S','SERVICE',5,8,2,3),(343,'413E','SERVICE',5,9,2,3),(344,'414W','SERVICE',5,10,2,3),(345,'414N','SERVICE',5,7,2,3),(346,'414S','SERVICE',5,8,2,3),(347,'414E','SERVICE',5,9,2,3),(348,'415W','SERVICE',5,10,2,3),(349,'415N','SERVICE',5,7,2,3),(350,'415S','SERVICE',5,8,2,3),(351,'415E','SERVICE',5,9,2,3),(352,'416W','SERVICE',5,10,2,4),(353,'416N','SERVICE',5,7,2,4),(354,'416S','SERVICE',5,8,2,4),(355,'416E','SERVICE',5,9,2,4),(356,'417W','SERVICE',5,10,2,4),(357,'417N','SERVICE',5,7,2,4),(358,'417S','SERVICE',5,8,2,4),(359,'417E','SERVICE',5,9,2,4),(360,'418W','SERVICE',5,10,2,4),(361,'418N','SERVICE',5,7,2,4),(362,'418S','SERVICE',5,8,2,4),(363,'418E','SERVICE',5,9,2,4),(364,'419W','SERVICE',5,10,2,4),(365,'419N','SERVICE',5,7,2,4),(366,'419S','SERVICE',5,8,2,4),(367,'419E','SERVICE',5,9,2,4),(368,'420W','SERVICE',5,10,2,4),(369,'420N','SERVICE',5,7,2,4),(370,'420S','SERVICE',5,8,2,4),(371,'420E','SERVICE',5,9,2,4),(372,'501W','SERVICE',6,10,2,1),(373,'501N','SERVICE',6,7,2,1),(374,'501S','SERVICE',6,8,2,1),(375,'501E','SERVICE',6,9,2,1),(376,'502W','SERVICE',6,10,2,1),(377,'502N','SERVICE',6,7,2,1),(378,'502S','SERVICE',6,8,2,1),(379,'502E','SERVICE',6,9,2,1),(380,'503W','SERVICE',6,10,2,1),(381,'503N','SERVICE',6,7,2,1),(382,'503S','SERVICE',6,8,2,1),(383,'503E','SERVICE',6,9,2,1),(384,'504W','SERVICE',6,10,2,1),(385,'504N','SERVICE',6,7,2,1),(386,'504S','SERVICE',6,8,2,1),(387,'504E','SERVICE',6,9,2,1),(388,'505W','SERVICE',6,10,2,1),(389,'505N','SERVICE',6,7,2,1),(390,'505S','SERVICE',6,8,2,1),(391,'505E','SERVICE',6,9,2,1),(392,'506W','SERVICE',6,10,2,2),(393,'506N','SERVICE',6,7,2,2),(394,'506S','SERVICE',6,8,2,2),(395,'506E','SERVICE',6,9,2,2),(396,'507W','SERVICE',6,10,2,2),(397,'507N','SERVICE',6,7,2,2),(398,'507S','SERVICE',6,8,2,2),(399,'507E','SERVICE',6,9,2,2),(400,'508W','SERVICE',6,10,2,2),(401,'508N','SERVICE',6,7,2,2),(402,'508S','SERVICE',6,8,2,2),(403,'508E','SERVICE',6,9,2,2),(404,'509W','SERVICE',6,10,2,2),(405,'509N','SERVICE',6,7,2,2),(406,'509S','SERVICE',6,8,2,2),(407,'509E','SERVICE',6,9,2,2),(408,'510W','SERVICE',6,10,2,2),(409,'510N','SERVICE',6,7,2,2),(410,'510S','SERVICE',6,8,2,2),(411,'510E','SERVICE',6,9,2,2),(412,'511W','SERVICE',6,10,2,3),(413,'511N','SERVICE',6,7,2,3),(414,'511S','SERVICE',6,8,2,3),(415,'511E','SERVICE',6,9,2,3),(416,'512W','SERVICE',6,10,2,3),(417,'512N','SERVICE',6,7,2,3),(418,'512S','SERVICE',6,8,2,3),(419,'512E','SERVICE',6,9,2,3),(420,'513W','SERVICE',6,10,2,3),(421,'513N','SERVICE',6,7,2,3),(422,'513S','SERVICE',6,8,2,3),(423,'513E','SERVICE',6,9,2,3),(424,'514W','SERVICE',6,10,2,3),(425,'514N','SERVICE',6,7,2,3),(426,'514S','SERVICE',6,8,2,3),(427,'514E','SERVICE',6,9,2,3),(428,'515W','SERVICE',6,10,2,3),(429,'515N','SERVICE',6,7,2,3),(430,'515S','SERVICE',6,8,2,3),(431,'515E','SERVICE',6,9,2,3),(432,'516W','SERVICE',6,10,2,4),(433,'516N','SERVICE',6,7,2,4),(434,'516S','SERVICE',6,8,2,4),(435,'516E','SERVICE',6,9,2,4),(436,'517W','SERVICE',6,10,2,4),(437,'517N','SERVICE',6,7,2,4),(438,'517S','SERVICE',6,8,2,4),(439,'517E','SERVICE',6,9,2,4),(440,'518W','SERVICE',6,10,2,4),(441,'518N','SERVICE',6,7,2,4),(442,'518S','SERVICE',6,8,2,4),(443,'518E','SERVICE',6,9,2,4),(444,'519W','SERVICE',6,10,2,4),(445,'519N','SERVICE',6,7,2,4),(446,'519S','SERVICE',6,8,2,4),(447,'519E','SERVICE',6,9,2,4),(448,'520W','SERVICE',6,10,2,4),(449,'520N','SERVICE',6,7,2,4),(450,'520S','SERVICE',6,8,2,4),(451,'520E','SERVICE',6,9,2,4);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_services`
--

DROP TABLE IF EXISTS `register_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register_services` (
  `service_id` int(10) NOT NULL,
  `enroll_price` float(5,2) NOT NULL,
  `service_type` enum('ROOM','CONFERENCE','GYM','SAUNA') NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_register_services_2_idx` (`service_type`),
  CONSTRAINT `fk_register_services_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_register_services_2` FOREIGN KEY (`service_type`) REFERENCES `services` (`service_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_services`
--

LOCK TABLES `register_services` WRITE;
/*!40000 ALTER TABLE `register_services` DISABLE KEYS */;
INSERT INTO `register_services` VALUES (2,30.00,'ROOM'),(5,25.00,'CONFERENCE'),(6,30.00,'GYM'),(7,45.00,'SAUNA');
/*!40000 ALTER TABLE `register_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `service_id` int(10) NOT NULL AUTO_INCREMENT,
  `service_type` enum('RECEPTION','ROOM','BAR','RESTAURANT','CONFERENCE','GYM','SAUNA','HAIR_SALON') NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_type_UNIQUE` (`service_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'RECEPTION'),(2,'ROOM'),(3,'BAR'),(4,'RESTAURANT'),(5,'CONFERENCE'),(6,'GYM'),(7,'SAUNA'),(8,'HAIR_SALON');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`services_BEFORE_DELETE` BEFORE DELETE ON `services` FOR EACH ROW
BEGIN
	DELETE FROM have_access
	WHERE have_access.place_id IN
		(SELECT p.place_id
         FROM places p
         WHERE p.offered_service_id = OLD.service_id);
             
	UPDATE places
    SET
		place_description = 'EMPTY'
	WHERE
		offered_service_id = OLD.service_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `use_charge_log`
--

DROP TABLE IF EXISTS `use_charge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `use_charge_log` (
  `use_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `service_id` int(10) NOT NULL,
  `use_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` varchar(45) DEFAULT NULL,
  `charge_amount` float(10,2) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`use_log_id`),
  KEY `fk_new_table_1_idx` (`customer_id`),
  KEY `fk_new_table_2_idx` (`service_id`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`nfc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_new_table_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_charge_log`
--

LOCK TABLES `use_charge_log` WRITE;
/*!40000 ALTER TABLE `use_charge_log` DISABLE KEYS */;
INSERT INTO `use_charge_log` VALUES (90,1,2,'2021-05-15 07:29:10','ROOM RESERVATION',780.00,0),(91,2,2,'2021-05-16 13:06:34','ROOM RESERVATION',780.00,0),(92,3,2,'2021-05-16 13:06:34','ROOM RESERVATION',780.00,0),(93,4,2,'2021-05-16 13:06:34','ROOM RESERVATION',780.00,0),(94,5,2,'2021-05-15 01:54:48','ROOM RESERVATION',780.00,0),(95,6,2,'2021-05-17 19:06:42','ROOM RESERVATION',870.00,0),(96,7,2,'2021-05-18 16:33:55','ROOM RESERVATION',840.00,0),(97,8,2,'2021-05-16 07:40:40','ROOM RESERVATION',870.00,0),(98,9,2,'2021-05-17 12:39:30','ROOM RESERVATION',780.00,0),(99,10,2,'2021-05-15 22:28:54','ROOM RESERVATION',840.00,0),(100,11,2,'2021-05-17 14:39:30','ROOM RESERVATION',720.00,0),(101,12,2,'2021-05-17 05:27:40','ROOM RESERVATION',960.00,0),(102,13,2,'2021-05-16 09:25:46','ROOM RESERVATION',990.00,0),(103,14,2,'2021-05-16 21:55:16','ROOM RESERVATION',1050.00,0),(104,15,2,'2021-05-18 19:54:59','ROOM RESERVATION',1230.00,0),(105,16,2,'2021-05-16 00:36:20','ROOM RESERVATION',1050.00,0),(106,1,4,'2021-05-17 10:18:23','1 MAIN DISH, 1 SALAD, 1 COKE',27.90,0),(107,1,3,'2021-06-01 17:45:50','3 MAI TAI',15.00,0),(108,1,4,'2021-05-18 10:18:23','1 MAIN DISH, 1 WATER',15.80,0),(109,1,3,'2021-05-18 18:13:01','2 RUM',10.00,0),(110,1,4,'2021-05-19 10:18:23','1 MAIN DISH, 1 COKE',17.90,0),(111,1,4,'2021-05-20 10:18:23','1 MAIN DISH, 1 COKE',17.90,0),(112,1,4,'2021-05-21 10:18:23','1 MAIN DISH, 1 COKE, 1 DESERT',20.90,0),(113,1,3,'2021-05-21 18:13:01','3 MOJITO',15.00,0),(114,2,4,'2021-05-17 10:00:00','1 MAIN DISH, 1 SALAD, 1 COKE',27.90,0),(115,2,3,'2021-06-01 17:45:50','2 GIN, 2 WHISKEY',20.00,0),(116,2,4,'2021-05-18 10:00:00','1 DISH NO 2, REFRESHMENT',17.90,0),(117,2,3,'2021-05-18 17:05:05','1 LEMONADE',4.00,0),(118,2,4,'2021-05-19 10:00:00','1 MAIN DISH, 1 WATER',15.80,0),(119,2,3,'2021-05-19 17:05:05','2 RUM',8.00,0),(120,2,4,'2021-05-20 10:00:00','1 MAIN DISH, 1 COKE',17.90,0),(121,2,3,'2021-05-20 17:05:05','4 WHISKEY',20.00,0),(122,2,4,'2021-05-21 10:00:00','1 MAIN DISH, 1 SALAD',25.00,0),(123,3,4,'2021-05-17 10:06:26','1 MAIN DISH, 1 COKE, 1 CHERRYPIE',20.90,0),(124,3,8,'2021-05-17 15:09:03','1 MENS HAIRCUT',14.00,0),(125,3,4,'2021-05-18 10:06:26','1 MAIN DISH, 1 WATER',15.80,0),(126,3,3,'2021-05-18 15:09:03','2 RUM',10.00,0),(127,3,4,'2021-05-19 10:06:26','1 MAIN DISH, 1 WATER',15.80,0),(128,3,3,'2021-05-19 15:09:03','2 RUM',10.00,0),(129,3,4,'2021-05-20 10:06:26','1 MAIN DISH, 1 COKE, 1 CHERRYPIE',20.90,0),(130,3,3,'2021-05-20 15:09:03','2 MARGARITA',10.00,0),(131,3,4,'2021-05-21 10:06:26','1 MAIN DISH, 1 COKE, 1 CHERRYPIE',20.90,0),(132,3,3,'2021-05-21 15:09:03','2 RUM',10.00,0),(133,3,4,'2021-05-22 10:06:26','1 MAIN DISH, 1 WATER',15.80,0),(134,3,3,'2021-05-22 15:09:03','2 RUM',10.00,0),(135,4,4,'2021-05-17 09:54:13','1 DISH NO 2, REFRESHMENT',17.90,0),(136,4,3,'2021-05-17 20:21:25','2 MARGARITA',10.00,0),(137,4,4,'2021-05-18 09:54:13','1 MAIN DISH, 1 COKE, 1 DESERT',20.90,0),(138,4,8,'2021-05-17 16:41:14','1 WOMEN HAIRCUT',23.00,0),(139,4,3,'2021-05-18 20:21:25','2 MARGARITA',10.00,0),(140,4,4,'2021-05-19 09:54:13','1 MAIN DISH, 1 COKE, 1 DESERT',20.90,0),(141,4,4,'2021-05-20 09:54:13','1 DISH NO 2, REFRESHMENT',17.90,0),(142,4,3,'2021-05-20 20:21:25','4 WHISKEY',20.00,0),(143,5,4,'2021-05-17 10:20:16','1 MAIN DISH, 1 WATER, 1 CHERRYPIE',15.80,0),(144,5,3,'2021-05-17 17:16:26','2 RUM',10.00,0),(145,5,4,'2021-05-18 10:20:16','1 MAIN DISH, 1 COKE, 1 CHERRYPIE',20.90,0),(146,5,3,'2021-05-18 17:16:26','4 WHISKEY',20.00,0),(147,5,4,'2021-05-19 10:07:09','1 MAIN DISH, 1 SALAD',25.00,0),(148,5,3,'2021-05-19 17:16:26','2 MARGARITA',10.00,0),(149,5,4,'2021-05-20 10:20:16','1 MAIN DISH, 1 WATER',15.80,0),(150,5,3,'2021-05-21 10:20:16','1 MAIN DISH, 1 WATER',15.80,0),(151,5,4,'2021-05-22 10:20:16','1 MAIN DISH, 1 WATER',15.80,0),(152,5,3,'2021-06-01 17:45:50','2 GIN, 2 WHISKEY',20.00,0),(153,9,4,'2021-05-17 10:15:04','1 DISH NO 5',9.00,0),(154,9,3,'2021-05-17 17:17:02','1 LONG ISLAND',5.00,0),(155,9,4,'2021-05-18 10:15:04','1 DISH NO 3, REFRESHMENT',13.00,0),(156,9,3,'2021-05-18 17:17:02','1 ZOMBIE 1 PALOMA',10.00,0),(157,9,4,'2021-05-19 10:15:04','1 CHERRYPIE',4.00,0),(158,9,3,'2021-06-01 17:45:50','1 GIN',5.00,0),(159,9,4,'2021-05-20 10:15:04','1 MAIN DISH, 1 COKE, 1 CHERRYPIE',20.90,0),(160,9,3,'2021-05-20 17:17:02','1 WHISKEY',5.00,0),(161,9,4,'2021-05-21 10:15:04','1 MAIN DISH, 1 SALAD, 1 COKE',27.90,0),(162,9,3,'2021-05-21 17:17:02','1 MARGARITA',5.00,0);
/*!40000 ALTER TABLE `use_charge_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_log`
--

DROP TABLE IF EXISTS `visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_log` (
  `v_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `place_id` int(10) NOT NULL,
  `timestamp_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp_out` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`v_log_id`),
  KEY `fk_visit_log_1_idx` (`customer_id`),
  KEY `fk_visit_log_2_idx` (`place_id`),
  CONSTRAINT `fk_visit_log_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`nfc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_visit_log_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1243 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_log`
--

LOCK TABLES `visit_log` WRITE;
/*!40000 ALTER TABLE `visit_log` DISABLE KEYS */;
INSERT INTO `visit_log` VALUES (622,1,26,'2021-05-17 07:00:00','2021-05-17 07:05:03'),(623,1,13,'2021-05-17 07:05:03','2021-05-17 07:06:05'),(624,1,8,'2021-05-17 07:06:05','2021-05-17 07:08:10'),(625,1,54,'2021-05-17 07:08:10','2021-05-17 08:45:06'),(626,1,8,'2021-05-17 08:45:06','2021-05-17 08:47:06'),(627,1,11,'2021-05-17 08:47:06','2021-05-17 08:49:07'),(628,1,42,'2021-05-17 08:49:07','2021-05-17 09:34:07'),(629,1,26,'2021-05-17 09:34:07','2021-05-17 09:40:08'),(630,1,13,'2021-05-17 09:40:08','2021-05-17 09:41:45'),(631,1,8,'2021-05-17 09:41:45','2021-05-17 09:50:51'),(632,1,54,'2021-05-17 09:50:51','2021-05-17 10:15:13'),(633,1,8,'2021-05-17 10:15:13','2021-05-17 10:16:23'),(634,1,11,'2021-05-17 10:16:23','2021-05-17 10:18:23'),(635,1,17,'2021-05-17 10:18:23','2021-05-17 12:20:23'),(636,1,13,'2021-05-17 12:20:23','2021-05-17 12:23:23'),(637,1,8,'2021-05-17 12:23:23','2021-05-17 12:25:31'),(638,1,54,'2021-05-17 12:25:31','2021-05-17 18:09:10'),(639,1,8,'2021-05-17 18:09:10','2021-05-17 18:12:10'),(640,1,11,'2021-05-17 18:12:10','2021-05-17 18:13:01'),(641,1,23,'2021-05-17 18:13:01','2021-05-17 20:54:07'),(642,1,11,'2021-05-17 20:54:07','2021-05-17 21:05:08'),(643,1,8,'2021-05-17 21:05:08','2021-05-17 21:09:11'),(644,1,54,'2021-05-17 21:09:11','2021-05-18 08:45:06'),(645,1,8,'2021-05-18 08:45:06','2021-05-18 08:47:06'),(646,1,11,'2021-05-18 08:47:06','2021-05-18 08:49:07'),(647,1,42,'2021-05-18 08:49:07','2021-05-18 09:34:07'),(648,1,26,'2021-05-18 09:34:07','2021-05-18 09:40:08'),(649,1,13,'2021-05-18 09:40:08','2021-05-18 09:41:45'),(650,1,8,'2021-05-18 09:41:45','2021-05-18 09:50:51'),(651,1,54,'2021-05-18 09:50:51','2021-05-18 10:15:13'),(652,1,8,'2021-05-18 10:15:13','2021-05-18 10:16:23'),(653,1,11,'2021-05-18 10:16:23','2021-05-18 10:18:23'),(654,1,17,'2021-05-18 10:18:23','2021-05-18 12:20:23'),(655,1,13,'2021-05-18 12:20:23','2021-05-18 12:23:23'),(656,1,8,'2021-05-18 12:23:23','2021-05-18 12:25:31'),(657,1,54,'2021-05-18 12:25:31','2021-05-18 18:09:10'),(658,1,8,'2021-05-18 18:09:10','2021-05-18 18:12:10'),(659,1,11,'2021-05-18 18:12:10','2021-05-18 18:13:01'),(660,1,23,'2021-05-18 18:13:01','2021-05-18 20:54:07'),(661,1,11,'2021-05-18 20:54:07','2021-05-18 21:05:08'),(662,1,8,'2021-05-18 21:05:08','2021-05-18 21:09:11'),(663,1,54,'2021-05-18 21:09:11','2021-05-19 08:45:06'),(664,1,8,'2021-05-19 08:45:06','2021-05-19 08:47:06'),(665,1,11,'2021-05-19 08:47:06','2021-05-19 08:49:07'),(666,1,42,'2021-05-19 08:49:07','2021-05-19 09:34:07'),(667,1,26,'2021-05-19 09:34:07','2021-05-19 09:40:08'),(668,1,13,'2021-05-19 09:40:08','2021-05-19 09:41:45'),(669,1,8,'2021-05-19 09:41:45','2021-05-19 09:50:51'),(670,1,54,'2021-05-19 09:50:51','2021-05-19 10:15:13'),(671,1,8,'2021-05-19 10:15:13','2021-05-19 10:16:23'),(672,1,11,'2021-05-19 10:16:23','2021-05-19 10:18:23'),(673,1,17,'2021-05-19 10:18:23','2021-05-19 12:20:23'),(674,1,13,'2021-05-19 12:20:23','2021-05-19 12:23:23'),(675,1,8,'2021-05-19 12:23:23','2021-05-19 12:25:31'),(676,1,54,'2021-05-19 12:25:31','2021-05-19 18:09:10'),(677,1,8,'2021-05-19 18:09:10','2021-05-19 18:12:10'),(678,1,11,'2021-05-19 18:12:10','2021-05-19 18:13:01'),(679,1,23,'2021-05-19 18:13:01','2021-05-19 20:54:07'),(680,1,11,'2021-05-19 20:54:07','2021-05-19 21:05:08'),(681,1,8,'2021-05-19 21:05:08','2021-05-19 21:09:11'),(682,1,54,'2021-05-19 21:09:11','2021-05-20 08:45:06'),(683,1,8,'2021-05-20 08:45:06','2021-05-20 08:47:06'),(684,1,11,'2021-05-20 08:47:06','2021-05-20 08:49:07'),(685,1,42,'2021-05-20 08:49:07','2021-05-20 09:34:07'),(686,1,26,'2021-05-20 09:34:07','2021-05-20 09:40:08'),(687,1,13,'2021-05-20 09:40:08','2021-05-20 09:41:45'),(688,1,8,'2021-05-20 09:41:45','2021-05-20 09:50:51'),(689,1,54,'2021-05-20 09:50:51','2021-05-20 10:15:13'),(690,1,8,'2021-05-20 10:15:13','2021-05-20 10:16:23'),(691,1,11,'2021-05-20 10:16:23','2021-05-20 10:18:23'),(692,1,17,'2021-05-20 10:18:23','2021-05-20 12:20:23'),(693,1,13,'2021-05-20 12:20:23','2021-05-20 12:23:23'),(694,1,8,'2021-05-20 12:23:23','2021-05-20 12:25:31'),(695,1,54,'2021-05-20 12:25:31','2021-05-20 18:09:10'),(696,1,8,'2021-05-20 18:09:10','2021-05-20 18:12:10'),(697,1,11,'2021-05-20 18:12:10','2021-05-20 18:13:01'),(698,1,23,'2021-05-20 18:13:01','2021-05-20 20:54:07'),(699,1,11,'2021-05-20 20:54:07','2021-05-20 21:05:08'),(700,1,8,'2021-05-20 21:05:08','2021-05-20 21:09:11'),(701,1,54,'2021-05-20 21:09:11','2021-05-21 08:45:06'),(702,1,8,'2021-05-21 08:45:06','2021-05-21 08:47:06'),(703,1,11,'2021-05-21 08:47:06','2021-05-21 08:49:07'),(704,1,42,'2021-05-21 08:49:07','2021-05-21 09:34:07'),(705,1,26,'2021-05-21 09:34:07','2021-05-21 09:40:08'),(706,1,13,'2021-05-21 09:40:08','2021-05-21 09:41:45'),(707,1,8,'2021-05-21 09:41:45','2021-05-21 09:50:51'),(708,1,54,'2021-05-21 09:50:51','2021-05-21 10:15:13'),(709,1,8,'2021-05-21 10:15:13','2021-05-21 10:16:23'),(710,1,11,'2021-05-21 10:16:23','2021-05-21 10:18:23'),(711,1,17,'2021-05-21 10:18:23','2021-05-21 12:20:23'),(712,1,13,'2021-05-21 12:20:23','2021-05-21 12:23:23'),(713,1,8,'2021-05-21 12:23:23','2021-05-21 12:25:31'),(714,1,54,'2021-05-21 12:25:31','2021-05-21 18:09:10'),(715,1,8,'2021-05-21 18:09:10','2021-05-21 18:12:10'),(716,1,11,'2021-05-21 18:12:10','2021-05-21 18:13:01'),(717,1,23,'2021-05-21 18:13:01','2021-05-21 20:54:07'),(718,1,11,'2021-05-21 20:54:07','2021-05-21 21:05:08'),(719,1,8,'2021-05-21 21:05:08','2021-05-21 21:09:11'),(720,1,54,'2021-05-21 21:09:11','2021-05-22 08:45:06'),(721,2,26,'2021-05-17 08:30:00','2021-05-17 08:35:04'),(722,2,13,'2021-05-17 08:35:04','2021-05-17 08:40:00'),(723,2,8,'2021-05-17 08:40:00','2021-05-17 08:41:19'),(724,2,94,'2021-05-17 08:41:19','2021-05-17 08:55:43'),(725,2,8,'2021-05-17 08:55:43','2021-05-17 08:59:43'),(726,2,13,'2021-05-17 08:59:43','2021-05-17 09:00:09'),(727,2,42,'2021-05-17 09:00:09','2021-05-17 09:45:09'),(728,2,26,'2021-05-17 09:45:09','2021-05-17 09:50:00'),(729,2,13,'2021-05-17 09:50:00','2021-05-17 09:51:00'),(730,2,8,'2021-05-17 09:51:00','2021-05-17 09:56:07'),(731,2,94,'2021-05-17 09:56:07','2021-05-17 09:56:07'),(732,2,8,'2021-05-17 09:56:07','2021-05-17 09:57:07'),(733,2,13,'2021-05-17 09:57:07','2021-05-17 10:00:00'),(734,2,18,'2021-05-17 10:00:00','2021-05-17 12:14:40'),(735,2,13,'2021-05-17 12:14:40','2021-05-17 12:15:43'),(736,2,8,'2021-05-17 12:15:43','2021-05-17 12:20:43'),(737,2,94,'2021-05-17 12:20:43','2021-05-17 17:00:43'),(738,2,8,'2021-05-17 17:00:43','2021-05-17 17:04:43'),(739,2,13,'2021-05-17 17:04:43','2021-05-17 17:05:05'),(740,2,23,'2021-05-17 17:05:05','2021-05-17 22:15:02'),(741,2,13,'2021-05-17 22:15:02','2021-05-17 22:20:02'),(742,2,8,'2021-05-17 22:20:02','2021-05-17 22:21:03'),(743,2,94,'2021-05-17 22:21:03','2021-05-18 08:55:43'),(744,2,8,'2021-05-18 08:55:43','2021-05-18 08:59:43'),(745,2,13,'2021-05-18 08:59:43','2021-05-18 09:00:09'),(746,2,39,'2021-05-18 09:00:09','2021-05-18 09:45:09'),(747,2,26,'2021-05-18 09:45:09','2021-05-18 09:50:00'),(748,2,13,'2021-05-18 09:50:00','2021-05-18 09:51:00'),(749,2,8,'2021-05-18 09:51:00','2021-05-18 09:56:07'),(750,2,94,'2021-05-18 09:56:07','2021-05-18 09:56:07'),(751,2,8,'2021-05-18 09:56:07','2021-05-18 09:57:07'),(752,2,13,'2021-05-18 09:57:07','2021-05-18 10:00:00'),(753,2,18,'2021-05-18 10:00:00','2021-05-18 12:14:40'),(754,2,13,'2021-05-18 12:14:40','2021-05-18 12:15:43'),(755,2,8,'2021-05-18 12:15:43','2021-05-18 12:20:43'),(756,2,94,'2021-05-18 12:20:43','2021-05-18 17:00:43'),(757,2,8,'2021-05-18 17:00:43','2021-05-18 17:04:43'),(758,2,13,'2021-05-18 17:04:43','2021-05-18 17:05:05'),(759,2,23,'2021-05-18 17:05:05','2021-05-18 22:15:02'),(760,2,13,'2021-05-18 22:15:02','2021-05-18 22:20:02'),(761,2,8,'2021-05-18 22:20:02','2021-05-18 22:21:03'),(762,2,94,'2021-05-18 22:21:03','2021-05-19 08:55:43'),(763,2,8,'2021-05-19 08:55:43','2021-05-19 08:59:43'),(764,2,13,'2021-05-19 08:59:43','2021-05-19 09:00:09'),(765,2,42,'2021-05-19 09:00:09','2021-05-19 09:45:09'),(766,2,26,'2021-05-19 09:45:09','2021-05-19 09:50:00'),(767,2,13,'2021-05-19 09:50:00','2021-05-19 09:51:00'),(768,2,8,'2021-05-19 09:51:00','2021-05-19 09:56:07'),(769,2,94,'2021-05-19 09:56:07','2021-05-19 09:56:07'),(770,2,8,'2021-05-19 09:56:07','2021-05-19 09:57:07'),(771,2,13,'2021-05-19 09:57:07','2021-05-19 10:00:00'),(772,2,18,'2021-05-19 10:00:00','2021-05-19 12:14:40'),(773,2,13,'2021-05-19 12:14:40','2021-05-19 12:15:43'),(774,2,8,'2021-05-19 12:15:43','2021-05-19 12:20:43'),(775,2,94,'2021-05-19 12:20:43','2021-05-19 17:00:43'),(776,2,8,'2021-05-19 17:00:43','2021-05-19 17:04:43'),(777,2,13,'2021-05-19 17:04:43','2021-05-19 17:05:05'),(778,2,23,'2021-05-19 17:05:05','2021-05-19 22:15:02'),(779,2,13,'2021-05-19 22:15:02','2021-05-19 22:20:02'),(780,2,8,'2021-05-19 22:20:02','2021-05-19 22:21:03'),(781,2,94,'2021-05-19 22:21:03','2021-05-20 08:55:43'),(782,2,8,'2021-05-20 08:55:43','2021-05-20 08:59:43'),(783,2,13,'2021-05-20 08:59:43','2021-05-20 09:00:09'),(784,2,42,'2021-05-20 09:00:09','2021-05-20 09:45:09'),(785,2,26,'2021-05-20 09:45:09','2021-05-20 09:50:00'),(786,2,13,'2021-05-20 09:50:00','2021-05-20 09:51:00'),(787,2,8,'2021-05-20 09:51:00','2021-05-20 09:56:07'),(788,2,94,'2021-05-20 09:56:07','2021-05-20 09:56:07'),(789,2,8,'2021-05-20 09:56:07','2021-05-20 09:57:07'),(790,2,13,'2021-05-20 09:57:07','2021-05-20 10:00:00'),(791,2,18,'2021-05-20 10:00:00','2021-05-20 12:14:40'),(792,2,13,'2021-05-20 12:14:40','2021-05-20 12:15:43'),(793,2,8,'2021-05-20 12:15:43','2021-05-20 12:20:43'),(794,2,94,'2021-05-20 12:20:43','2021-05-20 17:00:43'),(795,2,8,'2021-05-20 17:00:43','2021-05-20 17:04:43'),(796,2,13,'2021-05-20 17:04:43','2021-05-20 17:05:05'),(797,2,23,'2021-05-20 17:05:05','2021-05-20 22:15:02'),(798,2,13,'2021-05-20 22:15:02','2021-05-20 22:20:02'),(799,2,8,'2021-05-20 22:20:02','2021-05-20 22:21:03'),(800,2,94,'2021-05-20 22:21:03','2021-05-21 08:55:43'),(801,2,8,'2021-05-21 08:55:43','2021-05-21 08:59:43'),(802,2,13,'2021-05-21 08:59:43','2021-05-21 09:00:09'),(803,2,39,'2021-05-21 09:00:09','2021-05-21 09:45:09'),(804,2,26,'2021-05-21 09:45:09','2021-05-21 09:50:00'),(805,2,13,'2021-05-21 09:50:00','2021-05-21 09:51:00'),(806,2,8,'2021-05-21 09:51:00','2021-05-21 09:56:07'),(807,2,94,'2021-05-21 09:56:07','2021-05-21 09:56:07'),(808,2,8,'2021-05-21 09:56:07','2021-05-21 09:57:07'),(809,2,13,'2021-05-21 09:57:07','2021-05-21 10:00:00'),(810,2,18,'2021-05-21 10:00:00','2021-05-21 12:14:40'),(811,2,13,'2021-05-21 12:14:40','2021-05-21 12:15:43'),(812,2,8,'2021-05-21 12:15:43','2021-05-21 12:20:43'),(813,2,94,'2021-05-21 12:20:43','2021-05-21 17:00:43'),(814,2,8,'2021-05-21 17:00:43','2021-05-21 17:04:43'),(815,2,13,'2021-05-21 17:04:43','2021-05-21 17:05:05'),(816,2,39,'2021-05-21 17:05:05','2021-05-21 22:15:02'),(817,2,13,'2021-05-21 22:15:02','2021-05-21 22:20:02'),(818,2,8,'2021-05-21 22:20:02','2021-05-21 22:21:03'),(819,2,94,'2021-05-21 22:21:03','2021-05-22 08:55:43'),(820,3,26,'2021-05-17 06:30:00','2021-05-17 08:45:00'),(821,3,13,'2021-05-17 08:45:00','2021-05-17 08:47:05'),(822,3,8,'2021-05-17 08:47:05','2021-05-17 08:48:57'),(823,3,94,'2021-05-17 08:48:57','2021-05-17 08:48:57'),(824,3,8,'2021-05-17 08:48:57','2021-05-17 08:50:57'),(825,3,13,'2021-05-17 08:50:57','2021-05-17 08:55:43'),(826,3,26,'2021-05-17 08:55:43','2021-05-17 08:58:47'),(827,3,13,'2021-05-17 08:58:47','2021-05-17 09:00:04'),(828,3,8,'2021-05-17 09:00:04','2021-05-17 09:02:51'),(829,3,94,'2021-05-17 09:02:51','2021-05-17 10:04:23'),(830,3,8,'2021-05-17 10:04:23','2021-05-17 10:05:24'),(831,3,13,'2021-05-17 10:05:24','2021-05-17 10:06:26'),(832,3,18,'2021-05-17 10:06:26','2021-05-17 11:03:01'),(833,3,13,'2021-05-17 11:03:01','2021-05-17 11:04:21'),(834,3,8,'2021-05-17 11:04:21','2021-05-17 11:05:53'),(835,3,94,'2021-05-17 11:05:53','2021-05-17 15:05:03'),(836,3,8,'2021-05-17 15:05:03','2021-05-17 15:07:08'),(837,3,14,'2021-05-17 15:07:08','2021-05-17 15:09:03'),(838,3,51,'2021-05-17 15:09:03','2021-05-17 17:19:03'),(839,3,14,'2021-05-17 17:19:03','2021-05-17 17:20:05'),(840,3,8,'2021-05-17 17:20:05','2021-05-17 17:29:15'),(841,3,94,'2021-05-17 17:29:15','2021-05-17 08:48:57'),(842,3,8,'2021-05-18 08:48:57','2021-05-18 08:50:57'),(843,3,14,'2021-05-18 08:50:57','2021-05-18 08:55:43'),(844,3,26,'2021-05-18 08:55:43','2021-05-18 08:58:47'),(845,3,14,'2021-05-18 08:58:47','2021-05-18 09:00:04'),(846,3,8,'2021-05-18 09:00:04','2021-05-18 09:02:51'),(847,3,94,'2021-05-18 09:02:51','2021-05-18 10:04:23'),(848,3,8,'2021-05-18 10:04:23','2021-05-18 10:05:24'),(849,3,13,'2021-05-18 10:05:24','2021-05-18 10:06:26'),(850,3,18,'2021-05-18 10:06:26','2021-05-18 11:03:01'),(851,3,13,'2021-05-18 11:03:01','2021-05-18 11:04:21'),(852,3,8,'2021-05-18 11:04:21','2021-05-18 11:05:53'),(853,3,94,'2021-05-18 11:05:53','2021-05-18 15:05:03'),(854,3,8,'2021-05-18 15:05:03','2021-05-18 15:07:08'),(855,3,14,'2021-05-18 15:07:08','2021-05-18 15:09:03'),(856,3,23,'2021-05-18 15:09:03','2021-05-18 17:19:03'),(857,3,14,'2021-05-18 17:19:03','2021-05-18 17:20:05'),(858,3,8,'2021-05-18 17:20:05','2021-05-18 17:29:15'),(859,3,94,'2021-05-18 17:29:15','2021-05-18 08:48:57'),(860,3,8,'2021-05-19 08:48:57','2021-05-19 08:50:57'),(861,3,13,'2021-05-19 08:50:57','2021-05-19 08:55:43'),(862,3,26,'2021-05-19 08:55:43','2021-05-19 08:58:47'),(863,3,13,'2021-05-19 08:58:47','2021-05-19 09:00:04'),(864,3,8,'2021-05-19 09:00:04','2021-05-19 09:02:51'),(865,3,94,'2021-05-19 09:02:51','2021-05-19 10:04:23'),(866,3,8,'2021-05-19 10:04:23','2021-05-19 10:05:24'),(867,3,14,'2021-05-19 10:05:24','2021-05-19 10:06:26'),(868,3,18,'2021-05-19 10:06:26','2021-05-19 11:03:01'),(869,3,14,'2021-05-19 11:03:01','2021-05-19 11:04:21'),(870,3,8,'2021-05-19 11:04:21','2021-05-19 11:05:53'),(871,3,94,'2021-05-19 11:05:53','2021-05-19 15:05:03'),(872,3,8,'2021-05-19 15:05:03','2021-05-19 15:07:08'),(873,3,13,'2021-05-19 15:07:08','2021-05-19 15:09:03'),(874,3,23,'2021-05-19 15:09:03','2021-05-19 17:19:03'),(875,3,13,'2021-05-19 17:19:03','2021-05-19 17:20:05'),(876,3,8,'2021-05-19 17:20:05','2021-05-19 17:29:15'),(877,3,94,'2021-05-19 17:29:15','2021-05-19 08:48:57'),(878,3,8,'2021-05-20 08:48:57','2021-05-20 08:50:57'),(879,3,14,'2021-05-20 08:50:57','2021-05-20 08:55:43'),(880,3,26,'2021-05-20 08:55:43','2021-05-20 08:58:47'),(881,3,14,'2021-05-20 08:58:47','2021-05-20 09:00:04'),(882,3,8,'2021-05-20 09:00:04','2021-05-20 09:02:51'),(883,3,94,'2021-05-20 09:02:51','2021-05-20 10:04:23'),(884,3,8,'2021-05-20 10:04:23','2021-05-20 10:05:24'),(885,3,13,'2021-05-20 10:05:24','2021-05-20 10:06:26'),(886,3,18,'2021-05-20 10:06:26','2021-05-20 11:03:01'),(887,3,13,'2021-05-20 11:03:01','2021-05-20 11:04:21'),(888,3,8,'2021-05-20 11:04:21','2021-05-20 11:05:53'),(889,3,94,'2021-05-20 11:05:53','2021-05-20 15:05:03'),(890,3,8,'2021-05-20 15:05:03','2021-05-20 15:07:08'),(891,3,14,'2021-05-20 15:07:08','2021-05-20 15:09:03'),(892,3,23,'2021-05-20 15:09:03','2021-05-20 17:19:03'),(893,3,14,'2021-05-20 17:19:03','2021-05-20 17:20:05'),(894,3,8,'2021-05-20 17:20:05','2021-05-20 17:29:15'),(895,3,94,'2021-05-20 17:29:15','2021-05-20 08:48:57'),(896,3,8,'2021-05-21 08:48:57','2021-05-21 08:50:57'),(897,3,13,'2021-05-21 08:50:57','2021-05-21 08:55:43'),(898,3,26,'2021-05-21 08:55:43','2021-05-21 08:58:47'),(899,3,13,'2021-05-21 08:58:47','2021-05-21 09:00:04'),(900,3,8,'2021-05-21 09:00:04','2021-05-21 09:02:51'),(901,3,94,'2021-05-21 09:02:51','2021-05-21 10:04:23'),(902,3,8,'2021-05-21 10:04:23','2021-05-21 10:05:24'),(903,3,14,'2021-05-21 10:05:24','2021-05-21 10:06:26'),(904,3,18,'2021-05-21 10:06:26','2021-05-21 11:03:01'),(905,3,14,'2021-05-21 11:03:01','2021-05-21 11:04:21'),(906,3,8,'2021-05-21 11:04:21','2021-05-21 11:05:53'),(907,3,94,'2021-05-21 11:05:53','2021-05-21 15:05:03'),(908,3,8,'2021-05-21 15:05:03','2021-05-21 15:07:08'),(909,3,13,'2021-05-21 15:07:08','2021-05-21 15:09:03'),(910,3,23,'2021-05-21 15:09:03','2021-05-21 17:19:03'),(911,3,13,'2021-05-21 17:19:03','2021-05-21 17:20:05'),(912,3,8,'2021-05-21 17:20:05','2021-05-21 17:29:15'),(913,3,94,'2021-05-21 17:29:15','2021-05-21 08:48:57'),(914,3,8,'2021-05-22 08:48:57','2021-05-22 08:50:57'),(915,3,14,'2021-05-22 08:50:57','2021-05-22 08:55:43'),(916,3,26,'2021-05-22 08:55:43','2021-05-22 08:58:47'),(917,3,14,'2021-05-22 08:58:47','2021-05-22 09:00:04'),(918,3,8,'2021-05-22 09:00:04','2021-05-22 09:02:51'),(919,3,94,'2021-05-22 09:02:51','2021-05-22 10:04:23'),(920,3,8,'2021-05-22 10:04:23','2021-05-22 10:05:24'),(921,3,13,'2021-05-22 10:05:24','2021-05-22 10:06:26'),(922,3,18,'2021-05-22 10:06:26','2021-05-22 11:03:01'),(923,3,13,'2021-05-22 11:03:01','2021-05-22 11:04:21'),(924,3,8,'2021-05-22 11:04:21','2021-05-22 11:05:53'),(925,3,94,'2021-05-22 11:05:53','2021-05-22 15:05:03'),(926,3,8,'2021-05-22 15:05:03','2021-05-22 15:07:08'),(927,3,14,'2021-05-22 15:07:08','2021-05-22 15:09:03'),(928,3,23,'2021-05-22 15:09:03','2021-05-22 17:19:03'),(929,3,14,'2021-05-22 17:19:03','2021-05-22 17:20:05'),(930,3,8,'2021-05-22 17:20:05','2021-05-22 17:29:15'),(931,3,94,'2021-05-22 17:29:15','2021-05-22 08:48:57'),(932,4,26,'2021-05-17 07:05:00','2021-05-17 07:11:03'),(933,4,15,'2021-05-17 07:11:03','2021-05-17 07:13:04'),(934,4,8,'2021-05-17 07:13:04','2021-05-17 07:15:00'),(935,4,94,'2021-05-17 07:15:00','2021-05-17 08:15:00'),(936,4,8,'2021-05-17 08:15:00','2021-05-17 08:17:00'),(937,4,15,'2021-05-17 08:17:00','2021-05-17 08:17:55'),(938,4,26,'2021-05-17 08:17:55','2021-05-17 08:21:42'),(939,4,15,'2021-05-17 08:21:42','2021-05-17 08:23:04'),(940,4,8,'2021-05-17 08:23:04','2021-05-17 08:25:00'),(941,4,94,'2021-05-17 08:25:00','2021-05-17 09:50:00'),(942,4,8,'2021-05-17 09:50:00','2021-05-17 09:53:10'),(943,4,15,'2021-05-17 09:53:10','2021-05-17 09:54:13'),(944,4,16,'2021-05-17 09:54:13','2021-05-17 13:30:13'),(945,4,15,'2021-05-17 13:30:13','2021-05-17 13:35:25'),(946,4,8,'2021-05-17 13:35:25','2021-05-17 13:37:48'),(947,4,94,'2021-05-17 13:37:48','2021-05-17 16:34:59'),(948,4,8,'2021-05-17 16:34:59','2021-05-17 16:38:13'),(949,4,15,'2021-05-17 16:38:13','2021-05-17 16:41:14'),(950,4,51,'2021-05-17 16:41:14','2021-05-17 18:03:14'),(951,4,15,'2021-05-17 18:03:14','2021-05-17 18:05:16'),(952,4,8,'2021-05-17 18:05:16','2021-05-17 18:09:35'),(953,4,94,'2021-05-17 18:09:35','2021-05-17 20:19:11'),(954,4,8,'2021-05-17 20:19:11','2021-05-17 20:20:21'),(955,4,15,'2021-05-17 20:20:21','2021-05-17 20:21:25'),(956,4,25,'2021-05-17 20:21:25','2021-05-18 00:10:25'),(957,4,15,'2021-05-18 00:10:25','2021-05-18 00:11:25'),(958,4,8,'2021-05-18 00:11:25','2021-05-18 00:12:27'),(959,4,94,'2021-05-18 00:12:27','2021-05-18 08:15:00'),(960,4,8,'2021-05-18 08:15:00','2021-05-18 08:17:00'),(961,4,15,'2021-05-18 08:17:00','2021-05-18 08:17:55'),(962,4,26,'2021-05-18 08:17:55','2021-05-18 08:21:42'),(963,4,15,'2021-05-18 08:21:42','2021-05-18 08:23:04'),(964,4,8,'2021-05-18 08:23:04','2021-05-18 08:25:00'),(965,4,94,'2021-05-18 08:25:00','2021-05-18 09:50:00'),(966,4,8,'2021-05-18 09:50:00','2021-05-18 09:53:10'),(967,4,15,'2021-05-18 09:53:10','2021-05-18 09:54:13'),(968,4,16,'2021-05-18 09:54:13','2021-05-18 13:30:13'),(969,4,15,'2021-05-18 13:30:13','2021-05-18 13:35:25'),(970,4,8,'2021-05-18 13:35:25','2021-05-18 13:37:48'),(971,4,94,'2021-05-18 13:37:48','2021-05-18 16:34:59'),(972,4,8,'2021-05-18 16:34:59','2021-05-18 16:38:13'),(973,4,15,'2021-05-18 16:38:13','2021-05-18 16:41:14'),(974,4,42,'2021-05-18 16:41:14','2021-05-18 18:03:14'),(975,4,15,'2021-05-18 18:03:14','2021-05-18 18:05:16'),(976,4,8,'2021-05-18 18:05:16','2021-05-18 18:09:35'),(977,4,94,'2021-05-18 18:09:35','2021-05-18 20:19:11'),(978,4,8,'2021-05-18 20:19:11','2021-05-18 20:20:21'),(979,4,15,'2021-05-18 20:20:21','2021-05-18 20:21:25'),(980,4,25,'2021-05-18 20:21:25','2021-05-19 00:10:25'),(981,4,15,'2021-05-19 00:10:25','2021-05-19 00:11:25'),(982,4,8,'2021-05-19 00:11:25','2021-05-19 00:12:27'),(983,4,94,'2021-05-19 00:12:27','2021-05-19 08:15:00'),(984,4,8,'2021-05-19 08:15:00','2021-05-19 08:17:00'),(985,4,15,'2021-05-19 08:17:00','2021-05-19 08:17:55'),(986,4,26,'2021-05-19 08:17:55','2021-05-19 08:21:42'),(987,4,15,'2021-05-19 08:21:42','2021-05-19 08:23:04'),(988,4,8,'2021-05-19 08:23:04','2021-05-19 08:25:00'),(989,4,94,'2021-05-19 08:25:00','2021-05-19 09:50:00'),(990,4,8,'2021-05-19 09:50:00','2021-05-19 09:53:10'),(991,4,15,'2021-05-19 09:53:10','2021-05-19 09:54:13'),(992,4,16,'2021-05-19 09:54:13','2021-05-19 13:30:13'),(993,4,15,'2021-05-19 13:30:13','2021-05-19 13:35:25'),(994,4,8,'2021-05-19 13:35:25','2021-05-19 13:37:48'),(995,4,94,'2021-05-19 13:37:48','2021-05-19 16:34:59'),(996,4,8,'2021-05-19 16:34:59','2021-05-19 16:38:13'),(997,4,15,'2021-05-19 16:38:13','2021-05-19 16:41:14'),(998,4,42,'2021-05-19 16:41:14','2021-05-19 18:03:14'),(999,4,15,'2021-05-19 18:03:14','2021-05-19 18:05:16'),(1000,4,8,'2021-05-19 18:05:16','2021-05-19 18:09:35'),(1001,4,94,'2021-05-19 18:09:35','2021-05-19 20:19:11'),(1002,4,8,'2021-05-19 20:19:11','2021-05-19 20:20:21'),(1003,4,15,'2021-05-19 20:20:21','2021-05-19 20:21:25'),(1004,4,25,'2021-05-19 20:21:25','2021-05-20 00:10:25'),(1005,4,15,'2021-05-20 00:10:25','2021-05-20 00:11:25'),(1006,4,8,'2021-05-20 00:11:25','2021-05-20 00:12:27'),(1007,4,94,'2021-05-20 00:12:27','2021-05-20 08:15:00'),(1008,4,8,'2021-05-20 08:15:00','2021-05-20 08:17:00'),(1009,4,15,'2021-05-20 08:17:00','2021-05-20 08:17:55'),(1010,4,26,'2021-05-20 08:17:55','2021-05-20 08:21:42'),(1011,4,15,'2021-05-20 08:21:42','2021-05-20 08:23:04'),(1012,4,8,'2021-05-20 08:23:04','2021-05-20 08:25:00'),(1013,4,94,'2021-05-20 08:25:00','2021-05-20 09:50:00'),(1014,4,8,'2021-05-20 09:50:00','2021-05-20 09:53:10'),(1015,4,15,'2021-05-20 09:53:10','2021-05-20 09:54:13'),(1016,4,16,'2021-05-20 09:54:13','2021-05-20 13:30:13'),(1017,4,15,'2021-05-20 13:30:13','2021-05-20 13:35:25'),(1018,4,8,'2021-05-20 13:35:25','2021-05-20 13:37:48'),(1019,4,94,'2021-05-20 13:37:48','2021-05-20 16:34:59'),(1020,4,8,'2021-05-20 16:34:59','2021-05-20 16:38:13'),(1021,4,15,'2021-05-20 16:38:13','2021-05-20 16:41:14'),(1022,4,42,'2021-05-20 16:41:14','2021-05-20 18:03:14'),(1023,4,15,'2021-05-20 18:03:14','2021-05-20 18:05:16'),(1024,4,8,'2021-05-20 18:05:16','2021-05-20 18:09:35'),(1025,4,94,'2021-05-20 18:09:35','2021-05-20 20:19:11'),(1026,4,8,'2021-05-20 20:19:11','2021-05-20 20:20:21'),(1027,4,15,'2021-05-20 20:20:21','2021-05-20 20:21:25'),(1028,4,25,'2021-05-20 20:21:25','2021-05-21 00:10:25'),(1029,4,15,'2021-05-21 00:10:25','2021-05-21 00:11:25'),(1030,4,8,'2021-05-21 00:11:25','2021-05-21 00:12:27'),(1031,4,94,'2021-05-21 00:12:27','2021-05-21 08:15:00'),(1032,4,8,'2021-05-21 08:15:00','2021-05-21 08:17:00'),(1033,4,15,'2021-05-21 08:17:00','2021-05-21 08:17:55'),(1034,4,26,'2021-05-21 08:17:55','2021-05-21 08:21:42'),(1035,4,15,'2021-05-21 08:21:42','2021-05-21 08:23:04'),(1036,4,8,'2021-05-21 08:23:04','2021-05-21 08:25:00'),(1037,4,94,'2021-05-21 08:25:00','2021-05-21 09:50:00'),(1038,4,8,'2021-05-21 09:50:00','2021-05-21 09:53:10'),(1039,4,15,'2021-05-21 09:53:10','2021-05-21 09:54:13'),(1040,4,16,'2021-05-21 09:54:13','2021-05-21 13:30:13'),(1041,4,15,'2021-05-21 13:30:13','2021-05-21 13:35:25'),(1042,4,8,'2021-05-21 13:35:25','2021-05-21 13:37:48'),(1043,4,94,'2021-05-21 13:37:48','2021-05-21 16:34:59'),(1044,4,8,'2021-05-21 16:34:59','2021-05-21 16:38:13'),(1045,4,15,'2021-05-21 16:38:13','2021-05-21 16:41:14'),(1046,4,42,'2021-05-21 16:41:14','2021-05-21 18:03:14'),(1047,4,15,'2021-05-21 18:03:14','2021-05-21 18:05:16'),(1048,4,8,'2021-05-21 18:05:16','2021-05-21 18:09:35'),(1049,4,94,'2021-05-21 18:09:35','2021-05-21 20:19:11'),(1050,4,8,'2021-05-21 20:19:11','2021-05-21 20:20:21'),(1051,4,15,'2021-05-21 20:20:21','2021-05-21 20:21:25'),(1052,4,25,'2021-05-21 20:21:25','2021-05-22 00:10:25'),(1053,4,15,'2021-05-22 00:10:25','2021-05-22 00:11:25'),(1054,4,8,'2021-05-22 00:11:25','2021-05-22 00:12:27'),(1055,4,94,'2021-05-22 00:12:27','2021-05-22 08:15:00'),(1056,5,26,'2021-05-17 07:21:00','2021-05-17 07:40:00'),(1057,5,13,'2021-05-17 07:40:00','2021-05-17 07:43:49'),(1058,5,8,'2021-05-17 07:43:49','2021-05-17 07:45:59'),(1059,5,66,'2021-05-17 07:45:59','2021-05-17 07:58:12'),(1060,5,8,'2021-05-17 07:58:12','2021-05-17 08:03:03'),(1061,5,13,'2021-05-17 08:03:03','2021-05-17 08:05:09'),(1062,5,27,'2021-05-17 08:05:09','2021-05-17 10:07:09'),(1063,5,26,'2021-05-17 10:07:09','2021-05-17 10:20:16'),(1064,5,16,'2021-05-17 10:20:16','2021-05-17 12:30:16'),(1065,5,13,'2021-05-17 12:30:16','2021-05-17 12:33:16'),(1066,5,8,'2021-05-17 12:33:16','2021-05-17 12:36:01'),(1067,5,66,'2021-05-17 12:36:01','2021-05-17 17:10:01'),(1068,5,8,'2021-05-17 17:10:01','2021-05-17 17:14:06'),(1069,5,13,'2021-05-17 17:14:06','2021-05-17 17:16:26'),(1070,5,20,'2021-05-17 17:16:26','2021-05-17 20:49:26'),(1071,5,13,'2021-05-17 20:49:26','2021-05-17 20:55:14'),(1072,5,8,'2021-05-17 20:55:14','2021-05-17 20:59:00'),(1073,5,66,'2021-05-17 20:59:00','2021-05-17 07:58:12'),(1074,5,8,'2021-05-18 07:58:12','2021-05-18 08:03:03'),(1075,5,13,'2021-05-18 08:03:03','2021-05-18 08:05:09'),(1076,5,37,'2021-05-18 08:05:09','2021-05-18 10:07:09'),(1077,5,26,'2021-05-18 10:07:09','2021-05-18 10:20:16'),(1078,5,16,'2021-05-18 10:20:16','2021-05-18 12:30:16'),(1079,5,13,'2021-05-18 12:30:16','2021-05-18 12:33:16'),(1080,5,8,'2021-05-18 12:33:16','2021-05-18 12:36:01'),(1081,5,66,'2021-05-18 12:36:01','2021-05-18 17:10:01'),(1082,5,8,'2021-05-18 17:10:01','2021-05-18 17:14:06'),(1083,5,13,'2021-05-18 17:14:06','2021-05-18 17:16:26'),(1084,5,20,'2021-05-18 17:16:26','2021-05-18 20:49:26'),(1085,5,13,'2021-05-18 20:49:26','2021-05-18 20:55:14'),(1086,5,8,'2021-05-18 20:55:14','2021-05-18 20:59:00'),(1087,5,66,'2021-05-18 20:59:00','2021-05-18 07:58:12'),(1088,5,8,'2021-05-19 07:58:12','2021-05-19 08:03:03'),(1089,5,13,'2021-05-19 08:03:03','2021-05-19 08:05:09'),(1090,5,27,'2021-05-19 08:05:09','2021-05-19 10:07:09'),(1091,5,26,'2021-05-19 10:07:09','2021-05-19 10:20:16'),(1092,5,16,'2021-05-19 10:20:16','2021-05-19 12:30:16'),(1093,5,13,'2021-05-19 12:30:16','2021-05-19 12:33:16'),(1094,5,8,'2021-05-19 12:33:16','2021-05-19 12:36:01'),(1095,5,66,'2021-05-19 12:36:01','2021-05-19 17:10:01'),(1096,5,8,'2021-05-19 17:10:01','2021-05-19 17:14:06'),(1097,5,13,'2021-05-19 17:14:06','2021-05-19 17:16:26'),(1098,5,20,'2021-05-19 17:16:26','2021-05-19 20:49:26'),(1099,5,13,'2021-05-19 20:49:26','2021-05-19 20:55:14'),(1100,5,8,'2021-05-19 20:55:14','2021-05-19 20:59:00'),(1101,5,66,'2021-05-19 20:59:00','2021-05-19 07:58:12'),(1102,5,8,'2021-05-20 07:58:12','2021-05-20 08:03:03'),(1103,5,13,'2021-05-20 08:03:03','2021-05-20 08:05:09'),(1104,5,37,'2021-05-20 08:05:09','2021-05-20 10:07:09'),(1105,5,26,'2021-05-20 10:07:09','2021-05-20 10:20:16'),(1106,5,16,'2021-05-20 10:20:16','2021-05-20 12:30:16'),(1107,5,13,'2021-05-20 12:30:16','2021-05-20 12:33:16'),(1108,5,8,'2021-05-20 12:33:16','2021-05-20 12:36:01'),(1109,5,66,'2021-05-20 12:36:01','2021-05-20 17:10:01'),(1110,5,8,'2021-05-20 17:10:01','2021-05-20 17:14:06'),(1111,5,13,'2021-05-20 17:14:06','2021-05-20 17:16:26'),(1112,5,20,'2021-05-20 17:16:26','2021-05-20 20:49:26'),(1113,5,13,'2021-05-20 20:49:26','2021-05-20 20:55:14'),(1114,5,8,'2021-05-20 20:55:14','2021-05-20 20:59:00'),(1115,5,66,'2021-05-20 20:59:00','2021-05-20 07:58:12'),(1116,5,8,'2021-05-21 07:58:12','2021-05-21 08:03:03'),(1117,5,13,'2021-05-21 08:03:03','2021-05-21 08:05:09'),(1118,5,27,'2021-05-21 08:05:09','2021-05-21 10:07:09'),(1119,5,26,'2021-05-21 10:07:09','2021-05-21 10:20:16'),(1120,5,16,'2021-05-21 10:20:16','2021-05-21 12:30:16'),(1121,5,13,'2021-05-21 12:30:16','2021-05-21 12:33:16'),(1122,5,8,'2021-05-21 12:33:16','2021-05-21 12:36:01'),(1123,5,66,'2021-05-21 12:36:01','2021-05-21 17:10:01'),(1124,5,8,'2021-05-21 17:10:01','2021-05-21 17:14:06'),(1125,5,13,'2021-05-21 17:14:06','2021-05-21 17:16:26'),(1126,5,20,'2021-05-21 17:16:26','2021-05-21 20:49:26'),(1127,5,13,'2021-05-21 20:49:26','2021-05-21 20:55:14'),(1128,5,8,'2021-05-21 20:55:14','2021-05-21 20:59:00'),(1129,5,66,'2021-05-21 20:59:00','2021-05-21 07:58:12'),(1130,5,8,'2021-05-22 07:58:12','2021-05-22 08:03:03'),(1131,5,13,'2021-05-22 08:03:03','2021-05-22 08:05:09'),(1132,5,37,'2021-05-22 08:05:09','2021-05-22 10:07:09'),(1133,5,26,'2021-05-22 10:07:09','2021-05-22 10:20:16'),(1134,5,16,'2021-05-22 10:20:16','2021-05-22 12:30:16'),(1135,5,13,'2021-05-22 12:30:16','2021-05-22 12:33:16'),(1136,5,8,'2021-05-22 12:33:16','2021-05-22 12:36:01'),(1137,5,66,'2021-05-22 12:36:01','2021-05-22 17:10:01'),(1138,5,8,'2021-05-22 17:10:01','2021-05-22 17:14:06'),(1139,5,13,'2021-05-22 17:14:06','2021-05-22 17:16:26'),(1140,5,20,'2021-05-22 17:16:26','2021-05-22 20:49:26'),(1141,5,13,'2021-05-22 20:49:26','2021-05-22 20:55:14'),(1142,5,8,'2021-05-22 20:55:14','2021-05-22 20:59:00'),(1143,5,66,'2021-05-22 20:59:00','2021-05-22 07:58:12'),(1144,9,26,'2021-05-17 07:21:00','2021-05-17 08:00:05'),(1145,9,13,'2021-05-17 08:00:05','2021-05-17 08:02:13'),(1146,9,10,'2021-05-17 08:02:13','2021-05-17 08:04:15'),(1147,9,52,'2021-05-17 08:04:15','2021-05-17 08:30:01'),(1148,9,10,'2021-05-17 08:30:01','2021-05-17 08:32:09'),(1149,9,13,'2021-05-17 08:32:09','2021-05-17 08:36:14'),(1150,9,42,'2021-05-17 08:36:14','2021-05-17 09:30:12'),(1151,9,26,'2021-05-17 09:30:12','2021-05-17 09:32:21'),(1152,9,13,'2021-05-17 09:32:21','2021-05-17 09:33:21'),(1153,9,10,'2021-05-17 09:33:21','2021-05-17 09:36:32'),(1154,9,52,'2021-05-17 09:36:32','2021-05-17 10:11:11'),(1155,9,10,'2021-05-17 10:11:11','2021-05-17 10:13:10'),(1156,9,13,'2021-05-17 10:13:10','2021-05-17 10:15:04'),(1157,9,16,'2021-05-17 10:15:04','2021-05-17 13:12:04'),(1158,9,13,'2021-05-17 13:12:04','2021-05-17 13:14:02'),(1159,9,10,'2021-05-17 13:14:02','2021-05-17 13:15:04'),(1160,9,52,'2021-05-17 13:15:04','2021-05-17 17:15:04'),(1161,9,10,'2021-05-17 17:15:04','2021-05-17 17:16:00'),(1162,9,13,'2021-05-17 17:16:00','2021-05-17 17:17:02'),(1163,9,20,'2021-05-17 17:17:02','2021-05-17 21:15:02'),(1164,9,13,'2021-05-17 21:15:02','2021-05-17 21:16:04'),(1165,9,10,'2021-05-17 21:16:04','2021-05-17 21:17:29'),(1166,9,52,'2021-05-17 21:17:29','2021-05-18 08:30:01'),(1167,9,10,'2021-05-18 08:30:01','2021-05-18 08:32:09'),(1168,9,13,'2021-05-18 08:32:09','2021-05-18 08:36:14'),(1169,9,42,'2021-05-18 08:36:14','2021-05-18 09:30:12'),(1170,9,26,'2021-05-18 09:30:12','2021-05-18 09:32:21'),(1171,9,13,'2021-05-18 09:32:21','2021-05-18 09:33:21'),(1172,9,10,'2021-05-18 09:33:21','2021-05-18 09:36:32'),(1173,9,52,'2021-05-18 09:36:32','2021-05-18 10:11:11'),(1174,9,10,'2021-05-18 10:11:11','2021-05-18 10:13:10'),(1175,9,13,'2021-05-18 10:13:10','2021-05-18 10:15:04'),(1176,9,16,'2021-05-18 10:15:04','2021-05-18 13:12:04'),(1177,9,13,'2021-05-18 13:12:04','2021-05-18 13:14:02'),(1178,9,10,'2021-05-18 13:14:02','2021-05-18 13:15:04'),(1179,9,52,'2021-05-18 13:15:04','2021-05-18 17:15:04'),(1180,9,10,'2021-05-18 17:15:04','2021-05-18 17:16:00'),(1181,9,13,'2021-05-18 17:16:00','2021-05-18 17:17:02'),(1182,9,20,'2021-05-18 17:17:02','2021-05-18 21:15:02'),(1183,9,13,'2021-05-18 21:15:02','2021-05-18 21:16:04'),(1184,9,10,'2021-05-18 21:16:04','2021-05-18 21:17:29'),(1185,9,52,'2021-05-18 21:17:29','2021-05-19 08:30:01'),(1186,9,10,'2021-05-19 08:30:01','2021-05-19 08:32:09'),(1187,9,13,'2021-05-19 08:32:09','2021-05-19 08:36:14'),(1188,9,42,'2021-05-19 08:36:14','2021-05-19 09:30:12'),(1189,9,26,'2021-05-19 09:30:12','2021-05-19 09:32:21'),(1190,9,13,'2021-05-19 09:32:21','2021-05-19 09:33:21'),(1191,9,10,'2021-05-19 09:33:21','2021-05-19 09:36:32'),(1192,9,52,'2021-05-19 09:36:32','2021-05-19 10:11:11'),(1193,9,10,'2021-05-19 10:11:11','2021-05-19 10:13:10'),(1194,9,13,'2021-05-19 10:13:10','2021-05-19 10:15:04'),(1195,9,16,'2021-05-19 10:15:04','2021-05-19 13:12:04'),(1196,9,13,'2021-05-19 13:12:04','2021-05-19 13:14:02'),(1197,9,10,'2021-05-19 13:14:02','2021-05-19 13:15:04'),(1198,9,52,'2021-05-19 13:15:04','2021-05-19 17:15:04'),(1199,9,10,'2021-05-19 17:15:04','2021-05-19 17:16:00'),(1200,9,13,'2021-05-19 17:16:00','2021-05-19 17:17:02'),(1201,9,20,'2021-05-19 17:17:02','2021-05-19 21:15:02'),(1202,9,13,'2021-05-19 21:15:02','2021-05-19 21:16:04'),(1203,9,10,'2021-05-19 21:16:04','2021-05-19 21:17:29'),(1204,9,52,'2021-05-19 21:17:29','2021-05-20 08:30:01'),(1205,9,10,'2021-05-20 08:30:01','2021-05-20 08:32:09'),(1206,9,13,'2021-05-20 08:32:09','2021-05-20 08:36:14'),(1207,9,42,'2021-05-20 08:36:14','2021-05-20 09:30:12'),(1208,9,26,'2021-05-20 09:30:12','2021-05-20 09:32:21'),(1209,9,13,'2021-05-20 09:32:21','2021-05-20 09:33:21'),(1210,9,10,'2021-05-20 09:33:21','2021-05-20 09:36:32'),(1211,9,52,'2021-05-20 09:36:32','2021-05-20 10:11:11'),(1212,9,10,'2021-05-20 10:11:11','2021-05-20 10:13:10'),(1213,9,13,'2021-05-20 10:13:10','2021-05-20 10:15:04'),(1214,9,16,'2021-05-20 10:15:04','2021-05-20 13:12:04'),(1215,9,13,'2021-05-20 13:12:04','2021-05-20 13:14:02'),(1216,9,10,'2021-05-20 13:14:02','2021-05-20 13:15:04'),(1217,9,52,'2021-05-20 13:15:04','2021-05-20 17:15:04'),(1218,9,10,'2021-05-20 17:15:04','2021-05-20 17:16:00'),(1219,9,13,'2021-05-20 17:16:00','2021-05-20 17:17:02'),(1220,9,20,'2021-05-20 17:17:02','2021-05-20 21:15:02'),(1221,9,13,'2021-05-20 21:15:02','2021-05-20 21:16:04'),(1222,9,10,'2021-05-20 21:16:04','2021-05-20 21:17:29'),(1223,9,52,'2021-05-20 21:17:29','2021-05-21 08:30:01'),(1224,9,10,'2021-05-21 08:30:01','2021-05-21 08:32:09'),(1225,9,13,'2021-05-21 08:32:09','2021-05-21 08:36:14'),(1226,9,42,'2021-05-21 08:36:14','2021-05-21 09:30:12'),(1227,9,26,'2021-05-21 09:30:12','2021-05-21 09:32:21'),(1228,9,13,'2021-05-21 09:32:21','2021-05-21 09:33:21'),(1229,9,10,'2021-05-21 09:33:21','2021-05-21 09:36:32'),(1230,9,52,'2021-05-21 09:36:32','2021-05-21 10:11:11'),(1231,9,10,'2021-05-21 10:11:11','2021-05-21 10:13:10'),(1232,9,13,'2021-05-21 10:13:10','2021-05-21 10:15:04'),(1233,9,16,'2021-05-21 10:15:04','2021-05-21 13:12:04'),(1234,9,13,'2021-05-21 13:12:04','2021-05-21 13:14:02'),(1235,9,10,'2021-05-21 13:14:02','2021-05-21 13:15:04'),(1236,9,52,'2021-05-21 13:15:04','2021-05-21 17:15:04'),(1237,9,10,'2021-05-21 17:15:04','2021-05-21 17:16:00'),(1238,9,13,'2021-05-21 17:16:00','2021-05-21 17:17:02'),(1239,9,20,'2021-05-21 17:17:02','2021-05-21 21:15:02'),(1240,9,13,'2021-05-21 21:15:02','2021-05-21 21:16:04'),(1241,9,10,'2021-05-21 21:16:04','2021-05-21 21:17:29'),(1242,9,52,'2021-05-21 21:17:29','2021-05-22 08:30:01');
/*!40000 ALTER TABLE `visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_charges`
--

/*!50001 DROP TABLE IF EXISTS `customer_charges`*/;
/*!50001 DROP VIEW IF EXISTS `customer_charges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_charges` AS (select `c`.`nfc_id` AS `nfc_id`,`e`.`enroll_date_time` AS `date`,'SERVICE ENROLL' AS `type`,`r`.`enroll_price` AS `charge`,`r`.`service_type` AS `description` from ((`customers` `c` join `enroll_in` `e` on(`c`.`nfc_id` = `e`.`customer_id`)) join `register_services` `r` on(`e`.`service_id` = `r`.`service_id`)) where `e`.`service_id` <> 2) union (select `c`.`nfc_id` AS `nfc_id`,`u`.`use_date_time` AS `date`,replace(concat(`s`.`service_type`,' BILL'),'_',' ') AS `type`,`u`.`charge_amount` AS `charge`,`u`.`description` AS `description` from ((`customers` `c` join `use_charge_log` `u` on(`c`.`nfc_id` = `u`.`customer_id`)) join `services` `s` on(`u`.`service_id` = `s`.`service_id`)) where `u`.`service_id` <> 2 and `u`.`paid` = 0) union (select `c`.`nfc_id` AS `nfc_id`,`u`.`use_date_time` AS `date`,'RESERVATION' AS `type`,`u`.`charge_amount` AS `charge`,`u`.`description` AS `description` from ((`customers` `c` join `use_charge_log` `u` on(`c`.`nfc_id` = `u`.`customer_id`)) join `services` `s` on(`u`.`service_id` = `s`.`service_id`)) where `u`.`service_id` = 2 and `u`.`paid` = 0) order by `date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_data`
--

/*!50001 DROP TABLE IF EXISTS `customer_data`*/;
/*!50001 DROP VIEW IF EXISTS `customer_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_data` AS select `c`.`nfc_id` AS `nfc_id`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`c`.`verif_id` AS `verif_id`,`c`.`date_of_birth` AS `birth`,timestampdiff(YEAR,`c`.`date_of_birth`,curdate()) AS `age`,`c`.`gender` AS `gender`,(select `p`.`place_description` from ((`customers` `cu` join `have_access` `h` on(`cu`.`nfc_id` = `h`.`customer_id`)) join `places` `p` on(`h`.`place_id` = `p`.`place_id`)) where `c`.`nfc_id` = `cu`.`nfc_id` and `p`.`offered_service_id` = 2) AS `reserved` from `customers` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customers_age`
--

/*!50001 DROP TABLE IF EXISTS `customers_age`*/;
/*!50001 DROP VIEW IF EXISTS `customers_age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customers_age` AS select `c`.`nfc_id` AS `NFC_ID`,`c`.`first_name` AS `First Name`,`c`.`last_name` AS `Last Name`,timestampdiff(YEAR,`c`.`date_of_birth`,curdate()) AS `Age` from `customers` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-01 20:53:18
