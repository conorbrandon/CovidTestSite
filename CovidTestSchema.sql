-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: covidtest
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `employeeID` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `passcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmployeeTest`
--

DROP TABLE IF EXISTS `EmployeeTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeTest` (
  `testBarcode` varchar(50) NOT NULL,
  `employeeID` varchar(20) NOT NULL,
  `collectionTime` datetime DEFAULT NULL,
  PRIMARY KEY (`testBarcode`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `employeetest_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `Employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LabEmployee`
--

DROP TABLE IF EXISTS `LabEmployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LabEmployee` (
  `labID` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Pool`
--

DROP TABLE IF EXISTS `Pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pool` (
  `poolBarcode` varchar(50) NOT NULL,
  PRIMARY KEY (`poolBarcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PoolMap`
--

DROP TABLE IF EXISTS `PoolMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PoolMap` (
  `testBarcode` varchar(50) DEFAULT NULL,
  `poolBarcode` varchar(50) DEFAULT NULL,
  KEY `testBarcode` (`testBarcode`),
  KEY `poolBarcode` (`poolBarcode`),
  CONSTRAINT `poolmap_ibfk_1` FOREIGN KEY (`testBarcode`) REFERENCES `EmployeeTest` (`testBarcode`),
  CONSTRAINT `poolmap_ibfk_2` FOREIGN KEY (`poolBarcode`) REFERENCES `Pool` (`poolBarcode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Well`
--

DROP TABLE IF EXISTS `Well`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Well` (
  `wellBarcode` varchar(50) NOT NULL,
  PRIMARY KEY (`wellBarcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WellTesting`
--

DROP TABLE IF EXISTS `WellTesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellTesting` (
  `poolBarcode` varchar(50) DEFAULT NULL,
  `wellBarcode` varchar(50) DEFAULT NULL,
  `testingStartTime` datetime DEFAULT NULL,
  `testingEndTime` datetime DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  KEY `wellBarcode` (`wellBarcode`),
  KEY `poolBarcode` (`poolBarcode`),
  CONSTRAINT `welltesting_ibfk_2` FOREIGN KEY (`wellBarcode`) REFERENCES `Well` (`wellBarcode`) ON DELETE CASCADE,
  CONSTRAINT `welltesting_ibfk_3` FOREIGN KEY (`poolBarcode`) REFERENCES `Pool` (`poolBarcode`) ON DELETE CASCADE,
  CONSTRAINT `welltesting_chk_1` CHECK ((`result` in (_utf8mb4'in progress',_utf8mb4'negative',_utf8mb4'positive')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-14 20:44:50
