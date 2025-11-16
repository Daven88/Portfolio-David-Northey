-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jm_books
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `Author_Num` int NOT NULL,
  `Author_Last` varchar(20) DEFAULT NULL,
  `Author_First` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Author_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Morrison','Toni'),(2,'Solotaroff','Paul'),(3,'Vintage','Vernor'),(4,'Francis','Dick'),(5,'Straub','Peter'),(6,'King','Stephen'),(7,'Pratt','Philip'),(8,'Chase','Truddi'),(9,'Collins','Bradley'),(10,'Heller','Joseph'),(11,'Wills','Gary'),(12,'Hofstadter','Douglas R.'),(13,'Lee','Harper'),(14,'Ambrose','Stephen E.'),(15,'Rowling','J.K.'),(16,'Salinger','J.D.'),(17,'Heaney','Seamus'),(18,'Camus','Albert'),(19,'Collins, Jr.','Bradley'),(20,'Steinbeck','John'),(21,'Castelman','Riva'),(22,'Owen','Barbara'),(23,'O\'Rourke','Randy'),(24,'Kidder','Tracy'),(25,'Schleining','Lon');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `Book_Code` varchar(4) NOT NULL,
  `Book_Title` varchar(120) DEFAULT NULL,
  `Book_Type` varchar(3) DEFAULT NULL,
  `Paperback` varchar(5) DEFAULT NULL,
  `Publisher_Code` varchar(2) NOT NULL,
  PRIMARY KEY (`Book_Code`),
  KEY `fk_Book_Publisher1_idx` (`Publisher_Code`),
  CONSTRAINT `fk_Book_Publisher1` FOREIGN KEY (`Publisher_Code`) REFERENCES `publisher` (`Publisher_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('079X','Second Wind','MYS','FALSE','PU'),('1351','Dreamcatcher: A Novel','HOR','FALSE','SC'),('1382','Treasure Chests','ART','FALSE','TA'),('138X','Beloved','FIC','TRUE','PL'),('180','A Deepness in the Sky','SFI','TRUE','TB'),('189','Magic Terror','HOR','TRUE','FA'),('200','The Stranger','FIC','TRUE','VB'),('2226','Harry Potter and the Prisoner of Azkaban','SFI','FALSE','ST'),('2281','Van Gogh and Gauguin','ART','FALSE','WP'),('2766','Of Mice and Men','FIC','TRUE','PE'),('2908','Electric Light','POE','FALSE','FS'),('3350','Group: Six People in Search of a Life','PSY','TRUE','BP'),('3743','Nine Stories','FIC','TRUE','LB'),('378','Venice','ART','FALSE','SS'),('3906','The Soul of a New Machine','SCI','TRUE','BY'),('5163','Travels with Charley','TRA','TRUE','PE'),('5790','Catch-22','FIC','TRUE','SC'),('6128','Jazz','FIC','TRUE','PL'),('6328','Band of Brothers','HIS','TRUE','TO'),('669X','A Guide to SQL','CMP','TRUE','CT'),('6908','Franny and Zooey','FIC','TRUE','LB'),('7405','East of Eden','FIC','TRUE','PE'),('7443','Harry Potter and the Goblet of Fire','SFI','FALSE','ST'),('7559','The Fall','FIC','TRUE','VB'),('808','The Edge','MYS','TRUE','JP'),('8092','Godel, Escher, Bach','PHI','TRUE','BA'),('8720','When Rabbit Howls','PSY','TRUE','JP'),('9611','Black House','HOR','FALSE','RH'),('9627','Song of Solomon','FIC','TRUE','PL'),('9701','The Grapes of Wrath','FIC','TRUE','PE'),('9882','Slay Ride','MYS','TRUE','JP'),('9883','The Catcher in the Rye','FIC','TRUE','LB'),('9931','To Kill a Mockingbird','FIC','FALSE','HC');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branch_Num` int NOT NULL,
  `Branch_Name` varchar(20) DEFAULT NULL,
  `Branch_Location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Branch_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'JM Downtown','16 Riverview'),(2,'JM on the Hill','1289 Bedford'),(3,'JM Brentwood','Brentwood Mall'),(4,'JM Eastshore','Eastshore Mall');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer`
--

DROP TABLE IF EXISTS `computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computer` (
  `Comp_Num` varchar(4) NOT NULL,
  `Comp_PurchaseDate` date DEFAULT NULL,
  `Comp_Cost` int DEFAULT NULL,
  `Comp_Description` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Comp_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer`
--

LOCK TABLES `computer` WRITE;
/*!40000 ALTER TABLE `computer` DISABLE KEYS */;
INSERT INTO `computer` VALUES ('I001','2008-06-07',2195,'TS'),('I002','2008-05-19',700,'Trom'),('I003','2007-08-23',1350,'TB12'),('I004','2003-02-17',1295,'SDR'),('I005','2008-02-17',1349,'KD130'),('I006','2006-11-08',2000,'Trom'),('I007','2007-06-29',1240,'XL1002'),('I008','2003-06-29',1649,'Blend77'),('I009','2004-08-23',235,'ASL360'),('I010','2006-05-13',240,'Cymbols'),('I011','2009-01-24',1250,'TRP1000'),('I012','2008-02-16',2395,'ASL'),('I013','2011-03-25',769,'TRP1000'),('I014','2003-12-16',750,'TS'),('I015','2009-04-25',1900,'TS'),('I016','2005-08-06',1472,'TB12'),('I017','2009-11-15',1350,'Trom');
/*!40000 ALTER TABLE `computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy` (
  `Copy_Num` int NOT NULL,
  `Book_Code` varchar(4) NOT NULL,
  `Branch_Num` int NOT NULL,
  `Copy_Quality` varchar(10) DEFAULT NULL,
  `Copy_Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Copy_Num`,`Book_Code`,`Branch_Num`),
  KEY `fk_Book_has_Branch_Branch1_idx` (`Branch_Num`),
  KEY `fk_Book_has_Branch_Book1_idx` (`Book_Code`),
  CONSTRAINT `fk_Book_has_Branch_Book1` FOREIGN KEY (`Book_Code`) REFERENCES `book` (`Book_Code`),
  CONSTRAINT `fk_Book_has_Branch_Branch1` FOREIGN KEY (`Branch_Num`) REFERENCES `branch` (`Branch_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy`
--

LOCK TABLES `copy` WRITE;
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
INSERT INTO `copy` VALUES (1,'079X',2,'Excellent',26),(1,'079X',3,'Excellent',26),(1,'079X',4,'Excellent',26),(1,'1351',2,'Excellent',22),(1,'1351',3,'Excellent',22),(1,'1382',2,'Good',35),(1,'138X',2,'Excellent',13),(1,'180',1,'Excellent',7),(1,'189',2,'Excellent',8),(1,'200',1,'Excellent',8),(1,'200',2,'Excellent',8),(1,'2226',1,'Excellent',15),(1,'2226',3,'Excellent',15),(1,'2226',4,'Fair',4),(1,'2281',4,'Excellent',21),(1,'2766',3,'Excellent',8),(1,'2908',1,'Excellent',15),(1,'2908',4,'Good',9),(1,'3350',1,'Excellent',10),(1,'3743',2,'Excellent',6),(1,'378',3,'Excellent',25),(1,'3906',2,'Excellent',12),(1,'3906',3,'Excellent',12),(1,'5163',1,'Excellent',8),(1,'5790',4,'Excellent',12),(1,'6128',2,'Excellent',13),(1,'6128',3,'Excellent',13),(1,'6328',2,'Excellent',10),(1,'669X',1,'Excellent',40),(1,'669X',2,'Excellent',40),(1,'6908',2,'Excellent',6),(1,'7405',3,'Good',5),(1,'7443',4,'Good',9),(1,'7559',2,'Fair',4),(1,'808',2,'Excellent',8),(1,'8092',3,'Good',10),(1,'8720',1,'Excellent',6),(1,'9611',1,'Excellent',19),(1,'9627',3,'Excellent',14),(1,'9627',4,'Excellent',14),(1,'9701',1,'Excellent',13),(1,'9701',2,'Excellent',13),(1,'9701',3,'Fair',4),(1,'9701',4,'Excellent',13),(1,'9882',3,'Excellent',7),(1,'9883',2,'Excellent',6),(1,'9883',4,'Good',4),(1,'9931',1,'Excellent',13),(2,'079X',3,'Good',20),(2,'079X',4,'Excellent',26),(2,'1351',2,'Excellent',22),(2,'1351',3,'Good',14),(2,'138X',2,'Excellent',13),(2,'180',1,'Excellent',7),(2,'189',2,'Good',6),(2,'200',2,'Fair',4),(2,'2226',1,'Excellent',15),(2,'2226',3,'Excellent',15),(2,'2766',3,'Good',4),(2,'2908',1,'Excellent',15),(2,'3350',1,'Excellent',10),(2,'378',3,'Excellent',25),(2,'3906',3,'Good',5),(2,'5790',4,'Good',6),(2,'6128',2,'Excellent',13),(2,'6128',3,'Excellent',13),(2,'6328',2,'Excellent',10),(2,'6908',2,'Excellent',6),(2,'7405',3,'Fair',3),(2,'7559',2,'Good',8),(2,'8720',1,'Excellent',6),(2,'9611',1,'Good',8),(2,'9627',3,'Excellent',14),(2,'9627',4,'Good',7),(2,'9701',1,'Excellent',13),(2,'9701',3,'Fair',4),(2,'9701',4,'Poor',2),(2,'9882',3,'Good',4),(2,'9883',2,'Excellent',6),(2,'9883',4,'Excellent',6),(2,'9931',1,'Excellent',13),(3,'079X',4,'Good',20),(3,'1351',2,'Excellent',22),(3,'138X',2,'Good',7),(3,'200',2,'Poor',2),(3,'2226',1,'Good',9),(3,'2908',1,'Good',9),(3,'6128',2,'Excellent',13),(3,'6128',3,'Good',5),(3,'8720',1,'Good',4),(3,'9627',3,'Excellent',14),(3,'9701',3,'Good',7),(3,'9882',3,'Excellent',7),(3,'9883',2,'Fair',2),(4,'1351',2,'Excellent',22),(4,'6128',2,'Excellent',13),(4,'9627',3,'Excellent',14),(5,'9627',3,'Good',7);
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Emp_Num` int NOT NULL,
  `Emp_Last` varchar(10) DEFAULT NULL,
  `Emp_First` varchar(10) DEFAULT NULL,
  `Branch_Num` int DEFAULT NULL,
  PRIMARY KEY (`Emp_Num`),
  KEY `fk_Employee_Branch1_idx` (`Branch_Num`),
  CONSTRAINT `fk_Employee_Branch1` FOREIGN KEY (`Branch_Num`) REFERENCES `branch` (`Branch_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Witney','Joseph',1),(2,'Curry','Errol',NULL),(3,'Hammond','Jenny',3),(4,'Wilson','Sue',2),(5,'Wilkins','Karen',1),(6,'Lodge','Carolyn',2),(7,'Chopping','Marie',NULL),(8,'Nesbitt','Erin',3),(9,'Moffatt','Robert',3),(10,'Wood','Jessica',1),(11,'Blackmore','Danielle',1),(12,'Blackmore','Daisy',1),(27,'Johnson','Samuel',NULL),(39,'Lee','Catherine',4),(45,'Sturt','Lea',4),(51,'Fishermen','Emma',NULL),(65,'Smith','Ronald',2),(76,'Frog','Fred',4),(77,'Sawpit','Iva',3),(78,'Idjit','Ima',3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hire`
--

DROP TABLE IF EXISTS `hire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hire` (
  `Comp_Num` varchar(4) NOT NULL,
  `Hire_Start` date NOT NULL,
  `Hire_End` date DEFAULT NULL,
  `Emp_Num` int NOT NULL,
  PRIMARY KEY (`Comp_Num`,`Hire_Start`),
  KEY `fk_Computer_has_Employee_Employee1_idx` (`Emp_Num`),
  KEY `fk_Computer_has_Employee_Computer1_idx` (`Comp_Num`),
  CONSTRAINT `fk_Computer_has_Employee_Computer1` FOREIGN KEY (`Comp_Num`) REFERENCES `computer` (`Comp_Num`),
  CONSTRAINT `fk_Computer_has_Employee_Employee1` FOREIGN KEY (`Emp_Num`) REFERENCES `employee` (`Emp_Num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hire`
--

LOCK TABLES `hire` WRITE;
/*!40000 ALTER TABLE `hire` DISABLE KEYS */;
INSERT INTO `hire` VALUES ('I001','2010-04-28','2010-09-12',65),('I001','2010-09-15',NULL,4),('I002','2009-11-14',NULL,1),('I003','2010-06-05',NULL,9),('I004','2003-03-01','2006-06-26',7),('I004','2006-09-25',NULL,65),('I005','2009-12-23',NULL,2),('I006','2008-05-02',NULL,3),('I007','2007-08-07',NULL,5),('I008','2006-10-15',NULL,8),('I009','2008-09-30',NULL,7),('I010','2007-05-13',NULL,7),('I011','2010-05-13',NULL,65),('I012','2007-07-28',NULL,11),('I013','2011-03-26',NULL,77),('I014','2006-08-03',NULL,78),('I015','2009-05-05',NULL,76),('I016','2010-08-27',NULL,12),('I017','2009-11-19',NULL,6);
/*!40000 ALTER TABLE `hire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `Publisher_Code` varchar(2) NOT NULL,
  `Publisher_Name` varchar(30) DEFAULT NULL,
  `Publisher_City` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Publisher_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('AH','Arkham House','Sauk City WI'),('AP','Arcade Publishing','New York'),('BA','Basic Books','Boulder CO'),('BP','Berkley Publishing','Boston'),('BY','Back Bay Books','New York'),('CT','Course Technology','Boston'),('FA','Fawcett Books','New York'),('FS','Farrar Straus & Giroux','New York'),('HC','HarperCollins Publishers','New York'),('JP','Jove Publications','New York'),('JT','Jeremy P. Tarcher','Los Angeles'),('LB','Lb Books','New York'),('MP','McPherson and Co.','Kingston'),('PE','Penguin USA','New York'),('PL','Plume','New York'),('PU','Putnam Publishing Group','New York'),('RH','Random House','New York'),('SB','Schoken Books','New York'),('SC','Scribner','New York'),('SS','Simon & Schuster','New York'),('ST','Scholastic Trade','New York'),('TA','Taunton Press','Newtown CT'),('TB','Tor Books','New York'),('TH','Thames and Hudson','New York'),('TO','Touchstone Books','Westport CT'),('VB','Vintage Books','New York'),('WN','W.W. Norton','New York'),('WP','Westview Press','Boulder CO');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wrote`
--

DROP TABLE IF EXISTS `wrote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wrote` (
  `Author_Num` int NOT NULL,
  `Book_Code` varchar(4) NOT NULL,
  `Wrote_Sequence` int DEFAULT NULL,
  PRIMARY KEY (`Author_Num`,`Book_Code`),
  KEY `fk_Author_has_Book_Book1_idx` (`Book_Code`),
  KEY `fk_Author_has_Book_Author_idx` (`Author_Num`),
  CONSTRAINT `fk_Author_has_Book_Author` FOREIGN KEY (`Author_Num`) REFERENCES `author` (`Author_Num`),
  CONSTRAINT `fk_Author_has_Book_Book1` FOREIGN KEY (`Book_Code`) REFERENCES `book` (`Book_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wrote`
--

LOCK TABLES `wrote` WRITE;
/*!40000 ALTER TABLE `wrote` DISABLE KEYS */;
INSERT INTO `wrote` VALUES (1,'138X',1),(1,'6128',1),(1,'9627',1),(2,'3350',1),(3,'180',1),(4,'079X',1),(4,'808',1),(4,'9882',1),(5,'189',1),(5,'9611',2),(6,'1351',1),(6,'9611',1),(7,'669X',1),(8,'8720',1),(9,'2281',2),(10,'5790',1),(11,'378',1),(12,'8092',1),(13,'9931',1),(14,'6328',1),(15,'2226',1),(15,'7443',1),(16,'3743',1),(16,'6908',1),(16,'9883',1),(17,'2908',1),(18,'200',1),(18,'7559',1),(19,'2281',1),(20,'2766',1),(20,'5163',1),(20,'7405',1),(20,'9701',1),(23,'1382',2),(24,'3906',1),(25,'1382',1);
/*!40000 ALTER TABLE `wrote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-15  2:33:29
