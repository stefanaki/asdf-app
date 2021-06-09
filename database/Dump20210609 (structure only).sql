-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: asdf_db
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`enroll_in_AFTER_INSERT`
AFTER INSERT ON `asdf_db`.`enroll_in`
FOR EACH ROW
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`enroll_in_AFTER_DELETE`
AFTER DELETE ON `asdf_db`.`enroll_in`
FOR EACH ROW
BEGIN
	UPDATE use_charge_log
    SET paid = 1
    WHERE OLD.customer_id = customer_id; 
    
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`have_access_AFTER_INSERT`
AFTER INSERT ON `asdf_db`.`have_access`
FOR EACH ROW
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
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asdf_db`.`services_BEFORE_DELETE`
BEFORE DELETE ON `asdf_db`.`services`
FOR EACH ROW
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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-09  3:48:59
