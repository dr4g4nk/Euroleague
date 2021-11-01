CREATE DATABASE  IF NOT EXISTS `evroliga`
USE `evroliga`;

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
