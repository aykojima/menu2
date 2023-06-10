-- MySQL dump 10.16  Distrib 10.2.10-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: skt_menu
-- ------------------------------------------------------
-- Server version	10.2.10-MariaDB

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
-- Current Database: `skt_menu`
--

-- /* CREATE DATABASE /*!32312 IF NOT EXISTS*/ `skt_menu` /*!40100 DEFAULT CHARACTER SET utf8 */; /

/* USE `skt_menu`; */

/* for testing purposes */
USE `test`;

--
-- Table structure for table `bottles`
--

DROP TABLE IF EXISTS `bottles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bottles` (
  `bottle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `size` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_price` int(11) DEFAULT NULL,
  `sake_id` int(10) unsigned DEFAULT NULL,
  `wine_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bottle_id`),
  KEY `bottles_sake_id_foreign` (`sake_id`),
  KEY `bottles_wine_id_foreign` (`wine_id`),
  CONSTRAINT `bottles_sake_id_foreign` FOREIGN KEY (`sake_id`) REFERENCES `sakes` (`sake_id`) ON DELETE CASCADE,
  CONSTRAINT `bottles_wine_id_foreign` FOREIGN KEY (`wine_id`) REFERENCES `wines` (`wine_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottles`
--

LOCK TABLES `bottles` WRITE;
/*!40000 ALTER TABLE `bottles` DISABLE KEYS */;
INSERT INTO `bottles` VALUES (1,'900',NULL,14,NULL,'2018-07-13 01:38:03','2018-07-13 01:38:03'),(2,'300',NULL,11,NULL,'2018-07-13 01:58:22','2018-09-06 00:08:20'),(3,'500',NULL,13,NULL,'2018-07-13 01:58:44','2018-07-13 01:58:44'),(4,'500',NULL,20,NULL,'2018-07-14 01:35:08','2018-07-14 01:35:08'),(5,'500',NULL,22,NULL,'2018-07-14 03:15:38','2018-07-14 03:15:38'),(6,'300',NULL,21,NULL,'2018-07-14 03:18:05','2018-07-14 03:18:05'),(7,'500',NULL,24,NULL,'2018-07-14 03:29:25','2018-07-14 03:29:25'),(9,'500',NULL,48,NULL,'2018-07-19 03:49:45','2018-07-19 03:49:45'),(10,'300',NULL,47,NULL,'2018-07-19 03:49:59','2018-07-19 03:49:59'),(11,'1000',NULL,54,NULL,'2018-07-19 04:04:41','2018-07-19 04:04:41'),(12,NULL,NULL,56,NULL,'2018-07-20 00:22:05','2018-09-03 23:22:47'),(13,'375',46,NULL,16,'2018-07-21 02:05:41','2018-07-21 02:05:41'),(14,'375',NULL,NULL,34,'2018-07-23 00:26:59','2018-07-23 00:26:59'),(16,NULL,NULL,NULL,7,'2018-09-03 23:37:26','2018-09-03 23:37:26'),(21,'300',NULL,40,NULL,'2018-09-07 01:57:39','2018-09-07 01:57:39');
/*!40000 ALTER TABLE `bottles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_add_on_items`
--

DROP TABLE IF EXISTS `c_add_on_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_add_on_items` (
  `c_add_on_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_add_on_id`),
  KEY `c_add_on_item_course_id_foreign` (`course_id`),
  CONSTRAINT `c_add_on_item_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_add_on_items`
--

LOCK TABLES `c_add_on_items` WRITE;
/*!40000 ALTER TABLE `c_add_on_items` DISABLE KEYS */;
INSERT INTO `c_add_on_items` VALUES (1,'Served with miso soup',NULL,1,NULL,'2018-03-27 07:21:39'),(2,'Substitute with all sustainable fish/ +3',NULL,1,NULL,NULL),(3,'Add sashimi course',15,2,'2018-03-24 00:32:58','2018-04-06 21:52:38'),(4,'Add sake pairing',23,2,'2018-03-24 00:35:31','2018-04-06 21:52:38'),(14,'Add sashimi course',15,36,NULL,NULL),(15,'Add sake pairing',34,36,NULL,NULL),(16,'Add sashimi course',15,4,NULL,NULL),(17,'Add sake pairing',40,4,NULL,NULL),(20,'Featuring lcal and seasonal ingredients in an authentic yet creative Japanese prepatation.',NULL,39,NULL,NULL);
/*!40000 ALTER TABLE `c_add_on_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_items`
--

DROP TABLE IF EXISTS `c_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_items` (
  `c_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_item_id`),
  KEY `c_item_course_id_foreign` (`course_id`),
  CONSTRAINT `c_item_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_items`
--

LOCK TABLES `c_items` WRITE;
/*!40000 ALTER TABLE `c_items` DISABLE KEYS */;
INSERT INTO `c_items` VALUES (1,'Bara Chirashi*',25,'sushi rice layered with nori, shrimp oboro, tamago, ginger and topped with a mix of tuna, salmon, yellowtail and ikura','N',1,NULL,NULL),(2,'Sushi Combo*',28,'seven pieces of nigiri sushi and a roll','N',1,NULL,NULL),(3,'Sashimi Combo*',30,'variety of sashimi chosen by the chef served with rice','N',1,NULL,NULL),(4,'Washington albacore tuna and mustard green*,',NULL,NULL,'Y',2,'2018-03-24 01:02:22','2018-04-06 21:52:38'),(5,'Shigoku oysters on the half shell*, or',NULL,NULL,'N',2,'2018-03-24 01:11:37','2018-04-06 21:52:38'),(6,'String bean salad',NULL,NULL,'N',2,'2018-03-24 01:13:56','2018-04-06 21:52:38'),(7,'Bara chirashi*, or',NULL,NULL,'Y',2,'2018-03-24 01:15:07','2018-04-06 21:52:38'),(8,'Sushi combination*',NULL,NULL,'N',2,'2018-03-24 01:15:51','2018-04-06 21:52:38'),(9,'Chestnut and butter scotch creme brulee, or',NULL,NULL,'Y',2,'2018-03-24 01:16:47','2018-04-06 21:52:38'),(11,'Yuzu and yogurt panna cotta',NULL,NULL,'N',2,'2018-03-24 01:17:55','2018-04-06 21:52:38'),(15,'Washington albacore tuna and mustard green*,',NULL,NULL,'Y',36,NULL,NULL),(16,'Shigoku oysters on the half shell*, or',NULL,NULL,'N',36,NULL,NULL),(17,'String bean salad',NULL,NULL,'N',36,NULL,NULL),(18,'Chawanmushi',NULL,NULL,'N',36,NULL,NULL),(19,'Special roll*',NULL,NULL,'N',36,NULL,NULL),(20,'Chef\'s selection of 7 pieces of Sushi',NULL,NULL,'N',36,NULL,NULL),(21,'Chestnut and butter scotch creme brulee, or',NULL,NULL,'Y',36,NULL,NULL),(23,'Yuzu and yogurt panna cotta',NULL,NULL,'N',36,NULL,NULL),(24,'Washington albacore tuna and mustard green*,',NULL,NULL,'Y',4,NULL,NULL),(25,'Shigoku oysters on the half shell*, or',NULL,NULL,'N',4,NULL,NULL),(26,'String bean salad',NULL,NULL,'N',4,NULL,NULL),(27,'Chawanmushi',NULL,NULL,'N',4,NULL,NULL),(28,'Black cod miso yuan yaki',NULL,NULL,'N',4,NULL,NULL),(29,'Chef\'s selection of 5 pieces of Sushi*',NULL,NULL,'N',4,NULL,NULL),(30,'Chef\'s selection of 5 pieces of Sushi*',NULL,NULL,'N',4,NULL,NULL),(31,'Chestnut and butter scotch creme brulee, or',NULL,NULL,'Y',4,NULL,NULL),(33,'Yuzu and yogurt panna cotta',NULL,NULL,'N',4,NULL,NULL),(37,'Sashimi Omakase',NULL,NULL,'N',39,NULL,NULL),(38,'Sushi Omakase',NULL,NULL,'N',39,NULL,NULL),(42,'Seven course Omakase',110,'Add sake pairing/ +55','N',39,NULL,NULL);
/*!40000 ALTER TABLE `c_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_omakases`
--

DROP TABLE IF EXISTS `c_omakases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_omakases` (
  `c_omakase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `om_price` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_price` int(11) DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_omakase_id`),
  KEY `c_omakase_course_id_foreign` (`course_id`),
  CONSTRAINT `c_omakase_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_omakases`
--

LOCK TABLES `c_omakases` WRITE;
/*!40000 ALTER TABLE `c_omakases` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_omakases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'HOUSE HOT SAKE','',NULL,NULL),(2,'HONJOZO 本醸造 / JUNNMAI　純米','food-friendly, solid, savory -- cold, ward, or hot',NULL,NULL),(3,'GINJO 吟醸 / JUNNMAI　GINJO 純米吟醸','aromatic, smooth, balanced; excellent with sushi and light ippins',NULL,NULL),(4,'DAIGINJO 大吟醸 / JUNNMAI　DAIGINJO 純米大吟醸','high-toned, feather-light, seductive; perfect with sashimi and nigiri',NULL,NULL),(5,'NIGORI / CLOUDY にごり','cloudy, textured, rich; pairs with maki, mochi',NULL,NULL),(6,'SWEET / DESSERT SAKE','',NULL,NULL),(7,'JUNMAI  純米','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(8,'HONJOZO  本醸造','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(9,'JUNMAI GINJO / GINJO 純米吟醸','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(10,'JUNMAI DAIGINJO 純米大吟醸','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(11,'DAIGINJO 大吟醸','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(12,'NAMA 生','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(13,'NIGORI にごり','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(14,'SWEET / UME 梅/ YUZU ゆず','solid, savory, ricey - pairs well with most ippins and maki',NULL,NULL),(15,'Sparkling','',NULL,NULL),(16,'White','',NULL,NULL),(17,'Rotating White','',NULL,NULL),(18,'Rosé','',NULL,NULL),(19,'Red','',NULL,NULL),(20,'Rotating Red','',NULL,NULL),(21,'Sparkling','',NULL,NULL),(22,'White','',NULL,NULL),(23,'Rosé','',NULL,NULL),(24,'Red','',NULL,NULL),(25,'SHOCHU 焼酎','',NULL,NULL),(26,'JAPANESE WHISKY ウイスキー','',NULL,NULL),(28,'WHISKY','',NULL,NULL),(29,'TEQUILA','',NULL,NULL),(30,'BRANDY','',NULL,NULL),(31,'VODKA','',NULL,NULL),(32,'GIN','',NULL,NULL),(33,'SPECIALTY COCKTAILS','',NULL,NULL),(34,'DRAFT','',NULL,NULL),(35,'BOTTLES AND CANS','',NULL,NULL),(36,'WATER','',NULL,NULL),(37,'TEA, SODA','',NULL,NULL),(38,'SEASONAL SAKE','',NULL,NULL),(39,'Sake','specials',NULL,NULL),(40,'Sparkling','specials',NULL,NULL),(41,'White','specials',NULL,NULL),(42,'Red','specials',NULL,NULL),(43,'Dessert','specials',NULL,NULL),(44,'Whisky','specials',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_omakase` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_order` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Two courses',NULL,NULL,'2018-03-27 07:38:03','',1),(2,'Three courses',39,'2018-03-24 00:27:21','2018-03-27 07:50:43','',2),(4,'Six courses',90,'2018-03-24 00:47:06','2018-03-27 06:58:34','',4),(36,'Five courses',55,'2018-04-05 03:36:27','2018-04-17 01:03:17','',3),(39,'Omakase',NULL,'2018-04-17 00:36:45','2018-05-09 00:39:37','Y',5);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ippins`
--

DROP TABLE IF EXISTS `ippins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ippins` (
  `ippin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `is_sustainable` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_raw` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_gf` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_special` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_on_menu` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ippin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ippins`
--

LOCK TABLES `ippins` WRITE;
/*!40000 ALTER TABLE `ippins` DISABLE KEYS */;
INSERT INTO `ippins` VALUES (1,'Mustard greens and Washington albacore tuna dressed with an almond wasabi sauce',10,'Y','Y','Y','AP','N','Y',NULL,NULL),(2,'Asparagus and himeji mushrooms in a creamy tofu sauce',9,'N','N','Y','AP','N','Y',NULL,NULL),(3,'Tempura assortment with white prawns, local rockfish, kabocha squash, shishito pepper, and satsuma yam',17,'Y','N','N','TM','N','Y',NULL,NULL),(4,'Madai (Ehime, JP) aradaki with hari ginger and fresh gobo',NULL,'N','N','Y','FS','N','Y',NULL,NULL),(5,'Skagit River Ranch organic pork tenderloin tonkatsu with sesame tonkatsu sauce',19,'N','N','N','MT','N','Y',NULL,NULL),(6,'Organic butter lettuce, radishes, toasted almonds and Washington Fuji apples tossed in a sweet miso dressing',15,'N','N','Y','AP','N','Y','2018-03-18 13:34:16','2018-03-18 13:43:34'),(7,'Shigoku oysters on the half shell with momiji ponzu',20,'Y','Y','Y','AP','N','Y','2018-03-18 13:36:18','2018-03-18 13:36:18'),(8,'Assorted vegetable tempura with kabocha squash, asparagus, organic shiitake, shishito pepper and satsuma yam served with shiitake mushroom and konbu dashi',14,'N','N','N','TM','N','Y','2018-03-18 14:01:10','2018-03-18 14:01:10'),(9,'Braised Snake River Farms wagyu beef skirt konabe with maitake mushrooms and yuchoi',20,'N','N','Y','MT','N','Y','2018-03-18 14:02:39','2018-03-18 14:02:39'),(10,'Edited test item',NULL,'Y','N','Y','AP','N','N','2018-04-12 01:03:53','2018-05-21 02:17:27'),(11,'Hijiki seaweed nimono',9,'N','N','Y','AP','N','Y','2018-05-17 00:47:41','2018-05-17 00:47:57'),(12,'Shishito peppers blistered and sprinkled with sea salt',9,'N','N','Y','AP','N','N','2018-05-17 00:54:36','2018-05-17 00:54:36'),(13,'Geoduck (Puget Sound, WA) tender with mustard greens and shimeji mushrooms sautéed in a sake soy butter sauce',17,'Y','N','N','FS','N','Y','2018-05-17 01:02:26','2018-05-17 01:53:08'),(14,'Shishito peppers blistered and sprinkled with sea salt',9,'N','N','Y','AP','N','Y','2018-05-17 01:08:45','2018-05-17 01:08:45'),(15,'Shishito peppers blistered and sprinkled with sea salt',9,'N','N','Y','AP','N','Y','2018-05-17 01:09:30','2018-05-17 01:09:30'),(16,'Shishito peppers blistered and sprinkled with sea salt',9,'N','N','Y','AP','N','Y','2018-05-17 01:09:42','2018-05-17 01:09:42'),(17,'King salmon kama shioyaki',NULL,'Y','N','Y','FS','N','Y','2018-05-17 01:53:54','2018-05-25 04:57:01'),(18,'Alaskan kinki nitsuke with hari ginger and fresh gobo',NULL,'Y','N','Y','FS','N','Y','2018-05-17 01:54:07','2018-05-17 01:54:07'),(19,'Alaskan kinki nitsuke with hari ginger and fresh gobo',NULL,'Y','N','Y','FS','N','Y','2018-05-17 01:55:17','2018-05-17 01:55:17'),(20,'Black cod (Nea Bay, WA) miso yuanyaki',20,'Y','N','Y','FS','N','Y','2018-05-18 00:37:32','2018-05-18 00:37:32'),(21,'E Test item',NULL,'Y','Y','Y','AP','N','N','2018-05-21 02:13:19','2018-05-23 00:51:44'),(22,'Test item 2',NULL,'Y','Y','Y','AP','N','N','2018-05-21 02:14:08','2018-05-21 02:14:08'),(23,'Edited Test item 3',NULL,'Y','Y','Y','AP','N','N','2018-05-21 02:14:17','2018-05-23 00:47:06'),(24,'Test item 4',NULL,'Y','Y','Y','AP','N','N','2018-05-21 02:14:36','2018-05-21 02:14:36'),(25,'Test item 4',NULL,'Y','Y','Y','AP','N','N','2018-05-21 02:15:33','2018-05-21 02:15:33'),(26,'Test 6',NULL,'Y','Y','Y','AP','N','N','2018-05-23 00:41:53','2018-05-23 00:41:53'),(27,'Test 6',NULL,'Y','Y','Y','AP','N','N','2018-05-23 00:41:53','2018-05-23 00:41:53'),(28,'Test 7',NULL,'Y','Y','Y','AP','N','N','2018-05-23 00:45:44','2018-05-23 00:45:44');
/*!40000 ALTER TABLE `ippins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_displays`
--

DROP TABLE IF EXISTS `l_displays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_displays` (
  `l_disp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disp_section` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disp_title` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disp_subtitle` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disp_combo_title` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disp_combo_desc` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lunch_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`l_disp_id`),
  KEY `l_display_lunch_id_foreign` (`lunch_id`),
  CONSTRAINT `l_display_lunch_id_foreign` FOREIGN KEY (`lunch_id`) REFERENCES `lunches` (`lunch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_displays`
--

LOCK TABLES `l_displays` WRITE;
/*!40000 ALTER TABLE `l_displays` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_displays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_item_displays`
--

DROP TABLE IF EXISTS `l_item_displays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_item_displays` (
  `l_item_disp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disp_name` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disp_desc` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`l_item_disp_id`),
  KEY `l_item_display_l_item_id_foreign` (`l_item_id`),
  CONSTRAINT `l_item_display_l_item_id_foreign` FOREIGN KEY (`l_item_id`) REFERENCES `l_items` (`l_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_item_displays`
--

LOCK TABLES `l_item_displays` WRITE;
/*!40000 ALTER TABLE `l_item_displays` DISABLE KEYS */;
/*!40000 ALTER TABLE `l_item_displays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l_items`
--

DROP TABLE IF EXISTS `l_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l_items` (
  `l_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_raw` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lunch_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`l_item_id`),
  KEY `l_item_lunch_id_foreign` (`lunch_id`),
  CONSTRAINT `l_item_lunch_id_foreign` FOREIGN KEY (`lunch_id`) REFERENCES `lunches` (`lunch_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l_items`
--

LOCK TABLES `l_items` WRITE;
/*!40000 ALTER TABLE `l_items` DISABLE KEYS */;
INSERT INTO `l_items` VALUES (1,'Asa Gozen',23,'Wild sockeye salmon shioyaki and organic tamago yaki','N',1,NULL,NULL),(2,'Hiru Gozen',28,'Braised Snake River Ranch Wagyu beef skirt steak and maitake mushrooms konabe and Chef\'s sashimi selection of the day','Y',1,NULL,NULL),(3,'Nigiri Gozen',33,'seven pieces of chef\'s choice nigiri sushi','Y',1,NULL,NULL),(4,'Bara Chirashi',25,'Sushi rice layered with nori, shrimp oboro, tamago, ginger and topped with a mix of tuna, salmon, yellowtail, albacore and ikura','Y',2,NULL,NULL),(5,'Tempura Udon',19,'Udon with two wild gulf prawn tempura with scallion','N',3,NULL,NULL),(6,'Mustard greens and Washington albacore tuna dressed with an almond wasabi sauce',10,NULL,'Y',4,NULL,NULL),(7,'Organic spring mix, radishes, toasted almonds and Washington Fuji apples tossed in a sweet miso dressing',15,NULL,'N',4,NULL,NULL),(8,'Totten Shigoku oysters on the half shell with momiji ponzu',20,NULL,'Y',4,NULL,NULL),(9,'Chawan mushi with Jidori eggs, red crab and Neah Bay black cod',11,NULL,'N',4,NULL,NULL),(10,'Tempura Udon Combo',25,'Tempura udon with 3 pieces of nigiri of maguro, hamachi, and sockeye salmon','Y',3,NULL,NULL),(15,'Sushi Combo',28,'7 pieces of nigiri with a roll','Y',2,NULL,NULL),(16,'Deluxe Sushi Combo',33,'9 pieces of nigiri with a roll','Y',2,NULL,NULL),(17,'Sashimi Combo',30,'Daily selection of sashimi served with rice','Y',2,NULL,NULL);
/*!40000 ALTER TABLE `l_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lunches`
--

DROP TABLE IF EXISTS `lunches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lunches` (
  `lunch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `combo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `combo_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lunch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lunches`
--

LOCK TABLES `lunches` WRITE;
/*!40000 ALTER TABLE `lunches` DISABLE KEYS */;
INSERT INTO `lunches` VALUES (1,'Gozen','','All gozen Include:','Hijiki, agedashi tofu, string beans, and miso soup /   \r\nSubstitute with chawanmushi for miso +4 /\r\nAdd chef\'s sashimi selection +10 /\r\nAdd yuzu yogurt panna cotta +3',NULL,'2018-06-25 11:02:14'),(2,'Combinations','','','All combinations are served with miso soup / with all sustainable fish +3',NULL,'2018-06-25 11:05:54'),(3,'Noodle','','','','2018-06-02 01:24:11','2018-06-07 10:31:40'),(4,'Lunch Ippins',NULL,NULL,NULL,'2018-06-02 01:47:54','2018-06-02 01:47:54');
/*!40000 ALTER TABLE `lunches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (21,'2014_10_12_000000_create_users_table',1),(22,'2014_10_12_100000_create_password_resets_table',1),(23,'2018_03_01_040222_create_sb_table',1),(24,'2018_03_01_050908_create_ippin_table',1),(25,'2018_03_01_051355_create_roll_table',1),(26,'2018_03_01_051727_create_course_table',1),(27,'2018_03_01_051927_create_c_item_table',1),(28,'2018_03_01_172340_create_c_add_on_item_table',1),(29,'2018_03_01_172709_create_c_omakase_table',1),(30,'2018_03_01_174029_create_lunch_table',1),(31,'2018_03_01_175646_create_l_item_table',1),(32,'2018_03_01_175835_create_l_display_table',1),(33,'2018_03_01_180436_create_l_item_display_table',1),(34,'2018_03_01_180644_create_update_table',1),(35,'2018_03_04_234321_change_table_names',2),(36,'2018_03_15_224136_add_timestamps_to_tables',3),(37,'2018_05_08_171207_add_omakase_to_course',4),(38,'2018_05_09_204924_add_list_order_to_course',5),(39,'2018_05_29_202847_change_lunch_table_name',6),(41,'2018_06_07_183212_change_combo_desc_datatype',7),(42,'2018_06_30_215236_create_sake_wine_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `production_area` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ozeki \"Tanrei\"',12,'California','refreshing and light with a mellow finish',1,'2018-09-25 22:29:36','2018-09-25 22:29:36'),(2,'Genbei san no Onikoroshi',14,'Fushimi, Kyoto','soft and smooth; tropical fruit, rice, dried flowers',2,NULL,NULL),(3,'Miyasaka \"Yawaraka\" \"Sake Matinee\"',15,'Nagano','light and sweet; raspberry, roses',2,NULL,NULL),(4,'Kokryu \"Black Dragon\"',21,'Fukui','rich, soft, dynamic, and very smooth',3,NULL,'2018-07-07 01:33:55'),(5,'Enter Suhari',20,'Kyoto','rich and slightly effervescent; ripe pear, honeysuckle',4,NULL,NULL),(6,'Kurosawa Ginjo',14,'Nagano','light, sweet, green apple, refreshing finish',5,NULL,NULL),(7,'Nanbu Bijin \"Muto\" 100% kojimai Umeshu (4oz)',15,'Iwate','mineral, complex',6,NULL,NULL),(9,'Kasumi Tsuru \"Extra Dry\"',17,'Hyogo','shiitake, dried fruit, crisp dry finish',2,'2018-07-07 00:22:06','2018-07-08 05:37:53'),(10,'Kamoizumi \"Summer Snow\"',24,'Hiroshima','soft, tropical, dry, fresh',5,'2018-07-08 05:39:02','2018-07-08 05:39:02'),(11,'Nanbu Bijin \"Southern Beauty\"',40,'Iwate','tropical fruit, steamed rice, mineral; layered',7,'2018-07-10 03:06:23','2018-07-10 03:06:23'),(12,'Kikusui \"Chrysanthemum Water\"',54,'Niigata','compact, soft, dry; steamed rice, floral',8,'2018-07-10 03:20:32','2018-07-10 03:20:32'),(13,'Enter Sake \"Sookuu\"',60,'Fushimi, Kyoto','rich umami, silky smooth texture, long finish',7,'2018-07-12 23:56:05','2018-07-12 23:56:05'),(14,'Kenbishi \"Kuromatsu\"',78,'Nada, Hyogo','structured, scipy, intense umami',8,'2018-07-13 01:38:02','2018-07-13 01:38:02'),(15,'Kasumi Tsuru \"Extra Dry\"',56,'Kyogo','shiitake, dried fruit, crisp dry finish',7,'2018-07-14 00:28:37','2018-07-14 00:28:37'),(16,'Choryo Yamahai Taruzake',75,'Nara','elegant cedar aroma, spicy, smooth',7,'2018-07-14 00:32:35','2018-07-14 00:32:35'),(17,'Otokoyama \"Man\'s Mountain\"',82,'Hokkaido','mineral, mild, dry; masculin',7,'2018-07-14 00:33:43','2018-07-14 00:34:49'),(18,'Kokuryu \"Black Dragon\"',78,'Fukui','rich, soft, dynamic, and smooth',9,'2018-07-14 01:28:10','2018-07-14 01:28:10'),(19,'Kurosawa',42,'Nagano','light, sweet, green apple, refreshing finish',13,'2018-07-14 01:30:25','2018-07-14 01:30:25'),(20,'Yuzu Omoi \"Citrus Dream\"',50,'Kyoto','mandarin & lemon zest, round Yuzu sweetness, zippy finish',14,'2018-07-14 01:32:19','2018-07-14 03:15:38'),(21,'Nanbu Bijin \"Muto\"',80,'Iwate','koji rice sweetness + plum spice; savory, mineral, complex',14,'2018-07-14 01:33:40','2018-07-14 03:16:58'),(22,'Hana Hou Hou Shu \"Pink\"',34,'Okayama','made with rose hip and hibiscus; fruity and playful',14,'2018-07-14 01:33:43','2018-07-14 03:18:05'),(23,'Hanahato \"Gorgeous Bird\"',80,'Hiroshima','earthy, sweet, and fresh; Japan\'s answer to Oloroso sherry',14,'2018-07-14 01:35:08','2018-07-14 01:35:08'),(24,'Kamoizumi \"Summer Snow\"',54,'Hiroshima','soft, tropical, dry, fresh',13,'2018-07-14 03:29:25','2018-07-14 03:29:25'),(25,'Rihaku \"Dreamy Clouds\"',67,'Shimane','light clouds, dry, lively, green apple, cashew',13,'2018-07-14 03:30:22','2018-07-14 03:30:22'),(26,'Ryujin \"Dragon God\"',82,'Gunma','soft, slightly sweet; strawberries & cream',12,'2018-07-14 03:34:33','2018-07-14 03:34:33'),(28,'Tedorigawa \"Gold Blossom\"',85,'Ishikawa','vibrant, full, chalky, poised',12,'2018-07-16 23:44:08','2018-07-16 23:44:08'),(29,'Konteki \"Tears of Dawn\"',78,'Fushimi, Kyoto','floral, soft, honeydew, lemon zest; classic',11,'2018-07-16 23:46:05','2018-07-16 23:46:05'),(30,'Yoi-no-tsuki \"Midnight Moon\"',77,'Iwate','smooth and rich; melon, raspberry',11,'2018-07-16 23:47:35','2018-07-16 23:47:35'),(31,'Ken 2014',125,'Fukushima','benchmark daiginjo!',11,'2018-07-16 23:53:31','2018-07-16 23:53:31'),(32,'Gensai',185,'Fukushima','shehiro\'s velvety ode to rice and water',11,'2018-07-16 23:55:24','2018-07-16 23:55:24'),(33,'Hanahato \"Gorgeous Bird\"',13,'Hiroshima','earthy, sweet, and fresh; Japan\'s answer to Oloroso sherry',6,'2018-07-19 03:27:05','2018-07-19 03:27:05'),(34,'Konteki \"Tears of Dawn\"',22,'Fushimi, Kyoto','floral, soft, honeydew, lemon zest; classic',4,'2018-07-19 03:28:15','2018-07-19 03:28:15'),(35,'Dassai 50 \"Otterfest\"',24,'Yamaguchi','creamy, semi-dry, lively',4,'2018-07-19 03:29:17','2018-07-19 03:29:17'),(36,'Kikusui \"Setsugoro\"',90,'Niigata','old-school (Edo) brown rice seishu; sweet, sour, bitter, savory, intense',7,'2018-07-19 03:38:28','2018-07-19 03:38:28'),(37,'Eiko Fuji \"Honkara\"',56,'Yamagata','green apple, wet concrete, marshmallow; very dry',8,'2018-07-19 03:39:26','2018-07-19 03:39:26'),(38,'Enter Sake \"Black\"',60,'Aichi','classic Honjozo: lifted aroma, mild, light bodied, savory',8,'2018-07-19 03:40:19','2018-07-19 03:40:19'),(39,'Hakkaisan',70,'Niigata','soft, dry; savory, fruit, mineral',8,'2018-07-19 03:41:03','2018-07-19 03:41:03'),(40,'Taisetsu \"Garden of the Divine\"',26,'Hokkaido','mellow, compact, and very fruity',9,'2018-07-19 03:42:04','2018-07-19 03:42:04'),(41,'Yoshinogawa \"Winter Warrior\"',62,'Niigata','fragrant, fruity, light body, faint sweetness',9,'2018-07-19 03:42:54','2018-07-19 03:42:54'),(42,'Fukuju \"Happy Brewery\"',78,'Fukui','silky, fruity, minerals, elegant',9,'2018-07-19 03:43:54','2018-07-19 03:43:54'),(43,'Watari Bune \"55\"',85,'Ibaraki','complex mix of umami, flowers, fruit; food-friendly',9,'2018-07-19 03:44:59','2018-07-19 03:44:59'),(44,'Kuroushi \"Black Bull\"',85,'Wakayama','citrus, herbs, rich umami; aromatic and medium-light',9,'2018-07-19 03:45:57','2018-07-19 03:45:57'),(45,'Matsu no Tsukasa',100,'Shiga','rich, full-bodied, but settled; loads of fruit',9,'2018-07-19 03:46:40','2018-07-19 03:46:40'),(46,'Dewazakura \"Oka\" \"Cherry Bouquet\"',65,'Yamagata','intensely floral, soft, with pear and citrus',9,'2018-07-19 03:47:35','2018-07-19 03:47:35'),(47,'Kubota \"Manju\"',68,'Niigata','benchmark Niigata-- compact, dry, layered',10,'2018-07-19 03:48:36','2018-07-19 03:48:36'),(48,'Kamoizumi \"Autumn Elixir\"',59,'Hiroshima','persimmon, caramel, shiitake, forest floor',10,'2018-07-19 03:49:45','2018-07-19 03:49:45'),(49,'Enter Shuhari',70,'Kyoto','rich and slightly effervescent; ripe pear, honeysuckle',10,'2018-07-19 03:50:57','2018-07-19 03:50:57'),(50,'Tamanohikari',97,'Fushimi, Kyoto','soft water + heirloom right = fruity, rich; dry',10,'2018-07-19 03:51:44','2018-07-19 03:51:44'),(51,'Nanbu Bijin \"Shinpaku\"',85,'Iwate','fragrant; tropical fruit, mineral, ligering finish',10,'2018-07-19 03:52:33','2018-07-19 03:52:33'),(52,'Dassai 50 \"Otterfest\"',83,'Yamaguchi','supple textured, loads of fruit, smooth',10,'2018-07-19 03:53:23','2018-07-19 03:53:23'),(53,'Enter Sake \"Revolutions\"',180,'Yamaguchi','layers of fruit, compact, floral, seductive',10,'2018-07-19 03:54:22','2018-07-19 03:54:22'),(54,'Born \"Yume wa Masayume\"',375,'Fukui','extensively aged for remarkable depth',10,'2018-07-19 04:04:41','2018-07-19 04:04:41'),(55,'Mizubasho \"Pure\"',175,'Gunma','japan\'s gorgeous nod to Grand Cru Champagne',10,'2018-07-19 04:05:39','2018-07-19 04:05:39'),(56,'Dassai \"23\" \"Otter Fest\"',150,'Yamaguchi','milled to 23%-- in a class by itself',10,'2018-07-20 00:22:04','2018-07-20 00:22:04'),(57,'Gruet \"Sauvage\"',13,'USA','citrus, honey, fresh flowers; bone dry',15,NULL,NULL),(58,'Spy Valley',10,'Marlborough, NZ','citrus, honey, fresh flowers; bone dry',16,NULL,NULL),(59,'Anne Amie',12,'Willamette Valley, OR','citrus, honey, fresh flowers; bone dry',16,NULL,NULL),(60,'Fento \"Bico da Ran\"',13,'Rias Baixas, SP','citrus, honey, fresh flowers; bone dry',16,NULL,NULL),(63,'Miraval',14,'Provence, FR','archetype Provencial pink!',18,'2018-07-20 01:36:17','2018-07-20 01:36:17'),(64,'Waitsburg',13,'Columbia Valley, WA','silky, spicy, ripe fruit, subtle herbaciousness',19,'2018-07-20 01:37:39','2018-07-20 01:37:39'),(65,'Gruet \"Sauvage\"',50,'USA','citrus, honey, fresh flowers; bone dry',21,'2018-07-21 00:47:53','2018-07-21 00:47:53'),(66,'Antech \"Emotion Rosé\"',39,'Cémant de Limoux, Languedoc, FR','strawberry, lemon zest, moderate body; dry',21,'2018-07-21 00:53:27','2018-07-21 00:53:27'),(67,'Ellner \"Carte Blanche\"',63,'Epernay, Champagne, FR','fresh, raspberry, floral, smoky, vibrant; bone dry',21,'2018-07-21 00:54:38','2018-07-21 00:54:38'),(68,'Chartogne-Taillet',100,'Montagne de Reims, Champagne, FR','fresh raspberry, floral, smoky, vibrant; bone dry',21,'2018-07-21 00:56:02','2018-07-21 00:56:02'),(69,'Krug \"Grande Cuvé e\"',250,'Reims, Champagne, FR','gold-standard non-vintage Champagne',21,'2018-07-21 00:56:51','2018-07-21 00:56:51'),(70,'Anne Amie',46,'Willamette Valley, OR','textured, vibrant, refreshing',22,'2018-07-21 01:08:18','2018-07-21 01:08:18'),(71,'Ulcia',60,'Getariako Txakolina, Spain','effervescent, floral, and bright; made for sushi!',22,'2018-07-21 01:09:25','2018-07-21 01:09:25'),(72,'Parejas',48,'Columbia Valley, WA','a superb Washington rendition of Rias Biaxas!',22,'2018-07-21 01:17:00','2018-07-21 01:17:00'),(73,'Fento \"Bico da Ran\"',50,'Rias Baixas, SP','fresh flowers, ocean spray, orchard fruit; lively',22,'2018-07-21 01:18:00','2018-07-21 01:18:00'),(74,'La Cana \"Navia\"',76,'Rias Baixas, SP','stone fruit, vanilla, mineral; benchmark Albarino',22,'2018-07-21 01:19:06','2018-07-21 01:19:06'),(75,'Spy Valley',40,'Marlborough NZ','crisp, zesty, tropical fruit',22,'2018-07-21 01:51:27','2018-07-21 01:51:27'),(76,'Spottswoode',87,'Sonoma/Napa County, CA','tropical, bold, refreshing; light new oak',22,'2018-07-21 02:00:32','2018-07-21 02:00:32'),(77,'Cadaretta \"SBS\"',51,'Columbia Vally, WA','voluptuous; jalapeno, citrus, and herb',22,'2018-07-21 02:02:02','2018-07-21 02:02:02'),(78,'Domaine Vacheron',80,'Sancerre, FR','zesty, refreshing, austere; complex',22,'2018-07-21 02:05:41','2018-07-21 02:05:41'),(79,'Benanti',51,'Etna Bianco, IT','orange blossom, honeysuckle, fennel; lively, delicate',22,'2018-07-21 02:07:14','2018-07-21 02:07:14'),(80,'Michel Briday',60,'Rully, FR','soft impact, bright finish, light toast, mineral',22,'2018-07-21 02:08:12','2018-07-21 02:08:12'),(81,'Bernard Millot',100,'Puligny-Montrachet, FR','chalk, smoke, Bartlett pear; funky complexity',22,'2018-07-21 02:09:08','2018-07-21 02:09:08'),(82,'Comaine d\'Henri',95,'\"L\'Homme Mort\" 1er, Chablis, FR','pure with a touch of barrel-aged complexity',22,'2018-07-21 02:10:30','2018-07-21 02:10:30'),(83,'Louis Michel',128,'Les Clos Grand Cru, Chablis, FR','world-class unoaked Chardonnay',22,'2018-07-21 02:12:05','2018-07-21 02:12:05'),(84,'Orr \"Old Vine\"',56,'Columbia Valley, WA','erica Orr\'s stunning take on Loire Chenin Blanc',22,'2018-07-21 02:12:44','2018-07-21 02:12:44'),(85,'Huet \'Le Haut Lieu\' Demi-Sec',105,'Vouvray, FR','savory apple, spice, dried flowers, mineral; off-dry',22,'2018-07-21 02:15:26','2018-07-21 02:15:26'),(86,'Joly \'Clos de la Bergerie\'',130,'Savennieres - Roche-aux-Moines, FR','powerful; bruised apple, beeswax, ginger, saffron',22,'2018-07-21 02:16:45','2018-07-21 02:16:45'),(87,'Jean-Luc Colombo \"La Redonne\"',42,'Cotes du Rhone, FR','fragrant, floral, herbacious, and soft',22,'2018-07-21 02:17:46','2018-07-21 02:17:46'),(88,'JJ Prum \'Graacher Himmerlreich\'',66,'Mosel, GE','aromatic, off-dry, racy; honeysuckle, citrus, slate',22,'2018-07-21 02:18:48','2018-07-21 02:18:48'),(89,'Karthauserhof \"Alte Reben\"',85,'Mosel, GE','fruity, mineral, delicate; dry',22,'2018-07-21 02:20:08','2018-07-21 02:20:08'),(90,'JB Becker \'Wallufer Walkenberg\'',105,'Rheingau, GE','full-body, bruised apple, pineapple, exotic',22,'2018-07-21 03:04:30','2018-07-21 03:04:30'),(91,'W.T.Vintners',45,'Columbia Gorge, WA','jeff Lindsay-Thorsen\'s beautiful rendition of Wachau',22,'2018-07-21 03:05:19','2018-07-21 03:05:19'),(92,'Loimer \'Langenlois\'',51,'Kamptal, Austria','pepper, grapefruit, and green apple; pure',22,'2018-07-21 03:07:08','2018-07-21 03:07:08'),(93,'Canoe Ridge \"Canyon Vineyard Ranch\"',40,'Yakima, WA','fresh, lightweight, pretty, patio ready',23,'2018-07-23 00:23:36','2018-07-23 00:23:36'),(94,'Gobelsburg \"Cistercien\"',34,'Niederosterreich, Austria','mineral Pinot Noir, Zweigelt, St Laurent blend; monastic origin',23,'2018-07-23 00:25:20','2018-07-23 00:25:20'),(95,'Miraval Grecache',61,'Provence, FR','archetype Provencial pink!',23,'2018-07-23 00:26:05','2018-07-23 00:26:05'),(96,'Domaine Drouhin',44,'Doudee Hills, OR','bing cherry, cinnamon, velvet; layered',24,'2018-07-23 00:26:59','2018-07-23 00:26:59'),(97,'Joseph Drouhin \"La Foret\"',45,'Bourgogne, FR','bright, refreshing red fruits, light tannins, elegance',24,'2018-07-23 00:27:52','2018-07-23 00:27:52'),(98,'Battle Creek \"Unconditional\"',42,'OR','roses, bright cherry, fresh soil; silky',24,'2018-07-23 00:28:41','2018-07-23 00:28:41'),(99,'Cristom \"Mr Jefferson Cuvee\"',75,'Willamette Valley, OR','ripe red fruit, flowers, tobacco; full, but not fat',24,'2018-07-23 00:29:49','2018-07-23 00:29:49'),(100,'Seguin \"Vieilles Vignes\"',115,'Gevrey-Chambertin VV, FR','dried fruit, flowers, tobacco; full, but not fat',24,'2018-07-23 00:32:13','2018-07-23 00:32:13'),(101,'Sierra Cantabria \"Reserva Unica\"',60,'Rioja, SP','supple, toasty, elegant; plum, vanilla, and fresh earth',24,'2018-07-23 00:33:13','2018-07-23 00:33:13'),(102,'Lopez de Heredia \"Vina Tondonia\" Reserva',80,'Rioja, SP','dried raspberry, cherry, coconut; dusty tannins',24,'2018-07-23 00:35:30','2018-07-23 00:35:30'),(103,'Waitsburg Cellars',46,'Columbia Valley, WA','silky, spicy, ripe fruit, subble herbaciousness',24,'2018-07-23 00:36:14','2018-07-23 00:36:14'),(104,'Domaine les Pins \"Cuvee les Rochettes\"',38,'Bourgueil, FR','tobacco, bell pepper, brambly; ripe expression of Cab Franc',24,'2018-07-23 00:37:08','2018-07-23 00:37:08'),(105,'Kontos',72,'Walla Walla, WA','rich fruit, spice, earthiness; sturdy tannins',24,'2018-07-23 00:38:21','2018-07-23 00:38:21'),(106,'Heitz',108,'Napa Valley, CA','north Coast Cab with restraint and pedigree',24,'2018-07-23 00:39:10','2018-07-23 00:39:10'),(107,'AMaurice \"Amparo\"',96,'Walla Walla, WA','plum, baking spice, herbs; full-body with grace',24,'2018-07-23 00:39:57','2018-07-23 00:39:57'),(108,'Altocedro \"Reserva\"',70,'Uco Valley, Dendoza, Argentina','vanilla, spice, blackberry; full-body with grace',24,'2018-07-23 00:41:09','2018-07-23 00:41:09'),(109,'Ridge',75,'Paso Robles, CA','lush red and black fruit, spice, elegant tannins',24,'2018-07-23 00:41:47','2018-07-23 00:41:47'),(110,'Shiso Mojito',10,'','a Japanese-style Mojito: vodka, muddled shiso, cane sugar, lime juice',33,NULL,NULL),(111,'Lychee Martini',11,'','Vodka, lychee juice, lime juice; lychee',33,NULL,NULL),(112,'Satsuma Margarita',12,NULL,'imo Shochu, Ferrand Dry Curacao, Agave nectar, lime juice; Vlack Lava Hawaiian salt',33,'2018-07-25 01:13:01','2018-07-25 01:13:01'),(114,'Akashi Dori',14,NULL,'akashi Blended Whisky, Kenbishi Honjozo, Campari, Carpano Antica Formula; brandied cherry',33,'2018-07-25 01:14:14','2018-07-25 01:14:14'),(115,'Sapporo',7,NULL,'16oz.',34,'2018-07-25 01:14:33','2018-07-25 01:14:33'),(116,'Manny\'s Pale Ale',7,NULL,'georgetown Brewery; Seattle, WA 16oz.',34,'2018-07-25 01:15:01','2018-07-25 01:15:01'),(117,'Asahi \"Super Dry\"',10,NULL,'toronto, Canada 21.4 oz bottle',35,'2018-07-25 01:15:36','2018-07-25 01:15:36'),(118,'Echigo \'Koshihikari\' Rice Lager',11,NULL,'niigata, Japan 11.8 oz can',35,'2018-07-25 01:16:34','2018-07-25 01:16:34'),(119,'Echigo \'Koshihikari\' Red Ale',11,NULL,'niigata, Japan 11.2 oz bottle',35,'2018-07-25 01:17:09','2018-07-25 01:17:09'),(120,'Oze no Yukidoke IPA',11,NULL,'gunma, Japan 11.5 oz bottle',35,'2018-07-25 01:17:31','2018-07-25 01:17:31'),(121,'Kizakura \"Taste of the Brewery Ale\" Rice Ale',13,NULL,'fushimi, Kyoto, Japan 11.2 oz bottle',35,'2018-07-25 01:18:12','2018-07-25 01:18:12'),(122,'Bakushu Oyster Stout',13,NULL,'Iwate, Japan 11.2 oz bottle',35,'2018-07-25 01:19:15','2018-09-26 08:37:04'),(124,'Perrier Sparkling Mineral Water',8,NULL,'Vergeze, France      750ml',36,'2018-07-25 01:23:13','2018-07-25 01:23:13'),(125,'Yuzu Ginger Tea (caffeine free)',5,NULL,NULL,37,'2018-07-25 05:27:22','2018-07-25 05:27:22'),(126,'Oolong Tea',6,NULL,NULL,37,'2018-07-25 05:27:37','2018-07-25 05:27:37'),(127,'Limeade',4,NULL,'Lychee, Shiso, or Maraschino',37,'2018-07-25 05:28:09','2018-07-25 05:28:09'),(128,'Calpico & Soda',4,NULL,NULL,37,'2018-07-25 05:41:19','2018-07-25 05:41:19'),(129,'Cock\'n Bull Ginger Beer',6,NULL,NULL,37,'2018-07-25 05:41:35','2018-07-25 05:41:35'),(130,'Kakushigura Mugi',12,'Kagoshima','24% abv lightweight oak aged shochu; refined',25,NULL,'2018-08-08 05:04:05'),(131,'Suntory \"Toki\"',11,'Japan','Blended - light, citrus, subtle sweetness',26,NULL,'2018-08-17 02:14:35'),(132,'Evan Williams 1783',10,'KY','Straight Bourbon',28,NULL,NULL),(133,'Tequila Celestial',12,'Amatitan, Jalisco','Raposado',29,NULL,NULL),(134,'Kelt \"Tour du Monde\"',17,'Grand Champagne, FR','VSOP Cognac',30,NULL,NULL),(135,'Tito\'s',10,'Austin, TX','Corn',31,NULL,NULL),(136,'Baingridge Organic \"Heritage Douglas Fir\"',11,'WA','',32,NULL,NULL),(137,'Taiso Mugi, Kome',11,'Iki island, Nagasaki','24% abv rich, savory, mildly sour; great with rich cuisine!',25,'2018-07-27 01:26:37','2018-07-27 01:26:37'),(138,'Kawabe Kome',14,'Kuma Valley, Kumamoto','25% abv Ginjo-like fragrance, soft texture, minerally',25,'2018-07-27 01:29:45','2018-07-27 01:29:45'),(139,'Kuro Kirishima Imo',12,'Miyazaki','24% abv lean and spicy-- classic imo shochu',25,'2018-07-27 01:30:10','2018-07-27 01:30:10'),(140,'Satsuma Shiranami Imo',11,'Kagoshima','24% abv sweet and round start with dry spicy finish',25,'2018-07-27 01:30:37','2018-07-27 01:30:37'),(141,'Satoh Imo, Kome',15,'Kagoshima','25% abv spicy; green apple and steamed rice',25,'2018-07-27 01:31:00','2018-07-27 01:31:00'),(142,'Tenshi no Yuwaku Imo',28,'Kagoshima','40% abv aged 10 years; creamy, rich, savory-sweet',25,'2018-07-27 01:31:29','2018-07-27 01:31:29'),(143,'Kuramoto no Umeshu Ume',11,'Ehime','14% abv Nankoubai ume infuse shochu; off-dry',25,'2018-07-27 01:32:00','2018-07-27 01:32:00'),(144,'Hibiki \"Harmony\" Blended',17,'Japan','honeylike, candied orange peel, long finish',26,'2018-07-27 01:32:27','2018-09-13 00:39:39'),(146,'Yamazaki 18yr Single Malt',68,'Osaka','rich, spicy, smooth',26,'2018-07-27 05:32:44','2018-09-14 09:07:21'),(147,'Yamazaki 18yr Mizunara Cask \'2017\' Single Malt',200,'Osaka','rare, luxurious, Mizunara aged',26,'2018-07-27 05:33:42','2018-09-14 09:08:14'),(148,'Hakushu 18yr Single Malt',65,'Yamanashi','silky, floral, pleasant smoke',26,'2018-07-27 05:34:18','2018-09-14 09:08:53'),(149,'Hakushu 12yr Single Malt',37,'Yamanashi','fresh, herbal, smoky',26,'2018-07-27 05:35:26','2018-09-14 09:09:44'),(150,'Nikka \'Taketsuru\' 17yr Pure Malt',40,'Japan','mellow, subtle peat; fruit and cocoa',26,'2018-07-27 05:42:03','2018-09-14 09:11:08'),(151,'Nikka \'Miyagikyo\' Single Malt',26,'Miyagi','fruity, mild peat, sherry touch',26,'2018-07-27 05:42:38','2018-09-14 09:11:42'),(152,'Nikka \"Coffey Malt\"',18,'Miyagi','round, flavorful, caramel',26,'2018-07-27 05:43:14','2018-09-14 09:13:01'),(153,'Nikka \"Taketsuru\" 21 yr Pure Malt',50,'Japan','rich, spices, coffee and oak',26,'2018-07-27 05:43:42','2018-09-14 09:12:11'),(154,'Nikka \"Coffey Grain\" Grain',18,'Miyagi','bourbon-like, fresh vanilla, vibrant',26,'2018-07-27 05:44:21','2018-09-14 09:10:17'),(155,'Mars Iwai Blended',10,'Nagano','toasted nuts, honey, sweet spice',26,'2018-07-27 05:44:43','2018-09-14 09:14:31'),(156,'Mars Iwai \"Komagatake\" \"Rindo\" Single Malt',45,'Nagano','earthy, sweet spices, sherry forefront',26,'2018-07-27 05:45:14','2018-09-14 09:15:15'),(157,'Akashi \"White Oak\" Blended',10,'Hyogo','sweet bread, spice, medium length',26,'2018-07-27 05:45:47','2018-09-14 09:15:52'),(158,'Akashi \"White Oak\"',28,'Hyogo','Single Malt',26,'2018-07-27 05:46:13','2018-07-27 05:46:13'),(159,'Ichiro\'s Malt \"Malt & Grain\" Blended',22,'International','worldwide blended, toffee malt, tropical fruit',26,'2018-07-27 05:46:38','2018-09-14 09:16:20'),(160,'Ichiro\'s Malt \"The Floor Malted\" Single Malt',40,'Saitama','nutty, woody, coffee bean bite',26,'2018-07-27 05:47:05','2018-09-14 09:16:59'),(161,'Ichiro\'s Malt \"On the Way\" Single Malt',39,'Saitama','orchard fruit, soft toffee, spicy touch',26,'2018-07-27 05:47:34','2018-09-14 09:17:40'),(163,'Ohishi \"Single Sherry Cask\" Grain- Rice',16,'Kumamoto','sherry bomb, alluring sweetness, full body',26,'2018-07-27 05:48:30','2018-09-14 09:18:10'),(164,'Fukano Grain- Rice',18,'Kumamoto','toasted grain; light coconut and dried fruit',26,'2018-07-27 05:48:45','2018-09-14 09:18:58'),(165,'Makers Mark',11,'KY','Straight Bourbon',28,'2018-07-27 05:50:33','2018-07-27 05:50:33'),(166,'Angel\'s Enby \'Port Finished\'',13,'KY','Straight Bourbon',28,'2018-07-27 05:51:08','2018-07-27 05:51:08'),(167,'Templeton 6yr',11,'IA','Straight Rye',28,'2018-07-27 05:52:05','2018-07-27 05:52:05'),(168,'Highland Park 12yr',14,'Scotland','Single Malt',28,'2018-07-27 05:52:32','2018-07-27 05:52:32'),(169,'Glenmorangle \"Nectar d\'Or\"',NULL,'Highland-- Scotland','Single Malt',28,'2018-07-27 05:53:07','2018-07-27 05:53:07'),(170,'Tequila Ocho \"La Magueyera\" Reposado',16,'Arandas, Jalisco',NULL,29,'2018-07-27 05:53:42','2018-07-27 05:53:42'),(171,'Bainbridge Organic \"Legacy\"',10,'WA','Wheat',31,'2018-07-27 05:54:15','2018-07-27 05:54:49'),(172,'Grey Goose',11,'France','Wheat',31,'2018-07-27 05:54:38','2018-07-27 05:54:38'),(173,'Nikka \"Coffey Grain\"',13,'Miyagi, Japan','Corn',31,'2018-07-27 05:55:15','2018-07-27 05:55:15'),(174,'Bombay Sapphire',10,'England','London Dry',32,'2018-07-27 05:55:38','2018-07-27 05:55:38'),(175,'Hendrick\'s',12,'Scotland','Lndon Dry',32,'2018-07-27 05:55:57','2018-07-27 05:55:57'),(176,'Nikka \"Coffey Grain\"',16,'Miyagi, Japan','London Dry',32,'2018-07-27 05:56:18','2018-07-27 05:56:18'),(177,'Rotating Nama',22,'6 oz tokkuri','fresh, unpasteurized sake released seasonally; typically bright, bold, and distinctive. *ask your server for todays selection',38,NULL,NULL),(178,'Spring Sake Flight',20,'3 kinds, 2 oz each','three bright, light, and refreshing brews for the rainy season',38,NULL,NULL),(179,'Test product',29,'France','test test test',22,'2018-08-07 03:08:12','2018-08-07 03:08:12'),(180,'Kinokuniya Bunzaemon',50,'Ibaraki','Junmai Ginjo',39,NULL,'2018-08-16 02:55:16'),(181,'Vietti \"Cascinetta\" Mascato d\'Asti',19,'Piedmont, IT 2015',NULL,40,'2018-08-16 02:58:47','2018-08-16 02:58:47'),(182,'Kenbishi \"Mizuho\" Black Pine',78,'Nada, Hyogo','Yamahai',39,'2018-08-16 03:05:00','2018-08-16 03:05:00'),(183,'Antica Fratta Brut',35,'Fransiacorta, IT NX',NULL,40,'2018-08-16 03:08:50','2018-08-16 03:08:50'),(184,'Egly Ouriet Brut Tradition',135,'Montagne de Reims, Champagne FR',NULL,40,'2018-08-16 03:09:27','2018-08-16 03:09:27'),(185,'F.X. Pichler Steinertal Smaragd',75,'Wachau, Austria 2014',NULL,41,'2018-08-16 03:09:59','2018-08-16 03:09:59'),(186,'Alzinger \"Loibenberg\" Smaragd',105,'Wachau, Austria 2013','Gruner Veltliner',41,'2018-08-16 03:10:35','2018-08-16 03:10:35'),(187,'Altocedro \"Reserva\" Malbec',50,'Mendoza, Argentina 2013',NULL,42,'2018-08-16 03:11:05','2018-08-16 03:11:05'),(188,'Billi Billi Shiraz',42,'Victoria, Australia 2013',NULL,42,'2018-08-16 03:11:26','2018-08-16 03:11:26'),(189,'Roumieu - Lacoste Semillon',36,'Sauternes, FR 2011',NULL,43,'2018-08-16 03:11:55','2018-08-16 03:11:55'),(190,'Kaiyo Mizunara',15,NULL,NULL,44,'2018-08-16 03:12:17','2018-08-16 03:12:17'),(191,'Mizubasho Pure',160,'Gunma','Junmai Ginjo',39,'2018-08-17 02:45:03','2018-08-17 02:45:03'),(192,'Joto',88,'Hiroshima','Daiginjo',39,'2018-08-17 02:45:20','2018-08-17 02:45:20'),(193,'Soda',4,NULL,'Coca-Cola, Diet Coke, 7-up',37,'2018-08-17 03:04:34','2018-08-17 03:04:34'),(194,'Gypsy Demon',13,NULL,'Grey Goose, Benedictine, Genbei Onikoroshi; lemon swath',33,'2018-09-03 23:14:34','2018-09-03 23:14:34'),(197,'Nikka \'Yoichi\' Single Malt',26,'Hokkaido','balanced peat, briny, creamy',26,'2018-09-14 09:13:51','2018-09-14 09:13:51'),(198,'Test product',10,NULL,'Test test test',35,'2018-09-26 08:37:33','2018-09-26 08:37:33');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolls`
--

DROP TABLE IF EXISTS `rolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolls` (
  `roll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `is_sustainable` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_raw` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_gf` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_special` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_on_menu` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`roll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolls`
--

LOCK TABLES `rolls` WRITE;
/*!40000 ALTER TABLE `rolls` DISABLE KEYS */;
INSERT INTO `rolls` VALUES (1,'Black Cod, Avocado & Cucumber','Grilled Neah Bay black cod, avocado and cucumber',12,'Y','N','Y','SP_R','N','Y',NULL,NULL),(2,'Black Dragon Roll','Shrimp tempura, avocado, cucumber topped with grilled black cod, black tobiko, yuzu gosh and tsume sauce',23,'N','Y','N','SP_R','N','Y',NULL,'2018-09-12 00:49:01'),(3,'California Roll','Crab, avocado, mayo, cucumber, masago',10,'N','Y','N','R','N','Y',NULL,'2018-05-30 01:08:25'),(4,'Negihama Roll','Yellowtail, green onions, avocado, cucumber',10,'N','Y','Y','R','N','Y',NULL,NULL),(5,'Avocado Roll','Fresh avocado',4,'N','N','Y','VG_R','N','Y',NULL,NULL),(6,'Eastlake Vegetable Roll','Satsuma yam and kabocha squash tempura, romaine lettuce, cucumber, avocado and ume paste',9,'N','N','N','VG_R','N','Y',NULL,NULL),(7,'Oishi Roll','Shrimp tempura, avocado, and cucumber topped with seared creamy spicy crab, scallop and masago',20,'N','Y','N','SP_R','N','Y','2018-03-20 14:05:39','2018-03-20 14:05:39'),(8,'Ebi-Tempura Roll','Wild Shrimp tempura, cucumber, avocado, masago',11,'N','Y','N','R','N','Y','2018-03-20 14:06:31','2018-03-20 14:06:31'),(9,'Golden Dragon Roll','Spicy tuna, avocado, cucumber, and jalapeno inside topped with spicy tuna and golden tobiko',23,'N','Y','N','SP_R','N','Y','2018-05-30 00:58:44','2018-05-30 00:58:44'),(10,'Hamtastic Roll','Yellowtail, green onions, cucumber, avocado topped with yellowtail, jalapeno, golden tobiko and ponzu',23,'N','Y','N','SP_R','N','Y','2018-05-30 00:59:46','2018-05-30 01:01:41'),(11,'Rising Salmon Roll','Wild salmon, avocado, cucumber topped with seared salmon, nikiri sauce, jalapeno and golden tobiko',21,'N','Y','N','SP_R','N','Y','2018-05-30 01:07:40','2018-05-30 01:07:40'),(12,'Gari Saba','Japanese mackerel, ginger, shiso leaf',9,'Y','Y','Y','R','N','Y','2018-05-30 01:41:05','2018-05-30 01:41:05'),(13,'Futomaki','kampyo fourd, organic tamago, spinach, shrimp oboro',9,'N','Y','Y','R','N','Y','2018-05-30 01:42:08','2018-05-30 01:42:08'),(14,'Rosanna Roll','Hokkaido sea scallops, crab, masago, avocado, mayo',9,'N','Y','N','R','N','Y','2018-05-30 01:43:01','2018-05-30 01:43:01'),(15,'Salmon Skin Roll','Kaiware, green onion, gobo, broiled wild salmon skin',8,'Y','N','Y','R','N','Y','2018-05-30 01:43:40','2018-05-30 01:43:40'),(16,'Seattle Roll','Wild salmon, avocado, cucumber, masago',10,'Y','Y','N','R','N','Y','2018-05-30 01:51:09','2018-05-30 01:51:09'),(17,'Spicy Tuna Roll','Tuna, spicy chili sauce, cucumber, avocado',9,'N','Y','N','R','N','Y','2018-05-30 01:51:45','2018-05-30 01:51:45'),(18,'Spider Roll','Fried Maryland blue soft shell crab, cucumber, avocado, masago',13,'Y','Y','Y','R','N','Y','2018-05-30 01:52:38','2018-05-30 01:52:38'),(19,'Cucumber and Avocado Roll','Fresh avocado and cucumber slices',5,'N','N','Y','VG_R','N','Y','2018-05-30 01:53:34','2018-05-30 01:53:34'),(20,'Oshinko Maki','Pickled daikon radish',4,'N','N','Y','VG_R','N','Y','2018-05-30 01:54:02','2018-05-30 01:54:02'),(21,'Kappa Maki','Cucumber roll',4,'N','N','Y','VG_R','N','Y','2018-05-30 01:54:26','2018-05-30 01:54:26'),(22,'Super Yummy Roll','Spinach, shiitake, kampyo gourd, avocado, pickled plum, shiso leaf',8,'N','N','Y','VG_R','N','Y','2018-05-30 01:55:28','2018-05-30 01:55:28'),(23,'Ume Shiso Roll','Pickled plum, shiso leaf, cucumber',4,'N','N','Y','VG_R','N','Y','2018-05-30 01:55:57','2018-05-30 01:55:57');
/*!40000 ALTER TABLE `rolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakes`
--

DROP TABLE IF EXISTS `sakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sakes` (
  `sake_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rice` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sweetness` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sake_id`),
  KEY `sakes_product_id_foreign` (`product_id`),
  CONSTRAINT `sakes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakes`
--

LOCK TABLES `sakes` WRITE;
/*!40000 ALTER TABLE `sakes` DISABLE KEYS */;
INSERT INTO `sakes` VALUES (1,'Futsushu','Calrose','+4',NULL,'2018-09-04 07:41:40',1),(2,'Honjozo','Nihonbare','+5',NULL,NULL,2),(3,'Junmai','Miyamanishiki, Hitogokochi','-4',NULL,NULL,3),(5,'Junmai','Gohyakumangoku',NULL,'2018-07-07 00:22:06','2018-08-10 23:46:04',9),(6,'Junmai Ginjo','Gokyakumangoku',NULL,'2018-07-07 01:33:55','2018-08-10 23:47:51',4),(7,NULL,'Hiroshima Hattan, Nakate Shinsenbon','+1','2018-07-08 05:39:02','2018-07-08 05:39:02',10),(8,NULL,'koji rice sweetness + plum spice; savory,',NULL,'2018-07-08 05:40:40','2018-07-08 05:40:40',7),(9,NULL,'local rice','-50','2018-07-08 05:41:13','2018-07-08 05:41:13',6),(10,NULL,'Yamadanishiki','+4','2018-07-08 05:41:35','2018-07-08 05:41:35',5),(11,NULL,'Ginotome','+5','2018-07-10 03:06:23','2018-07-10 03:06:23',11),(12,NULL,'Gohyakumangoku','+8','2018-07-10 03:20:32','2018-07-10 03:20:32',12),(13,NULL,'Miyamanishiki',NULL,'2018-07-12 23:56:05','2018-07-12 23:56:05',13),(14,NULL,'Aiyama, Yamadanishiki','+0.5','2018-07-13 01:38:02','2018-07-13 01:38:02',14),(15,NULL,'Gohyakumangoku','+5','2018-07-14 00:28:38','2018-07-14 00:28:38',15),(16,NULL,'Omachi','-0','2018-07-14 00:32:35','2018-07-14 00:32:35',16),(17,NULL,'Miyamanishiki','+10','2018-07-14 00:33:43','2018-07-14 00:34:49',17),(18,NULL,'Gohyakumangoku','+3.5','2018-07-14 01:28:10','2018-07-14 01:29:31',18),(19,NULL,'local rice','-50','2018-07-14 01:30:25','2018-07-14 03:26:51',19),(20,'Kijoshu 8 yr',NULL,NULL,'2018-07-14 01:35:08','2018-07-14 03:41:58',23),(21,'Sparkling Sake','Akebono',NULL,'2018-07-14 01:38:08','2018-07-14 03:40:28',22),(22,NULL,NULL,NULL,'2018-07-14 03:15:38','2018-07-14 03:21:44',20),(23,NULL,NULL,NULL,'2018-07-14 03:16:58','2018-07-14 03:21:39',21),(24,NULL,'Hiroshima Hattan, Nakate Shinsenbon','+1','2018-07-14 03:29:25','2018-07-14 03:29:25',24),(25,NULL,'Gokyakumangoku','+3','2018-07-14 03:30:22','2018-07-14 03:30:22',25),(26,NULL,'Yamadanishiki','+1','2018-07-14 03:34:33','2018-07-14 03:34:33',26),(28,'Daiginjo Arabashiri','Yamadanishiki','+6','2018-07-16 23:44:08','2018-07-16 23:44:08',28),(29,NULL,'Yamadanishiki','+2','2018-07-16 23:46:06','2018-07-16 23:46:06',29),(30,NULL,'Ginginga','+5','2018-07-16 23:47:36','2018-07-16 23:47:36',30),(31,'','Yamadanishiki','+3','2018-07-16 23:53:32','2018-07-16 23:53:32',31),(32,'','Yamadanishiki','+4','2018-07-16 23:55:24','2018-07-16 23:55:24',32),(33,'Kijoshu 8 yr (2oz)','','-44','2018-07-19 03:27:05','2018-07-19 03:27:05',33),(34,'Diginjo','Yamadanishiki','+2','2018-07-19 03:28:15','2018-07-19 03:28:15',34),(35,'Junmai Daiginjo','Yamadanishiki','+3','2018-07-19 03:29:17','2018-07-19 03:29:17',35),(36,'Junmai Genrokushu',NULL,NULL,'2018-07-19 03:38:28','2018-09-03 23:30:28',36),(37,'Honjozo Karakuchi','Haenuki','+10','2018-07-19 03:39:26','2018-07-19 03:39:26',37),(38,'','',NULL,'2018-07-19 03:40:19','2018-07-19 03:40:19',38),(39,'Tokubetsu Honjozo','Gokyakumangoku','+5','2018-07-19 03:41:03','2018-07-19 03:41:03',39),(40,NULL,'Ginpu','+3','2018-07-19 03:42:04','2018-09-07 01:24:16',40),(41,NULL,'Gohyakumangoku','+5','2018-07-19 03:42:54','2018-09-07 01:22:02',41),(42,'','Gohyakumangoku','+2','2018-07-19 03:43:54','2018-07-19 03:43:54',42),(43,'Muroka Namachozo','Watari Bune','+3','2018-07-19 03:44:59','2018-07-19 03:44:59',43),(44,'','Omachi','+3','2018-07-19 03:45:57','2018-07-19 03:45:57',44),(45,NULL,'Yamadanishiki','+3','2018-07-19 03:46:40','2018-09-27 00:44:32',45),(46,'Ginjo','Miyamanishiki','+5','2018-07-19 03:47:35','2018-07-19 03:47:35',46),(47,NULL,'Gohyakumangoku',NULL,'2018-07-19 03:48:36','2018-07-19 03:49:59',47),(48,'','Yamadanishiki','+1.5','2018-07-19 03:49:45','2018-07-19 03:49:45',48),(49,'','Yamadanishiki','+4','2018-07-19 03:50:57','2018-07-19 03:50:57',49),(50,'','Omachi','+5','2018-07-19 03:51:44','2018-07-19 03:51:44',50),(51,'','Yamadanishiki','+0','2018-07-19 03:52:33','2018-07-19 03:52:33',51),(52,'','Yamadanishiki','+3','2018-07-19 03:53:23','2018-07-19 03:53:23',52),(53,'','Yamadanishiki','+5','2018-07-19 03:54:22','2018-07-19 03:54:22',53),(54,'Koshu','Yamadanishiki','+4','2018-07-19 04:04:41','2018-07-19 04:04:41',54),(55,'Junmai Daiginjo Sparkling','Yamadanishiki','+10','2018-07-19 04:05:39','2018-07-19 04:05:39',55),(56,NULL,'Yamadanishiki',NULL,'2018-07-20 00:22:05','2018-09-03 23:22:47',56);
/*!40000 ALTER TABLE `sakes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sbs`
--

DROP TABLE IF EXISTS `sbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbs` (
  `sb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eng_name` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jpn_name` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` char(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nigiri_price` decimal(4,1) DEFAULT NULL,
  `sashimi_price` decimal(4,1) DEFAULT NULL,
  `is_sustainable` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_raw` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_special` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_on_menu` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sbs`
--

LOCK TABLES `sbs` WRITE;
/*!40000 ALTER TABLE `sbs` DISABLE KEYS */;
INSERT INTO `sbs` VALUES (1,'Albacore Tuna','','Washington',5.0,10.0,'Y','Y','N','Y'),(2,'Albacore Tuna, belly','','Washington',6.0,12.0,'Y','Y','N','Y'),(3,'Black Cod Belly, grilled','','Neah Bay',5.0,10.0,'Y','N','N','Y'),(4,'Jidori Egg Omlet','Tamago','',3.0,6.0,'N','N','N','Y'),(5,'Amberjack','Kanpachi','Kona, HI',4.0,8.0,'Y','Y','N','Y'),(6,'Blue Prawns','Ebi','Gulf of Mexico',3.5,7.0,'Y','N','N','Y'),(7,'Sockey Salmon','','Washington',4.0,8.0,'Y','Y','N','Y'),(8,'Sockey Salmon, belly','','Washington',5.0,10.0,'Y','Y','N','Y'),(9,'King Salmon','','Washington',5.0,10.0,'Y','Y','N','Y'),(10,'King Salmon, belly',NULL,'Washington',6.0,12.0,'Y','N','N','Y'),(11,'Mackeral','Saba','Norway',3.0,6.0,'Y','Y','N','Y'),(12,'King Crab',NULL,'Alaska',6.0,12.0,'Y','N','N','Y'),(13,'Octopus','Tako','Spain',3.0,6.0,'Y','N','N','Y'),(14,'Sea Eel','Anago','Japan',4.5,9.0,'N','N','N','Y'),(15,'Yellowtail','Hamachi','Kagoshima, Japan',5.0,10.0,'N','Y','N','Y'),(16,'Yellowtail, belly','Hamachi, belly','',6.0,12.0,'N','Y','N','Y'),(17,'Negitoro Handroll','','',10.0,NULL,'N','Y','N','Y'),(18,'Sea Urchin','Uni','Main',7.0,14.0,'Y','Y','N','Y'),(19,'Sea Urchin','Uni','Santa Barbara',7.0,14.0,'Y','Y','N','N'),(20,'Spanish Mackerel','Aji','Japan',6.0,12.0,'Y','Y','N','Y'),(21,'Geoduck','Mirugai','Puget Sound',9.0,18.0,'Y','Y','N','Y'),(22,'GGGeoduck','Mirugai','Puget Sound',9.0,18.0,'Y','Y','N','Y'),(23,'Sea Scallops','Hotate','Hokkaido',4.0,8.0,'Y','Y','N','N'),(24,'Herring','Nishin','British Colombia',3.5,7.0,'Y','Y','N','Y'),(25,'Sea Scallops Seared w','Yuzu Gosho','',4.5,9.0,'Y','Y','N','Y'),(26,'Seabream','Madai','Japan',5.0,10.0,'Y','Y','N','Y'),(27,'Salmon Roe (chum)','Ikura','Washington',5.0,10.0,'Y','Y','N','Y'),(28,'Smelt Roe','Masago','Canada',3.0,6.0,'Y','Y','N','Y'),(29,'Spot Prawn','Amaebi','B.C.',5.0,10.0,'Y','Y','N','Y'),(30,'Squid Tentacles','Ika Geso','Japan',4.0,8.0,'Y','Y','N','Y'),(31,'Golden Eye Snapper','Kinmedai','Japan',7.0,14.0,'Y','Y','N','Y'),(32,'Sea Urchin','Uni','Hokkaido',9.0,18.0,'Y','Y','N','Y'),(33,'Tuna','Maguro','South Pacific',5.0,10.0,'N','Y','N','Y'),(34,'Squid','Surume Ika','Japan',4.0,8.0,'Y','Y','N','Y'),(35,'English Name','Japanese','Japan',2.0,NULL,'N','N','N','Y'),(36,'King Salmon, Spring','','Columbia River, WA',10.0,20.0,'Y','Y','N','Y'),(37,'Rock Fish','','Neah Bay',3.0,6.0,'Y','Y','N','Y'),(38,'Seabass','Suzuki','Japan',5.0,10.0,'Y','Y','N','Y'),(39,'Chutoro','','',6.0,12.0,'N','Y','N','Y');
/*!40000 ALTER TABLE `sbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `update_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu` char(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ayumi','ayumikjm@gmail.com','$2y$10$uKdk.pNW48nWFjK8OBMdjO24NFqE2tKXsf8grp7XT8kBX26FHb42W','Kieu2z2ylOusAJafbzGA0y6E7LdogKt44tUL0ERBWYdXOyajf9s34wYWt7am','2018-09-28 01:53:41','2018-09-28 01:53:41'),(2,'admin','steve@sushikappotamura.com','$2y$10$2W/0OBWmeaO7TDm001ROIO32YhvWpwjcVWdeQ2OzdCT7I8L6noTVi',NULL,'2018-09-29 01:15:03','2018-09-29 01:15:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wines`
--

DROP TABLE IF EXISTS `wines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wines` (
  `wine_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`wine_id`),
  KEY `wines_product_id_foreign` (`product_id`),
  CONSTRAINT `wines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wines`
--

LOCK TABLES `wines` WRITE;
/*!40000 ALTER TABLE `wines` DISABLE KEYS */;
INSERT INTO `wines` VALUES (1,'Granache, Cinsault blend','2015','2018-07-20 01:36:17','2018-07-20 01:36:17',63),(2,'Cabernet Franc','2015','2018-07-20 01:37:40','2018-07-20 01:37:40',64),(3,'Blanc de Blancs','NV','2018-07-21 00:47:53','2018-07-21 00:47:53',65),(4,NULL,'2014','2018-07-21 00:53:27','2018-09-08 06:20:47',66),(5,'','NV','2018-07-21 00:54:38','2018-07-21 00:54:38',67),(6,'Brut Rosé','NV','2018-07-21 00:56:02','2018-07-21 00:56:02',68),(7,NULL,'NV','2018-07-21 00:56:51','2018-09-03 23:37:26',69),(8,'Pinot Gris','2015','2018-07-21 01:08:18','2018-07-21 01:08:18',70),(9,'Txakoli','2015','2018-07-21 01:09:26','2018-07-21 01:09:26',71),(10,'Albarino','2015','2018-07-21 01:17:01','2018-07-21 01:17:01',72),(11,'Albarino','2015','2018-07-21 01:18:00','2018-08-09 23:39:44',73),(12,'Albarino','2014','2018-07-21 01:19:06','2018-07-21 01:19:06',74),(13,'Sauvignon Blanc','2017','2018-07-21 01:51:27','2018-07-21 01:51:27',75),(14,'Sauvignon Blanc','2015','2018-07-21 02:00:32','2018-07-21 02:00:32',76),(15,'Sauvignon Blanc/Sémillon','2013','2018-07-21 02:02:02','2018-07-21 02:02:02',77),(16,'Sauvignon Blanc','2015 (375ml), 2014(750ml)','2018-07-21 02:05:41','2018-08-08 04:55:00',78),(17,'Carricante','2015','2018-07-21 02:07:14','2018-07-21 02:07:14',79),(18,'Chardonnay','2015','2018-07-21 02:08:12','2018-07-21 02:08:12',80),(19,'Chardonnay','2013','2018-07-21 02:09:09','2018-07-21 02:09:09',81),(20,'Chardonnay','2014','2018-07-21 02:10:30','2018-07-21 02:10:30',82),(21,'Chardonnay','2013','2018-07-21 02:12:05','2018-07-21 02:12:05',83),(22,'Chenin Blanc','2016','2018-07-21 02:12:44','2018-07-21 02:12:44',84),(23,'Chenin Blanc','2016','2018-07-21 02:15:26','2018-07-21 02:15:26',85),(24,'','2012','2018-07-21 02:16:45','2018-07-21 02:16:45',86),(25,'Viognier-blend','2015','2018-07-21 02:17:46','2018-07-21 02:17:46',87),(26,'Kabinett Riesling','2014','2018-07-21 02:18:48','2018-07-21 02:18:48',88),(27,'Trocken Riesling','2014 (car TOYS air hoff)','2018-07-21 02:20:08','2018-07-21 02:24:27',89),(28,'Spatlese Riesling','1993','2018-07-21 03:04:30','2018-07-21 03:04:30',90),(29,'Gruner Veltliner','2014','2018-07-21 03:05:19','2018-07-21 03:05:19',91),(30,'Gruner Veltliner','2014','2018-07-21 03:07:08','2018-07-21 03:07:08',92),(31,'Cinsault','2016','2018-07-23 00:23:36','2018-07-23 00:23:36',93),(32,'','2016','2018-07-23 00:25:20','2018-07-23 00:25:20',94),(33,'Cinsault blend','2015','2018-07-23 00:26:05','2018-07-23 00:26:05',95),(34,'Pinot Noir','2015','2018-07-23 00:26:59','2018-07-23 00:26:59',96),(35,'Pinot Noir','2015','2018-07-23 00:27:52','2018-07-23 00:27:52',97),(36,'Pinot Noir','2015','2018-07-23 00:28:41','2018-07-23 00:28:41',98),(37,'Pinot Noir','2015','2018-07-23 00:29:49','2018-07-23 00:29:49',99),(38,'Pinot Noir','2013','2018-07-23 00:32:13','2018-07-23 00:32:13',100),(39,'Tempranillo','2010','2018-07-23 00:33:13','2018-07-23 00:33:13',101),(40,'Tempranillo','2004','2018-07-23 00:35:30','2018-07-23 00:35:30',102),(41,'Cab Franc','2015','2018-07-23 00:36:14','2018-07-23 00:36:14',103),(42,'Cab Franc','2014','2018-07-23 00:37:08','2018-07-23 00:37:08',104),(43,'Cabernet Sauvignon','2013','2018-07-23 00:38:21','2018-07-23 00:38:21',105),(44,'Cabernet Sauvignon','2012','2018-07-23 00:39:10','2018-07-23 00:39:10',106),(45,'Malbec','2012','2018-07-23 00:39:57','2018-07-23 00:39:57',107),(46,'Malbec','2013','2018-07-23 00:41:09','2018-08-08 04:57:27',108),(47,'Zinfandel','2014','2018-07-23 00:41:47','2018-07-23 00:41:47',109),(48,'Pinot Gris','2017','2018-08-07 03:08:12','2018-08-07 03:08:12',179),(49,'Pinot Gris','2015',NULL,NULL,59),(50,'Blanc de Blancs','NV',NULL,NULL,57),(51,'Blanc de Blancs','NV',NULL,NULL,58),(52,'Blanc de Blancs','NV',NULL,NULL,60);
/*!40000 ALTER TABLE `wines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-04 11:35:11
