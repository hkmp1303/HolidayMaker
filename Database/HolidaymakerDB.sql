-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: holidaymakerdb
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS holidaymakerdb;
USE holidaymakerdb;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `ActivitiesID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phonenumber` varchar(20) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Coordinates` point NOT NULL /*!80003 SRID 4326 */,
  `Price` decimal(10,2) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ActivitiesID`),
  SPATIAL KEY `Coordinates` (`Coordinates`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Liseberg Nöjespark','+46-31-400100','Örgrytevägen 5','Göteborg',0xE6100000010100000024B9FC87F4FB274054742497FFD84C40,595.00,'Nordens största nöjespark med berg-och-dalbanor.'),(2,'Paddan Båttur','+46-31-609670','Kungsportsplatsen','Göteborg',0xE61000000101000000AAF1D24D62F027400AD7A3703DDA4C40,220.00,'Klassisk sightseeingbåt under Göteborgs broar.'),(3,'Vasamuseet','+46-8-51954800','Galärvarvsvägen 14','Stockholm',0xE61000000101000000BADA8AFD65173240448B6CE7FBA94D40,190.00,'Se det välbevarade regalskeppet Vasa från 1600-talet.'),(4,'ABBA The Museum','+46-8-12132860','Djurgårdsvägen 68','Stockholm',0xE6100000010100000062105839B4183240363CBD5296A94D40,250.00,'Interaktivt museum om den legendariska popgruppen.'),(5,'Hundspannstur','+46-980-12345','Marknadsvägen 63','Jukkasjärvi',0xE610000001010000003D0AD7A3709D3440BC96900F7AF65040,1800.00,'Åk släde bakom huskies genom det snötäckta landskapet.'),(6,'Norrskensjakt','+46-980-55555','Camp Ripan','Kiruna',0xE610000001010000009A99999999393440105839B4C8F65040,1200.00,'Guidad tur för att se Aurora Borealis.'),(7,'Tivoli Gardens','+45-33-151001','Vesterbrogade 3','Köpenhamn',0xE6100000010100000017B7D100DE22294058A835CD3BD64B40,400.00,'En av världens äldsta nöjesparker mitt i centrum.'),(8,'Kanalrundfart Nyhavn','+45-32-963000','Nyhavn 1','Köpenhamn',0xE610000001010000003BDF4F8D972E2940E5D022DBF9D64B40,150.00,'Båttur genom Köpenhamns kanaler.'),(9,'Sveaborg Fästning','+358-29-5338300','Suomenlinna C74','Helsingfors',0xE610000001010000005DFE43FAEDFB384051DA1B7C61124E40,0.00,'Historisk fästning på en ö utanför staden. Färjan kostar ca 5 EUR.'),(10,'Löyly Bastu & Restaurang','+358-9-61286550','Hernesaarenranta 4','Helsingfors',0xE61000000101000000CC5D4BC807ED3840CF66D5E76A134E40,250.00,'Modern bastuupplevelse vid havet.'),(11,'Vigelandsparken','+47-23-493700','Nobels gate 32','Oslo',0xE610000001010000006688635DDC6625402DB29DEFA7F64D40,0.00,'Världens största skulpturpark av en enda konstnär.'),(12,'Holmenkollen Skidmuseum','+47-916-71947','Kongeveien 5','Oslo',0xE61000000101000000F6285C8FC255254008AC1C5A64FB4D40,160.00,'Hopptorn med fantastisk utsikt över Oslofjorden.'),(13,'Frihetsgudinnan Tur','+1-212-363-3200','Battery Park','New York',0xE61000000101000000022B8716D98252C09C33A2B437584440,300.00,'Båttur till Liberty Island och Ellis Island.'),(14,'Broadway Musikal','+1-212-555-0000','Broadway','New York',0xE61000000101000000508D976E127F52C01B2FDD2406614440,1500.00,'Se en världskänd musikal som Lejonkungen eller Hamilton.'),(15,'Universal Studios Hollywood','+1-800-864-8377','100 Universal City Plaza','Los Angeles',0xE61000000101000000029A081B9E965DC0EFC9C342AD114140,1300.00,'Filmpark med attraktioner och studiotur.'),(16,'Hollywood Sign Hike','+1-323-250-8390','Griffith Park','Los Angeles',0xE610000001010000007F6ABC7493945DC0613255302A114140,0.00,'Vandring upp för att se den berömda skylten på nära håll.'),(17,'Everglades Airboat Tour','+1-305-226-6923','Tamiami Trail','Miami',0xE61000000101000000D7A3703D0A1F54C0C3F5285C8FC23940,450.00,'Åk svävare bland alligatorer i träskmarkerna.'),(18,'Art Deco Walking Tour','+1-305-672-2014','1001 Ocean Dr','Miami',0xE61000000101000000B81E85EB510854C048E17A14AEC73940,250.00,'Guidad tur bland de färgglada husen i South Beach.'),(19,'Cirque du Soleil O','+1-702-693-7722','3600 S Las Vegas Blvd','Las Vegas',0xE61000000101000000014D840D4FCB5CC0CAC342AD690E4240,1800.00,'Vattenshow i världsklass på Bellagio.'),(20,'Grand Canyon Helikopter','+1-702-736-0011','McCarran Airport','Las Vegas',0xE610000001010000004B598638D6C95CC0986E1283C00A4240,3500.00,'Flyg över Grand Canyon med landning i dalen.'),(21,'Alcatraz Island Tour','+1-415-981-7625','Pier 33','San Francisco',0xE61000000101000000508D976E129B5EC060E5D022DBE94240,450.00,'Besök det ökända fängelset mitt i bukten.'),(22,'Cykla Golden Gate','+1-415-555-1212','Fishermans Wharf','San Francisco',0xE6100000010100000082E2C798BB9A5EC08195438B6CE74240,300.00,'Hyr cykel och trampa över den röda bron.'),(23,'Eiffeltornet Toppen','+33-892-70-12-39','Champ de Mars','Paris',0xE610000001010000004260E5D0225B024076711B0DE06D4840,300.00,'Åk hissen hela vägen upp till toppen.'),(24,'Louvren Museum','+33-1-40-20-50-50','Rue de Rivoli','Paris',0xE610000001010000006C09F9A067B3024003780B24286E4840,200.00,'Se Mona Lisa och tusentals andra konstverk.'),(25,'London Eye','+44-20-7967-8021','Riverside Building','London',0xE61000000101000000643BDF4F8D97BEBFD50968226CC04940,350.00,'Europas högsta pariserhjul.'),(26,'Harry Potter Studio Tour','+44-345-084-0900','Studio Tour Dr','London',0xE6100000010100000052499D8026C2DABF4694F6065FD84940,650.00,'Besök inspelningsplatserna för Harry Potter.'),(27,'Sagrada Família','+34-932-080-414','Carrer de Mallorca 401','Barcelona',0xE610000001010000001361C3D32B6501403255302AA9B34440,350.00,'Gaudís ofullbordade mästerverk.'),(28,'Park Güell','+34-934-091-831','Carrer dOlot','Barcelona',0xE6100000010100000029CB10C7BA380140931804560EB54440,100.00,'Färgsprakande park med utsikt över staden.'),(29,'Gondoltur','+39-041-522-0000','San Marco','Venedig',0xE61000000101000000931804560EAD2840643BDF4F8DB74640,900.00,'Romantisk tur genom kanalerna.'),(30,'Murano Glasblåsning','+39-041-739-0000','Murano Island','Venedig',0xE61000000101000000F6285C8FC2B52840273108AC1CBA4640,0.00,'Demonstration av glaskonst (Ofta gratis, men man förväntas köpa).'),(31,'Berlin TV Tower','+49-30-247575','Panoramastraße 1A','Berlin',0xE61000000101000000FDF675E09CD12A40DFE00B93A9424A40,250.00,'Tysklands högsta byggnad med 360-graders utsikt.'),(32,'Berlinmuren East Side Gallery','+49-30-2517159','Mühlenstraße 3-100','Berlin',0xE6100000010100000054E3A59BC4E02A40713D0AD7A3404A40,0.00,'Konstgalleri målat direkt på resterna av muren.'),(33,'Colosseum Guidad Tur','+39-06-3996-7700','Piazza del Colosseo','Rom',0xE61000000101000000B22E6EA301FC28401973D712F2F14440,500.00,'Gå i gladiatorernas fotspår.'),(34,'Vatikanmuseerna','+39-06-6988-4676','Viale Vaticano','Rom',0xE610000001010000007FFB3A70CEE8284040A4DFBE0EF44440,400.00,'Se Sixtinska kapellet och Peterskyrkan.'),(35,'Gardens by the Bay','+65-6420-6848','18 Marina Gardens Dr','Singapore',0xE61000000101000000D734EF3845F759408CDB68006F81F43F,200.00,'Futuristisk park med Supertrees.'),(36,'Night Safari','+65-6269-3411','80 Mandai Lake Rd','Singapore',0xE61000000101000000DF4F8D976EF25940AC8BDB68006FF63F,500.00,'Världens första nattdjurpark.'),(37,'TeamLab Planets','+81-3-6380-0000','6-1-16 Toyosu','Tokyo',0xE610000001010000002497FF907E7961400A68226C78D24140,350.00,'Digitalt konstmuseum där du går barfota i vatten.'),(38,'Tokyo Disneyland','+81-45-330-5211','1-1 Maihama','Tokyo',0xE61000000101000000C0EC9E3C2C7C6140B7D100DE02D14140,800.00,'Magiskt kungarike på japanskt vis.'),(39,'Grand Palace','+66-2-623-5500','Na Phra Lan Rd','Bangkok',0xE610000001010000008195438B6C1F59400000000000802B40,150.00,'Thailands heligaste tempel och kungligt palats.'),(40,'Floating Market Tour','+66-2-555-0000','Damnoen Saduak','Bangkok',0xE610000001010000006891ED7C3FFD5840F0A7C64B37092B40,300.00,'Marknad på kanaler där säljare sitter i båtar.'),(41,'Bollywood Studio Tour','+91-22-2840-1000','Film City Rd','Mumbai',0xE6100000010100000054E3A59BC4385240B6F3FDD478293340,400.00,'Se bakom kulisserna på världens största filmindustri.'),(42,'Elephanta Caves','+91-22-2202-4400','Gharapuri','Mumbai',0xE61000000101000000560E2DB29D3B52409F3C2CD49AF63240,100.00,'Båttur till antika grottempel på en ö.'),(43,'Burj Khalifa At the Top','+971-4-888-8888','1 Sheikh Mohammed bin Rashid Blvd','Dubai',0xE61000000101000000DE02098A1FA34B406DC5FEB27B323940,500.00,'Världens högsta utsiktsplats.'),(44,'Ökensafari med BBQ','+971-50-123-4567','Dubai Desert','Dubai',0xE61000000101000000CDCCCCCCCCCC4B409A99999999D93840,600.00,'Jeepkörning i sanddyner och middag under stjärnorna.'),(45,'Sydney Opera House Tour','+61-2-9250-7111','Bennelong Point','Sydney',0xE61000000101000000865AD3BCE3E662403D9B559FABED40C0,300.00,'Guidad tur inne i det berömda segelhuset.'),(46,'Bondi Surf Lesson','+61-2-9365-1800','Bondi Beach','Sydney',0xE61000000101000000B459F5B9DAE86240273108AC1CF240C0,700.00,'Lär dig surfa på världens kändaste strand.'),(47,'Haj- och rockasafari','+689-87-77-77-77','Vaitape','Bora Bora',0xE610000001010000007D3F355EBAF762C01CEBE2361A8030C0,1200.00,'Simma med ofarliga hajar och rockor i lagunen.'),(48,'Jet Ski Tour','+689-87-22-22-22','Matira Point','Bora Bora',0xE61000000101000000DD24068195F762C00AD7A3703D8A30C0,1500.00,'Fartfylld tur runt hela ön.'),(49,'Sky Tower Jump','+64-9-363-6000','Victoria St W','Auckland',0xE610000001010000005C2041F163D86540F853E3A59B6C42C0,1900.00,'Hoppa bungyjump från 192 meters höjd.'),(50,'Hobbiton Movie Set','+64-7-888-1505','501 Buckland Rd','Matamata (Auckland)',0xE6100000010100000007CE1951DAF56540560E2DB29DEF42C0,900.00,'Besök Fylke från Sagan om Ringen (Dagsutflykt).'),(51,'Christ the Redeemer','+55-21-2558-1329','Parque Nacional da Tijuca','Rio de Janeiro',0xE610000001010000006DE7FBA9F19A45C0F90FE9B7AFF336C0,250.00,'Tåg upp till den berömda Jesus-statyn.'),(52,'Sockerlimpan Linbana','+55-21-2546-8400','Av. Pasteur 520','Rio de Janeiro',0xE6100000010100000096438B6CE79345C0508D976E12F336C0,300.00,'Linbana med magisk utsikt över Rio.'),(53,'Tango Show & Dinner','+54-11-4123-4567','San Telmo','Buenos Aires',0xE6100000010100000039B4C876BE2F4DC0736891ED7C4F41C0,800.00,'Klassisk argentinsk tango med biffmiddag.'),(54,'La Boca Tour','+54-11-5555-5555','Caminito','Buenos Aires',0xE6100000010100000075931804562E4DC060E5D022DB5141C0,150.00,'Färgglada hus och fotbollskultur vid Boca Juniors stadium.'),(55,'Atlasbergen Dagsutflykt','+212-600-112233','Atlas Mountains','Marrakech',0xE610000001010000003333333333331FC03333333333333F40,600.00,'Besök berberbyar och vattenfall.'),(56,'Jardin Majorelle','+212-524-31-30-47','Rue Yves St Laurent','Marrakech',0xE610000001010000005227A089B00120C0151DC9E53FA43F40,150.00,'Yves Saint Laurents berömda trädgård.'),(57,'Taffelberget Linbana','+27-21-424-8181','Tafelberg Rd','Kapstaden',0xE610000001010000009BE61DA7E86832405E4BC8073DFB40C0,300.00,'Åk upp på det platta berget för en fantastisk vy.'),(58,'Robben Island Ferry','+27-21-413-4200','V&A Waterfront','Kapstaden',0xE61000000101000000598638D6C55D3240D734EF3845E740C0,400.00,'Besök fängelset där Nelson Mandela satt.');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `adminCompanyID` (`CompanyID`),
  CONSTRAINT `adminCompanyID` FOREIGN KEY (`CompanyID`) REFERENCES `holidaymakerab` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@admin.com','admin','Awesome','Adminson',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity`
--

DROP TABLE IF EXISTS `amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity` (
  `AmenityID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`AmenityID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES (1,'Wifi'),(2,'Pool'),(3,'Sauna'),(4,'Gym'),(5,'Parking'),(6,'Restaurant'),(7,'Bar'),(8,'Breakfast'),(9,'Air Conditioning'),(10,'Pet Friendly'),(11,'Spa'),(12,'Playground'),(13,'Sitting Room'),(14,'Beachfront'),(15,'Play Room'),(16,'Kitchenette');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CustomerID` int NOT NULL,
  `TransportationID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `TransportationID` (`TransportationID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`TransportationID`) REFERENCES `transportation` (`TransportationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingactivities`
--

DROP TABLE IF EXISTS `bookingactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingactivities` (
  `BookingActivitiesID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int DEFAULT NULL,
  `ActivitiesID` int DEFAULT NULL,
  `DateStart` datetime NOT NULL,
  `DateEnd` datetime NOT NULL,
  PRIMARY KEY (`BookingActivitiesID`),
  KEY `BookingID` (`BookingID`),
  KEY `ActivitiesID` (`ActivitiesID`),
  CONSTRAINT `bookingactivities_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `bookingactivities_ibfk_2` FOREIGN KEY (`ActivitiesID`) REFERENCES `activities` (`ActivitiesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingactivities`
--

LOCK TABLES `bookingactivities` WRITE;
/*!40000 ALTER TABLE `bookingactivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookinghotel`
--

DROP TABLE IF EXISTS `bookinghotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookinghotel` (
  `BookingHotelID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `DateStart` datetime NOT NULL,
  `DateEnd` datetime NOT NULL,
  PRIMARY KEY (`BookingHotelID`),
  KEY `BookingID` (`BookingID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `bookinghotel_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `bookinghotel_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookinghotel`
--

LOCK TABLES `bookinghotel` WRITE;
/*!40000 ALTER TABLE `bookinghotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookinghotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phonenumber` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `customerCompanyID` (`CompanyID`),
  CONSTRAINT `customerCompanyID` FOREIGN KEY (`CompanyID`) REFERENCES `holidaymakerab` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customersupportemployee`
--

DROP TABLE IF EXISTS `customersupportemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customersupportemployee` (
  `customersupportemployeeID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phonenumber` varchar(20) DEFAULT NULL,
  `CompanyID` int DEFAULT NULL,
  PRIMARY KEY (`customersupportemployeeID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `CompanyID` (`CompanyID`),
  CONSTRAINT `CompanyID` FOREIGN KEY (`CompanyID`) REFERENCES `holidaymakerab` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customersupportemployee`
--

LOCK TABLES `customersupportemployee` WRITE;
/*!40000 ALTER TABLE `customersupportemployee` DISABLE KEYS */;
INSERT INTO `customersupportemployee` VALUES (1,'cse@holidaymaker.net','pass123','Hard','Workerman','070010101',1);
/*!40000 ALTER TABLE `customersupportemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidaymakerab`
--

DROP TABLE IF EXISTS `holidaymakerab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidaymakerab` (
  `CompanyID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaymakerab`
--

LOCK TABLES `holidaymakerab` WRITE;
/*!40000 ALTER TABLE `holidaymakerab` DISABLE KEYS */;
INSERT INTO `holidaymakerab` VALUES (1,'Holiday Maker AB','070000001','info@holidaymaker.net','fake street 1, 00001, fake city');
/*!40000 ALTER TABLE `holidaymakerab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `HotelID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `Address` varchar(150) NOT NULL,
  `City` varchar(50) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `Coordinates` point NOT NULL /*!80003 SRID 4326 */,
  `TotalCapacity` int DEFAULT NULL,
  PRIMARY KEY (`HotelID`),
  UNIQUE KEY `Name` (`Name`),
  SPATIAL KEY `Coordinates` (`Coordinates`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'The Plaza New York','Ikoniskt lyxhotell vid Central Park.','768 5th Ave','New York','+1-212-759-3000',0xE610000001010000003C4ED1915C7E524060E5D022DB614440,282),(2,'Beverly Hills Hotel','Kändistätt hotell i Los Angeles.','9641 Sunset Blvd','Los Angeles','+1-310-276-2251',0xE61000000101000000BC96900F7A9A5D4043AD69DE710A4140,210),(3,'Miami Beach Resort','Hotell precis vid stranden och Ocean Drive.','4833 Collins Ave','Miami','+1-305-532-3600',0xE6100000010100000064CC5D4BC80754406DE7FBA9F1D23940,400),(4,'Caesars Palace','Gigantiskt casino-hotell i Las Vegas.','3570 Las Vegas Blvd','Las Vegas','+1-866-227-5938',0xE61000000101000000BA490C022BCB5C40C9E53FA4DF0E4240,3960),(5,'Fairmont San Francisco','Historiskt hotell med utsikt över bukten.','950 Mason St','San Francisco','+1-415-772-5000',0xE6100000010100000035EF3845479A5E40DAACFA5C6DE54240,600),(6,'The Ritz Paris','Elegans i hjärtat av Paris.','15 Place Vendôme','Paris','+33-1-43-16-30-30',0xE610000001010000006F1283C0CAA10240C976BE9F1A6F4840,142),(7,'The Savoy London','Klassiskt brittiskt hotell vid Themsen.','Strand','London','+44-20-7836-4343',0xE610000001010000001DC9E53FA4DFBEBF0C93A98251C14940,260),(8,'Hotel Arts Barcelona','Skyskrapa med utsikt över Medelhavet.','Carrer de la Marina 19','Barcelona','+34-932-211-000',0xE610000001010000006EA301BC059201400B24287E8CB14440,480),(9,'Hotel Danieli Venice','Legendariskt hotell nära Markusplatsen.','Riva degli Schiavoni 4196','Venedig','+39-041-522-6480',0xE6100000010100000057EC2FBB27AF28409D8026C286B74640,200),(10,'Adlon Kempinski','Berömt hotell vid Brandenburger Tor.','Unter den Linden 77','Berlin','+49-30-22610',0xE6100000010100000034A2B437F8C22A40355EBA490C424A40,380),(11,'Rome Cavalieri','Resort med panoramautsikt över Rom.','Via Alberto Cadlolo 101','Rom','+39-06-35091',0xE6100000010100000017B7D100DEE2284004E78C28EDF54440,370),(12,'Marina Bay Sands','Världskänd pool på taket som ser ut som en båt.','10 Bayfront Ave','Singapore','+65-6688-8888',0xE61000000101000000B3EA73B515F759407FFB3A70CE88F43F,2560),(13,'Park Hyatt Tokyo','Känt från filmen Lost in Translation.','3-7-1-2 Nishi-Shinjuku','Tokyo','+81-3-5322-1234',0xE610000001010000008048BF7D1D7661409D11A5BDC1D74140,170),(14,'Mandarin Oriental Bangkok','Lyxhotell vid floden Chao Phraya.','48 Oriental Ave','Bangkok','+66-2-659-9000',0xE61000000101000000FE43FAEDEB205940C364AA6054722B40,330),(15,'Taj Mahal Palace','Historiskt landmärke vid havet.','Apollo Bunder','Mumbai','+91-22-6665-3366',0xE61000000101000000BEC117265335524024B9FC87F4EB3240,560),(16,'Burj Al Arab','Sjöstjärneformart 7-stjärnigt hotell.','Jumeirah St','Dubai','+971-4-301-7777',0xE6100000010100000072F90FE9B7974B40F931E6AE25243940,200),(17,'Atlantis The Palm','Resort på den konstgjorda ön Palm Jumeirah.','Crescent Rd','Dubai','+971-4-426-2000',0xE61000000101000000492EFF21FD8E4B40FE65F7E461213940,1500),(18,'Park Hyatt Sydney','Utsikt direkt mot operahuset.','7 Hickson Rd','Sydney','+61-2-9256-1234',0xE61000000101000000B1E1E995B2E662403D0AD7A370ED40C0,155),(19,'Four Seasons Bora Bora','Bungalows ute på vattnet.','Motu Tehotu','Bora Bora','+689-40-60-31-30',0xE610000001010000008104C58F31F762C07DAEB6627F7930C0,100),(20,'Sofitel Auckland','Lyx vid hamnen Viaduct Harbour.','21 Viaduct Harbour Ave','Auckland','+64-9-909-9000',0xE61000000101000000A3923A014DD865404ED1915CFE6B42C0,170),(21,'Copacabana Palace','Art Deco-hotell vid stranden.','Av. Atlântica 1702','Rio de Janeiro','+55-21-2548-7070',0xE61000000101000000F4FDD478E99645C0BA6B09F9A0F736C0,230),(22,'Alvear Palace','Klassisk fransk stil i Sydamerika.','Av. Alvear 1891','Buenos Aires','+54-11-4808-2100',0xE6100000010100000052B81E85EB314DC025068195434B41C0,190),(23,'La Mamounia','Palatshotell med stora trädgårdar.','Avenue Bab Jdid','Marrakech','+212-524-388-600',0xE61000000101000000E9482EFF21FD1FC01EA7E8482E9F3F40,200),(24,'The Table Bay','Vid Waterfront med utsikt över Taffelberget.','Quay 6','Kapstaden','+27-21-406-5000',0xE610000001010000003F355EBA496C3240F9A067B3EAF340C0,320),(25,'Gothia Sky Towers','Fantastisk utsikt över Göteborg.','Mässans Gata 24','Göteborg','+46-31-123456',0xE610000001010000000C022B8716F927408C4AEA0434D94C40,1200),(26,'Grand Hôtel','Vid Stockholms ström.','S. Blasieholmshamnen 8','Stockholm','+46-8-123456',0xE610000001010000004F1E166A4D1332401904560E2DAA4D40,300),(27,'Icehotel','Byggt av snö och is.','Marknadsvägen 63','Jukkasjärvi','+46-980-12345',0xE610000001010000005AF5B9DA8A9D3440BC96900F7AF65040,100),(28,'Villa Copenhagen','Nytt lyxhotell i gamla posthuset.','Tietgensgade 35','Köpenhamn','+45-78-73-00-00',0xE61000000101000000DD24068195232940AE47E17A14D64B40,390),(29,'Hotel Kämp','Finlands mest kända hotell.','Pohjoisesplanadi 29','Helsingfors','+358-9-576-111',0xE610000001010000003411363CBDF2384068226C787A154E40,179),(30,'The Thief','Designhotell på Tjuvholmen.','Landgangen 1','Oslo','+47-24-00-40-00',0xE6100000010100000052B81E85EB7125405C8FC2F528F44D40,119);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelamenity`
--

DROP TABLE IF EXISTS `hotelamenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelamenity` (
  `HotelID` int NOT NULL,
  `AmenityID` int NOT NULL,
  PRIMARY KEY (`HotelID`,`AmenityID`),
  KEY `AmenityID` (`AmenityID`),
  CONSTRAINT `hotelamenity_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`),
  CONSTRAINT `hotelamenity_ibfk_2` FOREIGN KEY (`AmenityID`) REFERENCES `amenity` (`AmenityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelamenity`
--

LOCK TABLES `hotelamenity` WRITE;
/*!40000 ALTER TABLE `hotelamenity` DISABLE KEYS */;
INSERT INTO `hotelamenity` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(3,2),(8,2),(11,2),(15,2),(16,2),(17,2),(19,2),(21,2),(10,3),(13,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(1,4),(4,4),(5,4),(7,4),(12,4),(16,4),(17,4),(2,5),(3,5),(4,5),(25,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,6),(25,6),(26,6),(27,6),(28,6),(29,6),(30,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(14,7),(15,7),(16,7),(17,7),(18,7),(19,7),(20,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(14,8),(15,8),(16,8),(17,8),(18,8),(19,8),(20,8),(21,8),(22,8),(23,8),(24,8),(25,8),(26,8),(27,8),(28,8),(29,8),(30,8),(1,9),(2,9),(3,9),(4,9),(12,9),(13,9),(14,9),(15,9),(16,9),(17,9),(21,9),(22,9),(23,9),(24,9),(2,10),(6,10),(26,10),(25,11),(26,11),(27,11),(16,12),(1,13),(12,13),(25,13),(3,14),(8,14),(15,14),(16,14),(17,14),(19,14),(21,14),(4,15),(16,15),(1,16),(12,16);
/*!40000 ALTER TABLE `hotelamenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RatingID` int NOT NULL AUTO_INCREMENT,
  `StarRating` int NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `DateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `CustomerID` int DEFAULT NULL,
  `HotelID` int DEFAULT NULL,
  `ActivitiesID` int DEFAULT NULL,
  PRIMARY KEY (`RatingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `HotelID` (`HotelID`),
  KEY `ActivitiesID` (`ActivitiesID`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`),
  CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`ActivitiesID`) REFERENCES `activities` (`ActivitiesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` int NOT NULL AUTO_INCREMENT,
  `HotelID` int DEFAULT NULL,
  `RoomType` varchar(50) DEFAULT NULL,
  `PricePerNight` decimal(10,2) DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`RoomID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,10,'Standard Room',1500.00,1),(2,22,'Standard Room',1500.00,1),(3,17,'Standard Room',1500.00,1),(4,2,'Standard Room',1500.00,1),(5,16,'Standard Room',1500.00,1),(6,4,'Standard Room',1500.00,1),(7,21,'Standard Room',1500.00,1),(8,5,'Standard Room',1500.00,1),(9,19,'Standard Room',1500.00,1),(10,25,'Standard Room',1500.00,1),(11,26,'Standard Room',1500.00,1),(12,8,'Standard Room',1500.00,1),(13,9,'Standard Room',1500.00,1),(14,29,'Standard Room',1500.00,1),(15,27,'Standard Room',1500.00,1),(16,23,'Standard Room',1500.00,1),(17,14,'Standard Room',1500.00,1),(18,12,'Standard Room',1500.00,1),(19,3,'Standard Room',1500.00,1),(20,18,'Standard Room',1500.00,1),(21,13,'Standard Room',1500.00,1),(22,11,'Standard Room',1500.00,1),(23,20,'Standard Room',1500.00,1),(24,15,'Standard Room',1500.00,1),(25,1,'Standard Room',1500.00,1),(26,6,'Standard Room',1500.00,1),(27,7,'Standard Room',1500.00,1),(28,24,'Standard Room',1500.00,1),(29,30,'Standard Room',1500.00,1),(30,28,'Standard Room',1500.00,1),(32,10,'Deluxe Room',2500.00,1),(33,22,'Deluxe Room',2500.00,1),(34,17,'Deluxe Room',2500.00,1),(35,2,'Deluxe Room',2500.00,1),(36,16,'Deluxe Room',2500.00,1),(37,4,'Deluxe Room',2500.00,1),(38,21,'Deluxe Room',2500.00,1),(39,5,'Deluxe Room',2500.00,1),(40,19,'Deluxe Room',2500.00,1),(41,25,'Deluxe Room',2500.00,1),(42,26,'Deluxe Room',2500.00,1),(43,8,'Deluxe Room',2500.00,1),(44,9,'Deluxe Room',2500.00,1),(45,29,'Deluxe Room',2500.00,1),(46,27,'Deluxe Room',2500.00,1),(47,23,'Deluxe Room',2500.00,1),(48,14,'Deluxe Room',2500.00,1),(49,12,'Deluxe Room',2500.00,1),(50,3,'Deluxe Room',2500.00,1),(51,18,'Deluxe Room',2500.00,1),(52,13,'Deluxe Room',2500.00,1),(53,11,'Deluxe Room',2500.00,1),(54,20,'Deluxe Room',2500.00,1),(55,15,'Deluxe Room',2500.00,1),(56,1,'Deluxe Room',2500.00,1),(57,6,'Deluxe Room',2500.00,1),(58,7,'Deluxe Room',2500.00,1),(59,24,'Deluxe Room',2500.00,1),(60,30,'Deluxe Room',2500.00,1),(61,28,'Deluxe Room',2500.00,1),(63,10,'Grand Suite',5000.00,1),(64,22,'Grand Suite',5000.00,1),(65,17,'Grand Suite',5000.00,1),(66,2,'Grand Suite',5000.00,1),(67,16,'Grand Suite',5000.00,1),(68,4,'Grand Suite',5000.00,1),(69,21,'Grand Suite',5000.00,1),(70,5,'Grand Suite',5000.00,1),(71,19,'Grand Suite',5000.00,1),(72,25,'Grand Suite',5000.00,1),(73,26,'Grand Suite',5000.00,1),(74,8,'Grand Suite',5000.00,1),(75,9,'Grand Suite',5000.00,1),(76,29,'Grand Suite',5000.00,1),(77,27,'Grand Suite',5000.00,1),(78,23,'Grand Suite',5000.00,1),(79,14,'Grand Suite',5000.00,1),(80,12,'Grand Suite',5000.00,1),(81,3,'Grand Suite',5000.00,1),(82,18,'Grand Suite',5000.00,1),(83,13,'Grand Suite',5000.00,1),(84,11,'Grand Suite',5000.00,1),(85,20,'Grand Suite',5000.00,1),(86,15,'Grand Suite',5000.00,1),(87,1,'Grand Suite',5000.00,1),(88,6,'Grand Suite',5000.00,1),(89,7,'Grand Suite',5000.00,1),(90,24,'Grand Suite',5000.00,1),(91,30,'Grand Suite',5000.00,1),(92,28,'Grand Suite',5000.00,1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportation` (
  `TransportationID` int NOT NULL AUTO_INCREMENT,
  `Phonenumber` varchar(20) NOT NULL,
  `Departure` datetime DEFAULT NULL,
  `Arrival` datetime DEFAULT NULL,
  `Coordinates` point NOT NULL /*!80003 SRID 4326 */,
  `Name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TransportationID`),
  SPATIAL KEY `Coordinates` (`Coordinates`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
INSERT INTO `transportation` VALUES (32,'0771-757575','2025-06-01 06:10:00','2025-06-01 09:40:00',0xE6100000010100000035EF384547F22740D0B359F5B9DA4C40,'SJ Snabbtåg X2000'),(33,'08-580000','2025-06-01 08:30:00','2025-06-01 11:55:00',0xE6100000010100000035EF384547F22740D0B359F5B9DA4C40,'MTRX Röd'),(34,'0771-757575','2025-06-01 16:15:00','2025-06-01 19:45:00',0xE6100000010100000035EF384547F22740D0B359F5B9DA4C40,'SJ Snabbtåg X2000'),(35,'0771-757575','2025-06-02 10:00:00','2025-06-02 13:30:00',0xE6100000010100000035EF384547F22740D0B359F5B9DA4C40,'SJ Intercity'),(36,'0771-757575','2025-06-05 15:00:00','2025-06-05 18:30:00',0xE61000000101000000575BB1BFEC0E32400AD7A3703DAA4D40,'SJ Snabbtåg X2000'),(37,'08-580000','2025-06-05 17:00:00','2025-06-05 20:25:00',0xE61000000101000000575BB1BFEC0E32400AD7A3703DAA4D40,'MTRX Röd'),(38,'0770-727727','2025-06-15 10:25:00','2025-06-15 13:00:00',0xE61000000101000000BA490C022B8B52C0C74B378941584440,'SAS SK903 (Arlanda - Newark)'),(39,'+1-800-221-1212','2025-06-15 12:00:00','2025-06-15 14:45:00',0xE610000001010000002041F163CC7152C060764F1E16524440,'Delta DL205 (Arlanda - JFK)'),(40,'0770-727727','2025-07-10 10:25:00','2025-07-10 13:00:00',0xE61000000101000000BA490C022B8B52C0C74B378941584440,'SAS SK903 (Arlanda - Newark)'),(41,'+1-800-864-8331','2025-07-10 09:15:00','2025-07-10 12:00:00',0xE61000000101000000BA490C022B8B52C0C74B378941584440,'United UA69 (Arlanda - Newark)'),(42,'0770-727727','2025-12-15 10:25:00','2025-12-15 13:00:00',0xE61000000101000000BA490C022B8B52C0C74B378941584440,'SAS SK903 (Julshoppa i NYC)'),(43,'0770-727727','2025-06-25 17:30:00','2025-06-26 07:30:00',0xE61000000101000000780B24287EEC31406C787AA52CD34D40,'SAS SK904 (Newark - Arlanda)'),(44,'+1-800-221-1212','2025-06-25 19:00:00','2025-06-26 09:00:00',0xE61000000101000000780B24287EEC31406C787AA52CD34D40,'Delta DL204 (JFK - Arlanda)'),(45,'+33-9-6939','2025-07-01 07:00:00','2025-07-01 09:40:00',0xE61000000101000000C3D32B6519620440B7627FD93D814840,'Air France AF1063 (Morgonflyg)'),(46,'0770-727727','2025-07-01 11:30:00','2025-07-01 14:10:00',0xE61000000101000000C3D32B6519620440B7627FD93D814840,'SAS SK573 (Lunchflyg)'),(47,'+47-2149','2025-07-01 19:45:00','2025-07-01 22:25:00',0xE61000000101000000C3D32B6519620440B7627FD93D814840,'Norwegian D8431 (Budget)'),(48,'+33-9-6939','2025-07-05 14:00:00','2025-07-05 16:40:00',0xE61000000101000000C3D32B6519620440B7627FD93D814840,'Air France AF1065 (Helg)'),(49,'0770-727727','2025-07-08 15:00:00','2025-07-08 17:35:00',0xE61000000101000000780B24287EEC31406C787AA52CD34D40,'SAS SK574 (Hem från Paris)'),(50,'+44-344-493','2025-08-01 07:30:00','2025-08-01 09:15:00',0xE61000000101000000C1A8A44E4013DDBF5C8FC2F528BC4940,'British Airways BA771'),(51,'0770-727727','2025-08-01 08:15:00','2025-08-01 10:00:00',0xE61000000101000000C1A8A44E4013DDBF5C8FC2F528BC4940,'SAS SK525'),(52,'+353-1-248','2025-08-01 18:00:00','2025-08-01 19:10:00',0xE61000000101000000DCD781734694CE3FC520B07268F14940,'Ryanair FR56 (Billigt)'),(53,'+44-344-493','2025-08-02 16:00:00','2025-08-02 17:45:00',0xE61000000101000000C1A8A44E4013DDBF5C8FC2F528BC4940,'British Airways BA781'),(54,'+81-3-6733','2025-09-10 17:30:00','2025-09-11 09:00:00',0xE61000000101000000265305A3928C614026E4839ECDE24140,'JAL JL408 (Direkt)'),(55,'+358-300','2025-09-10 15:00:00','2025-09-11 08:30:00',0xE61000000101000000265305A3928C614026E4839ECDE24140,'Finnair AY073 (Via Helsingfors)'),(56,'+66-2-356','2025-11-01 13:30:00','2025-11-02 05:45:00',0xE61000000101000000B22E6EA301305940E17A14AE47612B40,'Thai Airways TG961'),(57,'+66-2-356','2025-11-02 13:30:00','2025-11-03 05:45:00',0xE61000000101000000B22E6EA301305940E17A14AE47612B40,'Thai Airways TG961 (Nästa dag)'),(58,'+47-2149','2025-07-15 06:00:00','2025-07-15 09:40:00',0xE61000000101000000ED0DBE3099AA00404BEA043411A64440,'Norwegian D85670'),(59,'0770-727727','2025-07-15 14:00:00','2025-07-15 17:30:00',0xE61000000101000000ED0DBE3099AA00404BEA043411A64440,'SAS SK1811'),(60,'+971-600','2025-10-01 14:30:00','2025-10-01 23:20:00',0xE61000000101000000D712F241CFAE4B40E25817B7D1403940,'Emirates EK158'),(61,'+47-2149','2025-12-01 08:00:00','2025-12-01 17:00:00',0xE61000000101000000D712F241CFAE4B40E25817B7D1403940,'Norwegian D8654 (Vinterresa)'),(62,'+49-69','2025-11-20 22:00:00','2025-11-21 06:00:00',0xE610000001010000001EA7E8482E9F45C002BC051214CF36C0,'Lufthansa LH500');
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'holidaymakerdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 15:19:31
