CREATE DATABASE  IF NOT EXISTS `perspectiveart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `perspectiveart`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: perspectiveart
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `fumetti`
--

DROP TABLE IF EXISTS `fumetti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fumetti` (
  `seriale` varchar(15) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `prezzo` double NOT NULL,
  `quantità` int NOT NULL,
  `descrizione` varchar(500) DEFAULT '-',
  `scrittore` varchar(45) NOT NULL,
  `numPagine` int DEFAULT NULL,
  `disegnatore` varchar(45) DEFAULT NULL,
  `categoria` enum('manga','manhua') NOT NULL,
  PRIMARY KEY (`seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fumetti`
--

LOCK TABLES `fumetti` WRITE;
/*!40000 ALTER TABLE `fumetti` DISABLE KEYS */;
INSERT INTO `fumetti` VALUES ('000000000000000','NARUTO 048',4.5,10,NULL,'Masashi Kishimoto',192,'Masashi Kishimoto','manga'),('000000000000001','TYR CHRONICLES 001',4.5,10,NULL,'In-Soo Ra',184,'Chang-Hoo Son','manhua'),('000000000000002','ADEKAN 014',5.5,10,NULL,'Nao Tsukiji',192,'Nao Tsukiji','manga'),('000000000000003','TYR CHRONICLES 002',4.5,10,NULL,'In-Soo Ra',184,'Chang-Hoo Son','manhua'),('000000000000004','MOMOGUMI PLUS SENKI 015',5,10,NULL,'Eri Sakondo',192,'Eri Sakondo','manga'),('000000000000005','TYR CHRONICLES 003',4.5,10,NULL,'In-Soo Ra',184,'Chang-Hoo Son','manhua'),('000000000000006','MARUHAN IL MERCENARIO 009',7.2,10,NULL,'Sung-jae Kim',184,'Byung-jin Kim','manga'),('000000000000007','MARUHAN IL MERCENARIO 001',4.5,10,NULL,'Sung-jae Kim',184,'Byung-jin Kim','manhua'),('000000000000008','KARAKURI CIRCUS 041',4.6,10,NULL,'Fujita Kazuhiro',192,'Fujita Kazuhiro','manga'),('000000000000009','CAFÉ OCCULT 001',5,10,NULL,'Oraebalgeum',196,'An No-Eun','manhua'),('000000000000010','CALLED GAME 003',5.3,10,NULL,'Izumi Kaneyoshi',192,'Izumi Kaneyoshi','manga'),('000000000000011','DEMON KING 001',5,10,NULL,'In-Soo Ra',200,'Jae-Hwan Kim','manhua'),('000000000000012','ZERO MAN 001',5,10,NULL,'Tezuka Osamu',410,'Tezuka Osamu','manga'),('000000000000013','DEMON KING 002',5,10,NULL,'In-Soo Ra',200,'Jae-Hwan Kim','manhua'),('000000000000014','KASANE 012',9,10,NULL,'Daruma Matsuura',192,'Daruma Matsuura','manga'),('000000000000015','DEMON KING 003',5,10,NULL,'In-Soo Ra',200,'Jae-Hwan Kim','manhua'),('000000000000016','MISSION: YOZAKURA FAMILY 005',3.8,10,NULL,'Hitsuji Gondaira',192,'Hitsuji Gondaira','manga'),('000000000000017','DEMON KING 004',4.5,10,NULL,'In-Soo Ra',200,'Jae-Hwan Kim','manhua'),('000000000000018','GAME OF FAMILIA 006',6.35,10,NULL,'Mikoto Yamaguchi',200,'D.P.','manga');
/*!40000 ALTER TABLE `fumetti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grafica`
--

DROP TABLE IF EXISTS `grafica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grafica` (
  `seriale` varchar(15) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `prezzo` double NOT NULL,
  `quantità` int NOT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `categoria` enum('opera','moderna') NOT NULL,
  PRIMARY KEY (`seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grafica`
--

LOCK TABLES `grafica` WRITE;
/*!40000 ALTER TABLE `grafica` DISABLE KEYS */;
INSERT INTO `grafica` VALUES ('100000000000000','YU-GI-OH! Limited Edition Fan-Cel',47.69,4,NULL,'moderna'),('100000000000001','YU-GI-OH! Limited Edition Art Print',14.3,9,NULL,'moderna'),('100000000000002','Dr. STONE - Boxed Poster Set',14.99,9,NULL,'moderna'),('100000000000003','GOBLIN SLAYER - Boxed Poster Set',14.99,9,NULL,'moderna'),('100000000000004','Dragon Ball Z - Heroes Poster Set',7.5,25,NULL,'moderna'),('100000000000005','Harry Potter Art Print - Gryffindor Crest',9.99,15,NULL,'opera'),('100000000000006','Harry Potter Art Print - Ravenclaw Crest',8.99,15,NULL,'opera'),('100000000000007','Harry Potter Art Print - Hufflepuff Crest',8.99,15,NULL,'opera'),('100000000000008','Harry Potter Art Print - Slytherin Crest',8.99,15,NULL,'opera'),('100000000000009','Funimation Con Print - Spot UV Treatment',14.99,3,NULL,'opera'),('100000000000010','SNK 40th Anniversary Poster Set',25.5,2,NULL,'opera');
/*!40000 ALTER TABLE `grafica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modellino`
--

DROP TABLE IF EXISTS `modellino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modellino` (
  `seriale` varchar(15) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `prezzo` double NOT NULL,
  `categoria` enum('funko_pop','action_figure') DEFAULT NULL,
  `franchise` varchar(20) NOT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `dimensioni` double DEFAULT NULL,
  `quantità` int NOT NULL,
  PRIMARY KEY (`seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modellino`
--

LOCK TABLES `modellino` WRITE;
/*!40000 ALTER TABLE `modellino` DISABLE KEYS */;
INSERT INTO `modellino` VALUES ('200000000000000','MARVEL: HAWKEYE - POP FUNKO VINYL FIGURE 1212 KATE BISHOP W/ LUCKY THE PIZZA DOG 9 CM',17.9,'funko_pop','Marvel Hawkeye',NULL,9,10),('200000000000001','SQUID GAME - POP FUNKO VINYL FIGURE 1226 RED SOLDIER (MASK) 9CM',17.9,'funko_pop','Squid Game',NULL,9,10),('200000000000002','MY HERO ACADEMIA - POP FUNKO VINYL FIGURE 1008 INFINITE DEKU W/ ERI 9CM',19.9,'funko_pop','My Hero Academia',NULL,9,10),('200000000000003','DC COMICS: THE BATMAN - POP FUNKO VINYL FIGURE 1190 SELINA KYLE 9CM - REGULAR',17.9,'funko_pop','DC Comics The Batman',NULL,9,10),('200000000000004','DC COMICS: THE BATMAN - POP FUNKO VINYL KEYCHAIN THE BATMAN 4CM',9,'funko_pop','DC Comics The Batman',NULL,4,10),('200000000000005','DISNEY: HOLIDAY 2021 - POP FUNKO VINYL FIGURE 1127 DAISY DUCK 9CM',17.9,'funko_pop','Disney',NULL,9,10),('200000000000006','DEMON SLAYER - FIGUARTS MINI - AKAZA 10CM',36.9,'action_figure','Demon Slayer',NULL,10,10),('200000000000007','FORTNITE - ACTION FIGURE CUDDLE TEAM LEADER 18 CM',29.95,'action_figure','Fortnite',NULL,18,10),('200000000000008','GAME OF THRONES - JON SNOW - ACTION FIGURE 18CM',29.9,'action_figure','Game Of Thrones',NULL,18,10),('200000000000009','78045 - NARUTO - SH FIGUARTS - NARUTO UZUMAKI BEST SELECTION 14CM',38.9,'action_figure','Naruto',NULL,14,10),('200000000000010','GAME OF THRONES - DROGON - ACTION FIGURE',48.9,'action_figure','Game Of Thrones',NULL,33,10);
/*!40000 ALTER TABLE `modellino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('francesco1','fra123','Francesco','Rossi'),('lenny97','pass321','Leonardo','Schiavo'),('marisuzc','marisa23','Marisa','La Sorda'),('mr234','mario234','Mario','Verdi');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-04 16:31:16
