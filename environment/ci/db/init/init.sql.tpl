-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: mysql    Database: allihoppa
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `category_colors`
--

DROP TABLE IF EXISTS `category_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_colors` (
  `the_cat_id` varchar(255) NOT NULL,
  `cat_color` varchar(255) NOT NULL,
  UNIQUE KEY `the_cat_id` (`the_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=1791 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=38708 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=29760 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_name` (`post_name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  `term_order` int(4) DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-10 15:09:10
-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: mysql    Database: allihoppa
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Dumping data for table `category_colors`
--

LOCK TABLES `category_colors` WRITE;
/*!40000 ALTER TABLE `category_colors` DISABLE KEYS */;
INSERT INTO `category_colors` VALUES ('15','2600fa'),('2','008aa4'),('3','be3942'),('4','ff6e00'),('5','003d77'),('6','006954'),('7','ff2ca4'),('8','e30000');
/*!40000 ALTER TABLE `category_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://allihoppa.localhost','yes'),(2,'blogname','Allihoppa','yes'),(3,'blogdescription','ideeën verhalen inspiratie','yes'),(4,'users_can_register','0','yes'),(5,'admin_email','me@lucasvanlierop.nl','yes'),(6,'start_of_week','1','yes'),(7,'use_balanceTags','','yes'),(8,'use_smilies','1','yes'),(9,'require_name_email','1','yes'),(10,'comments_notify','','yes'),(11,'posts_per_rss','10','yes'),(12,'rss_use_excerpt','0','yes'),(13,'mailserver_url','mail.example.com','yes'),(14,'mailserver_login','login@example.com','yes'),(15,'mailserver_pass','password','yes'),(16,'mailserver_port','110','yes'),(17,'default_category','211','yes'),(18,'default_comment_status','open','yes'),(19,'default_ping_status','open','yes'),(20,'default_pingback_flag','1','yes'),(21,'posts_per_page','14','yes'),(22,'date_format','F j, Y','yes'),(23,'time_format','g:i a','yes'),(24,'links_updated_date_format','F j, Y g:i a','yes'),(28,'comment_moderation','','yes'),(29,'moderation_notify','','yes'),(30,'permalink_structure','/%category%/%postname%/','yes'),(32,'hack_file','0','yes'),(33,'blog_charset','UTF-8','yes'),(34,'moderation_keys','','no'),(35,'active_plugins','a:14:{i:0;s:25:\"adminimize/adminimize.php\";i:1;s:30:\"advanced-custom-fields/acf.php\";i:2;s:19:\"akismet/akismet.php\";i:3;s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";i:4;s:28:\"category-colors/cc-index.php\";i:5;s:43:\"custom-post-type-ui/custom-post-type-ui.php\";i:7;s:28:\"page-excerpt/pageExcerpt.php\";i:8;s:37:\"pinterest-verify/pinterest-verify.php\";i:9;s:47:\"post-thumbnail-editor/post-thumbnail-editor.php\";i:10;s:43:\"public-post-preview/public-post-preview.php\";i:11;s:45:\"simple-page-ordering/simple-page-ordering.php\";i:12;s:45:\"taxonomy-terms-order/taxonomy-terms-order.php\";i:14;s:27:\"wp-pagenavi/wp-pagenavi.php\";i:15;s:33:\"wp-smtp-config/wp-smtp-config.php\";}','yes'),(36,'home','http://allihoppa.localhost','yes'),(37,'category_base','/categorie/','yes'),(38,'ping_sites','http://rpc.pingomatic.com/','yes'),(40,'comment_max_links','2','yes'),(41,'gmt_offset','','yes'),(42,'default_email_category','1','yes'),(43,'recently_edited','a:5:{i:0;s:94:\"/var/www/vhosts/allihoppa.nl/httpdocs/wp-content/plugins/pinterest-verify/pinterest-verify.php\";i:1;s:83:\"/var/www/vhosts/allihoppa.nl/httpdocs/wp-content/themes/allihoppa/single_BACKUP.php\";i:2;s:78:\"/var/www/vhosts/allihoppa.nl/httpdocs/wp-content/themes/allihoppa/category.php\";i:3;s:75:\"/var/www/vhosts/allihoppa.nl/httpdocs/wp-content/themes/allihoppa/index.php\";i:4;s:76:\"/var/www/vhosts/allihoppa.nl/httpdocs/wp-content/themes/allihoppa/footer.php\";}','no'),(44,'template','allihoppa','yes'),(45,'stylesheet','allihoppa','yes'),(46,'comment_whitelist','','yes'),(47,'blacklist_keys','','no'),(48,'comment_registration','','yes'),(49,'html_type','text/html','yes'),(50,'use_trackback','0','yes'),(51,'default_role','subscriber','yes'),(52,'db_version','36686','yes'),(53,'uploads_use_yearmonth_folders','1','yes'),(54,'upload_path','','yes'),(55,'blog_public','1','yes'),(56,'default_link_category','0','yes'),(57,'show_on_front','posts','yes'),(58,'tag_base','','yes'),(59,'show_avatars','1','yes'),(60,'avatar_rating','G','yes'),(61,'upload_url_path','','yes'),(62,'thumbnail_size_w','150','yes'),(63,'thumbnail_size_h','150','yes'),(64,'thumbnail_crop','1','yes'),(65,'medium_size_w','10000','yes'),(66,'medium_size_h','10000','yes'),(67,'avatar_default','mystery','yes'),(68,'large_size_w','10000','yes'),(69,'large_size_h','10000','yes'),(70,'image_default_link_type','','yes'),(71,'image_default_size','','yes'),(72,'image_default_align','','yes'),(73,'close_comments_for_old_posts','','yes'),(74,'close_comments_days_old','14','yes'),(75,'thread_comments','1','yes'),(76,'thread_comments_depth','5','yes'),(77,'page_comments','','yes'),(78,'comments_per_page','50','yes'),(79,'default_comments_page','newest','yes'),(80,'comment_order','asc','yes'),(81,'sticky_posts','a:0:{}','yes'),(82,'widget_categories','a:2:{i:3;a:4:{s:5:\"title\";s:12:\"categorieën\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(83,'widget_text','a:0:{}','yes'),(84,'widget_rss','a:0:{}','yes'),(85,'uninstall_plugins','a:4:{s:27:\"wp-pagenavi/wp-pagenavi.php\";s:14:\"__return_false\";s:25:\"adminimize/adminimize.php\";s:24:\"_mw_adminimize_uninstall\";s:40:\"coschedule-by-todaymade/tm-scheduler.php\";a:2:{i:0;s:13:\"tm_coschedule\";i:1;s:9:\"uninstall\";}s:43:\"public-post-preview/public-post-preview.php\";a:2:{i:0;s:22:\"DS_Public_Post_Preview\";i:1;s:9:\"uninstall\";}}','no'),(86,'timezone_string','Europe/Amsterdam','yes'),(87,'page_for_posts','0','yes'),(88,'page_on_front','0','yes'),(89,'default_post_format','0','yes'),(90,'link_manager_enabled','0','yes'),(91,'initial_db_version','26691','yes'),(92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:63:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"copy_posts\";b:1;s:16:\"aiosp_manage_seo\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:10:\"copy_posts\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(98,'sidebars_widgets','a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:0:{}s:9:\"sidebar-2\";a:1:{i:0;s:10:\"nav_menu-2\";}s:9:\"sidebar-3\";a:1:{i:0;s:12:\"categories-3\";}s:9:\"sidebar-4\";a:1:{i:0;s:10:\"nav_menu-3\";}s:13:\"array_version\";i:3;}','yes'),(99,'cron','a:5:{i:1568138050;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1568149078;a:3:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1568193107;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1568198156;a:1:{s:24:\"akismet_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(130,'recently_activated','a:0:{}','yes'),(132,'current_theme','Allihoppa','yes'),(133,'theme_mods_alihoppa','a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1394737173;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(134,'theme_switched','','yes'),(167,'theme_mods_twentyfourteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1394737176;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:18:\"orphaned_widgets_2\";a:0:{}s:18:\"orphaned_widgets_3\";a:0:{}}}}','yes'),(168,'theme_mods_allihoppa','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}}','yes'),(189,'pagenavi_options','a:15:{s:10:\"pages_text\";s:39:\"Pagina %CURRENT_PAGE% van %TOTAL_PAGES%\";s:12:\"current_text\";s:13:\"%PAGE_NUMBER%\";s:9:\"page_text\";s:13:\"%PAGE_NUMBER%\";s:10:\"first_text\";s:9:\"« Eerste\";s:9:\"last_text\";s:10:\"Laatste »\";s:9:\"prev_text\";s:2:\"«\";s:9:\"next_text\";s:2:\"»\";s:12:\"dotleft_text\";s:3:\"...\";s:13:\"dotright_text\";s:3:\"...\";s:9:\"num_pages\";i:5;s:23:\"num_larger_page_numbers\";i:3;s:28:\"larger_page_numbers_multiple\";i:10;s:11:\"always_show\";i:0;s:16:\"use_pagenavi_css\";i:1;s:5:\"style\";i:1;}','yes'),(193,'duplicate_post_copyexcerpt','1','yes'),(194,'duplicate_post_copyattachments','0','yes'),(195,'duplicate_post_copychildren','0','yes'),(196,'duplicate_post_copystatus','0','yes'),(197,'duplicate_post_taxonomies_blacklist','a:0:{}','yes'),(198,'duplicate_post_show_row','1','yes'),(199,'duplicate_post_show_adminbar','1','yes'),(200,'duplicate_post_show_submitbox','1','yes'),(201,'duplicate_post_version','2.6','yes'),(202,'wordpress_api_key','027fae58d8be','yes'),(203,'akismet_discard_month','true','yes'),(204,'akismet_show_user_comments_approved','false','yes'),(206,'akismet_connectivity_time','1394738198','yes'),(227,'pte-option-1','a:4:{s:9:\"pte_debug\";b:0;s:13:\"pte_crop_save\";b:1;s:17:\"pte_thumbnail_bar\";s:10:\"horizontal\";s:20:\"pte_imgedit_max_size\";i:600;}','yes'),(228,'widget_nav_menu','a:3:{i:2;a:2:{s:5:\"title\";s:8:\"minimenu\";s:8:\"nav_menu\";i:9;}i:3;a:2:{s:5:\"title\";s:12:\"social media\";s:8:\"nav_menu\";i:11;}s:12:\"_multiwidget\";i:1;}','yes'),(245,'acf_version','4.3.5','yes'),(313,'pte-option-3','a:4:{s:9:\"pte_debug\";b:1;s:13:\"pte_crop_save\";b:1;s:17:\"pte_thumbnail_bar\";s:10:\"horizontal\";s:20:\"pte_imgedit_max_size\";i:618;}','yes'),(321,'mw_adminimize','a:3:{i:0;b:0;s:31:\"mw_adminimize_dashboard_widgets\";a:5:{s:19:\"dashboard_right_now\";a:4:{s:2:\"id\";s:19:\"dashboard_right_now\";s:5:\"title\";s:13:\"Op dit moment\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:18:\"dashboard_activity\";a:4:{s:2:\"id\";s:18:\"dashboard_activity\";s:5:\"title\";s:12:\"Activiteiten\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:22:\"semperplugins-rss-feed\";a:4:{s:2:\"id\";s:22:\"semperplugins-rss-feed\";s:5:\"title\";s:8:\"SEO News\";s:7:\"context\";s:6:\"normal\";s:8:\"priority\";s:4:\"core\";}s:21:\"dashboard_quick_press\";a:4:{s:2:\"id\";s:21:\"dashboard_quick_press\";s:5:\"title\";s:0:\"\";s:7:\"context\";s:4:\"side\";s:8:\"priority\";s:4:\"core\";}s:17:\"dashboard_primary\";a:4:{s:2:\"id\";s:17:\"dashboard_primary\";s:5:\"title\";s:14:\"WordPress News\";s:7:\"context\";s:4:\"side\";s:8:\"priority\";s:4:\"core\";}}s:29:\"mw_adminimize_admin_bar_nodes\";a:29:{s:12:\"user-actions\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"user-actions\";s:5:\"title\";b:0;s:6:\"parent\";s:10:\"my-account\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:0:{}}s:9:\"user-info\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"user-info\";s:5:\"title\";s:296:\"<img alt=\'\' src=\'http://0.gravatar.com/avatar/3f459a9145c5c6dd52610cd83a0fb6c3?s=64&#038;d=mm&#038;r=g\' srcset=\'http://0.gravatar.com/avatar/3f459a9145c5c6dd52610cd83a0fb6c3?s=128&amp;d=mm&amp;r=g 2x\' class=\'avatar avatar-64 photo\' height=\'64\' width=\'64\' /><span class=\'display-name\'>admin</span>\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:57:\"http://allihoppa.localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:8:\"tabindex\";i:-1;}}s:12:\"edit-profile\";O:8:\"stdClass\":6:{s:2:\"id\";s:12:\"edit-profile\";s:5:\"title\";s:21:\"Mijn profiel wijzigen\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:57:\"http://allihoppa.localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:6:\"logout\";O:8:\"stdClass\":6:{s:2:\"id\";s:6:\"logout\";s:5:\"title\";s:9:\"Uitloggen\";s:6:\"parent\";s:12:\"user-actions\";s:4:\"href\";s:87:\"http://allihoppa.localhost/wordpress/wp-login.php?action=logout&amp;_wpnonce=1969dbcbe1\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:11:\"menu-toggle\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"menu-toggle\";s:5:\"title\";s:73:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">Menu</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:1:\"#\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:10:\"my-account\";O:8:\"stdClass\":6:{s:2:\"id\";s:10:\"my-account\";s:5:\"title\";s:268:\"Howdy, admin<img alt=\'\' src=\'http://0.gravatar.com/avatar/3f459a9145c5c6dd52610cd83a0fb6c3?s=26&#038;d=mm&#038;r=g\' srcset=\'http://0.gravatar.com/avatar/3f459a9145c5c6dd52610cd83a0fb6c3?s=52&amp;d=mm&amp;r=g 2x\' class=\'avatar avatar-26 photo\' height=\'26\' width=\'26\' />\";s:6:\"parent\";s:13:\"top-secondary\";s:4:\"href\";s:57:\"http://allihoppa.localhost/wordpress/wp-admin/profile.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"class\";s:11:\"with-avatar\";}}s:7:\"wp-logo\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"wp-logo\";s:5:\"title\";s:83:\"<span class=\"ab-icon\"></span><span class=\"screen-reader-text\">Over WordPress</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:55:\"http://allihoppa.localhost/wordpress/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"about\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"about\";s:5:\"title\";s:14:\"Over WordPress\";s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";s:55:\"http://allihoppa.localhost/wordpress/wp-admin/about.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:5:\"wporg\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"wporg\";s:5:\"title\";s:13:\"WordPress.org\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:25:\"https://nl.wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"documentation\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"documentation\";s:5:\"title\";s:12:\"Documentatie\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:28:\"https://codex.wordpress.org/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:14:\"support-forums\";O:8:\"stdClass\":6:{s:2:\"id\";s:14:\"support-forums\";s:5:\"title\";s:13:\"Supportforums\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:33:\"https://nl.wordpress.org/support/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"feedback\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"feedback\";s:5:\"title\";s:14:\"Terugkoppeling\";s:6:\"parent\";s:16:\"wp-logo-external\";s:4:\"href\";s:57:\"https://wordpress.org/support/forum/requests-and-feedback\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"site-name\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"site-name\";s:5:\"title\";s:9:\"Allihoppa\";s:6:\"parent\";b:0;s:4:\"href\";s:27:\"http://allihoppa.localhost/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"view-site\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"view-site\";s:5:\"title\";s:13:\"Site bekijken\";s:6:\"parent\";s:9:\"site-name\";s:4:\"href\";s:27:\"http://allihoppa.localhost/\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:7:\"updates\";O:8:\"stdClass\":6:{s:2:\"id\";s:7:\"updates\";s:5:\"title\";s:155:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">9</span><span class=\"screen-reader-text\">1 WordPress-update, 7 plugin-updates, Vertalingsupdates</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:61:\"http://allihoppa.localhost/wordpress/wp-admin/update-core.php\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:5:\"title\";s:55:\"1 WordPress-update, 7 plugin-updates, Vertalingsupdates\";}}s:8:\"comments\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"comments\";s:5:\"title\";s:206:\"<span class=\"ab-icon\"></span><span id=\"ab-awaiting-mod\" class=\"ab-label awaiting-mod pending-count count-0\" aria-hidden=\"true\">0</span><span class=\"screen-reader-text\">0 reacties wachten op moderatie</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:63:\"http://allihoppa.localhost/wordpress/wp-admin/edit-comments.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:11:\"new-content\";O:8:\"stdClass\":6:{s:2:\"id\";s:11:\"new-content\";s:5:\"title\";s:64:\"<span class=\"ab-icon\"></span><span class=\"ab-label\">Nieuw</span>\";s:6:\"parent\";b:0;s:4:\"href\";s:58:\"http://allihoppa.localhost/wordpress/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-post\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-post\";s:5:\"title\";s:4:\"Post\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:58:\"http://allihoppa.localhost/wordpress/wp-admin/post-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:9:\"new-media\";O:8:\"stdClass\":6:{s:2:\"id\";s:9:\"new-media\";s:5:\"title\";s:5:\"Media\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:59:\"http://allihoppa.localhost/wordpress/wp-admin/media-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-page\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-page\";s:5:\"title\";s:4:\"Page\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:73:\"http://allihoppa.localhost/wordpress/wp-admin/post-new.php?post_type=page\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:16:\"new-advertenties\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"new-advertenties\";s:5:\"title\";s:11:\"Advertentie\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:81:\"http://allihoppa.localhost/wordpress/wp-admin/post-new.php?post_type=advertenties\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:8:\"new-user\";O:8:\"stdClass\":6:{s:2:\"id\";s:8:\"new-user\";s:5:\"title\";s:9:\"Gebruiker\";s:6:\"parent\";s:11:\"new-content\";s:4:\"href\";s:58:\"http://allihoppa.localhost/wordpress/wp-admin/user-new.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:13:\"top-secondary\";O:8:\"stdClass\":6:{s:2:\"id\";s:13:\"top-secondary\";s:5:\"title\";b:0;s:6:\"parent\";b:0;s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-top-secondary\";}}s:16:\"wp-logo-external\";O:8:\"stdClass\":6:{s:2:\"id\";s:16:\"wp-logo-external\";s:5:\"title\";b:0;s:6:\"parent\";s:7:\"wp-logo\";s:4:\"href\";b:0;s:5:\"group\";b:1;s:4:\"meta\";a:1:{s:5:\"class\";s:16:\"ab-sub-secondary\";}}s:19:\"all-in-one-seo-pack\";O:8:\"stdClass\":6:{s:2:\"id\";s:19:\"all-in-one-seo-pack\";s:5:\"title\";s:3:\"SEO\";s:6:\"parent\";b:0;s:4:\"href\";s:98:\"http://allihoppa.localhost/wordpress/wp-admin/admin.php?page=all-in-one-seo-pack/aioseop_class.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}}s:19:\"aioseop-pro-upgrade\";O:8:\"stdClass\":6:{s:2:\"id\";s:19:\"aioseop-pro-upgrade\";s:5:\"title\";s:14:\"Upgrade To Pro\";s:6:\"parent\";s:19:\"all-in-one-seo-pack\";s:4:\"href\";s:75:\"https://semperplugins.com/plugins/all-in-one-seo-pack-pro-version/?loc=menu\";s:5:\"group\";b:0;s:4:\"meta\";a:1:{s:6:\"target\";s:6:\"_blank\";}}s:51:\"all-in-one-seo-pack/modules/aioseop_performance.php\";O:8:\"stdClass\":7:{s:2:\"id\";s:51:\"all-in-one-seo-pack/modules/aioseop_performance.php\";s:5:\"title\";s:11:\"Performance\";s:6:\"parent\";s:19:\"all-in-one-seo-pack\";s:4:\"href\";s:112:\"http://allihoppa.localhost/wordpress/wp-admin/admin.php?page=all-in-one-seo-pack/modules/aioseop_performance.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}s:5:\"order\";i:7;}s:47:\"all-in-one-seo-pack/modules/aioseop_sitemap.php\";O:8:\"stdClass\":7:{s:2:\"id\";s:47:\"all-in-one-seo-pack/modules/aioseop_sitemap.php\";s:5:\"title\";s:11:\"XML Sitemap\";s:6:\"parent\";s:19:\"all-in-one-seo-pack\";s:4:\"href\";s:108:\"http://allihoppa.localhost/wordpress/wp-admin/admin.php?page=all-in-one-seo-pack/modules/aioseop_sitemap.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}s:5:\"order\";i:10;}s:55:\"all-in-one-seo-pack/modules/aioseop_feature_manager.php\";O:8:\"stdClass\":7:{s:2:\"id\";s:55:\"all-in-one-seo-pack/modules/aioseop_feature_manager.php\";s:5:\"title\";s:15:\"Feature Manager\";s:6:\"parent\";s:19:\"all-in-one-seo-pack\";s:4:\"href\";s:116:\"http://allihoppa.localhost/wordpress/wp-admin/admin.php?page=all-in-one-seo-pack/modules/aioseop_feature_manager.php\";s:5:\"group\";b:0;s:4:\"meta\";a:0:{}s:5:\"order\";i:20;}}}','yes'),(348,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),(352,'aioseop_options','a:71:{s:12:\"aiosp_donate\";s:0:\"\";s:16:\"aiosp_home_title\";s:0:\"\";s:22:\"aiosp_home_description\";s:0:\"\";s:20:\"aiosp_togglekeywords\";s:1:\"0\";s:19:\"aiosp_home_keywords\";s:0:\"\";s:9:\"aiosp_can\";s:2:\"on\";s:20:\"aiosp_rewrite_titles\";s:1:\"1\";s:20:\"aiosp_force_rewrites\";s:1:\"1\";s:24:\"aiosp_use_original_title\";s:1:\"0\";s:16:\"aiosp_cap_titles\";s:2:\"on\";s:14:\"aiosp_cap_cats\";s:2:\"on\";s:23:\"aiosp_page_title_format\";s:27:\"%page_title% | %blog_title%\";s:23:\"aiosp_post_title_format\";s:27:\"%post_title% | %blog_title%\";s:27:\"aiosp_category_title_format\";s:31:\"%category_title% | %blog_title%\";s:25:\"aiosp_author_title_format\";s:23:\"%author% | %blog_title%\";s:22:\"aiosp_tag_title_format\";s:20:\"%tag% | %blog_title%\";s:25:\"aiosp_search_title_format\";s:23:\"%search% | %blog_title%\";s:24:\"aiosp_description_format\";s:13:\"%description%\";s:22:\"aiosp_404_title_format\";s:33:\"Nothing found for %request_words%\";s:18:\"aiosp_paged_format\";s:14:\" - Part %page%\";s:17:\"aiosp_enablecpost\";s:2:\"on\";s:19:\"aiosp_cpostadvanced\";s:1:\"0\";s:17:\"aiosp_cpostactive\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:18:\"aiosp_cpostnoindex\";s:0:\"\";s:19:\"aiosp_cpostnofollow\";s:0:\"\";s:17:\"aiosp_cposttitles\";s:0:\"\";s:21:\"aiosp_posttypecolumns\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:15:\"aiosp_admin_bar\";s:2:\"on\";s:23:\"aiosp_custom_menu_order\";s:2:\"on\";s:19:\"aiosp_google_verify\";s:0:\"\";s:17:\"aiosp_bing_verify\";s:0:\"\";s:22:\"aiosp_pinterest_verify\";s:0:\"\";s:22:\"aiosp_google_publisher\";s:0:\"\";s:28:\"aiosp_google_disable_profile\";s:0:\"\";s:28:\"aiosp_google_author_advanced\";s:1:\"0\";s:28:\"aiosp_google_author_location\";a:1:{i:0;s:3:\"all\";}s:29:\"aiosp_google_enable_publisher\";s:2:\"on\";s:30:\"aiosp_google_specify_publisher\";s:0:\"\";s:20:\"aiosp_google_connect\";N;s:25:\"aiosp_google_analytics_id\";s:13:\"UA-49403627-1\";s:32:\"aiosp_ga_use_universal_analytics\";s:0:\"\";s:15:\"aiosp_ga_domain\";s:0:\"\";s:21:\"aiosp_ga_multi_domain\";s:0:\"\";s:28:\"aiosp_ga_display_advertising\";s:0:\"\";s:22:\"aiosp_ga_exclude_users\";s:0:\"\";s:29:\"aiosp_ga_track_outbound_links\";s:0:\"\";s:20:\"aiosp_use_categories\";s:0:\"\";s:26:\"aiosp_use_tags_as_keywords\";s:2:\"on\";s:32:\"aiosp_dynamic_postspage_keywords\";s:2:\"on\";s:22:\"aiosp_category_noindex\";s:0:\"\";s:26:\"aiosp_archive_date_noindex\";s:0:\"\";s:28:\"aiosp_archive_author_noindex\";s:2:\"on\";s:18:\"aiosp_tags_noindex\";s:0:\"\";s:20:\"aiosp_search_noindex\";s:0:\"\";s:27:\"aiosp_generate_descriptions\";s:2:\"on\";s:33:\"aiosp_hide_paginated_descriptions\";s:0:\"\";s:20:\"aiosp_unprotect_meta\";s:0:\"\";s:14:\"aiosp_ex_pages\";s:0:\"\";s:20:\"aiosp_post_meta_tags\";s:0:\"\";s:20:\"aiosp_page_meta_tags\";s:0:\"\";s:21:\"aiosp_front_meta_tags\";s:0:\"\";s:20:\"aiosp_home_meta_tags\";s:0:\"\";s:12:\"aiosp_do_log\";s:0:\"\";s:11:\"aiosp_token\";s:30:\"4/uZMBMDJGklC7p3gX0zK0WwwD8hft\";s:12:\"aiosp_secret\";s:24:\"TxrmsQWZzQn2AwFa_j7pqPUW\";s:7:\"modules\";a:2:{s:29:\"aiosp_feature_manager_options\";a:3:{s:36:\"aiosp_feature_manager_enable_sitemap\";s:2:\"on\";s:38:\"aiosp_feature_manager_enable_opengraph\";s:0:\"\";s:40:\"aiosp_feature_manager_enable_performance\";s:2:\"on\";}s:21:\"aiosp_sitemap_options\";a:27:{s:22:\"aiosp_sitemap_filename\";s:7:\"sitemap\";s:20:\"aiosp_sitemap_google\";s:2:\"on\";s:18:\"aiosp_sitemap_bing\";s:0:\"\";s:21:\"aiosp_sitemap_indexes\";s:0:\"\";s:22:\"aiosp_sitemap_paginate\";s:0:\"\";s:23:\"aiosp_sitemap_max_posts\";s:5:\"50000\";s:23:\"aiosp_sitemap_posttypes\";a:5:{i:0;s:3:\"all\";i:1;s:4:\"post\";i:2;s:4:\"page\";i:3;s:10:\"attachment\";i:4;s:12:\"advertenties\";}s:24:\"aiosp_sitemap_taxonomies\";a:5:{i:0;s:3:\"all\";i:1;s:8:\"category\";i:2;s:8:\"post_tag\";i:3;s:11:\"post_format\";i:4;s:9:\"categorie\";}s:21:\"aiosp_sitemap_archive\";s:0:\"\";s:20:\"aiosp_sitemap_author\";s:0:\"\";s:21:\"aiosp_sitemap_gzipped\";s:2:\"on\";s:20:\"aiosp_sitemap_robots\";s:2:\"on\";s:21:\"aiosp_sitemap_rewrite\";s:2:\"on\";s:24:\"aiosp_sitemap_addl_pages\";a:0:{}s:29:\"aiosp_sitemap_excl_categories\";s:0:\"\";s:24:\"aiosp_sitemap_excl_pages\";s:0:\"\";s:27:\"aiosp_sitemap_prio_homepage\";s:2:\"no\";s:23:\"aiosp_sitemap_prio_post\";s:2:\"no\";s:29:\"aiosp_sitemap_prio_taxonomies\";s:2:\"no\";s:26:\"aiosp_sitemap_prio_archive\";s:2:\"no\";s:25:\"aiosp_sitemap_prio_author\";s:2:\"no\";s:27:\"aiosp_sitemap_freq_homepage\";s:2:\"no\";s:23:\"aiosp_sitemap_freq_post\";s:2:\"no\";s:29:\"aiosp_sitemap_freq_taxonomies\";s:2:\"no\";s:26:\"aiosp_sitemap_freq_archive\";s:2:\"no\";s:25:\"aiosp_sitemap_freq_author\";s:2:\"no\";s:19:\"aiosp_sitemap_debug\";s:2525:\"2017-09-24 09:52:45  57.61 MB memory used generating the dynamic compressed root sitemap in 7.000 seconds, 100.17 MB total memory used.\n2017-09-24 07:55:43  57.60 MB memory used generating the dynamic compressed root sitemap in 7.000 seconds, 100.16 MB total memory used.\n2017-09-22 11:18:32  57.61 MB memory used generating the dynamic compressed root sitemap in 9.000 seconds, 100.17 MB total memory used.\n2017-09-17 12:05:03  57.37 MB memory used generating the dynamic root sitemap in 5.000 seconds, 97.08 MB total memory used.\n2017-09-17 06:31:19  57.41 MB memory used generating the dynamic compressed root sitemap in 5.000 seconds, 97.12 MB total memory used.\n2017-09-09 13:31:37  57.29 MB memory used generating the dynamic compressed root sitemap in 12.000 seconds, 97.00 MB total memory used.\n2017-09-02 20:00:45  57.18 MB memory used generating the dynamic compressed root sitemap in 5.000 seconds, 96.89 MB total memory used.\n2017-08-27 12:14:15  57.19 MB memory used generating the dynamic compressed root sitemap in 4.000 seconds, 96.90 MB total memory used.\n2017-08-20 07:05:55  57.19 MB memory used generating the dynamic compressed root sitemap in 4.000 seconds, 96.90 MB total memory used.\n2017-08-13 13:43:38  57.16 MB memory used generating the dynamic compressed root sitemap in 5.000 seconds, 96.87 MB total memory used.\n2017-08-08 07:01:31  57.06 MB memory used generating the dynamic root sitemap in 6.000 seconds, 96.78 MB total memory used.\n2017-08-06 12:18:16  57.06 MB memory used generating the dynamic root sitemap in 4.000 seconds, 96.77 MB total memory used.\n2017-08-06 04:36:12  57.05 MB memory used generating the dynamic root sitemap in 7.000 seconds, 96.75 MB total memory used.\n2017-08-06 02:52:33  57.09 MB memory used generating the dynamic compressed root sitemap in 5.000 seconds, 96.80 MB total memory used.\n2017-07-28 15:53:53  57.10 MB memory used generating the dynamic compressed root sitemap in 5.000 seconds, 96.82 MB total memory used.\n2017-07-22 02:29:01  57.10 MB memory used generating the dynamic compressed root sitemap in 20.000 seconds, 96.82 MB total memory used.\n2017-07-14 04:22:38  57.09 MB memory used generating the dynamic compressed root sitemap in 8.000 seconds, 96.80 MB total memory used.\n2017-07-05 22:14:34  57.04 MB memory used generating the dynamic compressed root sitemap in 4.000 seconds, 96.75 MB total memory used.\n2017-06-28 04:05:12  56.82 MB memory used generating the dynamic compressed root sitemap in 4.000 seconds, 96.54 MB total memory used.\";}}s:29:\"aiosp_attachment_title_format\";s:27:\"%post_title% | %blog_title%\";s:31:\"aiosp_advertenties_title_format\";s:27:\"%post_title% | %blog_title%\";s:22:\"aiosp_acf_title_format\";s:27:\"%post_title% | %blog_title%\";s:23:\"aiosp_date_title_format\";s:21:\"%date% | %blog_title%\";s:19:\"last_active_version\";s:6:\"2.3.16\";}','yes'),(370,'pte-option-2','a:4:{s:9:\"pte_debug\";b:0;s:13:\"pte_crop_save\";b:1;s:17:\"pte_thumbnail_bar\";s:10:\"horizontal\";s:20:\"pte_imgedit_max_size\";i:600;}','yes'),(579,'cpt_custom_post_types','a:1:{i:0;a:21:{s:4:\"name\";s:12:\"advertenties\";s:5:\"label\";s:12:\"Advertenties\";s:14:\"singular_label\";s:11:\"Advertentie\";s:11:\"description\";s:141:\"Hier kan je je advertenties 1 voor 1 plaatsen, en in een bijpassende categorie zetten. Je kan ze ook wijzigen van volgorde door ze te slepen.\";s:6:\"public\";s:1:\"1\";s:7:\"show_ui\";s:1:\"1\";s:11:\"has_archive\";s:1:\"0\";s:19:\"exclude_from_search\";s:1:\"0\";s:15:\"capability_type\";s:4:\"post\";s:12:\"hierarchical\";s:1:\"1\";s:7:\"rewrite\";s:1:\"1\";s:12:\"rewrite_slug\";s:0:\"\";s:17:\"rewrite_withfront\";s:1:\"1\";s:9:\"query_var\";s:1:\"1\";s:13:\"menu_position\";s:2:\"20\";s:12:\"show_in_menu\";s:1:\"1\";s:19:\"show_in_menu_string\";s:0:\"\";s:9:\"menu_icon\";s:0:\"\";i:0;a:1:{i:0;s:5:\"title\";}i:1;N;i:2;a:12:{s:9:\"menu_name\";s:0:\"\";s:7:\"add_new\";s:0:\"\";s:12:\"add_new_item\";s:0:\"\";s:4:\"edit\";s:0:\"\";s:9:\"edit_item\";s:0:\"\";s:8:\"new_item\";s:0:\"\";s:4:\"view\";s:0:\"\";s:9:\"view_item\";s:0:\"\";s:12:\"search_items\";s:0:\"\";s:9:\"not_found\";s:0:\"\";s:18:\"not_found_in_trash\";s:0:\"\";s:6:\"parent\";s:0:\"\";}}}','yes'),(588,'cpt_custom_tax_types','a:1:{i:0;a:11:{s:4:\"name\";s:9:\"categorie\";s:5:\"label\";s:9:\"Categorie\";s:14:\"singular_label\";s:9:\"categorie\";s:12:\"hierarchical\";s:1:\"1\";s:7:\"show_ui\";s:1:\"1\";s:9:\"query_var\";s:1:\"1\";s:7:\"rewrite\";s:1:\"1\";s:12:\"rewrite_slug\";s:0:\"\";s:17:\"show_admin_column\";s:1:\"1\";i:0;a:12:{s:12:\"search_items\";s:0:\"\";s:13:\"popular_items\";s:0:\"\";s:9:\"all_items\";s:0:\"\";s:11:\"parent_item\";s:0:\"\";s:17:\"parent_item_colon\";s:0:\"\";s:9:\"edit_item\";s:0:\"\";s:11:\"update_item\";s:0:\"\";s:12:\"add_new_item\";s:0:\"\";s:13:\"new_item_name\";s:0:\"\";s:26:\"separate_items_with_commas\";s:0:\"\";s:19:\"add_or_remove_items\";s:0:\"\";s:21:\"choose_from_most_used\";s:0:\"\";}i:1;a:1:{i:0;s:12:\"advertenties\";}}}','yes'),(593,'tto_options','a:3:{s:8:\"autosort\";s:1:\"1\";s:9:\"adminsort\";s:1:\"1\";s:5:\"level\";i:8;}','yes'),(1060,'akismet_spam_count','129232','yes'),(1144,'auto_core_update_notified','a:4:{s:4:\"type\";s:6:\"manual\";s:5:\"email\";s:18:\"marten@atypisch.nl\";s:7:\"version\";s:5:\"4.7.1\";s:9:\"timestamp\";i:1484680092;}','yes'),(5025,'pvr_settings_general','a:1:{s:17:\"verification_code\";s:32:\"86dd65320c7a0e6ce4e9c29d089db749\";}','yes'),(26783,'nonce_key','9$4?cWSm7)%<0[bmL4Rfj;tDg2%Dg]RSHVJb,[_2Pf.Mi#^&VFpsWj&RPQ4b51E_','yes'),(26784,'nonce_salt','R$rOa]]c2y/F6^.!cvb6Jq|a:Qrc,3*_zu+l!{l/.V.[&fyX)UZ60p$u$t];1X:f','yes'),(26785,'auth_key','MP 5&/EY=7Gy9xpjF$&;J|!/HiYFZF@Gf(]Dyhqg|P].ppkF0b(5t?(lPKVYdX^*','yes'),(26786,'auth_salt','54&;4Q,6xl`J7yA{*469j$T_;r_Q04oncMssO8#4Y1j3M4Z&Zs^!U::OPyQ*rM B','yes'),(26787,'logged_in_key','aI#0F*c;t.WOgc:C>$?mszUbI2LEU(^rL9RPSuq&XKZ}[7N.%o4rcls%]wK>X_gX','yes'),(26788,'logged_in_salt','-?,H@U)S9e7uQsz&Dn12imx9@m9lE a(B@;I$tRbQ=}&MGe>C!tswb.Sbqi)&mJq','yes'),(26867,'db_upgraded','','yes'),(26892,'WPLANG','nl_NL','yes'),(27012,'public_post_preview','a:0:{}','yes'),(27013,'finished_splitting_shared_terms','1','yes'),(27048,'categorie_children','a:0:{}','yes'),(27049,'category_children','a:0:{}','yes'),(27050,'_split_terms','a:7:{i:2;a:2:{s:8:\"category\";i:203;s:8:\"post_tag\";i:204;}i:3;a:1:{s:8:\"category\";i:205;}i:4;a:2:{s:8:\"category\";i:206;s:8:\"post_tag\";i:207;}i:5;a:1:{s:8:\"category\";i:208;}i:6;a:1:{s:8:\"category\";i:209;}i:7;a:1:{s:8:\"category\";i:210;}i:8;a:1:{s:8:\"category\";i:211;}}','yes'),(27095,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(27096,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(27097,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(27098,'widget_akismet_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(27099,'site_icon','0','yes'),(27100,'medium_large_size_w','768','yes'),(27101,'medium_large_size_h','0','yes'),(27102,'rewrite_rules','a:113:{s:14:\"sitemap.xml.gz\";s:60:\"index.php?aiosp_sitemap_gzipped=1&aiosp_sitemap_path=root.gz\";s:25:\"sitemap_(.+)_(\\d+).xml.gz\";s:74:\"index.php?aiosp_sitemap_path=$matches[1].gz&aiosp_sitemap_page=$matches[2]\";s:19:\"sitemap_(.+).xml.gz\";s:43:\"index.php?aiosp_sitemap_path=$matches[1].gz\";s:11:\"sitemap.xml\";s:33:\"index.php?aiosp_sitemap_path=root\";s:22:\"sitemap_(.+)_(\\d+).xml\";s:71:\"index.php?aiosp_sitemap_path=$matches[1]&aiosp_sitemap_page=$matches[2]\";s:16:\"sitemap_(.+).xml\";s:40:\"index.php?aiosp_sitemap_path=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:48:\"categorie/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:43:\"categorie/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:24:\"categorie/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:36:\"categorie/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:18:\"categorie/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:50:\"categorie/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?categorie=$matches[1]&feed=$matches[2]\";s:45:\"categorie/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?categorie=$matches[1]&feed=$matches[2]\";s:26:\"categorie/([^/]+)/embed/?$\";s:42:\"index.php?categorie=$matches[1]&embed=true\";s:38:\"categorie/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?categorie=$matches[1]&paged=$matches[2]\";s:20:\"categorie/([^/]+)/?$\";s:31:\"index.php?categorie=$matches[1]\";s:38:\"advertenties/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:48:\"advertenties/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:68:\"advertenties/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"advertenties/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"advertenties/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"advertenties/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"advertenties/(.+?)/embed/?$\";s:45:\"index.php?advertenties=$matches[1]&embed=true\";s:31:\"advertenties/(.+?)/trackback/?$\";s:39:\"index.php?advertenties=$matches[1]&tb=1\";s:39:\"advertenties/(.+?)/page/?([0-9]{1,})/?$\";s:52:\"index.php?advertenties=$matches[1]&paged=$matches[2]\";s:46:\"advertenties/(.+?)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?advertenties=$matches[1]&cpage=$matches[2]\";s:35:\"advertenties/(.+?)(?:/([0-9]+))?/?$\";s:51:\"index.php?advertenties=$matches[1]&page=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:31:\".+?/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\".+?/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:37:\".+?/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"(.+?)/([^/]+)/embed/?$\";s:63:\"index.php?category_name=$matches[1]&name=$matches[2]&embed=true\";s:26:\"(.+?)/([^/]+)/trackback/?$\";s:57:\"index.php?category_name=$matches[1]&name=$matches[2]&tb=1\";s:46:\"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:41:\"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:34:\"(.+?)/([^/]+)/page/?([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:41:\"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:70:\"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:30:\"(.+?)/([^/]+)(?:/([0-9]+))?/?$\";s:69:\"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]\";s:20:\".+?/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\".+?/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:26:\".+?/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:38:\"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:14:\"(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:26:\"(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:33:\"(.+?)/comment-page-([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&cpage=$matches[2]\";s:8:\"(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";}','yes'),(27199,'can_compress_scripts','0','yes'),(30678,'secure_auth_key','2=OUy&D|`{n#M[bHx-_2bH?zE^.ZlOyw(q(;f`6<rq-d.dNeyj@f7g_kQEKey6X8','yes'),(30679,'secure_auth_salt','<-/(QdECo9!?|2:]ZX|)amv):mF7/g!_jjnA}=OC|)cu#d3;Q$_lSG*<Mtu$6Wy(','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$BGBwDcl1YEfQcs19feVRRePYbCay9B0','admin','me@lucasvanlierop.nl','','2014-03-11 08:57:56','$P$BbhShBOT8pVVfokXnfTro1KrtuuTyW.',0,'admin'),(2,'annelies','$P$BM47SLod6kxwCJuEUFLVneBAhNaIHo.','annelies','anneliesannelies@gmail.com','http://allihoppa.localhost/','2014-03-20 18:21:52','$P$B3/Ol6UovU2aX5VI09l4SrT5wconfB0',0,'Annelies Vermeulen');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'first_name','Lucas'),(2,1,'last_name','van Lierop'),(3,1,'nickname','admin'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','false'),(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks,aioseop_menu_211,aioseop_welcome_211,wp410_dfw'),(13,1,'show_welcome_panel','0'),(14,1,'wp_dashboard_quick_press_last_post_id','6234'),(15,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:38:\"dashboard_right_now,dashboard_activity\";s:4:\"side\";s:21:\"dashboard_quick_press\";s:7:\"column3\";s:17:\"dashboard_primary\";s:7:\"column4\";s:0:\"\";}'),(16,1,'meta-box-order_page','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:23:\"submitdiv,pageparentdiv\";s:6:\"normal\";s:110:\"acf_687,acf_72,postcustom,commentstatusdiv,commentsdiv,slugdiv,postimagediv,authordiv,postexcerpt,revisionsdiv\";s:8:\"advanced\";s:5:\"aiosp\";}'),(17,1,'screen_layout_page','2'),(18,1,'wp_user-settings','libraryContent=browse&editor=tinymce&ed_size=402&uploader=1'),(19,1,'wp_user-settings-time','1549366908'),(20,1,'meta-box-order_post','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:48:\"submitdiv,categorydiv,formatdiv,tagsdiv-post_tag\";s:6:\"normal\";s:107:\"acf_687,acf_738,acf_72,postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,slugdiv,postimagediv,authordiv\";s:8:\"advanced\";s:5:\"aiosp\";}'),(21,1,'screen_layout_post','2'),(22,1,'closedpostboxes_post','a:3:{i:0;s:7:\"acf_738\";i:1;s:6:\"acf_72\";i:2;s:5:\"aiosp\";}'),(23,1,'metaboxhidden_post','a:7:{i:0;s:7:\"acf_687\";i:1;s:11:\"postexcerpt\";i:2;s:13:\"trackbacksdiv\";i:3;s:10:\"postcustom\";i:4;s:16:\"commentstatusdiv\";i:5;s:7:\"slugdiv\";i:6;s:9:\"authordiv\";}'),(24,2,'first_name','Annelies'),(25,2,'last_name','Vermeulen'),(26,2,'nickname','annelies'),(27,2,'description',''),(28,2,'rich_editing','true'),(29,2,'comment_shortcuts','false'),(30,2,'admin_color','fresh'),(31,2,'use_ssl','0'),(32,2,'show_admin_bar_front','false'),(33,2,'wp_capabilities','a:1:{s:6:\"editor\";b:1;}'),(34,2,'wp_user_level','7'),(35,2,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks,wp410_dfw'),(36,1,'closedpostboxes_page','a:0:{}'),(37,1,'metaboxhidden_page','a:7:{i:0;s:7:\"acf_687\";i:1;s:6:\"acf_72\";i:2;s:10:\"postcustom\";i:3;s:16:\"commentstatusdiv\";i:4;s:11:\"commentsdiv\";i:5;s:7:\"slugdiv\";i:6;s:9:\"authordiv\";}'),(74,1,'nav_menu_recently_edited','135'),(75,1,'managenav-menuscolumnshidden','a:3:{i:0;s:11:\"css-classes\";i:1;s:3:\"xfn\";i:2;s:11:\"description\";}'),(76,1,'metaboxhidden_nav-menus','a:3:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";}'),(77,2,'wp_dashboard_quick_press_last_post_id','6233'),(78,2,'wp_user-settings','hidetb=1&editor=html&libraryContent=browse&urlbutton=custom&mfold=o&align=center&wplink=1&ed_size=685'),(79,2,'wp_user-settings-time','1518105974'),(80,2,'meta-box-order_post','a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:48:\"submitdiv,formatdiv,categorydiv,tagsdiv-post_tag\";s:6:\"normal\";s:107:\"acf_687,acf_738,acf_72,postimagediv,postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,slugdiv,authordiv\";s:8:\"advanced\";s:5:\"aiosp\";}'),(81,2,'screen_layout_post','2'),(82,2,'googleplus',''),(83,1,'default_password_nag',''),(84,2,'closedpostboxes_page','a:0:{}'),(85,2,'metaboxhidden_page','a:8:{i:0;s:7:\"acf_687\";i:1;s:6:\"acf_72\";i:2;s:12:\"revisionsdiv\";i:3;s:10:\"postcustom\";i:4;s:16:\"commentstatusdiv\";i:5;s:11:\"commentsdiv\";i:6;s:7:\"slugdiv\";i:7;s:9:\"authordiv\";}'),(86,2,'closedpostboxes_post','a:0:{}'),(87,2,'metaboxhidden_post','a:7:{i:0;s:7:\"acf_687\";i:1;s:11:\"postexcerpt\";i:2;s:13:\"trackbacksdiv\";i:3;s:10:\"postcustom\";i:4;s:16:\"commentstatusdiv\";i:5;s:7:\"slugdiv\";i:6;s:9:\"authordiv\";}'),(88,2,'closedpostboxes_dashboard','a:1:{i:0;s:17:\"dashboard_primary\";}'),(89,2,'metaboxhidden_dashboard','a:0:{}'),(95,1,'googleplus',''),(98,1,'aioseop_seen_about_page','2.3.16'),(102,1,'session_tokens','a:1:{s:64:\"8e83d6e68c1af4ac823ab28d49a51b2e53eaa136eca6af9f133096255dfd11f3\";a:4:{s:10:\"expiration\";i:1568300455;s:2:\"ip\";s:10:\"172.19.0.2\";s:2:\"ua\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36\";s:5:\"login\";i:1568127655;}}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-10 15:09:13
