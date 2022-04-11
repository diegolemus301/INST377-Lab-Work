-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album_genre_info`
--

DROP TABLE IF EXISTS `album_genre_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_genre_info` (
  `album_id` int NOT NULL,
  `genre_id` int NOT NULL,
  KEY `fk_albums_has_genres_genres1_idx` (`genre_id`),
  KEY `fk_albums_has_genres_albums_idx` (`album_id`),
  CONSTRAINT `fk_albums_has_genres_albums` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `fk_albums_has_genres_genres1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_genre_info`
--

LOCK TABLES `album_genre_info` WRITE;
/*!40000 ALTER TABLE `album_genre_info` DISABLE KEYS */;
INSERT INTO `album_genre_info` VALUES (1,1),(2,2),(2,3),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(4,1),(5,1),(6,1),(6,4),(6,5),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,4),(14,1),(14,3),(15,2),(15,3),(15,5),(16,2),(17,2),(18,1),(18,3);
/*!40000 ALTER TABLE `album_genre_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_style_info`
--

DROP TABLE IF EXISTS `album_style_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_style_info` (
  `album_id` int NOT NULL,
  `style_id` int NOT NULL,
  KEY `fk_albums_has_styles_styles1_idx` (`style_id`),
  KEY `fk_albums_has_styles_albums1_idx` (`album_id`),
  CONSTRAINT `fk_albums_has_styles_albums1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `fk_albums_has_styles_styles1` FOREIGN KEY (`style_id`) REFERENCES `styles` (`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_style_info`
--

LOCK TABLES `album_style_info` WRITE;
/*!40000 ALTER TABLE `album_style_info` DISABLE KEYS */;
INSERT INTO `album_style_info` VALUES (1,1),(2,2),(3,1),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(4,1),(4,5),(5,9),(5,10),(6,11),(6,12),(6,13),(7,14),(7,15),(8,16),(8,17),(8,18),(9,18),(9,16),(10,1),(10,7),(11,1),(11,3),(12,23),(12,24),(13,1),(13,4),(14,5),(15,2),(15,5),(15,20),(15,25),(16,5),(16,21),(17,5),(17,21),(17,22),(17,25),(18,1),(18,11),(18,17);
/*!40000 ALTER TABLE `album_style_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(80) NOT NULL,
  `number_of_songs` decimal(3,0) NOT NULL,
  `average_song_length` decimal(5,3) DEFAULT NULL,
  `album_link` blob NOT NULL,
  `album_versions` decimal(4,0) DEFAULT NULL,
  `release_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_albums_releases1_idx` (`release_id`),
  KEY `fk_albums_artists1_idx` (`artist_id`),
  CONSTRAINT `fk_albums_artists1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  CONSTRAINT `fk_albums_releases1` FOREIGN KEY (`release_id`) REFERENCES `releases` (`release_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Year Of The Cat',9,4.183,_binary 'https://www.discogs.com/Al-Stewart-Year-Of-The-Cat/master/90235',148,1,1),(2,'Do They Know It\'s Christmas?',3,4.083,_binary 'https://www.discogs.com/Band-Aid-Do-They-Know-Its-Christmas/master/57277	Phonogram',97,2,2),(3,'Guilty',9,4.633,_binary 'https://www.discogs.com/Barbra-Streisand-Guilty/master/74227',148,3,3),(4,'Spirits Having Flown',10,4.417,_binary 'https://www.discogs.com/Bee-Gees-Spirits-Having-Flown/master/23833',198,4,4),(5,'Rainbow Rising',6,5.500,_binary 'https://www.discogs.com/Blackmores-Rainbow-Rainbow-Rising/master/40614',208,5,5),(6,'Blood, Sweat And Tears',10,4.800,_binary 'https://www.discogs.com/Blood-Sweat-And-Tears-Blood-Sweat-And-Tears/master/35401',129,6,6),(7,'Bon Iver, Bon Iver',10,3.900,_binary 'https://www.discogs.com/Bon-Iver-Bon-Iver-Bon-Iver/master/345153',16,7,7),(8,'Diamond Dogs',11,3.617,_binary 'https://www.discogs.com/Bowie-Diamond-Dogs/master/20141',218,8,8),(9,'Pinups',12,2.833,_binary 'https://www.discogs.com/Bowie-Pinups/master/22208',214,9,8),(10,'The Best Of Bread',15,2.750,_binary 'https://www.discogs.com/Bread-The-Best-Of-Bread/master/85508',150,10,9),(11,'Reckless',10,3.700,_binary 'https://www.discogs.com/Bryan-Adams-Reckless/release/1451593',213,11,10),(12,'Somethin\' Else	',5,6.917,_binary 'https://www.discogs.com/Cannonball-Adderley-Somethin-Else/master/118117',169,12,11),(13,'Tapestry',12,3.733,_binary 'https://www.discogs.com/Carole-King-Tapestry/master/104166',336,13,12),(14,'C\'est Chic',8,5.233,_binary 'https://www.discogs.com/Chic-Cest-Chic/master/53087',86,14,13),(15,'Random Access Memories',13,5.817,_binary 'https://www.discogs.com/Daft-Punk-Random-Access-Memories/master/556257',41,15,14),(16,'Discovery',14,4.233,_binary 'https://www.discogs.com/Daft-Punk-Discovery/master/26647',83,16,14),(17,'Homework',16,4.717,_binary 'https://www.discogs.com/Daft-Punk-Homework/master/26629',66,17,14),(18,'Elvis\' Christmas Album',10,2.317,_binary '	https://www.discogs.com/Elvis-Presley-Elvis-Christmas-Album/master/107538',104,18,15);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(45) NOT NULL,
  `total_artist_albums` decimal(5,1) DEFAULT NULL,
  `artist_link` blob NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Al Stewart',54.0,_binary 'https://www.discogs.com/artist/148394-Al-Stewart'),(2,'Band Aid',2.0,_binary 'https://www.discogs.com/artist/136704-Band-Aid'),(3,'Barbra Streisand',58.0,_binary 'https://www.discogs.com/artist/53248-Barbra-Streisand'),(4,'Bee Gees',32.0,_binary 'https://www.discogs.com/artist/97664-Bee-Gees'),(5,'Blackmore\'s Rainbow',34.0,_binary 'https://www.discogs.com/artist/245648-Rainbow'),(6,'Blood, Sweat And Tears',21.0,_binary 'https://www.discogs.com/artist/168907-Blood-Sweat-And-Tears'),(7,'Bon Iver',4.0,_binary 'https://www.discogs.com/artist/1042739-Bon-Iver'),(8,'Bowie',87.0,_binary 'https://www.discogs.com/artist/10263-David-Bowie'),(9,'Bread',12.0,_binary 'https://www.discogs.com/artist/303471-Bread'),(10,'Bryan Adams',48.0,_binary 'https://www.discogs.com/artist/10933-Bryan-Adams'),(11,'Cannonball Adderley',70.0,_binary 'https://www.discogs.com/artist/61585-Cannonball-Adderley'),(12,'Carole King',31.0,_binary 'https://www.discogs.com/artist/266352-Carole-King'),(13,'Chic',16.0,_binary 'https://www.discogs.com/artist/9081-Chic'),(14,'Daft Punk',8.0,_binary 'https://www.discogs.com/artist/1289-Daft-Punk'),(15,'Elvis Presley',396.0,_binary 'https://www.discogs.com/artist/27518-Elvis-Presley');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Rock'),(2,'Electronic'),(3,'Pop'),(4,'Jazz'),(5,'Funk / Soul'),(6,'Stage & Screen');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `releases` (
  `release_id` int NOT NULL AUTO_INCREMENT,
  `release_country` varchar(45) NOT NULL,
  `release_year` int DEFAULT NULL,
  `release_link` blob NOT NULL,
  PRIMARY KEY (`release_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
INSERT INTO `releases` VALUES (1,'UK',1976,_binary 'https://www.discogs.com/Al-Stewart-Year-Of-The-Cat/release/8747181'),(2,'UK',1984,_binary 'https://www.discogs.com/Band-Aid-Do-They-Know-Its-Christmas/release/179411'),(3,'US',1980,_binary 'https://www.discogs.com/Barbra-Streisand-Guilty/release/1078681'),(4,'US',1979,_binary 'https://www.discogs.com/Bee-Gees-Spirits-Having-Flown/release/2699002'),(5,'UK',1976,_binary 'https://www.discogs.com/Blackmores-Rainbow-Rainbow-Rising/release/4483749'),(6,'US',1968,_binary 'https://www.discogs.com/Blood-Sweat-And-Tears-Blood-Sweat-And-Tears/release/1456515'),(7,'US',2011,_binary 'https://www.discogs.com/Bon-Iver-Bon-Iver-Bon-Iver/release/2940876'),(8,'UK',1974,_binary 'https://www.discogs.com/Bowie-Diamond-Dogs/release/3877179'),(9,'UK',1973,_binary 'https://www.discogs.com/Bowie-Pinups/release/440664'),(10,'US',1973,_binary 'https://www.discogs.com/Bread-The-Best-Of-Bread/release/7193851'),(11,'Europe',1984,_binary 'https://www.discogs.com/Bryan-Adams-Reckless/release/1451593'),(12,'US',1958,_binary 'https://www.discogs.com/Cannonball-Adderley-Somethin-Else/release/982633'),(13,'US',1971,_binary 'https://www.discogs.com/Carole-King-Tapestry/release/1395530'),(14,'US',1978,_binary 'https://www.discogs.com/Chic-Cest-Chic/release/952009'),(15,'UK',2013,_binary 'https://www.discogs.com/Daft-Punk-Random-Access-Memories/release/4570366'),(16,'UK',2001,_binary 'https://www.discogs.com/Daft-Punk-Discovery/release/2879'),(17,'UK',1997,_binary 'https://www.discogs.com/Daft-Punk-Homework/release/3676112'),(18,'US',1970,_binary 'https://www.discogs.com/Elvis-Presley-Elvis-Christmas-Album/release/1421937');
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `single_album_rock_genre`
--

DROP TABLE IF EXISTS `single_album_rock_genre`;
/*!50001 DROP VIEW IF EXISTS `single_album_rock_genre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `single_album_rock_genre` AS SELECT 
 1 AS `album_name`,
 1 AS `total_duration`,
 1 AS `genre_name`,
 1 AS `number_of_genres`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `styles`
--

DROP TABLE IF EXISTS `styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `styles` (
  `style_id` int NOT NULL AUTO_INCREMENT,
  `style_name` varchar(45) NOT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `styles`
--

LOCK TABLES `styles` WRITE;
/*!40000 ALTER TABLE `styles` DISABLE KEYS */;
INSERT INTO `styles` VALUES (1,'Pop Rock'),(2,'Synth-pop'),(3,'Ballad'),(4,'Vocal'),(5,'Disco'),(6,'Soul'),(7,'Soft Rock'),(8,'Easy Listning'),(9,'Hard Rock'),(10,'Heavy Metal'),(11,'Blues Rock'),(12,'Jazz-Funk'),(13,'Jazz-Rock'),(14,'Folk Rock'),(15,'Indie Rock'),(16,'Classic Rock'),(17,'Rock & Roll'),(18,'Glam'),(19,'Rock'),(20,'Funk'),(21,'House'),(22,'Techno'),(23,'Bop'),(24,'Hard Bop'),(25,'Electro');
/*!40000 ALTER TABLE `styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `single_album_rock_genre`
--

/*!50001 DROP VIEW IF EXISTS `single_album_rock_genre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `single_album_rock_genre` AS with `album_has_info` as (select `albums`.`album_id` AS `album_id`,`albums`.`album_name` AS `album_name`,`albums`.`number_of_songs` AS `number_of_songs`,`albums`.`average_song_length` AS `average_song_length`,`albums`.`album_link` AS `album_link`,`albums`.`album_versions` AS `album_versions`,`albums`.`release_id` AS `release_id`,`albums`.`artist_id` AS `artist_id`,`album_genre_info`.`genre_id` AS `genre_id` from (`albums` join `album_genre_info` on((`albums`.`album_id` = `album_genre_info`.`album_id`)))) select `album_has_info`.`album_name` AS `album_name`,sum((`album_has_info`.`number_of_songs` * `album_has_info`.`average_song_length`)) AS `total_duration`,`genres`.`genre_name` AS `genre_name`,count(`album_has_info`.`genre_id`) AS `number_of_genres` from (`album_has_info` join `genres` on((`album_has_info`.`genre_id` = `genres`.`genre_id`))) where `genres`.`genre_name` in (select `genres`.`genre_name` from (`album_genre_info` join `genres` on((`album_genre_info`.`genre_id` = `genres`.`genre_id`))) where (`genres`.`genre_name` = 'Rock')) group by `album_has_info`.`album_id` having (`number_of_genres` = 1) order by `total_duration` */;
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

-- Dump completed on 2021-05-17 17:17:34
