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
INSERT INTO `activities` VALUES (1,'Liseberg NÃ¶jespark','+46-31-400100','Ã–rgrytevÃ¤gen 5','GÃ¶teborg',_binary '\æ\0\0\0\0\0$¹ü‡\ôû\'@Tt$—ÿ\ØL@',595.00,'Nordens stÃ¶rsta nÃ¶jespark med berg-och-dalbanor.'),(2,'Paddan BÃ¥ttur','+46-31-609670','Kungsportsplatsen','GÃ¶teborg',_binary '\æ\0\0\0\0\0ª\ñ\ÒMb\ð\'@\n×£p=\ÚL@',220.00,'Klassisk sightseeingbÃ¥t under GÃ¶teborgs broar.'),(3,'Vasamuseet','+46-8-51954800','GalÃ¤rvarvsvÃ¤gen 14','Stockholm',_binary '\æ\0\0\0\0\0ºÚŠýe2@D‹l\çû©M@',190.00,'Se det vÃ¤lbevarade regalskeppet Vasa frÃ¥n 1600-talet.'),(4,'ABBA The Museum','+46-8-12132860','DjurgÃ¥rdsvÃ¤gen 68','Stockholm',_binary '\æ\0\0\0\0\0bX9´2@6<½R–©M@',250.00,'Interaktivt museum om den legendariska popgruppen.'),(5,'Hundspannstur','+46-980-12345','MarknadsvÃ¤gen 63','JukkasjÃ¤rvi',_binary '\æ\0\0\0\0\0=\n×£p4@¼–z\öP@',1800.00,'Ã…k slÃ¤de bakom huskies genom det snÃ¶tÃ¤ckta landskapet.'),(6,'Norrskensjakt','+46-980-55555','Camp Ripan','Kiruna',_binary '\æ\0\0\0\0\0š™™™™94@X9´\È\öP@',1200.00,'Guidad tur fÃ¶r att se Aurora Borealis.'),(7,'Tivoli Gardens','+45-33-151001','Vesterbrogade 3','KÃ¶penhamn',_binary '\æ\0\0\0\0\0·\Ñ\0\Þ\")@X¨5\Í;\ÖK@',400.00,'En av vÃ¤rldens Ã¤ldsta nÃ¶jesparker mitt i centrum.'),(8,'Kanalrundfart Nyhavn','+45-32-963000','Nyhavn 1','KÃ¶penhamn',_binary '\æ\0\0\0\0\0;\ßO—.)@\å\Ð\"\Ûù\ÖK@',150.00,'BÃ¥ttur genom KÃ¶penhamns kanaler.'),(9,'Sveaborg FÃ¤stning','+358-29-5338300','Suomenlinna C74','Helsingfors',_binary '\æ\0\0\0\0\0]þCú\íû8@Q\Ú|aN@',0.00,'Historisk fÃ¤stning pÃ¥ en Ã¶ utanfÃ¶r staden. FÃ¤rjan kostar ca 5 EUR.'),(10,'LÃ¶yly Bastu & Restaurang','+358-9-61286550','Hernesaarenranta 4','Helsingfors',_binary '\æ\0\0\0\0\0\Ì]K\È\í8@\Ïf\Õ\çjN@',250.00,'Modern bastuupplevelse vid havet.'),(11,'Vigelandsparken','+47-23-493700','Nobels gate 32','Oslo',_binary '\æ\0\0\0\0\0fˆc]\Üf%@-²\ï§\öM@',0.00,'VÃ¤rldens stÃ¶rsta skulpturpark av en enda konstnÃ¤r.'),(12,'Holmenkollen Skidmuseum','+47-916-71947','Kongeveien 5','Oslo',_binary '\æ\0\0\0\0\0\ö(\\\ÂU%@¬ZdûM@',160.00,'Hopptorn med fantastisk utsikt Ã¶ver Oslofjorden.'),(13,'Frihetsgudinnan Tur','+1-212-363-3200','Battery Park','New York',_binary '\æ\0\0\0\0\0+‡Ù‚RÀœ3¢´7XD@',300.00,'BÃ¥ttur till Liberty Island och Ellis Island.'),(14,'Broadway Musikal','+1-212-555-0000','Broadway','New York',_binary '\æ\0\0\0\0\0P—nRÀ/\Ý$aD@',1500.00,'Se en vÃ¤rldskÃ¤nd musikal som Lejonkungen eller Hamilton.'),(15,'Universal Studios Hollywood','+1-800-864-8377','100 Universal City Plaza','Los Angeles',_binary '\æ\0\0\0\0\0šž–]À\ï\É\ÃB­A@',1300.00,'Filmpark med attraktioner och studiotur.'),(16,'Hollywood Sign Hike','+1-323-250-8390','Griffith Park','Los Angeles',_binary '\æ\0\0\0\0\0j¼t“”]Àa2U0*A@',0.00,'Vandring upp fÃ¶r att se den berÃ¶mda skylten pÃ¥ nÃ¤ra hÃ¥ll.'),(17,'Everglades Airboat Tour','+1-305-226-6923','Tamiami Trail','Miami',_binary '\æ\0\0\0\0\0×£p=\nTÀ\Ã\õ(\\\Â9@',450.00,'Ã…k svÃ¤vare bland alligatorer i trÃ¤skmarkerna.'),(18,'Art Deco Walking Tour','+1-305-672-2014','1001 Ocean Dr','Miami',_binary '\æ\0\0\0\0\0¸…\ëQTÀH\áz®\Ç9@',250.00,'Guidad tur bland de fÃ¤rgglada husen i South Beach.'),(19,'Cirque du Soleil O','+1-702-693-7722','3600 S Las Vegas Blvd','Las Vegas',_binary '\æ\0\0\0\0\0M„\rO\Ë\\À\Ê\ÃB­iB@',1800.00,'Vattenshow i vÃ¤rldsklass pÃ¥ Bellagio.'),(20,'Grand Canyon Helikopter','+1-702-736-0011','McCarran Airport','Las Vegas',_binary '\æ\0\0\0\0\0KY†8\Ö\É\\À˜nƒÀ\nB@',3500.00,'Flyg Ã¶ver Grand Canyon med landning i dalen.'),(21,'Alcatraz Island Tour','+1-415-981-7625','Pier 33','San Francisco',_binary '\æ\0\0\0\0\0P—n›^À`\å\Ð\"\Û\éB@',450.00,'BesÃ¶k det Ã¶kÃ¤nda fÃ¤ngelset mitt i bukten.'),(22,'Cykla Golden Gate','+1-415-555-1212','Fishermans Wharf','San Francisco',_binary '\æ\0\0\0\0\0‚\âÇ˜»š^À•C‹l\çB@',300.00,'Hyr cykel och trampa Ã¶ver den rÃ¶da bron.'),(23,'Eiffeltornet Toppen','+33-892-70-12-39','Champ de Mars','Paris',_binary '\æ\0\0\0\0\0B`\å\Ð\"[@vq\r\àmH@',300.00,'Ã…k hissen hela vÃ¤gen upp till toppen.'),(24,'Louvren Museum','+33-1-40-20-50-50','Rue de Rivoli','Paris',_binary '\æ\0\0\0\0\0l	ù g³@x$(nH@',200.00,'Se Mona Lisa och tusentals andra konstverk.'),(25,'London Eye','+44-20-7967-8021','Riverside Building','London',_binary '\æ\0\0\0\0\0d;\ßO—¾¿\Õ	h\"lÀI@',350.00,'Europas hÃ¶gsta pariserhjul.'),(26,'Harry Potter Studio Tour','+44-345-084-0900','Studio Tour Dr','London',_binary '\æ\0\0\0\0\0RI€&\ÂÚ¿F”\ö_\ØI@',650.00,'BesÃ¶k inspelningsplatserna fÃ¶r Harry Potter.'),(27,'Sagrada FamÃ­lia','+34-932-080-414','Carrer de Mallorca 401','Barcelona',_binary '\æ\0\0\0\0\0a\Ã\Ó+e@2U0*©³D@',350.00,'GaudÃ­s ofullbordade mÃ¤sterverk.'),(28,'Park GÃ¼ell','+34-934-091-831','Carrer dOlot','Barcelona',_binary '\æ\0\0\0\0\0)\ËÇº8@“VµD@',100.00,'FÃ¤rgsprakande park med utsikt Ã¶ver staden.'),(29,'Gondoltur','+39-041-522-0000','San Marco','Venedig',_binary '\æ\0\0\0\0\0“V­(@d;\ßO·F@',900.00,'Romantisk tur genom kanalerna.'),(30,'Murano GlasblÃ¥sning','+39-041-739-0000','Murano Island','Venedig',_binary '\æ\0\0\0\0\0\ö(\\Âµ(@\'1¬ºF@',0.00,'Demonstration av glaskonst (Ofta gratis, men man fÃ¶rvÃ¤ntas kÃ¶pa).'),(31,'Berlin TV Tower','+49-30-247575','PanoramastraÃŸe 1A','Berlin',_binary '\æ\0\0\0\0\0ý\öu\àœ\Ñ*@\ß\à“©BJ@',250.00,'Tysklands hÃ¶gsta byggnad med 360-graders utsikt.'),(32,'Berlinmuren East Side Gallery','+49-30-2517159','MÃ¼hlenstraÃŸe 3-100','Berlin',_binary '\æ\0\0\0\0\0Tã¥›\Ä\à*@q=\n×£@J@',0.00,'Konstgalleri mÃ¥lat direkt pÃ¥ resterna av muren.'),(33,'Colosseum Guidad Tur','+39-06-3996-7700','Piazza del Colosseo','Rom',_binary '\æ\0\0\0\0\0².n£ü(@s\×\ò\ñD@',500.00,'GÃ¥ i gladiatorernas fotspÃ¥r.'),(34,'Vatikanmuseerna','+39-06-6988-4676','Viale Vaticano','Rom',_binary '\æ\0\0\0\0\0û:p\Î\è(@@¤ß¾\ôD@',400.00,'Se Sixtinska kapellet och Peterskyrkan.'),(35,'Gardens by the Bay','+65-6420-6848','18 Marina Gardens Dr','Singapore',_binary '\æ\0\0\0\0\0\×4\ï8E\÷Y@Œ\Ûh\0o\ô?',200.00,'Futuristisk park med Supertrees.'),(36,'Night Safari','+65-6269-3411','80 Mandai Lake Rd','Singapore',_binary '\æ\0\0\0\0\0\ßO—n\òY@¬‹\Ûh\0o\ö?',500.00,'VÃ¤rldens fÃ¶rsta nattdjurpark.'),(37,'TeamLab Planets','+81-3-6380-0000','6-1-16 Toyosu','Tokyo',_binary '\æ\0\0\0\0\0$—ÿ~ya@\nh\"lx\ÒA@',350.00,'Digitalt konstmuseum dÃ¤r du gÃ¥r barfota i vatten.'),(38,'Tokyo Disneyland','+81-45-330-5211','1-1 Maihama','Tokyo',_binary '\æ\0\0\0\0\0À\ìž<,|a@·\Ñ\0\Þ\ÑA@',800.00,'Magiskt kungarike pÃ¥ japanskt vis.'),(39,'Grand Palace','+66-2-623-5500','Na Phra Lan Rd','Bangkok',_binary '\æ\0\0\0\0\0•C‹lY@\0\0\0\0\0€+@',150.00,'Thailands heligaste tempel och kungligt palats.'),(40,'Floating Market Tour','+66-2-555-0000','Damnoen Saduak','Bangkok',_binary '\æ\0\0\0\0\0h‘\í|?ýX@\ð§\ÆK7	+@',300.00,'Marknad pÃ¥ kanaler dÃ¤r sÃ¤ljare sitter i bÃ¥tar.'),(41,'Bollywood Studio Tour','+91-22-2840-1000','Film City Rd','Mumbai',_binary '\æ\0\0\0\0\0Tã¥›\Ä8R@¶\óý\Ôx)3@',400.00,'Se bakom kulisserna pÃ¥ vÃ¤rldens stÃ¶rsta filmindustri.'),(42,'Elephanta Caves','+91-22-2202-4400','Gharapuri','Mumbai',_binary '\æ\0\0\0\0\0V-²;R@Ÿ<,Ôš\ö2@',100.00,'BÃ¥ttur till antika grottempel pÃ¥ en Ã¶.'),(43,'Burj Khalifa At the Top','+971-4-888-8888','1 Sheikh Mohammed bin Rashid Blvd','Dubai',_binary '\æ\0\0\0\0\0\Þ	Š£K@m\Åþ²{29@',500.00,'VÃ¤rldens hÃ¶gsta utsiktsplats.'),(44,'Ã–kensafari med BBQ','+971-50-123-4567','Dubai Desert','Dubai',_binary '\æ\0\0\0\0\0\Í\Ì\Ì\Ì\Ì\ÌK@š™™™™\Ù8@',600.00,'JeepkÃ¶rning i sanddyner och middag under stjÃ¤rnorna.'),(45,'Sydney Opera House Tour','+61-2-9250-7111','Bennelong Point','Sydney',_binary '\æ\0\0\0\0\0†ZÓ¼\ã\æb@=›UŸ«\í@À',300.00,'Guidad tur inne i det berÃ¶mda segelhuset.'),(46,'Bondi Surf Lesson','+61-2-9365-1800','Bondi Beach','Sydney',_binary '\æ\0\0\0\0\0´Y\õ¹\Ú\èb@\'1¬\ò@À',700.00,'LÃ¤r dig surfa pÃ¥ vÃ¤rldens kÃ¤ndaste strand.'),(47,'Haj- och rockasafari','+689-87-77-77-77','Vaitape','Bora Bora',_binary '\æ\0\0\0\0\0}?5^º\÷bÀ\ë\â6\Z€0À',1200.00,'Simma med ofarliga hajar och rockor i lagunen.'),(48,'Jet Ski Tour','+689-87-22-22-22','Matira Point','Bora Bora',_binary '\æ\0\0\0\0\0\Ý$•\÷bÀ\n×£p=Š0À',1500.00,'Fartfylld tur runt hela Ã¶n.'),(49,'Sky Tower Jump','+64-9-363-6000','Victoria St W','Auckland',_binary '\æ\0\0\0\0\0\\ A\ñc\Øe@øSã¥›lBÀ',1900.00,'Hoppa bungyjump frÃ¥n 192 meters hÃ¶jd.'),(50,'Hobbiton Movie Set','+64-7-888-1505','501 Buckland Rd','Matamata (Auckland)',_binary '\æ\0\0\0\0\0\ÎQ\Ú\õe@V-²\ïBÀ',900.00,'BesÃ¶k Fylke frÃ¥n Sagan om Ringen (Dagsutflykt).'),(51,'Christ the Redeemer','+55-21-2558-1329','Parque Nacional da Tijuca','Rio de Janeiro',_binary '\æ\0\0\0\0\0m\çû©\ñšEÀùé·¯\ó6À',250.00,'TÃ¥g upp till den berÃ¶mda Jesus-statyn.'),(52,'Sockerlimpan Linbana','+55-21-2546-8400','Av. Pasteur 520','Rio de Janeiro',_binary '\æ\0\0\0\0\0–C‹l\ç“EÀP—n\ó6À',300.00,'Linbana med magisk utsikt Ã¶ver Rio.'),(53,'Tango Show & Dinner','+54-11-4123-4567','San Telmo','Buenos Aires',_binary '\æ\0\0\0\0\09´\Èv¾/MÀsh‘\í|OAÀ',800.00,'Klassisk argentinsk tango med biffmiddag.'),(54,'La Boca Tour','+54-11-5555-5555','Caminito','Buenos Aires',_binary '\æ\0\0\0\0\0u“V.MÀ`\å\Ð\"\ÛQAÀ',150.00,'FÃ¤rgglada hus och fotbollskultur vid Boca Juniors stadium.'),(55,'Atlasbergen Dagsutflykt','+212-600-112233','Atlas Mountains','Marrakech',_binary '\æ\0\0\0\0\0333333À333333?@',600.00,'BesÃ¶k berberbyar och vattenfall.'),(56,'Jardin Majorelle','+212-524-31-30-47','Rue Yves St Laurent','Marrakech',_binary '\æ\0\0\0\0\0R\' ‰° À\É\å?¤?@',150.00,'Yves Saint Laurents berÃ¶mda trÃ¤dgÃ¥rd.'),(57,'Taffelberget Linbana','+27-21-424-8181','Tafelberg Rd','Kapstaden',_binary '\æ\0\0\0\0\0›\æ§\èh2@^K\È=û@À',300.00,'Ã…k upp pÃ¥ det platta berget fÃ¶r en fantastisk vy.'),(58,'Robben Island Ferry','+27-21-413-4200','V&A Waterfront','Kapstaden',_binary '\æ\0\0\0\0\0Y†8\Ö\Å]2@\×4\ï8E\ç@À',400.00,'BesÃ¶k fÃ¤ngelset dÃ¤r Nelson Mandela satt.');
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
INSERT INTO `hotel` VALUES (1,'The Plaza New York','Ikoniskt lyxhotell vid Central Park.','768 5th Ave','New York','+1-212-759-3000',_binary '\æ\0\0\0\0\0<NÑ‘\\~R@`\å\Ð\"\ÛaD@',282),(2,'Beverly Hills Hotel','KÃ¤ndistÃ¤tt hotell i Los Angeles.','9641 Sunset Blvd','Los Angeles','+1-310-276-2251',_binary '\æ\0\0\0\0\0¼–zš]@C­i\Þq\nA@',210),(3,'Miami Beach Resort','Hotell precis vid stranden och Ocean Drive.','4833 Collins Ave','Miami','+1-305-532-3600',_binary '\æ\0\0\0\0\0d\Ì]K\ÈT@m\çû©\ñ\Ò9@',400),(4,'Caesars Palace','Gigantiskt casino-hotell i Las Vegas.','3570 Las Vegas Blvd','Las Vegas','+1-866-227-5938',_binary '\æ\0\0\0\0\0ºI+\Ë\\@\É\å?¤\ßB@',3960),(5,'Fairmont San Francisco','Historiskt hotell med utsikt Ã¶ver bukten.','950 Mason St','San Francisco','+1-415-772-5000',_binary '\æ\0\0\0\0\05\ï8EGš^@Ú¬ú\\m\åB@',600),(6,'The Ritz Paris','Elegans i hjÃ¤rtat av Paris.','15 Place VendÃ´me','Paris','+33-1-43-16-30-30',_binary '\æ\0\0\0\0\0oƒÀÊ¡@\Év¾Ÿ\ZoH@',142),(7,'The Savoy London','Klassiskt brittiskt hotell vid Themsen.','Strand','London','+44-20-7836-4343',_binary '\æ\0\0\0\0\0\É\å?¤ß¾¿“©‚QÁI@',260),(8,'Hotel Arts Barcelona','Skyskrapa med utsikt Ã¶ver Medelhavet.','Carrer de la Marina 19','Barcelona','+34-932-211-000',_binary '\æ\0\0\0\0\0n£¼’@$(~Œ±D@',480),(9,'Hotel Danieli Venice','Legendariskt hotell nÃ¤ra Markusplatsen.','Riva degli Schiavoni 4196','Venedig','+39-041-522-6480',_binary '\æ\0\0\0\0\0W\ì/»\'¯(@€&Â†·F@',200),(10,'Adlon Kempinski','BerÃ¶mt hotell vid Brandenburger Tor.','Unter den Linden 77','Berlin','+49-30-22610',_binary '\æ\0\0\0\0\04¢´7ø\Â*@5^ºIBJ@',380),(11,'Rome Cavalieri','Resort med panoramautsikt Ã¶ver Rom.','Via Alberto Cadlolo 101','Rom','+39-06-35091',_binary '\æ\0\0\0\0\0·\Ñ\0\Þ\â(@\çŒ(\í\õD@',370),(12,'Marina Bay Sands','VÃ¤rldskÃ¤nd pool pÃ¥ taket som ser ut som en bÃ¥t.','10 Bayfront Ave','Singapore','+65-6688-8888',_binary '\æ\0\0\0\0\0³\êsµ\÷Y@û:pÎˆ\ô?',2560),(13,'Park Hyatt Tokyo','KÃ¤nt frÃ¥n filmen Lost in Translation.','3-7-1-2 Nishi-Shinjuku','Tokyo','+81-3-5322-1234',_binary '\æ\0\0\0\0\0€H¿}va@¥½Á\×A@',170),(14,'Mandarin Oriental Bangkok','Lyxhotell vid floden Chao Phraya.','48 Oriental Ave','Bangkok','+66-2-659-9000',_binary '\æ\0\0\0\0\0þCú\í\ë Y@\Ãdª`Tr+@',330),(15,'Taj Mahal Palace','Historiskt landmÃ¤rke vid havet.','Apollo Bunder','Mumbai','+91-22-6665-3366',_binary '\æ\0\0\0\0\0¾Á&S5R@$¹ü‡\ô\ë2@',560),(16,'Burj Al Arab','SjÃ¶stjÃ¤rneformart 7-stjÃ¤rnigt hotell.','Jumeirah St','Dubai','+971-4-301-7777',_binary '\æ\0\0\0\0\0rùé·—K@ù1\æ®%$9@',200),(17,'Atlantis The Palm','Resort pÃ¥ den konstgjorda Ã¶n Palm Jumeirah.','Crescent Rd','Dubai','+971-4-426-2000',_binary '\æ\0\0\0\0\0I.ÿ!ýŽK@þe\÷\äa!9@',1500),(18,'Park Hyatt Sydney','Utsikt direkt mot operahuset.','7 Hickson Rd','Sydney','+61-2-9256-1234',_binary '\æ\0\0\0\0\0±\áé•²\æb@=\n×£p\í@À',155),(19,'Four Seasons Bora Bora','Bungalows ute pÃ¥ vattnet.','Motu Tehotu','Bora Bora','+689-40-60-31-30',_binary '\æ\0\0\0\0\0Å1\÷bÀ}®¶by0À',100),(20,'Sofitel Auckland','Lyx vid hamnen Viaduct Harbour.','21 Viaduct Harbour Ave','Auckland','+64-9-909-9000',_binary '\æ\0\0\0\0\0£’:M\Øe@NÑ‘\\þkBÀ',170),(21,'Copacabana Palace','Art Deco-hotell vid stranden.','Av. AtlÃ¢ntica 1702','Rio de Janeiro','+55-21-2548-7070',_binary '\æ\0\0\0\0\0\ôý\Ôx\é–EÀºk	ù \÷6À',230),(22,'Alvear Palace','Klassisk fransk stil i Sydamerika.','Av. Alvear 1891','Buenos Aires','+54-11-4808-2100',_binary '\æ\0\0\0\0\0R¸…\ë1MÀ%•CKAÀ',190),(23,'La Mamounia','Palatshotell med stora trÃ¤dgÃ¥rdar.','Avenue Bab Jdid','Marrakech','+212-524-388-600',_binary '\æ\0\0\0\0\0\éH.ÿ!ýÀ§\èH.Ÿ?@',200),(24,'The Table Bay','Vid Waterfront med utsikt Ã¶ver Taffelberget.','Quay 6','Kapstaden','+27-21-406-5000',_binary '\æ\0\0\0\0\0?5^ºIl2@ù g³\ê\ó@À',320),(25,'Gothia Sky Towers','Fantastisk utsikt Ã¶ver GÃ¶teborg.','MÃ¤ssans Gata 24','GÃ¶teborg','+46-31-123456',_binary '\æ\0\0\0\0\0+‡ù\'@ŒJ\ê4\ÙL@',1200),(26,'Grand HÃ´tel','Vid Stockholms strÃ¶m.','S. Blasieholmshamnen 8','Stockholm','+46-8-123456',_binary '\æ\0\0\0\0\0OjM2@V-ªM@',300),(27,'Icehotel','Byggt av snÃ¶ och is.','MarknadsvÃ¤gen 63','JukkasjÃ¤rvi','+46-980-12345',_binary '\æ\0\0\0\0\0Z\õ¹ÚŠ4@¼–z\öP@',100),(28,'Villa Copenhagen','Nytt lyxhotell i gamla posthuset.','Tietgensgade 35','KÃ¶penhamn','+45-78-73-00-00',_binary '\æ\0\0\0\0\0\Ý$•#)@®G\áz\ÖK@',390),(29,'Hotel KÃ¤mp','Finlands mest kÃ¤nda hotell.','Pohjoisesplanadi 29','Helsingfors','+358-9-576-111',_binary '\æ\0\0\0\0\046<½\ò8@h\"lxzN@',179),(30,'The Thief','Designhotell pÃ¥ Tjuvholmen.','Landgangen 1','Oslo','+47-24-00-40-00',_binary '\æ\0\0\0\0\0R¸…\ëq%@\\\Â\õ(\ôM@',119);
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
INSERT INTO `transportation` VALUES (32,'0771-757575','2025-06-01 06:10:00','2025-06-01 09:40:00',_binary '\æ\0\0\0\0\05\ï8EG\ò\'@Ð³Y\õ¹\ÚL@','SJ SnabbtÃ¥g X2000'),(33,'08-580000','2025-06-01 08:30:00','2025-06-01 11:55:00',_binary '\æ\0\0\0\0\05\ï8EG\ò\'@Ð³Y\õ¹\ÚL@','MTRX RÃ¶d'),(34,'0771-757575','2025-06-01 16:15:00','2025-06-01 19:45:00',_binary '\æ\0\0\0\0\05\ï8EG\ò\'@Ð³Y\õ¹\ÚL@','SJ SnabbtÃ¥g X2000'),(35,'0771-757575','2025-06-02 10:00:00','2025-06-02 13:30:00',_binary '\æ\0\0\0\0\05\ï8EG\ò\'@Ð³Y\õ¹\ÚL@','SJ Intercity'),(36,'0771-757575','2025-06-05 15:00:00','2025-06-05 18:30:00',_binary '\æ\0\0\0\0\0W[±¿\ì2@\n×£p=ªM@','SJ SnabbtÃ¥g X2000'),(37,'08-580000','2025-06-05 17:00:00','2025-06-05 20:25:00',_binary '\æ\0\0\0\0\0W[±¿\ì2@\n×£p=ªM@','MTRX RÃ¶d'),(38,'0770-727727','2025-06-15 10:25:00','2025-06-15 13:00:00',_binary '\æ\0\0\0\0\0ºI+‹RÀ\ÇK7‰AXD@','SAS SK903 (Arlanda - Newark)'),(39,'+1-800-221-1212','2025-06-15 12:00:00','2025-06-15 14:45:00',_binary '\æ\0\0\0\0\0 A\ñc\ÌqRÀ`vORD@','Delta DL205 (Arlanda - JFK)'),(40,'0770-727727','2025-07-10 10:25:00','2025-07-10 13:00:00',_binary '\æ\0\0\0\0\0ºI+‹RÀ\ÇK7‰AXD@','SAS SK903 (Arlanda - Newark)'),(41,'+1-800-864-8331','2025-07-10 09:15:00','2025-07-10 12:00:00',_binary '\æ\0\0\0\0\0ºI+‹RÀ\ÇK7‰AXD@','United UA69 (Arlanda - Newark)'),(42,'0770-727727','2025-12-15 10:25:00','2025-12-15 13:00:00',_binary '\æ\0\0\0\0\0ºI+‹RÀ\ÇK7‰AXD@','SAS SK903 (Julshoppa i NYC)'),(43,'0770-727727','2025-06-25 17:30:00','2025-06-26 07:30:00',_binary '\æ\0\0\0\0\0x$(~\ì1@lxz¥,\ÓM@','SAS SK904 (Newark - Arlanda)'),(44,'+1-800-221-1212','2025-06-25 19:00:00','2025-06-26 09:00:00',_binary '\æ\0\0\0\0\0x$(~\ì1@lxz¥,\ÓM@','Delta DL204 (JFK - Arlanda)'),(45,'+33-9-6939','2025-07-01 07:00:00','2025-07-01 09:40:00',_binary '\æ\0\0\0\0\0\Ã\Ó+eb@·b\Ù=H@','Air France AF1063 (Morgonflyg)'),(46,'0770-727727','2025-07-01 11:30:00','2025-07-01 14:10:00',_binary '\æ\0\0\0\0\0\Ã\Ó+eb@·b\Ù=H@','SAS SK573 (Lunchflyg)'),(47,'+47-2149','2025-07-01 19:45:00','2025-07-01 22:25:00',_binary '\æ\0\0\0\0\0\Ã\Ó+eb@·b\Ù=H@','Norwegian D8431 (Budget)'),(48,'+33-9-6939','2025-07-05 14:00:00','2025-07-05 16:40:00',_binary '\æ\0\0\0\0\0\Ã\Ó+eb@·b\Ù=H@','Air France AF1065 (Helg)'),(49,'0770-727727','2025-07-08 15:00:00','2025-07-08 17:35:00',_binary '\æ\0\0\0\0\0x$(~\ì1@lxz¥,\ÓM@','SAS SK574 (Hem frÃ¥n Paris)'),(50,'+44-344-493','2025-08-01 07:30:00','2025-08-01 09:15:00',_binary '\æ\0\0\0\0\0Á¨¤N@Ý¿\\\Â\õ(¼I@','British Airways BA771'),(51,'0770-727727','2025-08-01 08:15:00','2025-08-01 10:00:00',_binary '\æ\0\0\0\0\0Á¨¤N@Ý¿\\\Â\õ(¼I@','SAS SK525'),(52,'+353-1-248','2025-08-01 18:00:00','2025-08-01 19:10:00',_binary '\æ\0\0\0\0\0\Ü×sF”\Î?\Å °rh\ñI@','Ryanair FR56 (Billigt)'),(53,'+44-344-493','2025-08-02 16:00:00','2025-08-02 17:45:00',_binary '\æ\0\0\0\0\0Á¨¤N@Ý¿\\\Â\õ(¼I@','British Airways BA781'),(54,'+81-3-6733','2025-09-10 17:30:00','2025-09-11 09:00:00',_binary '\æ\0\0\0\0\0&S£’Œa@&äƒž\Í\âA@','JAL JL408 (Direkt)'),(55,'+358-300','2025-09-10 15:00:00','2025-09-11 08:30:00',_binary '\æ\0\0\0\0\0&S£’Œa@&äƒž\Í\âA@','Finnair AY073 (Via Helsingfors)'),(56,'+66-2-356','2025-11-01 13:30:00','2025-11-02 05:45:00',_binary '\æ\0\0\0\0\0².n£0Y@\áz®Ga+@','Thai Airways TG961'),(57,'+66-2-356','2025-11-02 13:30:00','2025-11-03 05:45:00',_binary '\æ\0\0\0\0\0².n£0Y@\áz®Ga+@','Thai Airways TG961 (NÃ¤sta dag)'),(58,'+47-2149','2025-07-15 06:00:00','2025-07-15 09:40:00',_binary '\æ\0\0\0\0\0\í\r¾0™ª\0@K\ê4¦D@','Norwegian D85670'),(59,'0770-727727','2025-07-15 14:00:00','2025-07-15 17:30:00',_binary '\æ\0\0\0\0\0\í\r¾0™ª\0@K\ê4¦D@','SAS SK1811'),(60,'+971-600','2025-10-01 14:30:00','2025-10-01 23:20:00',_binary '\æ\0\0\0\0\0\×\òAÏ®K@\âX·\Ñ@9@','Emirates EK158'),(61,'+47-2149','2025-12-01 08:00:00','2025-12-01 17:00:00',_binary '\æ\0\0\0\0\0\×\òAÏ®K@\âX·\Ñ@9@','Norwegian D8654 (Vinterresa)'),(62,'+49-69','2025-11-20 22:00:00','2025-11-21 06:00:00',_binary '\æ\0\0\0\0\0§\èH.ŸEÀ¼\Ï6À','Lufthansa LH500');
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

-- Dump completed on 2025-12-03 10:49:27
