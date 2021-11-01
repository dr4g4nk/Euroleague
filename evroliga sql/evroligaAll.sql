CREATE DATABASE  IF NOT EXISTS `evroliga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `evroliga`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: evroliga
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Temporary view structure for view `address`
--

DROP TABLE IF EXISTS `address`;
/*!50001 DROP VIEW IF EXISTS `address`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `address` AS SELECT 
 1 AS `IdAdrese`,
 1 AS `Ulica`,
 1 AS `Broj`,
 1 AS `IdGrada`,
 1 AS `Grad`,
 1 AS `IdDrzave`,
 1 AS `Drzava`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresa` (
  `IdAdrese` int NOT NULL AUTO_INCREMENT,
  `Ulica` varchar(45) NOT NULL,
  `Broj` int NOT NULL,
  `IdGrada` int NOT NULL,
  PRIMARY KEY (`IdAdrese`),
  KEY `fk_Adresa_Grad1_idx` (`IdGrada`),
  CONSTRAINT `fk_Adresa_Grad1` FOREIGN KEY (`IdGrada`) REFERENCES `grad` (`IdGrada`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES (1,'Mali Kalemegdan',2,1),(2,'Knesebeckstr. ',56,2),(3,'Mahmutbey Mahallesi Ordu Caddesi 2581. Sokak ',3,3),(4,'Via Borgonuovo',11,4),(5,'Leningradsky Prospect',39,5),(6,'Aristides Maillol Av, S/N Access',11,6),(7,'Kirov Str. ',27,5),(8,'erwgrhwerh',23,3);
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `club`
--

DROP TABLE IF EXISTS `club`;
/*!50001 DROP VIEW IF EXISTS `club`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `club` AS SELECT 
 1 AS `IdKluba`,
 1 AS `Naziv`,
 1 AS `Info`,
 1 AS `Grb`,
 1 AS `Telefon`,
 1 AS `ZvanicnaStranica`,
 1 AS `Twitter`,
 1 AS `Instagram`,
 1 AS `Facebook`,
 1 AS `YouTube`,
 1 AS `IdAdrese`,
 1 AS `Ulica`,
 1 AS `Broj`,
 1 AS `IdGrada`,
 1 AS `Grad`,
 1 AS `IdDrzave`,
 1 AS `Drzava`,
 1 AS `IdOsobe`,
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `IdSezone`,
 1 AS `W`,
 1 AS `L`,
 1 AS `PTS+`,
 1 AS `PTS-`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clubaddress`
--

DROP TABLE IF EXISTS `clubaddress`;
/*!50001 DROP VIEW IF EXISTS `clubaddress`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clubaddress` AS SELECT 
 1 AS `IdKluba`,
 1 AS `Naziv`,
 1 AS `IdPredsjednika`,
 1 AS `Ime Predsjednika`,
 1 AS `Prezime Predsjednika`,
 1 AS `Info`,
 1 AS `Grb`,
 1 AS `Telefon`,
 1 AS `ZvanicnaStranica`,
 1 AS `Twitter`,
 1 AS `Instagram`,
 1 AS `Facebook`,
 1 AS `YouTube`,
 1 AS `IdAdrese`,
 1 AS `Ulica`,
 1 AS `Broj`,
 1 AS `IdGrada`,
 1 AS `Grad`,
 1 AS `IdDrzave`,
 1 AS `Drzava`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `drzava`
--

DROP TABLE IF EXISTS `drzava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drzava` (
  `IdDrzave` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`IdDrzave`),
  UNIQUE KEY `Naziv_UNIQUE` (`Naziv`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzava`
--

LOCK TABLES `drzava` WRITE;
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` VALUES (19,'Australija'),(12,'Danska'),(27,'Finska'),(10,'Francuska'),(11,'Grcka'),(13,'Gruzija'),(9,'Hrvatska'),(4,'Italija'),(14,'Letonija'),(16,'Madjarska'),(2,'Njemacka'),(5,'Rusija'),(7,'SAD'),(17,'Slovacka'),(20,'Slovenija'),(6,'Spanija'),(1,'Srbija'),(8,'Svedska'),(3,'Turska'),(15,'Uganda'),(18,'Ukrajina');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvorana`
--

DROP TABLE IF EXISTS `dvorana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvorana` (
  `IdDvorane` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `Kapacitet` int NOT NULL,
  `IdAdrese` int NOT NULL,
  `IdKluba` int NOT NULL,
  PRIMARY KEY (`IdDvorane`),
  KEY `fk_Dvorana_Adresa1_idx` (`IdAdrese`),
  KEY `fk_Dvorana_Klub1_idx` (`IdKluba`),
  CONSTRAINT `fk_Dvorana_Adresa1` FOREIGN KEY (`IdAdrese`) REFERENCES `adresa` (`IdAdrese`),
  CONSTRAINT `fk_Dvorana_Klub1` FOREIGN KEY (`IdKluba`) REFERENCES `klub` (`IdKluba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvorana`
--

LOCK TABLES `dvorana` WRITE;
/*!40000 ALTER TABLE `dvorana` DISABLE KEYS */;
/*!40000 ALTER TABLE `dvorana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fazatakmicenja`
--

DROP TABLE IF EXISTS `fazatakmicenja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fazatakmicenja` (
  `Faza` varchar(45) NOT NULL,
  `IdSezone` int NOT NULL,
  PRIMARY KEY (`Faza`,`IdSezone`),
  KEY `fk_FazaTakmicenja_Sezona1_idx` (`IdSezone`),
  CONSTRAINT `fk_FazaTakmicenja_Sezona1` FOREIGN KEY (`IdSezone`) REFERENCES `sezona` (`IdSezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fazatakmicenja`
--

LOCK TABLES `fazatakmicenja` WRITE;
/*!40000 ALTER TABLE `fazatakmicenja` DISABLE KEYS */;
INSERT INTO `fazatakmicenja` VALUES ('Final Four',1),('Playoff',1),('Regularna faza',1),('Final Four',2),('Playoff',2),('Regularna faza',2),('Final Four',3),('Playoff',3),('Regularna faza',3);
/*!40000 ALTER TABLE `fazatakmicenja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grad`
--

DROP TABLE IF EXISTS `grad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grad` (
  `IdGrada` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `IdDrzave` int NOT NULL,
  PRIMARY KEY (`IdGrada`),
  KEY `fk_Grad_Drzava1_idx` (`IdDrzave`),
  CONSTRAINT `fk_Grad_Drzava1` FOREIGN KEY (`IdDrzave`) REFERENCES `drzava` (`IdDrzave`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grad`
--

LOCK TABLES `grad` WRITE;
/*!40000 ALTER TABLE `grad` DISABLE KEYS */;
INSERT INTO `grad` VALUES (1,'Beograd',1),(2,'Berlin',2),(3,'Istanbul',3),(4,'Milano',4),(5,'Moskva',5),(6,'Barselona',6);
/*!40000 ALTER TABLE `grad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igrac`
--

DROP TABLE IF EXISTS `igrac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igrac` (
  `IdOsobe` int NOT NULL,
  `Pozicija` varchar(45) NOT NULL,
  `Visina` decimal(4,2) unsigned NOT NULL,
  `Biografija` text,
  PRIMARY KEY (`IdOsobe`),
  CONSTRAINT `fk_Igrac_Osoba` FOREIGN KEY (`IdOsobe`) REFERENCES `osoba` (`IdOsobe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igrac`
--

LOCK TABLES `igrac` WRITE;
/*!40000 ALTER TABLE `igrac` DISABLE KEYS */;
INSERT INTO `igrac` VALUES (3,'Bek',1.92,'\r\n    Grew up with FMP Zeleznik (Serbia) juniors.\r\n    Played the 2006-07 season with FMP 2nd Team.\r\n    Made his debut with FMP main team during the 2007-08 season.\r\n    Played there till the 2010-11 championship.\r\n    Signed for the 2011-12 season, signed by Crvena Zvezda Belgrade.\r\n    He\'s still playing there.\r\n'),(6,'Bek',2.00,'\r\n    Played college basketball at Stetson (2010-11), at Eastern Florida State College (2011-12) and at Eastern Kentucky (2012-15).\r\n    Signed for the 2015-16 season by Maine Red Claws, NBDL.\r\n    Moved to Belgium for the 2016-17 season, signed by BC Oostende.\r\n    Moved to Israel for the 2017-18 season, signed by Hapoel Holon.\r\n    Played there also the 2018-19 championship.\r\n    Moved to Serbia for the 2019-20 season, signed by BC Partizan Belgrade.\r\n    Signed for the 2020-21 season by Crvena Zvezda Belgrade.\r\n'),(21,'Krilo',2.00,'\r\n    Played college basketball at Louisiana State (2011-14)\r\n    Signed for the 2014-15 season by Milwaukee Bucks.\r\n    Played there also the 2015-16 championship.\r\n    Signed for the 2016-17 season by Northern Arizona Suns, NBDL.\r\n    In February’17 signed by Denver Nuggets.\r\n    In March’17 signed by Charlotte Hornets.\r\n    Played there also the 2017-18 championship..\r\n    Moved to Israel for the 2018-19 season, signed by Maccabi Tel Aviv.\r\n    Moved to Russia for the 2019-20 season, signed by Lokomotiv Kuban Krasnodar.\r\n    Moved to Serbia for the 2020-21 season, signed by Crvena Zvezda Belgrade.\r\n'),(22,'Bek',2.00,'\r\n    Played college basketball at Mercer (2010-14).\r\n    Moved to Italy for the 2014-15 season, signed by Pistoia Basket.\r\n    Signed for the 2015-16 season by Pallacanetsro Cantu.\r\n    In December’5 moved to Germany, signed by Telekom Baskets Bonn.\r\n    Moved to Greece for the 2016-17 season, signed by Colossus Rhodou.\r\n    Moved to Croatia for the 2017-18 season, signed by Cibona Zagreb.\r\n    In October’17 moved to Greece, signed by ASP Promitheas Patras.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Serbia for the 2020-21 season, signed by Crvena Zvezda Belgrade.\r\n'),(23,'Bek',2.00,'\r\n    Played college basketball at Furman (2011-13) and at University of Indianapolis (2013-16).\r\n    Signed for the 2016-17 season by Fort Wayne Mad Ants, NBDL.\r\n    Moved to Israel for the 2017-18 season signed by Hapoel Eilat.\r\n    Signed for the 2018-19 season by Toronto Raptors, during the season also played with Raptors 905 Mississauga.\r\n    Moved to Spain for the 2019-20 season, signed by Valencia Basket.\r\n    Moved to Serbia for the 2020-21 season, signed by Crvena Zvezda Belgrade.\r\n'),(24,'Krilo',2.00,'\r\n    Made his debut with Proleter Zrenjanin (Serbia), A League, during the 2010-11 season.\r\n    Played there till the 2012-13 championship.\r\n    Signed for the 2013-14 season by KK Vrsac.\r\n    Played there till March\'15.\r\n    Signed for the remainder of the 2014-15 season by FMP Belgrade.\r\n    Played there till the 2016-17 championship.\r\n    Signed for the 2017-18 season by Crvena Zvezda Belgrade.\r\n    He\'s still playing there.\r\n'),(25,'Bek',2.00,'    Grew up with Crvena Zvezda Belgrade (Serbia) juniors.\r\n    Signed for the 2013-14 season by FMP Belgrade.\r\n    Played there till the 2015-16 championship.\r\n    Signed for the 2016-17 season by Crvena Zvezda Belgrade.\r\n    He\'s still playing there.\r\n'),(26,'Bek',2.00,'\r\n    Made his debut with Central Hoops Berlin (Germany), Regionalliga 2, during the 2009-10 season.\r\n    Played there also the 2010-11 championship.\r\n    Played high-school basketball at Wilbraham & Monson Academy HS (2011-12).\r\n    Played college basketball at Columbia University (2012-16).\r\n    Moved to Germany for the 2016-17 season, signed by Brose Bamberg.\r\n    Played there also the 2017-18 championship.\r\n    Signed for the 2018-19 season by FC Bayern Munich.\r\n    Played there also the 2019-20 championship.\r\n    Signed for the 2020-21 season by ALBA Berlin.\r\n'),(27,'Bek',2.00,'\r\n    Played college basketball at University of Louisville (2009-13).\r\n    Signed for the 2013-14 season by Detroit Pistons, also played with Fort Wayne Mad Ants, NBDL.\r\n    Signed for the 2014-15 season by Erie Bay Hawks, NBDL.\r\n    Moved to Italy for the 2015-16 season, signed by Juve Caserta.\r\n    Moved to Germany for the 2016-17 season, signed by ALBA Berlin Basketball Team.\r\n    He\'s still playing there.\r\n'),(28,'Krilo',2.00,'\r\n    Made his debut with Tus Lichterfelde (Germany), ProB, during the 2007-08 season.\r\n    Signed for the 2008-09 season by ALBA Berlin II, Regionalliga.\r\n    Played there also the 2009-10 championship.\r\n    Played college basketball at U-Conn (2010-14).\r\n    Back to Germany for the 2014-15 season, signed by ALBA Berlin Basketball Team.\r\n    He\'s still playing there.\r\n'),(29,'Bek',2.00,'\r\n    Grew up with ALBA Berlin Basketball Team (Germany) juniors.\r\n    Signed for the 2017-18 season by SSV Locomotive Bernau, ProB, also played with ALBA 2nd team, Regionalliga.\r\n    He’s still playing there and made his debut with ALBA main team during the 2019-20 season.\r\n'),(30,'Bek',2.00,'Made his debut with KFUM Uppsala (Sweden) during the 2009-10 season.\r\nMoved to Spain for the 2010-11 season by Manresa Basquet.\r\nSigned for the 2011-12 season by FC Barcelona, played with FC Barcelona 2nd team, LEB Silver.\r\nPlayed there also the 2012-13 championship.\r\nSigned for the 2013-14 season by Manresa Basquet.\r\nBack to FC Barcelona for the 2014-15 season.\r\nPlayed there till the 2016-17 championship.\r\nSigned for the 2017-18 season by CB Gran Canaria.\r\nPlayed there also the 2018-19 championship.\r\nMoved to Germany for the 2019-20 season, signed by Alba Berlin Basketball Team.'),(31,'Centar',2.00,'\r\n    Grew up with Cibona Zagreb (Croatia) juniors.\r\n    Moved to Germany for the 2017-18 season, signed by ALBA Berlin Basketball Team, also played with SSV Lokomotive Bernau.\r\n    He\'s still playing there.\r\n'),(32,'Bek',2.00,'\r\n    Played college basketball at Miami, Florida (2011-13).\r\n    Signed for the 2013-14 season by Dallas Mavericks, also played during the season with Frisco Texas Legends.\r\n    Signed for the 2014-15 season by New York Knicks.\r\n    Signed for the 2015-16 season by Brooklyn Nets.\r\n    Moved to Spain for the 2016-17 season, signed by Baskonia Vitoria.\r\n    Signed for the 2017-18 season by Boston Celtics.\r\n    Moved to Turkey for the 2018-19 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(33,'Bek',2.00,'Grew up with Cholet Basket (France) juniors.\r\nMade his debut with Cholet during the 2006-07 season.\r\nPlayed there till the 2008-09 championship.\r\nSigned for the 2009-10 season by Dallas Mavericks.\r\nPlayed there till the 2012-13 championship.\r\nMoved to Belgium for the 2013-14 season, in March\'14, signed by Spirou Charleroi.\r\nMoved to France for the 2014-15 season, signed by Le Mans MSB.\r\nSigned for the 2015-16 season by Strasbourg IG.\r\nMoved to Spain for the 2016-17 season, signed by Baskonia Vitoria Gasteiz.\r\nPlayed there also the 2017-18 championship.\r\nMoved to Turkey for the 2018-19 season, signed by Anadolu Efes Istanbul.'),(34,'Krilo',2.00,'\r\n    Played college basketball at Florida State (2008-11).\r\n    Signed for the 2011-12 season by Washington Wizards.\r\n    Played there till the 2013-14 championship.\r\n    Moved to China for the 2014-15 season, signed by Dragons Nanjing.\r\n    In January\'15, signed by Oklahoma City Blue, NBDL.\r\n    Moved to Russia for the 2015-16 season, signed by Lokomotiv Kuban Krasnodar.\r\n    In late May\'16 moved to China, signed by Anhui Wenyi.\r\n    Moved to Greece for the 2016-17 season, signed by Panathinaikos Athens.\r\n    Played there also the 2017-18 championship.\r\n    Moved to Spain for the 2018-19 season, signed by FC Barcelona.\r\n    Moved to Turkey for the 2019-20 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(35,'Krilo',2.03,'\r\n    Grew up with Anadolu Efes Istanbul (Turkey) juniors.\r\n    Made his debut with Anadolu Efes during the 2017-18 season.\r\n    He\'s still playing there.\r\n'),(36,'Centar',2.00,'\r\n    Grew up with RheinEnergie Cologne (Germany) juniors.\r\n    Made his debut with RheinEnergie Cologne during the 2006-07 season.\r\n    Played there though the team changed its name to Koeln 99ers till the 2008-09 championship.\r\n    Signed for the 2009-10 season by Brose Baskets Bamberg.\r\n    Played there till the 2011-12 championship.\r\n    Moved to Spain for the 2012-13 season, signed by Baskonia Vitoria.\r\n    Played there also the 2013-14 championship.\r\n    Signed for the 2014-15 season by FC Barcelona.\r\n    Signed for the 2015-16 season by Utah Jazz.\r\n    In December\'15 signed by Idaho Stampede.\r\n    Moved to Turkey for the 2016-17 season, signed by Galatasaray Istanbul.\r\n    Moved to Spain for the 2017-18 season, signed by Valencia BC.\r\n    Moved to Turkey for the 2018-19 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(37,'Bek',2.00,'\r\n    Grew up with FMP Zeleznik (Serbia) youth teams.\r\n    Signed for the 2010-11 season by Mega Vizura.\r\n    Played there till the 2013-14 championship.\r\n    Moved to Germany for the 2014-15 season, signed by FC Bayern Munich.\r\n    Played there till December\'15.\r\n    Moved to Serbia, signed by Crvena Zvezda Belgrade for the remainder of the 2015-16 season.\r\n    Moved to Turkey for the 2016-17 season, signed by Tofas Bursa.\r\n    Moved to Lithuania for the 2017-18 season, signed by BC Zalgiris Kaunas.\r\n    Moved to Turkey for the 2018-19 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(38,'Bek',2.00,'\r\n    Played college basketball at State Fair CC (2012-14) and at University of Tennessee (2014-16).\r\n    Moved to Greece for the 2016-17 season, signed by GS Lavrio.\r\n    In March’17 moved to Belgium, signed by Antwerp Giants.\r\n    Moved to Poland for the 2017-18 season, signed by Rosa Radom.\r\n    In February’18 moved to Greece, signed by AEK Athens.\r\n    Moved to Italy for the 2018-19 season,signed by Virtus Bologna.\r\n    Moved to Greece for the 2019-20 season, signed by Olympiacos Piraeus.\r\n    Played there till December\'19.\r\n    In December\'19 moved to Serbia, signed by Crvena Zvezda Belgrade.\r\n    Moved to Italy for the 2020-21 season, signed by Olimpia Milan.\r\n'),(39,'Centar',2.00,'\r\n    Played college basketball at South Florida (2012-14) and at Virginia Tech (2014-17).\r\n    Moved to Israel for the 2017-18 season, signed by Hapoel Galil Gilboa.\r\n    Moved to Greece for the 2018-19 season, signed by Olympiacos Piraeus.\r\n    Moved to Lithuania for the 2019-20 season, signed by BC Zalgiris Kaunas.\r\n    Moved to Italy for the 2020-21 season, signed by Olimpia Milan.\r\n'),(40,'Bek',2.00,'\r\n    Made his debut with Stella Azzurra Rome (Italy), SB, during the 2013-14 season.\r\n    Signed for the 2014-15 season by Pistoia Basket.\r\n    Signed for the 2015-16 season by Treviso Basket, A2.\r\n    Played there also the 2016-17 championship.\r\n    Played college basketball at Texas Tech University (2017-20)\r\n    Signed for the 2020-21 season by Olimpia Milan.\r\n'),(41,'Krilo',2.00,'\r\n    Grew up with Beopetrol Belgrade (Serbia) juniors.\r\n    Signed for the 2002-03 season by Nova Pazova, in the Serbian minors.\r\n    Signed for the 2003-04 season by OKK Belgrade.\r\n    Signed for the 2004-05 season, signed by Lavovi 063 Belgrade.\r\n    Signed for the 2005-06 season by BC Buducnost Belgrade.\r\n    Played there till March\'07.\r\n    Signed for the remainder of the 2006-07 season by BC Partizan Belgrade.\r\n    Back to BC Buducnost Podgorica for the 2007-08 season.\r\n    Played there till March\'09.\r\n    Moved to Greece signed by Panionios BC Athens for the remainder of the season.\r\n    Moved to Spain for the 2009-10 season, signed by Baskonia Vitoria.\r\n    On December \'09 moved to Italy, signed by Pallacanestro Cantù.\r\n    Played there till the 2011-12 championship.\r\n    Moved to Russia for the 2012-13 season, signed by CSKA Moscow.\r\n    Played there also the 2013-14 championship.\r\n    Moved to Turkey for the 2014-15 season, signed by Galatasaray Istanbul.\r\n    Played there till the 2016-17 championship.\r\n    Moved to Italy for the 2017-18 season, signed by Olimpia Milano.\r\n    He\'s still playing there.\r\n'),(42,'Bek',2.00,'\r\n    Grew up with Virtus Bologna (Italy) juniors.\r\n    Made his debut with Virtus Bologna during the 2007-08 season.\r\n    Played there till January\'11, signed by Pallacanestro Biella.\r\n    Signed for the 2011-12 season by Pallacanestro Sant\'Antimo, Legadue.\r\n    Signed for the 2012-13 season by Virtus Bologna.\r\n    Signed for the 2013-14 season by Virtus Roma.\r\n    Signed for the 2014-15 season by Pallacanestro Mantovana, A2.\r\n    Played there also the 2015-16 championship.\r\n    Signed for the 2016-17 season by Aquila Trento.\r\n    Signed for the 2017-18 season by Pallacanestro Mantovana, A2.\r\n    Signed for the 2018-19 season by Pallacanestro Brindisi.\r\n    Signed for the 2019-20 season by Olimpia Milan.\r\n    He\'s still playing there.\r\n'),(43,'Bek',2.00,'\r\n    Played college basketball at UCLA (2005-10).\r\n    Moved to Turkey for the 2010-11 season, signed by Bornova Bld.\r\n    On May\'11 moved to Belgium, signed by Antwerp Giants.\r\n    Played there also the 2011-12 championship.\r\n    Moved to Spain for the 2012-13 season, signed by CAI Zaragoza.\r\n    Played there also the 2013-14 championship.\r\n    Moved to Turkey for the 2014-15 season, signed by Turk Telekom Ankara.\r\n    Signed for the 2015-16 season by Tuyap BB.\r\n    In April\'16 moved to Spain, signed by Baskonia Vitoria.\r\n    Back to Turkey for the 2016-17 season, signed by Besiktas JK Istanbul.\r\n    Moved to Israel for the 2017-18 season, signed by Maccabi Tel Aviv.\r\n    Played there also the 208-19 championship.\r\n    Moved to Italy for the 2019-20 season, signed by Olimpia Milan.\r\n    He\'s still playing there.\r\n'),(44,'Bek',1.94,'\r\n    Grew up with Tus Lichterfelde Berlin (Germany) juniors.\r\n    Signed for the 2016-17 season by Alba Berlin, played with the 2nd team, Regionalliga.\r\n    Make his debut with Alba main team during the 2017-18 season, when he also played with SSV Lokomotive Bernau. ProB.\r\n    He\'s still playing there.\r\n'),(45,'Krilo',2.08,'\r\n    Grew up with ALBA Berlin Basketball Team (Germany) juniors.\r\n    Made his debut with ALBA Berlin 2nd team, Regionalliga during the 2013-14 season.\r\n    Played there till the 2015-16 championship.\r\n    Signed for the 2016-17 season by Lokomotive Bernau, also played with ALBA Berlin main team.\r\n    He\'s still playing with ALBA Berlin.\r\n'),(46,'Krilo',2.04,'\r\n    Grew up with ALBA Berlin Basketball Team (Germany) youth teams.\r\n    Made his debut with ALBA Berlin 3rd team, 2Regionalliga, during the 2016-17 season, also playing with U19 team.\r\n    Made his debut with ALBA Berlin 2nd team Regionalliga, during the 2017-18 season.\r\n    Signed for the 2018-19 season by SSV Lokomotive Bernau, ProB, also played with ALBA Berlin 2nd team.\r\n    He\'s still playing there and made his debut with ALBA Berlin main team during the 2019-20 season.\r\n'),(47,'Krilo',2.05,'\r\n    Made his debut with BC Hamburg (Germany) 2.Regionalliga during the 201314 season, also paying with Piraten Hamburg, JBBL.\r\n    Played there also the 2014-15 championship.\r\n    Signed for the 2015-16 season by SC Rist Wedel, ProB, also played with Hamburg Towers, ProA, and Alba Berlin juniors.\r\n    Signed for the 2016-17 season by Brose Bamberg, also played with Baunach Young Pikes, Pro A.\r\n    Played with Brose Bamberg till the 2019-20 championship.\r\n    Signed for the 2020-21 season by ALBA Berlin.\r\n'),(48,'Krilo',2.03,'\r\n    Grew up with Virtus Bologna (Italy) juniors.\r\n    Made his debut with Virtus Bologna during the 2012-13 season.\r\n    Played there till the 2015-16 championship.\r\n    Signed for the 2016-17 season by Olimpia Milano.\r\n    Played there till December\'17.\r\n    Signed for the remainder of the 2017-18 season by Vanoli Cremona.\r\n    Signed for the 2018-19 season by Olimpia Milan.\r\n    Signed for the 2019-20 season by Pallacanestro Reggiana Reggio Emilia.\r\n    Moved to Germany for the 2020-21 season, signed by ALBA Berlin.\r\n'),(49,'Centar',1.00,'\r\n    Grew up with TSV Breitenguessbach (germany) juniors.\r\n    Made his debut with TSV Breitenguessbach during the 2012-13 season.\r\n    Signed for the 2013-14 season by Brose Baskets Bamberg, also played for Baunach.\r\n    Played with both teams also the 2014-15 championship.\r\n    Signed for the 2015-16 season by Baunach Young Pikes, ProA.\r\n    Signed for the 2016-17 season by MHP Riesen Ludwigsburg.\r\n    Played there also the 2017-18 championship.\r\n    Signed for the 2018-19 season by ALBA Berlin Basketball Team.\r\n    He\'s still playing there.\r\n'),(50,'Bek',1.89,'\r\n    Made his debut with Estudiantes Madrid 2nd team (Spain), EBA, during the 2006-07 season.\r\n    Played also with the ACB team during the 2007-08 championship.\r\n    Played with Estudiantes till the 2012-13 champiomship.\r\n    Signed for the 2013-14 season by Malaga CB.\r\n    Played there also the 2014-15 championship.\r\n    Moved to Turkey for the 2015-16 season, signed by Anadolu Efes Istanbul.\r\n    Played there also the 2016-17 championship.\r\n    Moved to Spain for the 2017-18 season, signed by Baskonia Vitoria-Gasteiz.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Germany for the 2020-21 season, signed by ALBA Berlin.\r\n'),(51,'Krilo',2.03,'\r\n    Played college basketball at Portland University (2007-11).\r\n    Moved to Spain for the 2011-12 season, signed by UB La Palma, LEB Gold.\r\n    Signed for the 2012-13 season by Ford Burgos LEB Gold.\r\n    Signed for the 2013-14 season, signed by CB Canarias Tenerife.\r\n    Played there also the 2014-15 championship.\r\n    Signed for the 2015-16 season by Valencia BC.\r\n    Played there also the 2016-17 championship.\r\n    Moved to Germany for the 2017-18 season, signed by ALBA Berlin Basketball Team.\r\n    He\'s still playing there.\r\n'),(52,'Centar',2.08,'\r\n    Played college basketball at Georgia Tech (2014-18).\r\n    Moved to Spain for the 2018-19 season, signed by Bilbao Basket.\r\n    Played there also the 2019-20 championship.\r\n    Moved to Germany for the 2020-21 season, signed by ALBA Berlin.\r\n'),(53,'Bek',1.94,'\r\n    Grew up with Crvena Zvezda Belgrade (Serbia) youth teams.\r\n    Signed for the 2017-18 season by FMP Belgrade.\r\n    Played there till the 2019-20 championship.\r\n    Signed for the 2020-21 season by Crvena Zvezda Belgrade.\r\n'),(54,'Krilo',2.03,'\r\n    Grew up with Radnicki Belgrade (Serbia) juniors.\r\n    Signed for the 2001-02 season by Smederevo, in the Yugoslav 2nd division.\r\n    Signed for the 2002-03 season by Radnicki Belgrade.\r\n    Signed for the 2003-04 season by Lavovi 063 Belgrade.\r\n    Played there also the 2004-05 championship.\r\n    Signed for the 2005-06 season by Egronom Nis.\r\n    Moved to Belgium for the 2006-07 season, signed by BC Oostende.\r\n    In December\'06 back to Serbia, signed by KK Hemofarm Vrsac.\r\n    Played there also the 2007-08 championship.\r\n    Moved to Montenegro for the 2008-09 season, signed by BC Buducnost Podgorica.\r\n    Played there till the 2010-11 championship.\r\n    Moved to Germany for the 2011-12 season, signed by Alba Berlin Basketball Team.\r\n    Back to Serbia for the 2012-13 season, signed by Crvena Zvezda Belgrade.\r\n    Played there also the 2013-14 championship.\r\n    Moved to France for the 2014-15 season, signed by EB Pau-Orthez.\r\n    Back to Serbia for the 2015-16 season, signed by Crvena Zvezda Belgrade.\r\n    Played there also the 2016-17 championship.\r\n    Moved to Russia for the 2017-18 season, signed by Zenit St. Petersburg.\r\n    Played there also the 2018-19 championship.\r\n    Moved to Slovenia for the 2019-20 season, signed by KK Cedevita Olimpija Ljubljana.\r\n    In February\'20 moved to Spain, signed by Malaga CB.\r\n    Moved to Serbia for the 2020-21 season, signed by Crvena Zvezda Belgrade.\r\n'),(55,'Centar',2.13,'\r\n    Made his debut with Borac Nektas Banja Luka (Bosnia) during the 2007-08 season.\r\n    Moved to Finland for the 2008-09 season, signed by UU-Korihait Uusikaupunki.\r\n    Played there till January\'10.\r\n    Signed for the remainder of the season by Lapuan Korikobrat.\r\n    Moved to Bosnia for the 2010-11 season, signed by KK Celik Zenica.\r\n    Moved to Spain for the 2011-12 season, signed by Clinica Rincon Azarquia, LEB Gold.\r\n    Signed for the 2012-13 season by Malaga CB and loaned to Joventut Badalona.\r\n    Signed for the 2013-14 season by Golden State Warriors, also played with Santa Cruz Warriors, NBDL.\r\n    Played with both teams also the 2014-15 championship.\r\n    Moved to Greece for the 2015-16 season, signed by Panathinaikos Athens.\r\n    Moved to Serbia for the 2016-17 season, signed by Crvena Zvezda Belgrade.\r\n    Moved to Spain for the 2017-18 season, signed by Real Madrid CF.\r\n    Played there also the 2018-19 championship.\r\n    Moved to Serbia for the 2019-20 season, signed by Crvena Zvezda Belgrade.\r\n    He\'s still playing there.\r\n'),(56,'Krilo',2.00,'\r\n    Grew up with Spartak Subotica (Serbia) juniors.\r\n    Made his debut with Spartak during the 2005-06 season.\r\n    Played there also the 2006-07 championship.\r\n    Signed for the 2007-08 season by BC Novi Sad.\r\n    Played there till November\'09.\r\n    In March\'10 moved to Bosnia, signed by HKK Capljina.\r\n    Signed for the 2010-11 season by Borac Nektar Banja Luka.\r\n    Signed for the 2011-12 season by HKK Capljina.\r\n    Moved to Croatia for the 2012-13 season, signed by Cibona Zagreb.\r\n    Played there till January\'16.\r\n    In January\'16 moved to Czech Republic, signed by CEZ Basketball Nymburk.\r\n    Moved to Belgium for the 2016-17 season, signed by BC Oostende.\r\n    Played there also the 2017-18 championship.\r\n    Moved to Slovenia for the 2018-19 season, signed by Primorska Koper.\r\n    Played there till December\'19.\r\n    In December\'19 moved to Serbia, signed by Crvena Zvezda Belgrade.\r\n    He\'s still playing there.\r\n'),(57,'Bek',1.88,'\r\n    Made his debut with CAI Zaragoza (Spain) during the 2006-07 season, when he also played with Fiat Olivar, EBA.\r\n    Signed for the 2007-08 season by CB L\'Hospitalet, LEB Gold.\r\n    Signed for the 2008-09 by Lleida Basket, LEB Gold.\r\n    In February\'09 signed by CAI Zaragoza.\r\n    Signed for the 2009-10 season by Baloncesto Fuenlabrada.\r\n    Played there till the 2012-13 season, when he also played with Forca Lleida, LEB Gold.\r\n    Signed for the 2013-14 season by Estudiantes Madird.\r\n    Signed for the 2014-15 season by Bilbao Basket.\r\n    Moved to Russia for the 2015-16 season, signed by Unics Kazan.\r\n    Played there till the 2017-18 championship.\r\n    Moved to Turkey for the 2018-18 season, signed by Bahcesehir Koleji Istanbul.\r\n    Moved to Spain for the 2019-20 season, signed by Valencia Basket.\r\n    In December\'20 moved to Serbia, signed by Crvena Zvezda Belgrade.\r\n'),(58,'Bek',1.85,'\r\n    Grew up with Fenerbahce Istanbul (Turkey) juniors.\r\n    Made his debut with Fenerbahce during the 2004-05 season.\r\n    Played there also the 2005-06 championship.\r\n    Played college basketball at Texas University (2007-11).\r\n    Back to Turkey for the 2011-12 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(59,'Krilo',2.02,'\r\n    Grew up with Chorale Roanne (France) juniors.\r\n    Made his debut with Chorale Roanne during the 2005-06 season.\r\n    Played there also the 2006-07 championship.\r\n    Signed for the 2007-08 season by JSF Nanterre.\r\n    Signed for the 2008-09 season by Entente Orleans 45.\r\n    Played there till the 2010-11 championship.\r\n    Signed for the 2011-12 season by Sluc Nancy.\r\n    Moved to Spain for the 2012-13 season, signed by Bizkaia Basket Bilbao.\r\n    Back to France for the 2013-14 season, signed by Limoges CSP.\r\n    Played there also the 2014-15 championship.\r\n    Moved to Turkey for the 2015-16 season, signed by Banvit Bandirma.\r\n    Signed for the 2016-17 season by Darussafaka Dogus Istanbul.\r\n    Moved to Spain for the 2017-18 season, signed by FC Barcelona.\r\n    Moved to Turkey for the 2018-19 season, signed by Anadolu Efes Istanbul.\r\n'),(60,'Centar',2.12,'\r\n    Grew up with Pinar Karsiyaka Izmir (Turkey) juniors.\r\n    Made his debut with Genc Telekom, TNL2 during the 2008-09 season.\r\n    Played there also the 2009-10 championship.\r\n    Signed for the 2010-11 season, signed by Galatasaray Istanbul.\r\n    Signed for the 2011-12 season by Tifas Bursa..on December\'11 back to Galatasaray.\r\n    Played there also the 2012-13 championship.\r\n    Signed for the 2013-14 season by Royal Hali Gaziantep.\r\n    Signed for the 2014-15 season by Usak Sportlif.\r\n    Signed for the 2015-16 season by Trabzonspor Basketball.\r\n    Signed for the 2016-17 season by Besiktas JK Istanbul.\r\n    Played there also the 2017-18 championship.\r\n    Signed for the 2018-19 season by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(61,'Krilo',1.98,'\r\n    Played college basketball at Oklahoma State (2007-10).\r\n    Signed for the 2010-11 season by San Antonio Spurs.\r\n    Also played during the season with Austin Toros, NBDL.\r\n    Played with San Antonio Spurs till December\'12.\r\n    Signed with Rio Grande Valley Vipers, NBDL.\r\n    On January\'13, signed, for the remainder of the 2012-13 season, by Houston Rockets.\r\n    Signed for the 2013-14 season by Philadelphia 76ers.\r\n    Moved to Lithuania for the 2014-15 season, signed by BC Zalgiris Kaunas.\r\n    Signed for the 2015-16 season by Sacramento Kings.\r\n    Moved to Turkey for the 2016-17 season, signed by Darussafaka Dogus Istanbul.\r\n    Moved to Russia for the 2017-18 season, signed by BC Khimiki Moscow region\r\n    Moved to Turkey for the 2018-19 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(62,'Centar',2.03,'\r\n    Played college basketball at Fordham (2004-08).\r\n    Moved to Korea for the 2008-09 season, signed by Mobis Phoebus.\r\n    Played there also the 2009-10 championship.\r\n    Moved to Greece for the 2010-11 season, signed by Aris Thessaloniki.\r\n    On February\'11 moved to Israel, signed by Bnei Hasharon.\r\n    Signed for the 2011-12 season by Hapoel Holon.\r\n    Moved to Italy for the 2012-13 season, signed by Pallacanestro Varese.\r\n    Moved to Greece for the 2013-14 season, signed by Olympiacos Piraeus.\r\n    Played there also the 2014-15 championship.\r\n    Moved to Turkey for the 2015-16 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(63,'Bek',1.97,'\r\n    Grew up with KK Zagreb (Croatia) juniors.\r\n    Made his debut with KK Zagreb during the 2002-03 season.\r\n    Played there till the 2011-12 championship.\r\n    Moved to Spain for the 2012-13 season, signed by CB Malaga..moved to Russia for the 2013-14 season, signed by Lokomotiv Kuban.\r\n    Played there also the 2014-15 championship.\r\n    Moved to Italy for the 2015-16 season, signed by Olimpia Milano.\r\n    Played there also the 2016-17 championship.\r\n    Moved to Turkey for the 2017-18 season, signed by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(64,'Bek',1.93,'\r\n    Grew up with Besiktas JK Istanbul (Turkey) juniors.\r\n    Signed for the 2011-12 season by Aliaga Petkim.\r\n    Played there till October’12.\r\n    In October’12 signed by Istanbul Buyuksehir Belediyesi.\r\n    Signed for the 2013-14 season by Mersin Buyuksehir Belediyesi.\r\n    Signed for the 2014-15 season by Eskisehir Basket.\r\n    Signed for the 2015-16 season by Balikesir Basket.\r\n    Signed for the 2016-17 season by Eskisehir Basket.\r\n    Played there also the 2017-18 championship.\r\n    Signed for the 2018-19 season by Anadolu Efes Istanbul.\r\n    He\'s still playing there.\r\n'),(65,'Bek',1.91,'\r\n    Grew up with Estudiantes Madrid (Spain) juniors.\r\n    Made his debut with Estudiantes Madrid during the 2004-05 season.\r\n    Played there also the 2005-06 championship.\r\n    Signed for the 2006-07 season by Portland Trail Blazers.\r\n    Played thee till the 2008-09 championship.\r\n    Signed for the 2009-10 season by Sacramento Kings.\r\n    On February\'10, signed by New York Knicks.\r\n    Back to Spain for the 2010-11 season, signed by Real Madrid CF.\r\n    Played there till the 2015-16 championship.\r\n    Signed for the 2016-17 season by Philadelphia 76ers.\r\n    Moved to Russia for the 2017-18 season, signed by CSKA Moscow.\r\n    Played there also the 2018-19 championship.\r\n    Moved to Italy for the 2019-20 season, signed by Olimpia Milan.\r\n    He\'s still playing there.\r\n'),(66,'Centar',2.13,'\r\n    Played college basketball at University of Arizona (2012-16).\r\n    Signed for the 2016-17 season by Oklahoma City Blue, NBDL.\r\n    In March\'17 moved to Italy, signed by Olimpia Milan.\r\n    He\'s still playing there.\r\n'),(67,'Bek',1.91,'\r\n    Played college basketball at Virginia Tech (2007-11).\r\n    Moved to France for the 2011-2 season, signed by Elan Chalon-sur-Saone.\r\n    Moved to Ukraine for the 2012-13 season, signed by Budivelnik Kiev.\r\n    Moved to Germany for the 2013-14 season, signed by FC Bayern Munich.\r\n    Moved to Russia for the 2014-15 season, signed by Lokomotiv Kuban Krasnodar.\r\n    Played there also the 2015-16 championship.\r\n    Signed for the 2016-17 season by Atlanta Hawks.\r\n    Played there also the 2017-18 championship.\r\n    Moved to China for the 2018-19 season, signed by Guandong Southern Tigers.\r\n    Moved to Spain for the 2019-20 season, signed by FC Barcelona.\r\n    Moved to Italy for the 2020-21 season, signed by Olimpia Milan.\r\n'),(68,'Krilo',2.01,'\r\n    Played college basketball at University of Nebraska (2012-16).\r\n    Moved to Germany for the 2016-17 season, signed by Fraport Skyliners Frankfurt.\r\n    In April\'17 moved to Italy, signed by Aquila Trento.\r\n    Played there also the 2017-18 championship.\r\n    Moved to Spain for the 2018-19 season, signed by Baskonia Vitoria-Gasteiz.\r\n    Played there also the 2019-20 championship.\r\n    Moved to Italy for the 2020-21 season, signed by Olimpia Milan.\r\n'),(69,'Krilo',2.03,'\r\n    Played college basketball at Penn State (2007-11).\r\n    Moved to Italy for the 2011-12 season, signed by BPA Jesi.\r\n    Signed for the 2012-13 season by Pallacanestro Cantu.\r\n    Signed for the 2013-14 season by Juve Caserta.\r\n    Signed for the 2014-15 season by Dinamo Sassari.\r\n    Moved to Russia for the 2015-16 season, signed by Avtodor Saratov.\r\n    Moved to Spain for the 2016-17 season, signed by Malaga CB.\r\n    Played there also the 2017-18 championship.\r\n    Moved to Italy for the 2018-19 season, signed by Olimpia Milan.\r\n    He\'s still playing there.\r\n'),(70,'Centar',1.98,'\r\n    Played college basketball at North Carolina Greensboro (2004-08).\r\n    Moved to Italy for the 2008-09 season, signed by Prima Veroli, Legadue.\r\n    Played there also the 2009-10 championship.\r\n    Moved to Germany for the 2010-11 season, signed by Brose Baskets Bamberg.\r\n    Moved to Greece for the 2011-12 season, signed by Olympiacos Piraeus.\r\n    Played there also the 2012-13 championship.\r\n    Moved to Russia for the 2013-14 season, signed by CSKA Moscow.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Italy for the 2020-21 season, signed by Olimpia Milan.\r\n'),(71,'Krilo',2.03,'\r\n    Grew up with Olbia Basket (Italy) youth teams.\r\n    Signed for the 2003-04 season by Mens Sana Basket Siena.\r\n    Played there till Ferbuary\'07.\r\n    Signed by Scafati Basket.\r\n    Played there also the 2007-08 season.\r\n    Signed for the 2008-09 season by Virtus Roma.\r\n    Played there till the 2012-13 championship.\r\n    Signed for the 2013-14 season by Detroit Pistons.\r\n    Played there till February \'15, also playing with Grand Rapids Drive, NBDL.\r\n    In February\'15, signed by Boston Cetics.\r\n    Moved to Turkey for the 2015-16 season, signed by Fenerbahce Istanbul.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Italy for the 2020-21 season, signed by Olimpia Milan.\r\n'),(72,'Krilo',2.04,'\r\n    Played college basketball at Weber State (2012-16).\r\n    Signed for the 2016-17 season by Utah Jazz, also played with Salt Lake City Stars, NBDL.\r\n    Signed for the 2017-18 season by Milwaukee Bucks, also played with Wisconsin Herd, G-League.\r\n    Moved to Russia for the 2018-19 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(73,'Bek',1.85,'\r\n    Played college basketball at Eastern Arizona JC (2008-09) and at Lamar (2010-12).\r\n    Moved to Croatia for the 2012-13 season, signed by KK Zagreb.\r\n    In February\'13 moved to Israel, signed by Galil Elyon.\r\n    Moved to Italy for the 2013-14 season, signed by Fulgor Omegna, DNA Silver.\r\n    Moved to Greece for the 2014-15 season, signed by Kolossos Rodou.\r\n    In December\'14 moved to Spain, signed by Baskonia Vitoria.\r\n    Played there also the 2015-16 championship.\r\n    Moved to Greece for the 2016-17 season, signed by Panathinaikos Athens.\r\n    Signed for the 2017-18 season by Phoenix Suns.\r\n    In January\'18 signed by New Orleans Pelicans.\r\n    In February\'18 back to Greece, signed by Panathinaikos Athens.\r\n    Moved to Italy for the 2018-19 season, signed by Olimpia Milan.\r\n    Moved to Russia for the 2019-20 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(74,'Bek',1.98,'\r\n    Played college basketball at Villanova (2011-15).\r\n    Signed for the 2015-16 season by Detroit Pistons, also played with Grand Rapids Drive, NBDL.\r\n    Played with both teams also the 2016-17 championship.\r\n    Signed for the 2017-18 season by San Antonio Spurs, also played with Austin Spurs, G-League.\r\n    Moved to Spain for the 2018-19 season, signed by Baskonia Vitoria-Gasteiz.\r\n    Moved to Russia for the 2019-20 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(75,'Bek',1.93,'\r\n    Grew up with Parma Basket Perm (Russia) juniors.\r\n    Made his debut with Parma Basket Perm, Superleague, during the 2013-14 season.\r\n    Played there till the 2017-18 championship.\r\n    Signed for the 2018-19 season by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(76,'Bek',1.96,'\r\n    Grew up with Victoria Libertas Pesaro (Italy) youth teams.\r\n    Played high-school basketball at St. John Bosco HS, Bellflower, Cal.\r\n    Played college basketball at USC (2006-09).\r\n    Moved to Italy for the 2009-10 season, signed by Benetton Basket Treviso.\r\n    Signed for the 2010-11 season by Svaolini Pesaro.\r\n    Played there also the 2011-12 championship.\r\n    Signed for the 2012-13 season by Mens Sana Basket Siena.\r\n    Played there till December\'13.\r\n    Signed on late December\'13 by Olimpia Milan.\r\n    Played there also the 2014-15 championship.\r\n    Moved to Greece for the 2015-16 season, signed by Olympiacos Piraeus.\r\n    Played there also the 2016-17 championship.\r\n    Moved to Germany for the 2017-18 season, signed by Brose Bamebrg.\r\n    Moved to Russia for the 2018-19 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(77,'Krilo',2.11,'\r\n    Made his debut with Tus Jena 2 (Germany), Regionalliga 2, during the 2009-10 season.\r\n    Signed for the 2010-11 season by Science City Jena, Pro A.\r\n    Played there also the 2011-12 championship.\r\n    Signed for the 2012-13 season by Fraport Skyliners Frankfurt.\r\n    Played there till the 2015-16 championship, also playing with the 2nd team.\r\n    Moved to Spain for the 2016-17 season, signed by Baskonia Vitoria-Gasteiz.\r\n    Played there till the 2018-19 championship.\r\n    Moved to Russia for the 2019-20 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(78,'Krilo',2.01,'\r\n    Played college basketball at University of Utah (2010-11) and at Iowa State (2011-13).\r\n    Moved to Germany for the 2013-14 season, signed by Ratiopharm Ulm.\r\n    Played there also the 2014-15 season.\r\n    Moved to Israel for the 2015-16 season, signed by Hapoel Holon.\r\n    Moved to Turkey for the 2016-17 season, signed by Darussafaka Dogus Istanbul.\r\n    Moved to Russia for the 2017-18 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(79,'Krilo',2.06,'\r\n    Grew up with Valencia CB (Spain) juniors.\r\n    Made his debut with Valencia CB Main team during the 2008-09 season, also playing with Valencia 2nd team.\r\n    Played with both teams also in the 2009-10 championship.\r\n    Moved to Belgium for the 2010-11 season, signed by Verviers-Pepinster.\r\n    Signed for the 2011-12 season by Spirou Charleroi.\r\n    Signed for the 2012-13 season by Brooklyn Ntes.\r\n    Also played with Springfield Armos, NBDL.\r\n    Played wth both teams till January\'14.\r\n    Signed by Chicago Bull in January\'14.\r\n    Moved to Spain for the 2014-15 season, signed by Baskonia Vitoria-Gasteiz.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Russia for the 2020-21 season, signed by CSKA Moscow.\r\n'),(80,'Krilo',2.02,'\r\n    Grew up wtih CSKA Moscow (Russia) juniors.\r\n    Made his debut with CSKA Moscow during the 2004-05 season.\r\n    Loaned for the 2005-06 season to Lokomotiv Rostov.\r\n    In November\'05 back to CSKA Moscow.\r\n    Played there till February\'08.\r\n    Signed for the remainder of the season by Unics Kazan.\r\n    Signed for the 2008-09 season by Spartak St. Petersburg.\r\n    Signed for the 2009-10 season by CSKA Moscow.\r\n    Played there till the 2011-12 championship.\r\n    Signed for the 2012-13 season by Spartak St. Petersburg.\r\n    Signed for the 2013-14 season by Unics Kazan.\r\n    Signed for the 2014-15 season by Lokomotiv Kuban Krasnodar.\r\n    Signed for the 2015-16 season by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(81,'Centar',2.13,'\r\n    Grew up with Hemofarm Vrsac (Serbia) juniors.\r\n    Made his debut with Hemofarm Vrsac during the 2011-12 season.\r\n    Signed for the 2012-13 season by BC Partizan Belgrade.\r\n    Played there till the 2014-15 championship.\r\n    Moved to Greece for the 2015-16 season, signed by Olympiacos Piraeus.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Russia for the 2020-21 season, signed by CSKA Moscow.\r\n'),(82,'Bek',1.31,'\r\n    Grew up with Ventspils augstskola (Latvia).\r\n    Made his debut with Ventspils augstskola during the 2006-07 season.\r\n    Signed for the 2007-08 season by BC Ventspils, also played with Ventspils augstskola.\r\n    Played with BC Ventpsils till November\'11.\r\n    Moved to Russia, signed by Spartak St. Petersburg.\r\n    Played there also the 2012-13 championship.\r\n    Moved to Ukraine for the 2013-14 season, signed by Budivelnik Kiev.\r\n    Moved to Germany for the 2014-15 season, signed by Borse Bamberg.\r\n    Played there till the 2016-17 championship.\r\n    Moved to Greece for the 2017-18 season, signed by Olympiacos Piraeus.\r\n    Played there also the 2018-19 championship.\r\n    Moved to Russia for the 2019-20 season, signed by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(83,'Krilo',2.02,'\r\n    Made his debut with Avtodor Samara (Russia), Higher League, during the 2006-07 season.\r\n    Played there till the 2008-09 championship.\r\n    Signed for the 2009-10 season by TSU-Basket Tambov.\r\n    Signed for the 2010-11 season by BC Nizhny Novgord.\r\n    Played there till the 2015-16 championship.\r\n    Signed for the 2016-17 season by CSKA Moscow.\r\n    He\'s still playing there.\r\n'),(84,'Bek',1.92,'\r\n    Grew up with CSKA Moscow (Russia) juniors.\r\n    Made his debut with CSKA Moscow 2nd team during the 2015-16 season.\r\n    Made his debut with CSKA main team during the 2018-19 season, also playing with CSKA 2nd Team, Superleague.\r\n    He\'s still playing there.\r\n'),(85,'Centar',2.08,'\r\n    Played college basketball at Brigham Young University (2009-13).\r\n    Signed for the 2013-14 season by Phladelphia 76ers.\r\n    Played there till December\'14.\r\n    Signed by Brooklyn Nets.\r\n    In January\'15 moved to France, signed by ES Chalon-sur-Saone.\r\n    Moved to Italy for the 2015-16 season, signed by Pallacanestro Varese.\r\n    Moved to France for the 2016-17 season, signed by AS Monaco Basket.\r\n    Moved to Lithuania for the 2017-18 season, signed by BC Zalgiris Kaunas.\r\n    Played there also the 2018-19 championship.\r\n    Moved to Spain for the 2019-20 season, signed by FC Barcelona.\r\n    He\'s still playing there.\r\n'),(86,'Bek',1.98,'\r\n    Played with Centre Federal du Basket-Ball (2008-10).\r\n    Signed for the 2010-11 season by Asvel Lyon-Villeurbanne.\r\n    Played there also the 2011-12 championship.\r\n    Moved to Serbia for the 2012-13 season, signed by BC Partizan Belgrade.\r\n    Played there also the 2013-14 championship.\r\n    Moved to France for the 2014-15 season by Limoges CSP.\r\n    Played there also the 2015-16 championship.\r\n    Moved to Lithuania for the 2016-17 season, signed by BC Zalgiris Kaunas.\r\n    Moved to Russia for the 2017-18 season, signed by CSKA Moscow.\r\n    Back to Lithuania for the 2018-19 season, signed by BC Zalgiris Kaunas.\r\n    Moved to Turkey for the 2019-20 season, signed by Fenerbahce Istanbul.\r\n    Played there till December\'20.\r\n    in January\'21 moved to Spain, signed by FC Barcelona.\r\n'),(87,'Krilo',2.00,'\r\n    Made his debut with Albacomp-UPC Szekesfehervar (Hungary) during the 2006-07 season.\r\n    Played there trough the 2010-11 championship.\r\n    Moved to Spain for the 2011-12 season, signed by Manresa Basquet.\r\n    Played there also the 2012-13 championship.\r\n    Signed for the 2013-14 season by Baskonia Vitoria Gasteiz.\r\n    Moved to Italy for the 2014-15 season, signed by SS Scandone Avellino.\r\n    In May\'15 back to Spain, signed by Baskonia Vitoria Gasteiz.\r\n    Played there till the 2016-17 championship.\r\n    Signed for the 2017-18 season by FC Barcelona.\r\n    He\'s still playing there.\r\n'),(88,'Bek',2.04,'\r\n    Grew up with Club Almafuerte de Las Varillas, Córdoba (Argentina) juniors.\r\n    Signed for the 2017-18 season by Bahia Blanca Basket.\r\n    Moved to Spain for the 2018-19 season, signed by FC Barcelona, played with FC Barcelona 2nd team, LEB Gold.\r\n    He\'s still playing there and made his debut with FC Barcelona main team during the 2019-20 season.\r\n'),(89,'Krilo',2.07,'\r\n    Made his debut with Baloncesto Fuenlabrada 2nd team, EBA (Spain) during the 2011-12 season.\r\n    Signed for the 2012-13 season by Avila CB, LEB Silver, and also made his debut with Fuenlabrada main team.\r\n    Played the 2013-14 and 2014-15 season with Fuenlabrada main team and 2nd team.\r\n    Played the 2015-16 season just with the main team.\r\n    Playd there till the 2017-18 championship.\r\n    Signed for the 2018-19 season, signed by FC Barcelona.\r\n    He\'s still playing there.\r\n'),(90,'Centar',2.08,'\r\n    Grew up with Manresa Basquet (Spain) juniors.\r\n    Made his debut with Manresa Basquet during the 2010-11 season, also playing with CE Saint Nicolau Sabadell, EBA.\r\n    Played with Manresa till the 2011-12 championship.\r\n    Signed for the 2012-13 season by Lleida CB, LEB Gold.\r\n    Signed for the 2013-14 season by CB Huesca, LEB Gold.\r\n    Signed for the 2014-15 season by Baloncesto Sevilla.\r\n    Played there also the 2015-16 championship.\r\n    Signed for the 2016-17 season by Valencia BC.\r\n    Signed for the 2017-18 season by FC Barcelona.\r\n    He\'s still playing there.\r\n'),(91,'Krilo',1.98,'\r\n    Made his debut with CB Rincon (Spain), LEB Gold, during the 2010-11 season, also playing with Unicaja II, EBA.\r\n    Signed for the 2011-12 season by CB Malaga, also played with CB Rincon.\r\n    Signed for the 2012-13 season by FC Barcelona.\r\n    Played there till the 2015-16 championship.\r\n    Signed for the 2016-17 season by Oklahoma City Thunder.\r\n    Played there till the 2018-19 championship.\r\n    Moved to Spain for the 2019-20 season, signed by FC Barcelona.\r\n'),(92,'Bek',1.95,'\r\n    Played college basketball at University of Colorado (2007-11).\r\n    Signed for the 2011-12 season by Erie Bay Hawks, NBDL.\r\n    In November\'11 signed by Denver Nuggets.\r\n    In December\'11, signed by Charlotte Bobcats.\r\n    Played there till December\'12.\r\n    In January\'13 signed by Erie Bay Hawks, NBDL.\r\n    Moved to Russia for the 2013-14 season, signed by Triumph Lyubertsy.\r\n    Moved to Turkey for the 2014-15 season, signed by Royal Hali Gaziantep.\r\n    Moved to Russia for the 2015-16 season, signed by CSKA Moscow.\r\n    Played there till the 2018-19 championship.\r\n    Moved to Spain for the 2019-20 season, signed by FC Barcelona.\r\n'),(93,'Krilo',1.93,'\r\n    Played college basketball at Louisville (2008-12).\r\n    Moved to Spain for the 2012-13 season, signed by Estudiantes Madrid.\r\n    Played there also the 2013-14 championship.\r\n    Signed for the 2014-15 season by CB Gran Canaria 2014.\r\n    Played there till the 2016-17 championship.\r\n    Moved to Russia for the 2017-18 season, signed by Zenit St. Petersburg.\r\n    Moved to Spain for the 2018-19 season, signed by FC Barcelona.\r\n    He\'s still playing there.\r\n'),(94,'Krilo',2.08,'Grew up with Real Madrid CF (Spain) juniors.\r\nMade his debut with Real Madrid during the 2008-09 season.\r\nSigned for the 2009-10 season by Faymasa Palencia, LEB-Gold.\r\nSigned for the 2010-11 season by Real Madrid CF.\r\nPlayed there till the 2013-14 championship.\r\nSigned for the 2014-15 season by Chicago Bulls.\r\nPlayed there till February\'18.\r\nSigned for the remainder of the 2017-18 season by New Orleans Pelicans.\r\nPlayed there till February\'19.\r\nSigned for the reaminder of the 2018-19 season by Milwaukee Bucks.\r\nMoved to Spain for the 2019-20 season, signed by FC Barcelona.'),(95,'Bek',1.96,'\r\n    Played high-school basketball at Winter Park, Fl.\r\n    Played college basketball at Florida University (2007-09).\r\n    Moved to Greece for the 2009-10 season, signed by Panathinaikos Athens.\r\n    Played there till the 2011-12 championship.\r\n    Moved to Russia for the 2012-13 season, signed by Lokomotiv Kuban.\r\n    Signed for the 2013-14 season by Memphis Grizzlies.\r\n    Played there also the 2014-15 championship.\r\n    Back to Greece for the 2015-16 season, signed by Panathinaikos Athens.\r\n    Played there till the 2019-20 championship.\r\n    Moved to Spain for the 2020-21 season, signed by FC Barcelona.\r\n'),(96,'Krilo',2.02,'\r\n    Grew up with FC Barcelona (Spain) juniors.\r\n    Made his debut with FC Barcelona 2, LEB Gold, during the 2015-16 season.\r\n    Made his debut with the main team during the 2017-18 season, also playing with the 2nd team.\r\n    He\'s still playing there.\r\n'),(97,'Centar',2.18,'\r\n    Grew up with Khimik OPZ Yuzny (Ukraine) juniors.\r\n    Made his debut with Khimik during the 2010-11 season.\r\n    Played there till the 2014-15 championship.\r\n    Moved to Spain for the 2015-16 season, signed by Obradoiro CAB.\r\n    Played there till the 2017-18 championship.\r\n    Signed for the 2018-19 season by FC Barcelona.\r\n    He\'s still playing there.\r\n'),(101,'Bek',1.86,'\r\n    Played college basketball at Tulane (2004-06) and at Washington State (2006-09).\r\n    Moved to Germany for the 2009-10 season, signed by MEG Goettingen.\r\n    Moved to Turkey for the 2010-11 season, signed by Galatasaray Istanbul.\r\n    In February\'11 moved to Germany, signed by Alba Berlin Basketball Team.\r\n    Moved to France for the 2011-12 season, signed by MSB Le Mans.\r\n    Moved to Spain for the 2012-13 season, signed by Baskonia Vitoria.\r\n    In January\'13 moved to Italy, signed by Pallacanestro Biella.\r\n    Signed for the 2013-14 season by Mens Sana Basket Siena.\r\n    In January\'14 moved to Russia, signed by BC Nizhny Novgorod.\r\n    Played there also the 2014-15 season.\r\n    Moved to Israel for the 2015-16 season, signed by Maccabi Tel Aviv.\r\n    Moved to Russia for the 2016-17 season, signed by Lokomotiv Kuban Krasnodar.\r\n    Moved to Serbia for the 2017-18 season, signed by Crvena Zvezda Belgrade.\r\n    Moved to China for the 2018-19 season, signed by Fujian Sturgeons.\r\n    In October\'18 signed by Tianjin Gold Lions.\r\n    In May\'19 signed by Anhui Wenyi.\r\n    In October\'19 moved to Greece, signed for the 2019-20 season by Olympiacos Piraeus.\r\n    Moved to Serbia for the 2020-21 season, signed by Crvena Zvezda Belgrade.\r\n'),(102,'Centar',2.10,'\r\n    Made his debut with Kalamunda Eastern Suns (Australia) during the 2014 season.\r\n    Played college basketball at Lee Junior College (2014-16) and at Louisiana State (2016-18).\r\n    Moved to Serbia for the 2018-19 season, signed by FMP Belgrade.\r\n    Played there also the 2019-20 championship.\r\n    Signed for the 2020-21 season by Crvena Zvezda Belgrade.\r\n'),(103,'Centar',2.06,'\r\n    Played college basketball at Lincoln Memorial University (2014-18).\r\n    Signed for the 2018-19 season by Canton Charge, G-League.\r\n    In January’19 signed by Phoenix Suns.\r\n    In February’19 signed by Miami Heat, also played with Sioux Falls Skyforce.\r\n    Moved to Turkey for the 2019-20 season, signed by Teksut Bandirma.\r\n    In February’20 moved to Israel, signed by Hapoel Jerusalem.\r\n    Moved to Serbia for the 2020-21 season, signed by Crvena Zvezda Belgrade.\r\n'),(126,'Krilo',1.88,'sagrsdhdsger'),(127,'sagfs',1.00,'afsgsd'),(128,'asdgwe',1.00,'sgrewrfsadfedw'),(129,'Bek',1.89,'fdghjsdfktsdcb');
/*!40000 ALTER TABLE `igrac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igracidealnepetorke`
--

DROP TABLE IF EXISTS `igracidealnepetorke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igracidealnepetorke` (
  `IdOsobe` int NOT NULL,
  `IdSezone` int NOT NULL,
  PRIMARY KEY (`IdOsobe`,`IdSezone`),
  KEY `fk_IgracIdealnePetorke_Sezona1_idx` (`IdSezone`),
  CONSTRAINT `fk_IgracIdealnePetorke_Igrac1` FOREIGN KEY (`IdOsobe`) REFERENCES `igrac` (`IdOsobe`),
  CONSTRAINT `fk_IgracIdealnePetorke_Sezona1` FOREIGN KEY (`IdSezone`) REFERENCES `sezona` (`IdSezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igracidealnepetorke`
--

LOCK TABLES `igracidealnepetorke` WRITE;
/*!40000 ALTER TABLE `igracidealnepetorke` DISABLE KEYS */;
/*!40000 ALTER TABLE `igracidealnepetorke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igrackola`
--

DROP TABLE IF EXISTS `igrackola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igrackola` (
  `IdOsobe` int NOT NULL,
  `IdKola` int NOT NULL,
  `Faza` varchar(45) NOT NULL,
  `IdSezone` int NOT NULL,
  PRIMARY KEY (`IdOsobe`,`IdKola`,`Faza`,`IdSezone`),
  KEY `fk_IgracKola_Igrac1_idx` (`IdOsobe`),
  KEY `fk_igrackola_kolo1_idx` (`IdKola`,`Faza`,`IdSezone`),
  CONSTRAINT `fk_IgracKola_Igrac1` FOREIGN KEY (`IdOsobe`) REFERENCES `igrac` (`IdOsobe`),
  CONSTRAINT `fk_igrackola_kolo1` FOREIGN KEY (`IdKola`, `Faza`, `IdSezone`) REFERENCES `kolo` (`IdKola`, `Faza`, `IdSezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igrackola`
--

LOCK TABLES `igrackola` WRITE;
/*!40000 ALTER TABLE `igrackola` DISABLE KEYS */;
/*!40000 ALTER TABLE `igrackola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igracnautakmici`
--

DROP TABLE IF EXISTS `igracnautakmici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igracnautakmici` (
  `IdOsobe` int NOT NULL,
  `IdUtakmice` int NOT NULL,
  `PTS` int NOT NULL,
  `MIN` varchar(15) NOT NULL,
  `2FGM` int NOT NULL,
  `2FGA` int NOT NULL,
  `3FGM` int NOT NULL,
  `3FGA` int NOT NULL,
  `FTM` int NOT NULL,
  `FTA` int NOT NULL,
  `AS` int NOT NULL,
  `OReb` int NOT NULL,
  `DReb` int NOT NULL,
  `BLK` int NOT NULL,
  `STL` int NOT NULL,
  `Fouls` int NOT NULL,
  PRIMARY KEY (`IdOsobe`,`IdUtakmice`),
  KEY `fk_Igrac_has_Utakmica_Utakmica1_idx` (`IdUtakmice`),
  KEY `fk_igracnautakmici_igrac1_idx` (`IdOsobe`),
  CONSTRAINT `fk_Igrac_has_Utakmica_Utakmica1` FOREIGN KEY (`IdUtakmice`) REFERENCES `utakmica` (`IdUtakmice`),
  CONSTRAINT `fk_igracnautakmici_igrac1` FOREIGN KEY (`IdOsobe`) REFERENCES `igrac` (`IdOsobe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igracnautakmici`
--

LOCK TABLES `igracnautakmici` WRITE;
/*!40000 ALTER TABLE `igracnautakmici` DISABLE KEYS */;
INSERT INTO `igracnautakmici` VALUES (3,38,2,'22:46',1,2,0,2,0,0,0,1,2,0,1,5),(3,47,6,'20:15',0,0,2,3,0,0,1,0,0,0,0,1),(3,51,9,'25:41',0,0,3,4,0,0,0,0,0,0,0,5),(6,38,10,'16:35',2,6,2,2,0,0,0,1,1,1,0,5),(6,47,5,'18:16',1,3,1,3,0,0,3,1,2,0,1,4),(6,51,14,'28:34',3,4,2,4,2,2,4,0,0,0,0,2),(21,47,0,'3:25',0,1,0,1,0,0,0,0,1,0,0,1),(22,38,6,'22:21',0,5,2,2,0,0,6,1,0,1,3,0),(22,47,9,'16:27',4,6,0,2,1,1,2,2,0,0,2,1),(23,38,31,'30:33',9,15,2,6,7,7,1,0,6,0,1,4),(23,47,7,'10:38',2,2,1,4,0,0,0,0,2,0,0,1),(24,38,5,'33:06',1,2,1,3,0,0,1,2,3,0,2,2),(24,47,12,'22:40',4,4,1,4,1,1,4,1,3,0,0,2),(25,47,12,'24:16',0,1,3,8,3,3,5,0,1,0,0,1),(25,51,13,'20:42',2,2,3,4,0,0,0,0,0,0,0,0),(26,43,6,'19:34',0,0,2,5,0,0,0,0,0,0,0,1),(26,48,11,'16:19',4,6,1,3,0,0,0,0,1,0,1,1),(27,43,7,'18:35',2,2,0,5,3,3,3,0,2,0,2,3),(27,48,11,'25:34',1,7,1,5,6,6,3,0,0,2,3,2),(28,43,12,'25:59',3,6,2,2,0,0,1,2,2,3,3,0),(28,48,2,'25:36',1,4,0,3,0,0,0,1,1,0,0,2),(29,48,2,'13:24',1,1,0,1,0,0,0,1,1,0,0,2),(30,43,13,'25:24',2,3,3,7,0,0,0,0,0,0,0,1),(32,47,23,'23:21',3,3,5,8,2,2,1,1,1,0,3,1),(32,51,39,'35:21',8,10,7,8,2,2,5,0,0,0,2,1),(33,43,9,'24:53',0,1,3,4,0,0,3,0,2,1,1,0),(33,47,11,'19:06',1,1,3,4,0,0,2,0,0,0,0,0),(33,51,19,'20:32',5,7,2,3,3,3,0,0,0,0,0,2),(34,43,10,'25:17',2,4,2,3,0,0,3,0,2,0,2,2),(34,47,2,'13:01',1,1,0,1,0,0,1,1,3,0,0,2),(35,43,0,'0:33',0,0,0,0,0,0,0,0,0,0,0,0),(36,43,23,'26:27',8,10,0,0,7,7,1,4,2,1,0,2),(36,51,10,'28:30',5,6,0,0,0,0,0,0,0,0,0,0),(37,43,13,'36:00',3,5,1,6,4,4,13,0,5,0,0,0),(37,47,13,'30:42',2,3,3,5,0,0,3,1,3,0,0,3),(38,44,6,'24:18',1,4,1,7,1,1,0,0,3,0,2,2),(38,48,14,'20:17',2,4,2,2,4,4,1,0,2,0,1,1),(38,51,25,'35:10',4,6,5,6,2,2,0,0,0,0,0,0),(39,44,0,'23:49',0,2,0,1,0,0,1,0,2,1,0,4),(39,48,12,'18:46',3,4,1,2,3,3,2,0,3,0,0,1),(41,44,11,'22:40',1,1,3,6,0,0,2,0,0,0,0,3),(41,48,5,'19:23',2,4,0,2,1,1,0,0,2,0,0,2),(42,44,0,'10:06',0,2,0,0,0,0,1,0,1,0,0,0),(42,48,0,'5:38',0,1,0,1,0,0,1,0,0,0,0,0),(43,44,0,'14:18',0,1,0,1,0,0,2,0,1,0,1,0),(43,48,2,'15:52',1,2,0,2,0,0,1,0,1,0,0,3),(44,43,5,'10:25',1,1,1,2,0,0,1,0,0,0,0,1),(44,48,3,'14:05',0,0,1,4,0,0,0,0,2,0,0,3),(45,43,0,'4:22',0,0,0,1,0,0,1,0,0,0,0,1),(45,48,2,'7:35',1,2,0,1,0,0,0,1,0,0,0,2),(47,43,0,'2:41',0,1,0,0,0,0,0,0,0,0,0,1),(47,48,8,'22:44',1,6,2,5,0,0,0,4,3,0,0,2),(48,43,4,'17:14',2,5,0,2,0,0,1,2,1,2,0,3),(49,43,6,'22:56',3,5,0,1,0,0,1,1,6,0,2,2),(49,48,6,'24:17',3,5,0,0,0,0,0,2,3,0,2,1),(50,43,5,'18:09',1,2,0,1,3,3,8,0,4,0,3,0),(50,48,0,'16:05',0,1,0,2,0,0,1,1,2,0,1,0),(51,43,7,'23:36',2,6,1,2,0,0,3,3,3,1,0,3),(51,48,6,'25:55',1,2,0,0,4,4,5,3,6,0,0,3),(52,43,7,'11:05',2,2,1,1,0,0,0,0,1,0,0,1),(52,48,4,'10:22',2,5,0,0,0,0,1,0,1,0,0,3),(54,38,0,'13:45',0,0,0,2,0,0,0,0,0,0,0,2),(55,38,0,'13:19',0,2,0,0,0,0,0,2,0,0,0,1),(56,38,11,'26:13',1,5,1,1,6,6,2,4,2,1,0,0),(56,47,7,'20:39',2,3,1,2,0,0,1,0,2,0,0,1),(57,47,0,'13:59',0,0,0,1,0,0,6,0,2,0,1,0),(58,47,2,'4:45',1,1,0,0,0,0,0,0,0,0,1,0),(59,43,4,'14:10',2,3,0,0,0,0,1,0,1,0,2,0),(59,47,7,'26:59',2,4,1,2,0,0,2,1,9,0,1,1),(60,43,2,'1:28',1,1,0,0,0,0,0,0,0,0,0,0),(60,47,12,'22:55',5,7,0,3,2,2,1,0,0,2,0,2),(61,43,6,'23:26',1,4,1,2,1,1,2,1,4,0,2,3),(61,47,0,'6:59',0,1,0,0,0,0,0,0,1,0,0,0),(62,43,13,'12:05',6,8,0,0,1,1,0,2,0,3,1,1),(62,47,6,'17:05',2,2,0,0,2,2,2,1,2,0,1,1),(63,43,10,'25:05',2,3,2,3,0,0,3,1,3,0,1,1),(63,47,10,'26:12',2,4,2,3,0,0,6,1,2,0,0,0),(64,43,3,'9:04',0,1,1,2,0,0,2,0,1,0,1,3),(64,47,0,'4:10',0,0,0,3,0,0,1,1,0,0,0,1),(65,48,12,'16:19',1,2,2,3,4,4,5,0,2,0,1,1),(66,44,3,'9:24',1,1,0,0,1,1,1,1,0,0,0,2),(66,48,3,'17:42',1,2,0,0,1,1,1,3,3,0,2,1),(67,44,41,'27:36',10,4,4,8,9,9,4,0,0,0,2,3),(67,48,9,'22:12',3,6,1,4,0,0,3,0,4,0,0,4),(68,44,12,'24:26',3,7,2,3,0,0,0,1,1,0,1,1),(68,48,7,'18:05',1,2,1,3,2,2,2,0,3,0,2,0),(69,44,4,'14:31',1,3,0,0,2,2,0,4,2,0,0,2),(69,48,3,'16:16',0,1,1,1,0,0,1,0,5,1,0,1),(70,44,10,'23:30',5,6,0,0,0,0,5,5,5,1,0,3),(70,48,5,'19:28',1,2,0,0,3,3,1,0,3,1,0,1),(71,44,2,'5:22',0,1,0,0,2,2,0,0,0,0,0,1),(71,48,3,'10:02',0,0,1,2,0,0,0,0,1,1,0,1),(72,49,7,'12:29',1,3,1,1,2,2,0,0,0,0,0,2),(73,38,4,'33:20',2,5,0,4,0,0,8,0,1,1,1,3),(73,49,18,'31:25',5,8,1,6,5,5,4,0,4,1,1,3),(74,38,2,'13:50',1,2,0,2,0,0,0,0,1,2,0,4),(74,49,10,'29:01',5,15,0,6,0,0,3,4,5,2,0,2),(75,38,2,'6:49',1,2,0,0,0,0,0,0,0,0,0,1),(76,38,29,'35:52',3,4,6,8,5,5,3,2,3,0,2,0),(77,38,9,'33:19',3,5,0,1,3,3,1,0,5,0,0,2),(77,49,5,'15:13',0,4,1,2,2,2,0,5,2,0,1,2),(78,38,18,'36:17',5,10,1,5,5,5,1,2,2,0,0,2),(79,38,8,'21:02',1,1,1,2,3,3,3,1,3,0,1,5),(79,49,10,'27:31',2,6,1,2,3,3,1,2,5,1,0,2),(80,38,5,'34:29',0,2,1,3,2,2,0,1,1,3,0,0),(80,49,4,'26:40',1,1,0,2,2,2,1,0,2,1,1,3),(81,38,2,'9:24',1,1,0,0,0,0,0,1,2,0,0,2),(81,49,15,'26:18',5,6,0,0,5,5,1,5,1,0,0,2),(82,49,4,'16:50',1,3,0,2,2,2,4,0,0,0,0,0),(83,38,0,'0:29',0,0,0,0,0,0,0,0,1,0,0,0),(83,49,2,'7:04',1,1,0,0,0,0,0,0,1,0,1,1),(84,38,0,'0:09',0,0,0,0,0,0,0,0,0,0,0,0),(84,49,0,'7:29',0,3,0,0,0,0,0,1,0,0,0,2),(85,44,21,'24:33',8,10,0,0,5,5,0,3,3,0,1,2),(86,49,0,'4:33',0,0,0,1,0,0,0,0,1,0,0,0),(87,44,5,'16:23',1,1,1,2,0,0,2,0,1,0,1,2),(87,49,7,'14:16',1,3,1,3,2,2,1,0,0,1,0,3),(88,44,0,'7:06',0,0,0,0,0,0,2,0,0,0,0,3),(88,49,3,'0:31',0,0,1,1,0,0,0,0,0,0,0,0),(89,44,4,'11:28',1,1,0,1,2,2,0,0,3,0,0,0),(89,49,4,'19:47',1,1,0,1,2,2,0,0,4,1,0,2),(90,44,4,'15:05',2,6,0,0,0,0,0,2,2,0,1,2),(90,49,4,'20:58',1,3,0,0,2,2,2,2,4,0,0,4),(91,49,19,'29:50',1,3,5,9,2,2,1,0,2,1,0,0),(92,44,16,'29:45',3,7,3,3,1,1,2,2,4,0,1,2),(92,49,25,'28:52',9,13,0,4,7,7,2,0,6,0,1,2),(93,44,6,'13:57',0,0,2,2,0,0,0,0,0,0,0,0),(93,49,5,'15:20',1,1,1,2,0,0,0,0,0,0,0,3),(94,44,19,'28:47',7,13,0,2,5,5,1,3,7,0,3,1),(95,44,5,'26:57',1,3,1,2,0,0,14,1,2,0,1,3),(95,49,13,'26:38',2,6,3,5,0,0,7,1,5,2,0,4),(96,44,0,'0:07',0,0,0,0,0,0,0,0,0,0,0,0),(96,49,6,'22:44',1,2,1,1,1,1,1,3,2,0,0,4),(97,49,2,'13:19',1,2,0,0,0,0,0,2,0,1,1,3),(101,38,2,'18:40',1,3,0,1,0,0,5,1,1,0,0,0),(102,38,7,'10:15',2,3,1,1,0,0,0,1,1,1,0,2),(102,47,10,'18:03',2,2,2,3,0,0,1,0,0,0,0,1),(103,38,10,'17:27',4,5,0,0,2,2,0,0,2,2,0,5);
/*!40000 ALTER TABLE `igracnautakmici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igracsezone`
--

DROP TABLE IF EXISTS `igracsezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igracsezone` (
  `IdSezone` int NOT NULL,
  `IdOsobe` int NOT NULL,
  PRIMARY KEY (`IdSezone`,`IdOsobe`),
  KEY `fk_IgracSezone_Sezona1_idx` (`IdSezone`),
  KEY `fk_IgracSezone_Igrac1_idx` (`IdOsobe`),
  CONSTRAINT `fk_IgracSezone_Igrac1` FOREIGN KEY (`IdOsobe`) REFERENCES `igrac` (`IdOsobe`),
  CONSTRAINT `fk_IgracSezone_Sezona1` FOREIGN KEY (`IdSezone`) REFERENCES `sezona` (`IdSezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igracsezone`
--

LOCK TABLES `igracsezone` WRITE;
/*!40000 ALTER TABLE `igracsezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `igracsezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igrau`
--

DROP TABLE IF EXISTS `igrau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igrau` (
  `IdSezone` int NOT NULL,
  `IdKluba` int NOT NULL,
  `IdOsobe` int NOT NULL,
  `Dres` int DEFAULT NULL,
  PRIMARY KEY (`IdSezone`,`IdKluba`,`IdOsobe`),
  KEY `fk_igrau_igrac1_idx` (`IdOsobe`),
  CONSTRAINT `fk_igrau_igrac1` FOREIGN KEY (`IdOsobe`) REFERENCES `igrac` (`IdOsobe`),
  CONSTRAINT `fk_igrau_klubsezona1` FOREIGN KEY (`IdSezone`, `IdKluba`) REFERENCES `klubsezona` (`IdSezone`, `IdKluba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igrau`
--

LOCK TABLES `igrau` WRITE;
/*!40000 ALTER TABLE `igrau` DISABLE KEYS */;
INSERT INTO `igrau` VALUES (1,2,3,10),(1,2,6,6),(1,2,24,7),(1,2,25,13),(1,2,38,0),(1,2,56,21),(1,5,27,3),(1,5,28,5),(1,5,29,6),(1,5,30,8),(1,5,44,9),(1,5,45,10),(1,5,51,43),(1,6,32,0),(1,6,33,1),(1,6,35,3),(1,6,36,21),(1,6,58,0),(1,6,60,15),(1,8,72,3),(1,8,73,5),(1,8,74,32),(1,8,75,7),(1,8,77,17),(1,8,78,21),(1,8,80,41),(1,8,82,13),(1,8,83,11),(2,2,3,10),(2,2,6,2),(2,2,21,15),(2,2,22,0),(2,2,23,1),(2,2,24,3),(2,2,25,7),(2,2,53,4),(2,2,54,19),(2,2,55,32),(2,2,56,21),(2,2,57,55),(2,2,101,57),(2,2,102,11),(2,2,103,33),(2,5,26,13),(2,5,27,0),(2,5,28,3),(2,5,29,5),(2,5,30,6),(2,5,31,8),(2,5,44,9),(2,5,45,10),(2,5,46,11),(2,5,47,19),(2,5,48,20),(2,5,49,32),(2,5,50,33),(2,5,51,43),(2,5,52,50),(2,6,32,16),(2,6,33,0),(2,6,34,1),(2,6,35,2),(2,6,36,3),(2,6,37,22),(2,6,58,4),(2,6,59,18),(2,6,60,15),(2,6,61,23),(2,6,62,42),(2,6,63,44),(2,6,64,19),(2,7,38,0),(2,7,39,2),(2,7,40,3),(2,7,41,5),(2,7,42,9),(2,7,43,10),(2,7,65,13),(2,7,66,15),(2,7,67,23),(2,7,68,31),(2,7,69,32),(2,7,70,42),(2,7,71,70),(2,8,72,3),(2,8,73,5),(2,8,74,6),(2,8,75,7),(2,8,76,10),(2,8,77,17),(2,8,78,21),(2,8,79,23),(2,8,80,41),(2,8,81,33),(2,8,82,13),(2,8,83,11),(2,8,84,4),(2,9,85,0),(2,9,86,2),(2,9,87,5),(2,9,88,8),(2,9,89,9),(2,9,90,10),(2,9,91,18),(2,9,92,21),(2,9,93,22),(2,9,94,24),(2,9,95,33),(2,9,96,99),(2,9,97,23),(3,7,126,10),(3,9,93,5),(3,9,129,1),(3,15,128,3);
/*!40000 ALTER TABLE `igrau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klub`
--

DROP TABLE IF EXISTS `klub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klub` (
  `IdKluba` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `IdPredsjednika` int NOT NULL,
  `Info` text,
  `IdAdrese` int NOT NULL,
  `Grb` varchar(100) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `ZvanicnaStranica` varchar(150) DEFAULT NULL,
  `Twitter` varchar(150) DEFAULT NULL,
  `Instagram` varchar(150) DEFAULT NULL,
  `Facebook` varchar(150) DEFAULT NULL,
  `YouTube` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`IdKluba`),
  KEY `fk_Klub_Predsjednik1_idx` (`IdPredsjednika`),
  KEY `fk_Klub_Adresa1_idx` (`IdAdrese`),
  CONSTRAINT `fk_Klub_Adresa1` FOREIGN KEY (`IdAdrese`) REFERENCES `adresa` (`IdAdrese`),
  CONSTRAINT `fk_Klub_Predsjednik1` FOREIGN KEY (`IdPredsjednika`) REFERENCES `predsjednik` (`IdOsobe`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klub`
--

LOCK TABLES `klub` WRITE;
/*!40000 ALTER TABLE `klub` DISABLE KEYS */;
INSERT INTO `klub` VALUES (2,'Crvena Zvezda',2,'Crvena Zvezda mts Belgrade comes off an up-and-down Turkish Airlines EuroLeague season in which it combined great moments with not-so-satisfying ones. The club had a slow start in the competition with just two wins from its first nine games. Zvezda signed head coach Dragan Sakota midseason to replace Milan Tomic (and interim coach Andrija Gavrilovic) and added Kevin Punter and Vladimir Stimac. Lorenzo Brown found his rhythm, too, and Zvezda went on to win seven of its next nine EuroLeague games, including victories in Kaunas, Milan, St Petersburg and Villeurbanne. That brought Zvezda\'s record to 9-9 record, but the team only won two of its next 10 games and ranked 14th with an 11-17 record when the season was canceled due to the COVID-19 pandemic. At that moment, Zvezda ranked third in the Adriatic League with a 14-7 record and had suffered a heartbreaking 84-85 overtime loss against archrival Partizan NIS Belgrade in the Serbian Radivoj Korac Cup final. ',1,'C:\\Users\\Hp\\Downloads\\Clubs Images\\crvena.png','+381 11 328 4780','www.kkcrvenazvezda.rs/',' @kkcrvenazvezda','@crvenazvezdakk/',' kkcrvenazvezda',''),(5,'Alba Berlin',4,'ALBA Berlin comes back to the Turkish Airlines EuroLeague for the first time since 2015. In its last four 7DAYS EuroCup appearances the club has gone up year after year and it shifted gears in 2017 when it signed legendary coach Aito Garcia Reneses. Last season, Aito\'s second with the team, ALBA roared to a 5-1 start to the regular season with high scoring averages. The Berliners had to deal with important injuries that affected the core of the roster, but a 7-3 mark at the end of the regular season allowed them to place second in Group B. In the Top 16, ALBA dominated again and won Group E, paving the way to bigger things, including an MVP of the season award for Luke Sikma and a Coach of the Year accolade for Aito. ALBA disposed of Unicaja Malaga in quarterfinals 2-1 and then swept the semis against MoraBanc Andorra to set up a repeat from its first EuroCup Finals in 2010: Valencia Basket. ALBA fought, but only managed to win its game at home after a thrilling overtime and Valencia claimed its fourth EuroCup title in Spain. That did not change the fact that ALBA had had a magical run in the competition. In the German League, ALBA landed third in the regular season at 27-7 and in the playoffs, the team plowed through the quarterfinals and semifinals with respective sweeps to face archrival FC Bayern Munich in the decisive round and earn its EuroLeague ticket for 2019-20. Bayern swept the series, but ALBA lost all the games by 5 or fewer points, making it clear that it remains a major contender in Germany. ',2,'C:\\Users\\Hp\\Downloads\\Clubs Images\\alba.png','+49 30 300 905 10','','@albaberlin','@albaberlin','albaberlin',''),(6,'Anadolu Efes Istanbul',17,'Anadolu Efes Istanbul established itself as one of the teams to beat in continental basketball in the 2019-20 season that was canceled by the COVID-19 pandemic. Efes played outstanding basketball in the Turkish Airlines EuroLeague all season long. With the same coach, Ergin Ataman, and the same core of players that reached the championship game the year before featuring Shane Larkin, Vasilije Micic, Rodrigue Beaubois, Krunoslav Simon, James Anderson, Adrien Moerman, Bryant Dunston and Tibor Pleiss, among others, Efes ranked topped the standings with a 24-4 record when the competition was halted. Before that, Larkin broke the EuroLeague\'s single-game scoring record with 49 points against FC Bayern Munich on November 29, 2019. Larkin was chosen MVP of the Month in both November and January and earned MVP of the Round honors six times. He was the MVP in four consecutive rounds, from Rounds 18 to 21, to set another record. Efes also led the Turkish League with a 21-2 record, but had lost against Darussafaka Tekfen Istanbul in the Turkish Cup quarterfinals.',3,'C:\\Users\\Hp\\Downloads\\Clubs Images\\anadolu.png','+90 212 449 38 84','www.anadoluefessk.org','@anadoluefessk','@anadoluefessk','AnadoluEfesSK','www.youtube.com/channel/UCNgZ4KBDtA7Z-Jgf-geLLVg'),(7,'AX Armani Exchange Milan',18,'Milan comes off an interesting season in which it set the basis for a brighter future. The club hired coaching legend Ettore Messina to run the show and he brought in experienced stars such as Sergio Rodriguez and Luis Scola. Everything clicked right away; Milan won six of its first seven games and Rodriguez was chosen as the EuroLeague MVP for October 2019. After an injury to center Arturas Gudaitis, the team struggled to find its rhythm after such a great start. Milan only won five of its last 19 games and was out of the playoff zone with a 12-16 record when the season was canceled due to the COVID-19 pandemic. Back in Italy, Milan ranked fourth in the standings at 14-7 and was knocked off by Umana Reyer Venice in the Italian Cup semifinals. With interesting arrivals such as Kyle Hines and Malcolm Delaney for the 2020-21 campaign, Milan can reach much higher with Coach Messina at the helm. ',4,'C:\\Users\\Hp\\Downloads\\Clubs Images\\ea7.png','+39 02 7000 16 15 ','www.olimpiamilano.com/','@olimpiami1936','@olimpiamilano1936','OlimpiaMilano1936','www.youtube.com/channel/UC-74Lw-UoS1UG7MLsA5VcTQ'),(8,'CSKA Moscow',19,'CSKA Moscow came off a near-perfect 2018-19 season and started a new campaign with a modified core of players. Mike James, Darrun Hilliard and Johannes Voigtmann arrived to play big roles, but one of its pillars, 2019 Final Four MVP Will Clyburn, was lost for the season due to a torn ACL suffered in Round 4. Even so, James led CSKA to a solid start with victories in five of its first six Turkish Airlines EuroLeague games. CSKA soon added Howard Sant-Roos to replace Clyburn and struggled more than in previous seasons with five rare home losses. Nevertheless, CSKA managed to clinch a playoff spot before the season was canceled due to the COVID-19 pandemic. At that point, CSKA ranked fourth with a 19-9 record, the same as Maccabi FOX Tel Aviv. CSKA was second in the VTB League with a 15-4 record when that competition was canceled, too. The club has already landed Nikola Milutinov and extended James\'s deal, setting the basis for a new core of players that should lead CSKA to its usual standards - competing for every trophy and every game.',5,'C:\\Users\\Hp\\Downloads\\Clubs Images\\cska.png','+7 495 225 2662','cskabasket.com','@cskabasket','@cskabasket','cskabasket','www.youtube.com/channel/UCvW3rUz6sTtFGw7wkwQnL4Q'),(9,'FC Barcelona',20,'FC Barcelona took a major step towards a return to its old standards in the 2018-19 season as it challenged for every title available. The club brought in experienced players like Kevin Pangos, Chris Singleton and Kyle Kuric and Barcelona enjoyed a good start in the Turkish Airlines EuroLeague by winning five of its first seven games. Barcelona bounced back after a four-game losing streak to win nine of its next 11 and qualify to the playoffs in advance. Barca finished the regular season in fifth place with an 18-12 record. It was Barcelona\'s first playoff appearance under the new format. Coach Svetislav Pesic\'s men stole home-court advantage from Anadolu Efes Istanbul, but then lost in Game 3 at home and Game 5 in Turkey, thus missing its chance to reach the Final Four for the first time since 2014. Barcelona was competitive in domestic action; it won the Spanish Copa del Rey by downing Real Madrid 94-93 in overtime with Thomas Heurtel earning MVP honors. Real took revenge in the Spanish League finals. Still, Barcelona managed to add new titles and raise its competitive level in a 2018-19 season that could be a turning point for the EuroLeague power.',6,'C:\\Users\\Hp\\Downloads\\Clubs Images\\fcbarcelona.png','+34 93 496 3714','www.fcbarcelona.com/en/basketball/','@fcbbasket','@fcbbasket','FCBbasket','www.youtube.com/channel/UC14UlmYlSNiQCBe9Eookf_A'),(15,'Khimki Moscow Region',4,'Khimki Moscow Region is set to start its fourth consecutive Turkish Airlines Euroleague campaign fully established as a powerhouse able to beat anyone, anywhere. Last season, Khimki returned Janis Timma, Anthony Gill and superstar guard Alexey Shved and surrounded them with talented players such as Devin Booker, Jonas Jerebko and Stefan Jovic. Khimki had a strong start to the EuroLeague regular season with victories in six of its first eight games. Khimki, however, went on to win just three of the next 13 games, which damaged its playoff chances. The club regained momentum again, winning four of its last five games before the season was canceled due to the COVID-19 pandemic. At that time, Khimki ranked seventh with a 13-15 record and led the VTB League standings at 18-1 before that competition was canceled without a winner, too. Khimki looks to return even stronger, with the right combination of talent and experience, to make more noise than ever. ',7,'C:\\Users\\Hp\\Downloads\\Clubs Images\\khimki.png','+7495 572 0744','https://en.bckhimki.com/','@khimkibasket','@khimkibasket/','khimkibasket/','https://www.youtube.com/channel/UC3EMkdrPSFHdoEJCjVqSm1Q'),(19,'pNaziv',1,'pInfo',1,'pGrb','pTelefon','pStranica','pTwitter','pInstagram','pFacebook','pYouTube');
/*!40000 ALTER TABLE `klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klubsezona`
--

DROP TABLE IF EXISTS `klubsezona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klubsezona` (
  `IdSezone` int NOT NULL,
  `IdKluba` int NOT NULL,
  `W` int NOT NULL DEFAULT '0',
  `L` int NOT NULL DEFAULT '0',
  `PTS+` int NOT NULL DEFAULT '0',
  `PTS-` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdSezone`,`IdKluba`),
  KEY `fk_klubsezona_klub1_idx` (`IdKluba`),
  CONSTRAINT `fk_klubsezona_klub1` FOREIGN KEY (`IdKluba`) REFERENCES `klub` (`IdKluba`),
  CONSTRAINT `fk_klubsezona_sezona1` FOREIGN KEY (`IdSezone`) REFERENCES `sezona` (`IdSezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klubsezona`
--

LOCK TABLES `klubsezona` WRITE;
/*!40000 ALTER TABLE `klubsezona` DISABLE KEYS */;
INSERT INTO `klubsezona` VALUES (1,2,0,1,74,75),(1,5,0,0,0,0),(1,6,1,0,75,74),(1,8,0,0,0,0),(2,2,1,1,158,170),(2,5,0,2,127,168),(2,6,2,0,179,144),(2,7,1,1,146,142),(2,8,0,2,159,174),(2,9,2,0,175,146),(3,7,0,0,0,0),(3,8,0,0,0,0),(3,9,0,0,0,0),(3,15,0,0,0,0);
/*!40000 ALTER TABLE `klubsezona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kolo`
--

DROP TABLE IF EXISTS `kolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kolo` (
  `IdKola` int NOT NULL AUTO_INCREMENT,
  `Rb` int NOT NULL,
  `Faza` varchar(45) NOT NULL,
  `IdSezone` int NOT NULL,
  PRIMARY KEY (`IdKola`,`Faza`,`IdSezone`),
  KEY `fk_Kolo_FazaTakmicenja1_idx` (`Faza`,`IdSezone`),
  CONSTRAINT `fk_Kolo_FazaTakmicenja1` FOREIGN KEY (`Faza`, `IdSezone`) REFERENCES `fazatakmicenja` (`Faza`, `IdSezone`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kolo`
--

LOCK TABLES `kolo` WRITE;
/*!40000 ALTER TABLE `kolo` DISABLE KEYS */;
INSERT INTO `kolo` VALUES (1,1,'Regularna faza',2),(2,2,'Regularna faza',2),(3,3,'Regularna faza',2),(4,4,'Regularna faza',2),(5,5,'Regularna faza',2),(6,6,'Regularna faza',2),(7,1,'Playoff',2),(8,2,'Playoff',2),(9,3,'Playoff',2),(10,4,'Playoff',2),(11,5,'Playoff',2),(12,1,'Regularna faza',1),(13,1,'Playoff',1),(14,2,'Regularna faza',1),(15,2,'Playoff',1),(16,3,'Regularna faza',1),(17,3,'Playoff',1),(18,4,'Regularna faza',1),(19,4,'Playoff',1),(20,5,'Regularna faza',1),(21,5,'Playoff',1),(22,6,'Regularna faza',1);
/*!40000 ALTER TABLE `kolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoba` (
  `IdOsobe` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) NOT NULL,
  `Prezime` varchar(45) NOT NULL,
  `DatumRodjenja` date NOT NULL,
  `Slika` varchar(100) DEFAULT NULL,
  `IdDrzave` int NOT NULL,
  PRIMARY KEY (`IdOsobe`),
  KEY `fk_Osoba_Drzava1_idx` (`IdDrzave`),
  CONSTRAINT `fk_Osoba_Drzava1` FOREIGN KEY (`IdDrzave`) REFERENCES `drzava` (`IdDrzave`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (2,'Nebojsa','Covic','1958-07-02','',1),(3,'Branko','Lazic','1989-01-12','C:\\Users\\Hp\\Downloads\\Players\\lazic.jpg',1),(4,'Axel','Schweitzer','1969-07-08','',2),(6,'Corey','Walden','1992-08-05','C:\\Users\\Hp\\Downloads\\Players\\walden.jpg',1),(17,'Tuncay','Ozilhan','1947-07-09','',3),(18,'Pantaleo','Dell’Orco','1955-04-08','',4),(19,'Andrey','Vatutin','1973-07-25','',5),(20,'Josep Maria','Bartomeu','1963-02-06','',6),(21,'JOHNNY','O\'BRYANT','1993-06-01','C:\\Users\\Hp\\Downloads\\Players\\O\'BRYANT.jpg',7),(22,'LANGSTON','HALL','1991-11-01','C:\\Users\\Hp\\Downloads\\Players\\HALL.jpg',7),(23,'JORDAN','LOYD','1993-07-27','C:\\Users\\Hp\\Downloads\\Players\\LOYD.jpg',7),(24,'DEJAN','DAVIDOVAC','1995-01-17','C:\\Users\\Hp\\Downloads\\Players\\DAVIDOVAC.jpg',1),(25,'OGNJEN','DOBRIC','1994-10-27','C:\\Users\\Hp\\Downloads\\Players\\DOBRIC.jpg',1),(26,'MAODO','LO','1992-12-31','C:\\Users\\Hp\\Downloads\\Players\\LO.jpg',2),(27,'PEYTON','SIVA','1990-10-24','C:\\Users\\Hp\\Downloads\\Players\\SIVA.jpg',7),(28,'NIELS','GIFFEY','1991-06-08','C:\\Users\\Hp\\Downloads\\Players\\GIFFEY.jpg',2),(29,'MALTE','DELOW','2001-04-22','C:\\Users\\Hp\\Downloads\\Players\\DELOW.jpg',2),(30,'MARCUS','ERIKSSON','1993-12-05','C:\\Users\\Hp\\Downloads\\Players\\ERIKSSON.jpg',8),(31,'KRESIMIR','NIKIC','1999-04-16','C:\\Users\\Hp\\Downloads\\Players\\NIKIC.jpg',9),(32,'SHANE','LARKIN','1992-10-02','C:\\Users\\Hp\\Downloads\\Players\\LARKIN.jpg',7),(33,'RODRIGUE','BEAUBOIS','1988-02-24','C:\\Users\\Hp\\Downloads\\Players\\BEAUBOIS.jpg',10),(34,'CHRIS','SINGLETON','1989-11-21','C:\\Users\\Hp\\Downloads\\Players\\SINGLETON.jpg',7),(35,'YIGITCAN','SAYBIR','1999-02-27','C:\\Users\\Hp\\Downloads\\Players\\SAYBIR.jpg',3),(36,'TIBOR','PLEISS','1989-11-02','C:\\Users\\Hp\\Downloads\\Players\\PLEISS.jpg',2),(37,'VASILIJE','MICIC','1994-01-13','C:\\Users\\Hp\\Downloads\\Players\\MICIC.jpg',1),(38,'KEVIN','PUNTER','1993-06-25','C:\\Users\\Hp\\Downloads\\Players\\PUNTER.jpg',7),(39,'ZACH','LEDAY','1994-05-30','C:\\Users\\Hp\\Downloads\\Players\\LEDAY.jpg',7),(40,'DAVIDE','MORETTI','1998-03-25','C:\\Users\\Hp\\Downloads\\Players\\MORETTI.jpg',4),(41,'VLADIMIR','MICOV','1985-04-16','C:\\Users\\Hp\\Downloads\\Players\\MICOV.jpg',1),(42,'RICCARDO','MORASCHINI','1991-01-08','C:\\Users\\Hp\\Downloads\\Players\\MORASCHINI.jpg',4),(43,'MICHAEL','ROLL','1987-04-12','C:\\Users\\Hp\\Downloads\\Players\\ROLL.jpg',7),(44,'JONAS','MATTISSECK','2000-01-16','C:\\Users\\Hp\\Downloads\\Players\\MATTISSECK.jpg',2),(45,'TIM','SCHNEIDER','1997-09-01','C:\\Users\\Hp\\Downloads\\Players\\SCHNEIDER.jpg',2),(46,'LORENZ','BRENNEKE','2021-02-18','C:\\Users\\Hp\\Downloads\\Players\\BRENNEKE.jpg',2),(47,'LOUIS','OLINDE','1998-03-19','C:\\Users\\Hp\\Downloads\\Players\\OLINDE.jpg',2),(48,'SIMONE','FONTECCHIO','1995-12-09','C:\\Users\\Hp\\Downloads\\Players\\FONTECCHIO.jpg',4),(49,'JOHANNES','THIEMANN','1994-02-09','C:\\Users\\Hp\\Downloads\\Players\\THIEMANN.jpg',2),(50,'JAYSON','GRANGER','1989-09-15','C:\\Users\\Hp\\Downloads\\Players\\GRANGER.jpg',4),(51,'LUKE','SIKMA','1989-07-30','C:\\Users\\Hp\\Downloads\\Players\\SIKMA.jpg',7),(52,'BEN','LAMMERS','1995-11-12','C:\\Users\\Hp\\Downloads\\Players\\LAMMERS.jpg',7),(53,'ALEKSA','USKOKOVIC','1999-08-30','C:\\Users\\Hp\\Downloads\\Players\\USKOKOVIC.jpg',1),(54,'MARKO','SIMONOVIC','1986-05-30','C:\\Users\\Hp\\Downloads\\Players\\SIMONOVIC.jpg',1),(55,'OGNJEN','KUZMIC','1990-05-16','C:\\Users\\Hp\\Downloads\\Players\\KUZMIC.jpg',1),(56,'MARKO','JAGODIC-KURIDZA','1987-05-15','C:\\Users\\Hp\\Downloads\\Players\\JAGODIC-KURIDZA.jpg',1),(57,'QUINO','COLOM','1988-11-01','C:\\Users\\Hp\\Downloads\\Players\\COLOM.jpg',6),(58,'DOGUS','BALBAY','1989-01-21','C:\\Users\\Hp\\Downloads\\Players\\BALBAY.jpg',3),(59,'ADRIEN','MOERMAN','1988-08-07','C:\\Users\\Hp\\Downloads\\Players\\MOERMAN.jpg',10),(60,'SERTAC','SANLI','1991-08-05','C:\\Users\\Hp\\Downloads\\Players\\SANLI.jpg',3),(61,'JAMES','ANDERSON','1989-03-25','C:\\Users\\Hp\\Downloads\\Players\\ANDERSON.jpg',7),(62,'BRYANT','DUNSTON','1986-05-28','C:\\Users\\Hp\\Downloads\\Players\\DUNSTON.jpg',7),(63,'KRUNOSLAV','SIMON','1985-06-24','C:\\Users\\Hp\\Downloads\\Players\\SIMON.jpg',9),(64,'BUGRAHAN','TUNCER','1993-03-23','C:\\Users\\Hp\\Downloads\\Players\\TUNCER.jpg',3),(65,'SERGIO','RODRIGUEZ','1986-06-12','C:\\Users\\Hp\\Downloads\\Players\\RODRIGUEZ.jpg',6),(66,'KALEB','TARCZEWSKI','1993-02-26','C:\\Users\\Hp\\Downloads\\Players\\TARCZEWSKI.jpg',7),(67,'MALCOLM','DELANEY','1989-03-11','C:\\Users\\Hp\\Downloads\\Players\\DELANEY.jpg',7),(68,'SHAVON','SHIELDS','1994-06-05','C:\\Users\\Hp\\Downloads\\Players\\SHIELDS.jpg',12),(69,'JEFF','BROOKS','1989-06-12','C:\\Users\\Hp\\Downloads\\Players\\BROOKS.jpg',7),(70,'KYLE','HINES','1986-09-02','C:\\Users\\Hp\\Downloads\\Players\\HINES.jpg',7),(71,'LUIGI','DATOME','1987-11-27','C:\\Users\\Hp\\Downloads\\Players\\DATOME.jpg',4),(72,'JOEL','BOLOMBOY','1994-01-28','C:\\Users\\Hp\\Downloads\\Players\\BOLOMBOY.jpg',5),(73,'MIKE','JAMES','1990-08-18','C:\\Users\\Hp\\Downloads\\Players\\JAMES.jpg',7),(74,'DARRUN','HILLIARD','1993-04-13','C:\\Users\\Hp\\Downloads\\Players\\HILLIARD.jpg',7),(75,'IVAN','UKHOV','1995-09-11','C:\\Users\\Hp\\Downloads\\Players\\UKHOV.jpg',5),(76,'DANIEL','HACKETT','1987-12-19','C:\\Users\\Hp\\Downloads\\Players\\HACKETT.jpg',4),(77,'JOHANNES','VOIGTMANN','1992-09-30','C:\\Users\\Hp\\Downloads\\Players\\VOIGTMANN.jpg',2),(78,'WILL','CLYBURN','1990-05-17','C:\\Users\\Hp\\Downloads\\Players\\CLYBURN.jpg',7),(79,'TORNIKE','SHENGELIA','1991-10-05','C:\\Users\\Hp\\Downloads\\Players\\SHENGELIA.jpg',13),(80,'NIKITA','KURBANOV','1986-10-05','C:\\Users\\Hp\\Downloads\\Players\\KURBANOV.jpg',5),(81,'NIKOLA','MILUTINOV','1994-12-30','C:\\Users\\Hp\\Downloads\\Players\\MILUTINOV.jpg',1),(82,'JANIS','STRELNIEKS','1989-09-01','C:\\Users\\Hp\\Downloads\\Players\\STRELNIEKS.jpg',14),(83,'SEMEN','ANTONOV','1989-07-18','C:\\Users\\Hp\\Downloads\\Players\\ANTONOV.jpg',5),(84,'ALEXANDER','KHOMENKO','1999-01-25','C:\\Users\\Hp\\Downloads\\Players\\KHOMENKO.jpg',5),(85,'BRANDON','DAVIES','1991-07-25','C:\\Users\\Hp\\Downloads\\Players\\DAVIES.jpg',15),(86,'LEO','WESTERMANN','1992-07-24','C:\\Users\\Hp\\Downloads\\Players\\WESTERMANN.jpg',10),(87,'ADAM','HANGA','1989-04-12','C:\\Users\\Hp\\Downloads\\Players\\HANGA.jpg',16),(88,'LEANDRO','BOLMARO','2000-09-11','C:\\Users\\Hp\\Downloads\\Players\\BOLMARO.jpg',4),(89,'ROLANDS','SMITS','1995-06-25','C:\\Users\\Hp\\Downloads\\Players\\SMITS.jpg',14),(90,'PIERRE','ORIOLA','1992-09-25','C:\\Users\\Hp\\Downloads\\Players\\ORIOLA.jpg',6),(91,'ALEX','ABRINES','1993-08-01','C:\\Users\\Hp\\Downloads\\Players\\ABRINES.jpg',6),(92,'CORY','HIGGINS','1989-06-14','C:\\Users\\Hp\\Downloads\\Players\\HIGGINS.jpg',7),(93,'KYLE','KURIC','1989-08-25','C:\\Users\\Hp\\Downloads\\Players\\KURIC.jpg',17),(94,'NIKOLA','MIROTIC','1991-02-11','C:\\Users\\Hp\\Downloads\\Players\\MIROTIC.jpg',6),(95,'NICK','CALATHES','1989-02-07','C:\\Users\\Hp\\Downloads\\Players\\CALATHES.jpg',11),(96,'SERGI','MARTINEZ','1999-05-10','C:\\Users\\Hp\\Downloads\\Players\\MARTINEZ.jpg',6),(97,'ARTEM','PUSTOVYI','1992-06-25','C:\\Users\\Hp\\Downloads\\Players\\PUSTOVYI.jpg',18),(100,'JORDAN','LOYD','1993-07-27','C:\\Users\\Hp\\Downloads\\Players\\LOYD.jpg',7),(101,'TAYLOR','ROCHESTIE','1985-07-01','C:\\Users\\Hp\\Downloads\\Players\\ROCHESTIE.jpg',7),(102,'DUOP','REATH','2021-02-19','C:\\Users\\Hp\\Downloads\\Players\\REATH.jpg',19),(103,'EMANUEL','TERRY','1996-08-21','C:\\Users\\Hp\\Downloads\\Players\\TERRY.jpg',7),(104,'MATEJ ','BOLTAUZER','1974-02-22','',20),(105,'JOSEPH','BISSANG','1976-04-17','',10),(106,'PETRI','MANTYLA','1974-04-12','',27),(107,'LUIGI','LAMONICA','2021-02-23','',4),(108,'JUAN CARLOS','GARCIA','2021-02-23','',6),(109,'ARTURAS','SUKYS','2021-02-23','',11),(110,'SRETEN','RADOVIC','2021-02-25','',1),(111,'MILAN','NEDOVIC','2021-02-25','',1),(112,'MICHELE','ROSSI','2021-02-25','',10),(113,'ROBERT','LOTTERMOSER','2021-02-25','',2),(114,'OLEGS','LATISEVS','2021-02-25','',12),(115,'SASO','PETEK','2021-02-25','',17),(116,'MIGUEL ANGE','PEREZ','2021-02-26','',6),(117,'SPIROS','GKONTAS','2021-02-26','',11),(118,'AMIT','BALAK','2021-02-26','',2),(119,'PIOTR','PASTUSIAK','2021-02-26','',10),(120,'CARLOS','CORTES','2021-02-26','',6),(121,'MEHDI','DIFALLAH','2021-02-27','',3),(122,'FERNANDO','ROCHA','2021-02-27','',6),(124,'LO','MAODO','2002-11-30','C:\\Users\\Hp\\Downloads\\Players\\LO.jpg',2),(125,'Dmitry','Golubkov','1975-03-18','',5),(126,'Dragan','Kos','1996-08-26','C:\\Users\\Hp\\Downloads\\Players\\CALATHES.jpg',1),(127,'dragan','asdgre','2021-03-19','C:\\Users\\Hp\\Downloads\\Players\\ANDERSON.jpg',12),(128,'dafgffgr','asgewasf','2021-03-19','C:\\Users\\Hp\\Downloads\\Players\\BOLMARO.jpg',10),(129,'fsgerh','sdghesrh','1998-03-19','C:\\Users\\Hp\\Downloads\\Players\\COLOM.jpg',5);
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `player`
--

DROP TABLE IF EXISTS `player`;
/*!50001 DROP VIEW IF EXISTS `player`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `player` AS SELECT 
 1 AS `IdOsobe`,
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `DatumRodjenja`,
 1 AS `Slika`,
 1 AS `IdDrzave`,
 1 AS `Naziv`,
 1 AS `Visina`,
 1 AS `Pozicija`,
 1 AS `Biografija`,
 1 AS `Dres`,
 1 AS `IdSezone`,
 1 AS `IdKluba`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `playersongame`
--

DROP TABLE IF EXISTS `playersongame`;
/*!50001 DROP VIEW IF EXISTS `playersongame`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `playersongame` AS SELECT 
 1 AS `IdOsobe`,
 1 AS `IdUtakmice`,
 1 AS `PTS`,
 1 AS `MIN`,
 1 AS `2FGM`,
 1 AS `2FGA`,
 1 AS `3FGM`,
 1 AS `3FGA`,
 1 AS `FTM`,
 1 AS `FTA`,
 1 AS `AS`,
 1 AS `OReb`,
 1 AS `DReb`,
 1 AS `BLK`,
 1 AS `STL`,
 1 AS `Fouls`,
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `Dres`,
 1 AS `IdKluba`,
 1 AS `IdSezone`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `predsjednik`
--

DROP TABLE IF EXISTS `predsjednik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predsjednik` (
  `IdOsobe` int NOT NULL,
  PRIMARY KEY (`IdOsobe`),
  CONSTRAINT `fk_Predsjednik_Osoba1` FOREIGN KEY (`IdOsobe`) REFERENCES `osoba` (`IdOsobe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predsjednik`
--

LOCK TABLES `predsjednik` WRITE;
/*!40000 ALTER TABLE `predsjednik` DISABLE KEYS */;
INSERT INTO `predsjednik` VALUES (2),(4),(17),(18),(19),(20),(125);
/*!40000 ALTER TABLE `predsjednik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!50001 DROP VIEW IF EXISTS `referee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `referee` AS SELECT 
 1 AS `IdOsobe`,
 1 AS `IdUtakmice`,
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `DatumRodjenja`,
 1 AS `Slika`,
 1 AS `IdDrzave`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sezona`
--

DROP TABLE IF EXISTS `sezona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sezona` (
  `IdSezone` int NOT NULL AUTO_INCREMENT,
  `OdDatum` date NOT NULL,
  `DoDatum` date NOT NULL,
  `Naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`IdSezone`),
  UNIQUE KEY `Naziv_UNIQUE` (`Naziv`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sezona`
--

LOCK TABLES `sezona` WRITE;
/*!40000 ALTER TABLE `sezona` DISABLE KEYS */;
INSERT INTO `sezona` VALUES (1,'2019-10-03','2020-05-25','2019/20'),(2,'2020-10-01','2021-04-09','2020/21'),(3,'2018-10-03','2019-04-05','2018/19');
/*!40000 ALTER TABLE `sezona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponzor`
--

DROP TABLE IF EXISTS `sponzor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponzor` (
  `IdSponzora` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`IdSponzora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponzor`
--

LOCK TABLES `sponzor` WRITE;
/*!40000 ALTER TABLE `sponzor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponzor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponzorklub`
--

DROP TABLE IF EXISTS `sponzorklub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponzorklub` (
  `IdSponzora` int NOT NULL,
  `IdKluba` int NOT NULL,
  PRIMARY KEY (`IdSponzora`,`IdKluba`),
  KEY `fk_Sponzor_has_Klub_Klub1_idx` (`IdKluba`),
  KEY `fk_Sponzor_has_Klub_Sponzor1_idx` (`IdSponzora`),
  CONSTRAINT `fk_Sponzor_has_Klub_Klub1` FOREIGN KEY (`IdKluba`) REFERENCES `klub` (`IdKluba`),
  CONSTRAINT `fk_Sponzor_has_Klub_Sponzor1` FOREIGN KEY (`IdSponzora`) REFERENCES `sponzor` (`IdSponzora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponzorklub`
--

LOCK TABLES `sponzorklub` WRITE;
/*!40000 ALTER TABLE `sponzorklub` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponzorklub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sudija`
--

DROP TABLE IF EXISTS `sudija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sudija` (
  `IdOsobe` int NOT NULL,
  PRIMARY KEY (`IdOsobe`),
  CONSTRAINT `fk_Sudija_Osoba1` FOREIGN KEY (`IdOsobe`) REFERENCES `osoba` (`IdOsobe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sudija`
--

LOCK TABLES `sudija` WRITE;
/*!40000 ALTER TABLE `sudija` DISABLE KEYS */;
INSERT INTO `sudija` VALUES (104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122);
/*!40000 ALTER TABLE `sudija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sudijanautakmici`
--

DROP TABLE IF EXISTS `sudijanautakmici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sudijanautakmici` (
  `IdUtakmice` int NOT NULL,
  `IdOsobe` int NOT NULL,
  PRIMARY KEY (`IdUtakmice`,`IdOsobe`),
  KEY `fk_Utakmica_has_Sudija_Sudija1_idx` (`IdOsobe`),
  KEY `fk_Utakmica_has_Sudija_Utakmica1_idx` (`IdUtakmice`),
  CONSTRAINT `fk_Utakmica_has_Sudija_Sudija1` FOREIGN KEY (`IdOsobe`) REFERENCES `sudija` (`IdOsobe`),
  CONSTRAINT `fk_Utakmica_has_Sudija_Utakmica1` FOREIGN KEY (`IdUtakmice`) REFERENCES `utakmica` (`IdUtakmice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sudijanautakmici`
--

LOCK TABLES `sudijanautakmici` WRITE;
/*!40000 ALTER TABLE `sudijanautakmici` DISABLE KEYS */;
INSERT INTO `sudijanautakmici` VALUES (48,104),(49,104),(38,107),(51,107),(38,108),(38,109),(51,109),(43,110),(43,111),(43,112),(44,113),(44,114),(44,115),(47,116),(47,117),(51,117),(47,118),(48,119),(48,120),(49,121),(49,122);
/*!40000 ALTER TABLE `sudijanautakmici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trener`
--

DROP TABLE IF EXISTS `trener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trener` (
  `IdOsobe` int NOT NULL,
  `IdKluba` int DEFAULT NULL,
  `Biografija` text,
  PRIMARY KEY (`IdOsobe`),
  KEY `fk_Trener_Klub1_idx` (`IdKluba`),
  CONSTRAINT `fk_Trener_Klub1` FOREIGN KEY (`IdKluba`) REFERENCES `klub` (`IdKluba`),
  CONSTRAINT `fk_Trener_Osoba1` FOREIGN KEY (`IdOsobe`) REFERENCES `osoba` (`IdOsobe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvkanal`
--

DROP TABLE IF EXISTS `tvkanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvkanal` (
  `IdTVKanala` int NOT NULL AUTO_INCREMENT,
  `NazivTV` varchar(45) NOT NULL,
  `Zemlja` varchar(45) NOT NULL,
  `IdUtakmice` int NOT NULL,
  PRIMARY KEY (`IdTVKanala`),
  KEY `fk_TVKanal_Utakmica1_idx` (`IdUtakmice`),
  CONSTRAINT `fk_TVKanal_Utakmica1` FOREIGN KEY (`IdUtakmice`) REFERENCES `utakmica` (`IdUtakmice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvkanal`
--

LOCK TABLES `tvkanal` WRITE;
/*!40000 ALTER TABLE `tvkanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvkanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utakmica`
--

DROP TABLE IF EXISTS `utakmica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utakmica` (
  `IdUtakmice` int NOT NULL AUTO_INCREMENT,
  `Vrijeme` datetime NOT NULL,
  `PrvaCetvrtinaD` int DEFAULT NULL,
  `PrvaCetvrtinaG` int DEFAULT NULL,
  `DrugaCetvrtinaD` int DEFAULT NULL,
  `DrugaCetvrtinaG` int DEFAULT NULL,
  `TrecaCetvrtinaD` int DEFAULT NULL,
  `TrecaCetvrtinaG` int DEFAULT NULL,
  `CetvrtaCetvrtinaD` int DEFAULT NULL,
  `CetvrtaCetvrtinaG` int DEFAULT NULL,
  `ProduzeciD` int DEFAULT NULL,
  `ProduzeciG` int DEFAULT NULL,
  `IdDomacina` int NOT NULL,
  `IdGosta` int NOT NULL,
  `IdKola` int NOT NULL,
  `Faza` varchar(45) NOT NULL,
  `IdSezone` int NOT NULL,
  PRIMARY KEY (`IdUtakmice`),
  KEY `fk_Utakmica_Klub1_idx` (`IdDomacina`),
  KEY `fk_Utakmica_Klub2_idx` (`IdGosta`),
  KEY `fk_utakmica_kolo1_idx` (`IdKola`,`Faza`,`IdSezone`),
  CONSTRAINT `fk_Utakmica_Klub1` FOREIGN KEY (`IdDomacina`) REFERENCES `klub` (`IdKluba`),
  CONSTRAINT `fk_Utakmica_Klub2` FOREIGN KEY (`IdGosta`) REFERENCES `klub` (`IdKluba`),
  CONSTRAINT `fk_utakmica_kolo1` FOREIGN KEY (`IdKola`, `Faza`, `IdSezone`) REFERENCES `kolo` (`IdKola`, `Faza`, `IdSezone`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utakmica`
--

LOCK TABLES `utakmica` WRITE;
/*!40000 ALTER TABLE `utakmica` DISABLE KEYS */;
INSERT INTO `utakmica` VALUES (38,'2020-10-01 20:45:00',18,20,17,23,11,8,27,22,13,11,2,8,1,'Regularna faza',2),(43,'2020-10-01 20:00:00',14,29,21,24,20,17,17,23,0,0,5,6,1,'Regularna faza',2),(44,'2020-10-01 21:00:00',23,15,16,28,21,18,27,10,0,0,9,7,1,'Regularna faza',2),(47,'2020-10-08 19:00:00',29,13,27,22,19,17,11,20,0,0,6,2,2,'Regularna faza',2),(48,'2020-10-08 20:45:00',19,13,23,9,22,19,11,14,0,0,7,5,2,'Regularna faza',2),(49,'2020-10-08 18:00:00',25,20,16,22,15,22,19,24,0,0,8,9,2,'Regularna faza',2),(51,'2021-03-19 18:00:00',24,23,18,15,14,16,19,20,0,0,6,2,12,'Regularna faza',1);
/*!40000 ALTER TABLE `utakmica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utakmica_AFTER_INSERT` AFTER INSERT ON `utakmica` FOR EACH ROW BEGIN
declare domacinPTS int default 0;
declare gostPTS int default 0;

set domacinPTS=new.PrvaCetvrtinaD + new.DrugaCetvrtinaD + new.TrecaCetvrtinaD + new.CetvrtaCetvrtinaD + new.ProduzeciD;
set gostPTS=new.PrvaCetvrtinaG + new.DrugaCetvrtinaG + new.TrecaCetvrtinaG + new.CetvrtaCetvrtinaG + new.ProduzeciG;

update klubsezona set `PTS+`=`PTS+`+domacinPTS, `PTS-`=`PTS-`+gostPTS where IdKluba=new.IdDomacina and IdSezone=new.IdSezone;
update klubsezona set `PTS+`=`PTS+`+gostPTS, `PTS-`=`PTS-`+domacinPTS where IdKluba=new.IdGosta and IdSezone=new.IdSezone;

if domacinPTS>gostPTS then 
	update klubsezona set W=W+1 where IdKluba=new.IdDomacina and IdSezone=new.IdSezone;
	update klubsezona set L=L+1 where IdKluba=new.IdGosta and IdSezone=new.IdSezone;
else
	update klubsezona set W=W+1 where IdKluba=new.IdGosta and IdSezone=new.IdSezone;
	update klubsezona set L=L+1 where IdKluba=new.IdDomacina and IdSezone=new.IdSezone;
end if;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utakmica_BEFORE_DELETE` BEFORE DELETE ON `utakmica` FOR EACH ROW BEGIN
declare ptsHome int default 0;
declare ptsGuest int default 0;

delete from sudijanautakmici where IdUtakmice=old.IdUtakmice; 
delete from igracnautakmici where IdUtakmice=old.IdUtakmice;

set ptsHome=old.PrvaCetvrtinaD+old.DrugaCetvrtinaD+old.TrecaCetvrtinaD+old.CetvrtaCetvrtinaD+old.ProduzeciD;
set ptsGuest=old.PrvaCetvrtinaG+old.DrugaCetvrtinaG+old.TrecaCetvrtinaG+old.CetvrtaCetvrtinaG+old.ProduzeciG;

update klubsezona set `PTS+`=`PTS+`-ptsHome, `PTS-`=`PTS-`-ptsGuest where IdKluba=old.IdDomacina and IdSezone=old.IdSezone;
update klubsezona set `PTS+`=`PTS+`-ptsGuest, `PTS-`=`PTS-`-ptsHome where IdKluba=old.IdGosta and IdSezone=old.IdSezone;
if ptsHome>ptsGuest then
	update klubsezona set `W`=`W`-1 where IdKluba=old.IdDomacina and IdSezone=old.IdSezone;
    update klubsezona set `L`=`L`-1 where IdKluba=old.IdGosta and IdSezone=old.IdSezone;
else
	update klubsezona set `W`=`W`-1 where IdKluba=old.IdGosta and IdSezone=old.IdSezone;
    update klubsezona set `L`=`L`-1 where IdKluba=old.IdDomacina and IdSezone=old.IdSezone;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'evroliga'
--

--
-- Dumping routines for database 'evroliga'
--
/*!50003 DROP PROCEDURE IF EXISTS `deletePLayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePLayer`(
	in id int, 
    in klub int,
    in sezona int
    )
BEGIN
delete from igrau where IdOsobe=id and IdKluba=klub and IdSezone=sezona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlayerStatistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayerStatistics`(
	in igrac int,
    in sezona int
)
BEGIN
select i.* from igracnautakmici i inner join utakmica u on i.IdUtakmice=u.IdUtakmice where i.IdOsobe=igrac and u.IdSezone=sezona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertClub`(
	in naziv varchar(45),
    in predsjednik int,
    in adresa int, 
    in info Text,
    in grb varchar(100),
    in telefon varchar(45),
    in stranica varchar(150),
    in twitter varchar(150),
    in instagram varchar(150),
    in facebook varchar(150),
    in youtube varchar(150),
    out result varchar(100),
    out lastId int
    )
BEGIN
declare id int default 0;

select IdKluba into id from klub k where k.Naziv=naziv;
set lastId=0;
if id=0 then
	insert into klub (Naziv, IdPredsjednika, Info, IdAdrese, Grb, Telefon, ZvanicnaStranica, Twitter, Instagram, Facebook, YouTube) values (naziv, predsjednik, info, adresa, grb, telefon, stranica, twitter, instagram, facebook, youtube);
	set lastId=last_insert_id();
else set result='Klub vec postoji';

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGame`(
	in vrijeme datetime,
    in pcd int,
    in pcg int,
    in dcd int,
    in dcg int,
    in tcd int,
    in tcg int,
    in ccd int,
    in ccg int,
    in pd int,
    in pg int,
    in domacin int,
    in gost int,
    in kolo int,
    in faza varchar(45),
    in sezona int,
    in idSudije1 int,
    in idSudije2 int,
    in idSudije3 int,
    out msg varchar(100),
    out id int
)
BEGIN
declare u int default 0;
declare p int default 0;

select IdUtakmice into u from utakmica where IdDomacina=domacin and IdGosta=gost and IdKola=kolo;
select IdUtakmice into p from utakmica where (IdDomacina=domacin or IdGosta=gost or IdDomacina=gost or IdGosta=domacin) and IdKola=kolo;
set id=0;
if u=0 and p=0 then
	insert into utakmica (Vrijeme, PrvaCetvrtinaD, PrvaCetvrtinaG, DrugaCetvrtinaD, DrugaCetvrtinaG, TrecaCetvrtinaD, TrecaCetvrtinaG, CetvrtaCetvrtinaD, CetvrtaCetvrtinaG, ProduzeciD, ProduzeciG, IdDomacina, IdGosta, IdKola, Faza, IdSezone)
    values (vrijeme, pcd, pcg, dcd, dcg, tcd, tcg, ccd, ccg, pd, pg, domacin, gost, kolo, faza, sezona);
	
	set id=last_insert_id();
    
    insert into sudijanautakmici (IdUtakmice, IdOsobe) values (id, idSudije1);
    insert into sudijanautakmici (IdUtakmice, IdOsobe) values (id, idSudije2);
    insert into sudijanautakmici (IdUtakmice, IdOsobe) values (id, idSudije3);
elseif u!=0 then
	set msg='Utakmica sa ovim domacinom, gostom i kolom vec postoji';
else set msg='Jedan ili oba tima su vec igrali u ovom kolu';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPlayer`(
	in ime varchar(45),
    in prezime varchar(45),
    in datumRodjenja date,
    in visina decimal(4,2),
    in pozicija varchar(45),
    in slika varchar(100),
    in drzava int,
    in biografija text,
    out lastId int
    )
BEGIN
declare p int default 0;
declare id int;
select i.IdOsobe into p from igrac i inner join osoba o on i.IdOsobe=o.IdOsobe where o.Ime=ime and o.Prezime=prezime and o.DatumRodjenja=datumRodjenja;
if p=0 then
	insert into osoba (Ime, Prezime, DatumRodjenja, Slika, IdDrzave) values (ime, prezime, datumRodjenja, slika, drzava);
    set lastId = last_insert_id();
    insert into igrac (IdOsobe, Pozicija, Visina, Biografija) values(lastId, pozicija, visina, biografija);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPlayerStatistic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPlayerStatistic`(
	in osoba int, 
    in utakmica int, 
    in pts int,
    in `min` varchar(15), 
    in fgm int, 
    in fga int,
    in _3fgm int,
    in _3fga int, 
    in ftm int,
    in fta int,
    in `as` int,
    in oreb int,
    in dreb int,
    in blk int,
	in stl int, 
    in fouls int,
    out msg varchar(100)
)
BEGIN
declare id int default 0; 
select IdOsobe into id from igracnautakmici where IdOsobe=osoba and IdUtakmice=utakmica;
if id=0 then
	insert into igracnautakmici (`IdOsobe`, `IdUtakmice`, `PTS`, `MIN`, `2FGM`, `2FGA`, `3FGM`, `3FGA`, FTM, FTA, `AS`, OReb, DReb, BLK, STL, Fouls) values (osoba, utakmica, pts, `min`, fgm, fga, _3fgm, _3fga, ftm, fta, `as`, oreb, dreb, blk, stl, fouls);
else set msg='Statistika za ovaj mec vec postoji';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPresident` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPresident`(
	in ime varchar(45),
    in prezime varchar(45),
    in datumRodjenja date,
    in slika varchar(100),
    in drzava int
)
BEGIN
declare id int default 0;

insert into osoba (Ime, Prezime, DatumRodjenja, Slika, IdDrzave) values (ime, prezime, datumRodjenja, slika, drzava);
set id = last_insert_id();
insert into predsjednik (IdOsobe) values(id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertReferee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertReferee`(
	in ime varchar(45),
    in prezime varchar(45),
    in datumRodjenja date,
    in slika varchar(100),
    in drzava int
)
BEGIN
declare id int default 0;

insert into osoba (Ime, Prezime, DatumRodjenja, Slika, IdDrzave) values (ime, prezime, datumRodjenja, slika, drzava);
set id = last_insert_id();
insert into sudija (IdOsobe) values(id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateClub`(
	in pId int,
	in pNaziv varchar(45),
    in pPredsjednik int,
    in pAdresa int, 
    in pInfo Text,
    in pGrb varchar(100),
    in pTelefon varchar(45),
    in pStranica varchar(150),
    in pTwitter varchar(150),
    in pInstagram varchar(150),
    in pFacebook varchar(150),
    in pYouTube varchar(150),
    out result varchar(50)
    )
BEGIN
declare id int default 0;
select IdKluba into id from klub where Naziv=pNaziv;
    if id=pId or id=0 then
		update klub set Naziv=pNaziv, IdPredsjednika=pPredsjednik, IdAdrese=pAdresa, Info=pInfo, 
			Grb=pGrb, Telefon=pTelefon, ZvanicnaStranica=pStranica, Twitter=pTwitter, Instagram=pInstagram,
			Facebook=pFacebook, YouTube=pYouTube where klub.IdKluba=pId;
	else set result='Klub vec postoji';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePlayer`(
		in id int, 
		in ime varchar(45),
        in prezime varchar(45),
        in drzava int,
        in datumRodjenja date, 
        in pozicija varchar(45),
        in visina decimal(4,2),
        in slika varchar(100),
        in biografija text
)
BEGIN
	update osoba set Ime=ime, Prezime=prezime, IdDrzave=drzava, DatumRodjenja=datumRodjenja, Slika=slika where IdOsobe=id;
	update Igrac set Visina=visina, Pozicija=pozicija, Biografija=biografija where IdOsobe=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `address`
--

/*!50001 DROP VIEW IF EXISTS `address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `address` AS select `a`.`IdAdrese` AS `IdAdrese`,`a`.`Ulica` AS `Ulica`,`a`.`Broj` AS `Broj`,`g`.`IdGrada` AS `IdGrada`,`g`.`Naziv` AS `Grad`,`d`.`IdDrzave` AS `IdDrzave`,`d`.`Naziv` AS `Drzava` from ((`adresa` `a` join `grad` `g` on((`a`.`IdGrada` = `g`.`IdGrada`))) join `drzava` `d` on((`g`.`IdDrzave` = `d`.`IdDrzave`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `club`
--

/*!50001 DROP VIEW IF EXISTS `club`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `club` AS select `k`.`IdKluba` AS `IdKluba`,`k`.`Naziv` AS `Naziv`,`k`.`Info` AS `Info`,`k`.`Grb` AS `Grb`,`k`.`Telefon` AS `Telefon`,`k`.`ZvanicnaStranica` AS `ZvanicnaStranica`,`k`.`Twitter` AS `Twitter`,`k`.`Instagram` AS `Instagram`,`k`.`Facebook` AS `Facebook`,`k`.`YouTube` AS `YouTube`,`a`.`IdAdrese` AS `IdAdrese`,`a`.`Ulica` AS `Ulica`,`a`.`Broj` AS `Broj`,`g`.`IdGrada` AS `IdGrada`,`g`.`Naziv` AS `Grad`,`d`.`IdDrzave` AS `IdDrzave`,`d`.`Naziv` AS `Drzava`,`o`.`IdOsobe` AS `IdOsobe`,`o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`klubsezona`.`IdSezone` AS `IdSezone`,`klubsezona`.`W` AS `W`,`klubsezona`.`L` AS `L`,`klubsezona`.`PTS+` AS `PTS+`,`klubsezona`.`PTS-` AS `PTS-` from (((((`klub` `k` join `adresa` `a` on((`k`.`IdAdrese` = `a`.`IdAdrese`))) join `grad` `g` on((`a`.`IdGrada` = `g`.`IdGrada`))) join `drzava` `d` on((`g`.`IdDrzave` = `d`.`IdDrzave`))) join `osoba` `o` on((`o`.`IdOsobe` = `k`.`IdPredsjednika`))) join `klubsezona` on((`k`.`IdKluba` = `klubsezona`.`IdKluba`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clubaddress`
--

/*!50001 DROP VIEW IF EXISTS `clubaddress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clubaddress` AS select `klub`.`IdKluba` AS `IdKluba`,`klub`.`Naziv` AS `Naziv`,`klub`.`IdPredsjednika` AS `IdPredsjednika`,`osoba`.`Ime` AS `Ime Predsjednika`,`osoba`.`Prezime` AS `Prezime Predsjednika`,`klub`.`Info` AS `Info`,`klub`.`Grb` AS `Grb`,`klub`.`Telefon` AS `Telefon`,`klub`.`ZvanicnaStranica` AS `ZvanicnaStranica`,`klub`.`Twitter` AS `Twitter`,`klub`.`Instagram` AS `Instagram`,`klub`.`Facebook` AS `Facebook`,`klub`.`YouTube` AS `YouTube`,`klub`.`IdAdrese` AS `IdAdrese`,`adresa`.`Ulica` AS `Ulica`,`adresa`.`Broj` AS `Broj`,`adresa`.`IdGrada` AS `IdGrada`,`grad`.`Naziv` AS `Grad`,`grad`.`IdDrzave` AS `IdDrzave`,`drzava`.`Naziv` AS `Drzava` from ((((`klub` join `osoba` on((`klub`.`IdPredsjednika` = `osoba`.`IdOsobe`))) join `adresa` on((`klub`.`IdAdrese` = `adresa`.`IdAdrese`))) join `grad` on((`adresa`.`IdGrada` = `grad`.`IdGrada`))) join `drzava` on((`grad`.`IdDrzave` = `drzava`.`IdDrzave`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `player`
--

/*!50001 DROP VIEW IF EXISTS `player`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `player` AS select `o`.`IdOsobe` AS `IdOsobe`,`o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`o`.`DatumRodjenja` AS `DatumRodjenja`,`o`.`Slika` AS `Slika`,`o`.`IdDrzave` AS `IdDrzave`,`d`.`Naziv` AS `Naziv`,`i`.`Visina` AS `Visina`,`i`.`Pozicija` AS `Pozicija`,`i`.`Biografija` AS `Biografija`,`u`.`Dres` AS `Dres`,`u`.`IdSezone` AS `IdSezone`,`u`.`IdKluba` AS `IdKluba` from (((`igrac` `i` join `osoba` `o` on((`i`.`IdOsobe` = `o`.`IdOsobe`))) join `drzava` `d` on((`o`.`IdDrzave` = `d`.`IdDrzave`))) join `igrau` `u` on((`i`.`IdOsobe` = `u`.`IdOsobe`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playersongame`
--

/*!50001 DROP VIEW IF EXISTS `playersongame`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playersongame` AS select `iu`.`IdOsobe` AS `IdOsobe`,`iu`.`IdUtakmice` AS `IdUtakmice`,`iu`.`PTS` AS `PTS`,`iu`.`MIN` AS `MIN`,`iu`.`2FGM` AS `2FGM`,`iu`.`2FGA` AS `2FGA`,`iu`.`3FGM` AS `3FGM`,`iu`.`3FGA` AS `3FGA`,`iu`.`FTM` AS `FTM`,`iu`.`FTA` AS `FTA`,`iu`.`AS` AS `AS`,`iu`.`OReb` AS `OReb`,`iu`.`DReb` AS `DReb`,`iu`.`BLK` AS `BLK`,`iu`.`STL` AS `STL`,`iu`.`Fouls` AS `Fouls`,`o`.`Ime` AS `Ime`,`o`.`Prezime` AS `Prezime`,`k`.`Dres` AS `Dres`,`k`.`IdKluba` AS `IdKluba`,`k`.`IdSezone` AS `IdSezone` from (((`igracnautakmici` `iu` join `osoba` `o` on((`o`.`IdOsobe` = `iu`.`IdOsobe`))) join `utakmica` `u` on((`iu`.`IdUtakmice` = `u`.`IdUtakmice`))) join `igrau` `k` on(((`k`.`IdOsobe` = `iu`.`IdOsobe`) and (`u`.`IdSezone` = `k`.`IdSezone`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `referee`
--

/*!50001 DROP VIEW IF EXISTS `referee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `referee` AS select `sudijanautakmici`.`IdOsobe` AS `IdOsobe`,`sudijanautakmici`.`IdUtakmice` AS `IdUtakmice`,`osoba`.`Ime` AS `Ime`,`osoba`.`Prezime` AS `Prezime`,`osoba`.`DatumRodjenja` AS `DatumRodjenja`,`osoba`.`Slika` AS `Slika`,`osoba`.`IdDrzave` AS `IdDrzave` from (`sudijanautakmici` join `osoba` on((`sudijanautakmici`.`IdOsobe` = `osoba`.`IdOsobe`))) */;
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

-- Dump completed on 2021-03-19 15:53:50
