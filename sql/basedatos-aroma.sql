-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: aroma
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (95,'2014_10_12_000000_create_users_table',1),(96,'2014_10_12_100000_create_password_resets_table',1),(97,'2015_01_20_084450_create_roles_table',1),(98,'2015_01_20_084525_create_role_user_table',1),(99,'2015_01_24_080208_create_permissions_table',1),(100,'2015_01_24_080433_create_permission_role_table',1),(101,'2015_12_04_003040_add_special_role_column',1),(102,'2017_10_17_170735_create_permission_user_table',1),(103,'2018_05_23_154631_create_provincias_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Navegar Usuarios','users.index','Lista y navega todos los usuarios del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(2,'Ver detalle de usuario','users.show','Ver en detalle un usuario del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(3,'Edicion de Usuarios','users.edit','Editar cualquier dato de un usuario del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(4,'Eliminar usuario','users.destroy','Eliminar cualquier usuario del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(5,'Navegar roles','roles.index','Lista y navega todos los roles del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(6,'Crear rol','roles.create','Crear un rol del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(7,'Ver detalle de un rol','roles.show','Ver en detalle un rol del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(8,'Edicion de roles','roles.edit','Editar cualquier dato de un rol del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(9,'Eliminar rol','roles.destroy','Eliminar cualquier rol del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(10,'Navegar provincias','provincias.index','Lista y navega todos los provincias del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(11,'Crear provincia','provincias.create','Crear una provincia en el sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(12,'Ver detalle de una provincia','provincias.show','Ver en detalle una provincia del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(13,'Edicion de provincias','provincias.edit','Editar cualquier dato de una provincia del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49'),(14,'Eliminar provincia','provincias.destroy','Eliminar cualquier provincia del sistema','2018-05-24 17:20:49','2018-05-24 17:20:49');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Lugo',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(2,'Orense',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(3,'Pontevedra',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(4,'La Coruña',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(5,'Asturias',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(6,'Cantabria',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(7,'Vizcaya',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(8,'Alava',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(9,'Guipuzcoa',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(10,'Navarra',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(11,'La Rioja',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(12,'León',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(13,'Palencia',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(14,'Burgos',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(15,'Zamora',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(16,'Valladolid',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(17,'Soria',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(18,'Salamanca',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(19,'Ávila',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(20,'Segovia',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(21,'Huesca',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(22,'Zaragoza',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(23,'Teruel',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(24,'LLeida',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(25,'Gerona',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(26,'Tarragona',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(27,'Barcelona',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(28,'Madrid',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(29,'Guadalajara',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(30,'Toledo',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(31,'Cuenca',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(32,'Ciudad Real',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(33,'Albacete',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(34,'Castellon',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(35,'Valencia',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(36,'Alicante',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(37,'Murcia',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(38,'Caceres',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(39,'Badajoz',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(40,'Huelva',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(41,'Sevilla',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(42,'Cordoba',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(43,'Jaén',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(44,'Cadiz',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(45,'Malaga',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(46,'Granada',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(47,'Almería',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(48,'Ceuta',0,'2018-05-24 17:20:49','2018-05-24 17:20:49'),(49,'Melilla',0,'2018-05-24 17:20:49','2018-05-24 17:20:49');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','admin',NULL,'2018-05-24 17:20:49','2018-05-24 17:20:49','all-access');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ms. Dorris Breitenberg I','spinka.candice@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','UjXis0pjCp','2018-05-24 17:20:49','2018-05-24 17:20:49'),(2,'Viola Jones','rbernier@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','tlbyZPac6S','2018-05-24 17:20:49','2018-05-24 17:20:49'),(3,'Aditya Marquardt','whitney.reynolds@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','CX0BvLxExQ','2018-05-24 17:20:49','2018-05-24 17:20:49'),(4,'Mrs. Abigayle Heathcote','okon.keith@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','EPkcB2YJGf','2018-05-24 17:20:49','2018-05-24 17:20:49'),(5,'Miss Maryjane Schowalter Sr.','dell.batz@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','vkzXaWBKN9','2018-05-24 17:20:49','2018-05-24 17:20:49'),(6,'Dr. Otho Nikolaus Jr.','gusikowski.saul@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','uRZJ8Dylnh','2018-05-24 17:20:49','2018-05-24 17:20:49'),(7,'Lora Renner','lola.ullrich@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','0s8K2sHeip','2018-05-24 17:20:49','2018-05-24 17:20:49'),(8,'Noemy Leffler','corwin.carlotta@example.net','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','pZj389wvJV','2018-05-24 17:20:49','2018-05-24 17:20:49'),(9,'Vern Bernhard Jr.','vonrueden.dorothy@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','MxrRw4vxbH','2018-05-24 17:20:49','2018-05-24 17:20:49'),(10,'Sherwood Muller','langworth.cordia@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','MEiF9yiTek','2018-05-24 17:20:49','2018-05-24 17:20:49'),(11,'Samara Daniel','kacey75@example.net','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','9bvMOfvRUO','2018-05-24 17:20:49','2018-05-24 17:20:49'),(12,'Lillian Jakubowski','maggio.zachary@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','B9g6ruqKMv','2018-05-24 17:20:49','2018-05-24 17:20:49'),(13,'Dr. Arvid Wolff II','stamm.anais@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','r9mXbBIldy','2018-05-24 17:20:49','2018-05-24 17:20:49'),(14,'Chester Abbott','fred.abbott@example.net','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','g8DAhOzANH','2018-05-24 17:20:49','2018-05-24 17:20:49'),(15,'Randi Bergstrom','natasha.smith@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','gE9PWeRhFn','2018-05-24 17:20:49','2018-05-24 17:20:49'),(16,'Enrique Kihn','ihamill@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','6soyPSRjuY','2018-05-24 17:20:49','2018-05-24 17:20:49'),(17,'Mr. Kobe Grant','sandy46@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','kppGBURgFs','2018-05-24 17:20:49','2018-05-24 17:20:49'),(18,'Jane Gutmann','acummings@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','QFq4r1FQlR','2018-05-24 17:20:49','2018-05-24 17:20:49'),(19,'Miss Darlene Turner','nick.mckenzie@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','N1syNVUvli','2018-05-24 17:20:49','2018-05-24 17:20:49'),(20,'Alia O\'Conner','uriel.turcotte@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','bfTyrQgKJF','2018-05-24 17:20:49','2018-05-24 17:20:49'),(21,'Japostua','ayudaeconomicanav@gmail.com','$2y$10$YRR8onzY6rmvoeUhQJVWqOLYm5PWiwLv5Gvaw7YT/oHwplD5UEjJS','myM3V8aTltOEEajlFpST4YqmTXCir1Znv7LWFQgZrICV33cOuTgsKicr8OlI','2018-05-24 19:45:25','2018-05-24 19:45:25'),(22,'joseba','japostua@gmail.com','$2y$10$/TmGvBjVEkZJXaVWO.J12ehrvM.L2yTqEG5PdyBsZJsCa72TTrUdy','QCniopetF0BTvcjDhdbLIefhfMUM2HjzyilDq2hijEwG6UteTv9v5fwhA1M0','2018-05-27 08:43:15','2018-05-27 08:43:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-27 13:08:17
