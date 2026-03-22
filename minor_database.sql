-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: faculty_appraisal_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'System Admin','admin@university.edu','admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisal_form`
--

DROP TABLE IF EXISTS `appraisal_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appraisal_form` (
  `form_id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `submission_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`form_id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `appraisal_form_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisal_form`
--

LOCK TABLES `appraisal_form` WRITE;
/*!40000 ALTER TABLE `appraisal_form` DISABLE KEYS */;
INSERT INTO `appraisal_form` VALUES (1,1,'2024-2025','2025-02-10','Submitted'),(2,2,'2024-2025','2025-02-12','Submitted'),(3,3,'2024-2025','2025-02-14','Submitted'),(4,4,'2024-2025','2025-02-15','Pending'),(5,5,'2024-2025','2025-02-16','Submitted');
/*!40000 ALTER TABLE `appraisal_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Amit Sharma','amit@university.edu','pass123','Assistant Professor','CSE'),(2,'Neha Verma','neha@university.edu','pass123','Associate Professor','IT'),(3,'Rahul Mehta','rahul@university.edu','pass123','Assistant Professor','CSE'),(4,'Priya Singh','priya@university.edu','pass123','Professor','IT'),(5,'Karan Patel','karan@university.edu','pass123','Assistant Professor','AI & ML');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `project_title` varchar(200) NOT NULL,
  `funding_agency` varchar(200) NOT NULL,
  `duration` varchar(100) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `form_id` (`form_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `appraisal_form` (`form_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Smart Campus System','AICTE','12 Months'),(2,2,'Cloud Based LMS','UGC','10 Months'),(3,3,'AI Chatbot System','AICTE','8 Months'),(4,4,'Big Data Analyzer','DST','14 Months'),(5,5,'Smart Attendance System','UGC','6 Months');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `publication_id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `journal_name` varchar(200) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `form_id` (`form_id`),
  CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `appraisal_form` (`form_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,1,'AI in Education','IEEE',2024),(2,1,'Machine Learning Trends','Springer',2023),(3,2,'Cloud Computing Advances','Elsevier',2024),(4,3,'Deep Learning Models','IEEE',2024),(5,3,'Neural Networks Study','Springer',2023),(6,4,'Data Mining Techniques','Elsevier',2024),(7,5,'AI Ethics Review','IEEE',2025);
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seminar`
--

DROP TABLE IF EXISTS `seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seminar` (
  `seminar_id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`seminar_id`),
  KEY `form_id` (`form_id`),
  CONSTRAINT `seminar_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `appraisal_form` (`form_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seminar`
--

LOCK TABLES `seminar` WRITE;
/*!40000 ALTER TABLE `seminar` DISABLE KEYS */;
INSERT INTO `seminar` VALUES (1,1,'AI Workshop','IIT Delhi','2024-09-15'),(2,2,'Cloud Seminar','NIT Bhopal','2024-10-05'),(3,3,'Deep Learning Workshop','IIT Bombay','2024-11-12'),(4,4,'Data Science Summit','IISc Bangalore','2024-12-01'),(5,5,'AI Conference','IIIT Hyderabad','2025-01-20');
/*!40000 ALTER TABLE `seminar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-27 10:38:03
