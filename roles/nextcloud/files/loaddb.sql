-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	10.3.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('admin','{\"displayname\":{\"value\":\"admin\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'admin','displayname','admin'),(2,'admin','address',''),(3,'admin','website',''),(4,'admin','email',''),(5,'admin','phone',''),(6,'admin','twitter','');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `subjectparams` longtext COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `messageparams` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `file` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `amq_appid` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_subjectparams` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('accessibility','enabled','yes'),('accessibility','installed_version','1.7.0'),('accessibility','types',''),('activity','enabled','yes'),('activity','installed_version','2.15.0'),('activity','types','filesystem'),('backgroundjob','lastjob','5'),('bruteforcesettings','enabled','yes'),('bruteforcesettings','installed_version','2.2.0'),('bruteforcesettings','types',''),('circles','enabled','yes'),('circles','installed_version','22.1.0'),('circles','loopback_tmp_scheme','https'),('circles','types','filesystem,dav'),('cloud_federation_api','enabled','yes'),('cloud_federation_api','installed_version','1.4.0'),('cloud_federation_api','types','filesystem'),('comments','enabled','yes'),('comments','installed_version','1.11.0'),('comments','types','logging'),('contactsinteraction','enabled','yes'),('contactsinteraction','installed_version','1.2.0'),('contactsinteraction','types','dav'),('core','installed.bundles','[\"CoreBundle\"]'),('core','installedat','1629198326.8519'),('core','lastcron','1629198441'),('core','lastupdatedat','1629198326.8547'),('core','oc.integritycheck.checker','[]'),('core','public_files','files_sharing/public.php'),('core','public_webdav','dav/appinfo/v1/publicwebdav.php'),('core','theming.variables','32ef7dc01a3ffbcbbaf8fb9483f9bd03'),('core','vendor','nextcloud'),('dashboard','enabled','yes'),('dashboard','installed_version','7.1.0'),('dashboard','types',''),('dav','enabled','yes'),('dav','installed_version','1.18.0'),('dav','types','filesystem'),('federatedfilesharing','enabled','yes'),('federatedfilesharing','installed_version','1.11.0'),('federatedfilesharing','types',''),('federation','enabled','yes'),('federation','installed_version','1.11.0'),('federation','types','authentication'),('files','enabled','yes'),('files','installed_version','1.16.0'),('files','types','filesystem'),('files_pdfviewer','enabled','yes'),('files_pdfviewer','installed_version','2.3.0'),('files_pdfviewer','types',''),('files_rightclick','enabled','yes'),('files_rightclick','installed_version','1.1.0'),('files_rightclick','types',''),('files_sharing','enabled','yes'),('files_sharing','installed_version','1.13.2'),('files_sharing','types','filesystem'),('files_trashbin','enabled','yes'),('files_trashbin','installed_version','1.11.0'),('files_trashbin','types','filesystem,dav'),('files_versions','enabled','yes'),('files_versions','installed_version','1.14.0'),('files_versions','types','filesystem,dav'),('files_videoplayer','enabled','yes'),('files_videoplayer','installed_version','1.11.0'),('files_videoplayer','types',''),('firstrunwizard','enabled','yes'),('firstrunwizard','installed_version','2.11.0'),('firstrunwizard','types','logging'),('logreader','enabled','yes'),('logreader','installed_version','2.7.0'),('logreader','types',''),('lookup_server_connector','enabled','yes'),('lookup_server_connector','installed_version','1.9.0'),('lookup_server_connector','types','authentication'),('nextcloud_announcements','enabled','yes'),('nextcloud_announcements','installed_version','1.11.0'),('nextcloud_announcements','types','logging'),('notifications','enabled','yes'),('notifications','installed_version','2.10.1'),('notifications','types','logging'),('oauth2','enabled','yes'),('oauth2','installed_version','1.9.0'),('oauth2','types','authentication'),('password_policy','enabled','yes'),('password_policy','installed_version','1.12.0'),('password_policy','types','authentication'),('photos','enabled','yes'),('photos','installed_version','1.4.0'),('photos','types',''),('privacy','enabled','yes'),('privacy','installed_version','1.6.0'),('privacy','types',''),('provisioning_api','enabled','yes'),('provisioning_api','installed_version','1.11.0'),('provisioning_api','types','prevent_group_restriction'),('recommendations','enabled','yes'),('recommendations','installed_version','1.1.0'),('recommendations','types',''),('serverinfo','cached_count_filecache','166'),('serverinfo','cached_count_storages','2'),('serverinfo','enabled','yes'),('serverinfo','installed_version','1.12.0'),('serverinfo','types',''),('settings','enabled','yes'),('settings','installed_version','1.3.0'),('settings','types',''),('sharebymail','enabled','yes'),('sharebymail','installed_version','1.11.0'),('sharebymail','types','filesystem'),('support','enabled','yes'),('support','installed_version','1.5.0'),('support','types','session'),('survey_client','enabled','yes'),('survey_client','installed_version','1.10.0'),('survey_client','types',''),('systemtags','enabled','yes'),('systemtags','installed_version','1.11.0'),('systemtags','types','logging'),('text','enabled','yes'),('text','installed_version','3.3.0'),('text','types','dav'),('theming','enabled','yes'),('theming','installed_version','1.12.0'),('theming','types','logging'),('twofactor_backupcodes','enabled','yes'),('twofactor_backupcodes','installed_version','1.10.1'),('twofactor_backupcodes','types',''),('updatenotification','enabled','yes'),('updatenotification','installed_version','1.11.0'),('updatenotification','types',''),('user_status','enabled','yes'),('user_status','installed_version','1.1.1'),('user_status','types',''),('viewer','enabled','yes'),('viewer','installed_version','1.6.0'),('viewer','types',''),('weather_status','enabled','yes'),('weather_status','installed_version','1.1.0'),('weather_status','types',''),('workflowengine','enabled','yes'),('workflowengine','installed_version','2.3.0'),('workflowengine','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `login_name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `password` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `public_key` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'admin','admin','2eb6e2c72e547b9c40e8c3420b4a60bf|0b0d67383a83873742dfcb4173935eda|06a24c65b58aebb7eac18ab428c8468bdb95ba806029b98005210f04feafd782c84e9da55f098bb280a3c8da3a72689f05ca4c549c0436d863e705e5275c815a|3','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36','b6ef5ac25a5d9937f23332b47019f42beb3e20818f532449405308aa3043e4195cf767a372962ee001fc37c46ed0eab925325648a4fe212c41ab3e446cd4e446',0,0,1629198338,1629198338,NULL,NULL,NULL,NULL,1,0),(2,'admin','admin','A9O/XquzEx7QBDdxcQxTTCNJSnMgCx01PfmaBwECvpOLIS4xOuh4bvHTFaR/7vvljK62N211ccZ/nC/x8J+c5C5WukTVg1jotd05e1LtU5fg0EtywhF8YHwlGBGOO8Rg7LxovfBjvy00L0wvQw4u1crqMqcmUz1JCSF6M4PpuhreaYHxQS8qNj4tyD8sivCVZSTYnQF9qmravgF6YtCtI8kt+aDNsq3uJ8YyHXUIBR1vSrPnLJHy8OCuu1XH+Ah3K68TRwU4n8qQ7Zxk8bRBsNL/043nyHkwyI6jZp5vSyMiPjc3c80UIDA4apVlaEhryjSRABWZxM1P6etCyszAsA==','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36','815c3b3a1fdc700b49122045dc59c69181450874748bed8c4efd7ddc43dc24e7c41f4d4915016752e80321e2436c6dfc0bf480aff8c05f6f98a61ae49d1ffe87',0,1,1629198501,1629198419,NULL,NULL,'ba42ff30072b9a78dee985c6694006c77868337307105e8d4d08d106b71f169ccc6f5e21cca6b4406e2d5b4d489b81629cdf6c32653f7762dfd74a358b66ee51a8da8c64bad68bf5be5d97459e858c66a7c644301a0ab4d2f20f5747d493a09d5a7035ef7be123a4ef7284fff7a336260ac9e2332f1520e42fcc339e2777bd96e4068bdfa7af11363746f9dd03f09fb20e7f9ab2dde9da9eba994002c4b1e5e3bf05a0cc53335f210ebfb39de52a754724833ce58459480bf49ab6327c9cd53fb867150f403f60335fa5acfe24f0a1fe18dabc53854d2fdbf611501b586b7b70cee298f7ac497def8cad9a58529321482d278865ff8d029526093e845e95ebdcc459e304eea84ba234042932b021ab6d4ba55e5d8ed0b38fdc705a6608e884ff2d30b25a893cbffa4dc6445eb3c02700713df792877414d4de7b191ffc349d2ed95c63087e19cdac4fc424735c44bc611ba9a0d7c8e245efd4718b8bc345bda10b29b69fbe42bb48015b608024aefc71cca35ebe6cce2274b4b7e21af82b74e07efd72ff0e033274e195211b23d4c6c5751227671b96abbdf06eeadba40e46bb040a713116e27a2e097f0dd2e71c891bb02df57172809f0a3e7126373a653ad1ddd5be1daffa5fe9d186b3fead5e5bfd42b5ffc86757ebfb22dd17a34bf372a57255861e58a5672b104be9b029760e06bc1f4f99c5a809734fd808e155a7d2a7dc5256653ae23aada64986a70a1d9a2edc9564701069f6f81e25379a7339e0367ca54b966387a5dc272c7873cca8922d09fbf2516bd2886a20321958754a41226507a454df8d8a60e653990c1373532f9b0331ea1dec89f00e22dea28dac86f0553fd723bab201fd92384a933a78202a797b654478e14f33c200a455bff05210dcf9148def7fd6d753ab978845a8372a3a8a070cab6b31369b7e043ec214e180cf0778a48422778d372b49c7d22224e0d406ca3ae8d4a61fe0fa0aa6632a6625098d7d4595149566f7d939efab413ebe1ee04c464035c0d1afbfbcdb22f680d9eb7dd3e59a98cbcb8add6205c4ca1f39a83634c1286bb5b205ec59a04d95b8c48b0960373cad31b26c0c87814e776c09a91a10e592bbeefbb6f0334cc20a517939a06b80eacec1c5c434be74c68706099286f52f92d3fd730951fd63642eaddf6d83b65a20361da94c732fb884071784d3848a9d3ab979d800fb8d73cb38903ee875d02ae1f0c2ecbab605716f8f88b32ed04e4a53a519cbe19c9165a941cc2188de6ed174267862bf425aa2c92952f19c1e05e235ff2c5717431ecba5fead047106f4d77bf90f2bca0aadc92ff678c67753e62d3316377c2a8f717e2b2af7f0296ca8c941b6dd2b78c300bd6532e915d37b950a96eeda3707136eef6efee2d579f649910b8b187cd1710f78102ffb10b2af1a599370f953920dc13f542580e80eb55558e6095c106fbde8336eba00201275ff361189b47f8c78e8eecc79e4dbd6f02bda9d245a6fda0af56e9d83ccf452b444fd6e2bd237cd799744d6f7f766a5891220b22d355bc9d3c0ae875b31da749b7307eb4c7e040bc09bd14dfeceda787283ad1f92206e490a72b3b7097ba8caa28ddda1966c352128c1023c1ca0515e9c12adf011425165b5535eb197e0f8e2dc60a11c126416eec43a58149046fba185cadf410c8328baaf83222162a253c031251c8d1d8d84ad32d38af8168430104545612b2bb759eea4c9b37f9ebd593cc2d44d1be381c7f86c1c03526b803a2e914ba7fac495a8c5c5b01c75fbfe55a92a252fcbfdc075e8e5e33ec549855c6c64966653d2abbeb613d52cbbb3743e638954be1e8f0d68614409baec036b86f6ded51a3b94a26684d24b94c1174af1c9e3e6f8be721361b82efcbbafa921dbc015a8c058e56d984fd606e01bdfe6e4e00af993c35309ccd4b252b7eebf2bbcaef78deb594889bf03896a0ce91f94a8ae878034c0f0a5653ce08ec6d8033e481d1173ef7f272374cdcbaeda7b4afb0da74620187107cb3d66c6424733d1c1304cee77a6aa3e5cd250c7ff69463d5aefa9b41e156b3c94aeeb80ca78285fe7cdc59723e4cd9590c0ef039a23f8b99b2ad46ae53bcfbbfd75d478f741aec3c5c786ed31c4911ce761e34655d9d80f6ed398da322b8db6d1bcc62171a470fcf307a0562a28c8015b70c523b670ff7be66e8c49e20656e0752de80ca07e706ee791fa0ca0d0c7220644980848f793afe037c2d546daf3c806b885113fe835cb22df77b5c1828da9ab01b657c1e0e405a682c427d2bf88e79acb32c7fb2b974fd44bf9e842394c8af476de5a91171103b86bf1452d7ef947a88f15f7e9bf3b6525c44e8feba3619fefbe470db140440a12ccbc220324124afd8d1bd1e6a7c6ed3c624001eec836db0ec18559435d15b9a16d|2b0b2764e7e64bc2d7c6502dd48dd418|10163ac184237c78a2f340948155a984d7a20fea993116614af1059ff96410b76c007587a14a782d6c96a2b66917822cc8662870597d1208acea583a8f466bc1|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3oSsmyONmJCWw6l9LXu6\nyb2RJciZKa62xgu0Y84p3V2wM+5VlNxpBtTyvkustm85iLz70juxW2+Aylw2BHot\nwtc13Z00YG9xA3xyYTc3KOOlMcWSero5Yqzx9AGWqpXrqY/QvP00FTR+5ilVDqhq\niTT5xvZIE4lbppn/NtszbNPV/1EbriArKVsDs2VlLPxf1dN1D2igD9NaGkINs7P3\nWQyGSwnrCcVdieU5MHdVwnBmLXDuikZz2u9nlvKlRTMSbDJqWtOD1f3EsWK/Kfsh\njL56JPaR+iTl+b/Q77GmWwvjUcL4Xl8Zev9J6XhXmcVl5oG4Wv+RxU/ii3vj038s\n/wIDAQAB\n-----END PUBLIC KEY-----\n',2,0);
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `metadata` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recurrenceid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `attendee` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `organizer` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `alarm_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parameter` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timezone` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `components` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `refreshrate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abid` (`addressbookid`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  `display_name` varchar(127) COLLATE utf8mb4_bin DEFAULT '',
  `sanitized_name` varchar(127) COLLATE utf8mb4_bin DEFAULT '',
  `instance` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','user:admin:btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','admin','','',1,1,'[]','','2021-08-17 11:06:59',0,''),(2,'GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','app:circles:GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','Circles','','',8193,10001,'[]','','2021-08-17 11:06:59',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) COLLATE utf8mb4_bin DEFAULT NULL,
  `event` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `result` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `instance` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  UNIQUE KEY `UNIQ_1C1814105F37A13B4230B1DE` (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `member_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `invited_by` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `cached_name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `contact_meta` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','circles',10000,'',NULL,9,'Member','[]','Circles','2021-08-17 11:06:59','',NULL,'2021-08-17 11:06:59'),(2,'btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','admin',1,'','GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF',9,'Member','[]','admin','2021-08-17 11:06:59','',NULL,'2021-08-17 11:06:59');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `inheritance_last` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `UNIQ_8FC816EAE7C1D92B70EE2FF6` (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF',9,'GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF','GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF',1,'[\"GhjdZaCXZvLzXXnNa3lYMQetpzZCZTF\"]'),('btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','btkHLoBJVIhhpQI6A6THyBmOwdhMOQK',9,'btkHLoBJVIhhpQI6A6THyBmOwdhMOQK','btkHLoBJVIhhpQI6A6THyBmOwdhMOQK',1,'[\"btkHLoBJVIhhpQI6A6THyBmOwdhMOQK\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(63) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `mountpoint_hash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `mountpoint` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `mountpoint_hash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `instance` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `href` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL,
  `item` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `instance` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `member_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `resource_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `actor_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `verb` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `reference_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `proxy_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/4be8e939c20acee3550dd4759744083f',1629202021),(2,0,'files/4e880c89dd5ef07f76468c186eb6d77d',1629202021),(3,0,'files/1ae3dedc906a08116b40c4db1830bf22',1629202022),(5,0,'files/f1a24181cbdd788217e78daa4cdc09c9',1629202022),(6,0,'files/5a1261e14459f84e4e6e3dde193ed1d7',1629202022),(7,0,'files/081acf30ef1d389136f5520b075c3946',1629202022),(9,0,'files/bf718a62293a2452aa9605a263295943',1629202022),(10,0,'files/a855b0642847119c3d116d792e89a77f',1629202022),(11,0,'files/2d78b1ac1eff287fc2f468056556c1b3',1629202022),(12,0,'files/3c6cbf78118655fcc9e71d8bb9792f90',1629202022),(13,0,'files/5f2c44368dfb2d1366c588b6d15a5d32',1629202022),(14,0,'files/5ea854d1d3bddc99080c41201a1c336f',1629202022),(15,0,'files/b0760073a49f5b38ad7ad262b23a29e8',1629202022),(16,0,'files/077d537429fd913cddcba21372d1881a',1629202022),(17,0,'files/2a60139137dec9758c24494e1a145d1f',1629202022),(18,0,'files/89a1a70efc73c5493e5a248061f97d3d',1629202022),(19,0,'files/274a80dde4d5b853de255d91e29d861f',1629202022),(20,0,'files/aae03c503f47f3b75809d10f25ec7f6d',1629202022),(21,0,'files/40982ef38739f8d559f897d4c5e2ac5b',1629202022),(22,0,'files/8af299ffd09b1b573a54627ec65351d1',1629202022),(23,0,'files/0cb40d7dc90a305de7fc337a889fe5b7',1629202022),(24,0,'files/bfdc403c0ea2c61416cbcea12b64736b',1629202022),(25,0,'files/7571fadced6609ab1d9355b51610c8cf',1629202022),(26,0,'files/f19983c1177c025f36ea8f9f4dc22c14',1629202022),(27,0,'files/c5a4eec614f2e3073e7fb2b1ae83acd3',1629202022),(28,0,'files/df70a5364119d3c99563814fcd65702f',1629202022),(30,0,'files/84fc6d08ed3bd071bcdab33a99d2d7d9',1629202023),(31,0,'files/88b27fb6a1b0923cfcb5b3580df8187a',1629202024),(32,0,'files/b6ef755cfc70b5eb94f5d3aad8ba833d',1629202024),(33,0,'files/3513aba8aa4305d3ad33fc7122d4af30',1629202023),(34,0,'files/11f1a7725a8f86df6d64d6625ddba8f5',1629202023),(35,0,'files/aa257104891955d4f3bf1888e7f00c90',1629202023),(36,0,'files/e4c7d65068ae7412246f294716c8ff1c',1629202023),(37,0,'files/3a81cdbf048df5a5eccc06c7e34c9854',1629202023),(38,0,'files/97889ad0c27014acd099992f49e37b79',1629202023),(39,0,'files/cf997b89cb0e87148185a9b157775142',1629202023),(40,0,'files/042c8467b009223625f274e5d460731a',1629202023),(41,0,'files/cb3428b1d44ee1d3e9c76aa16bfbe24a',1629202023),(42,0,'files/3551cc523677ef09b1ddd9380e62c9bb',1629202023),(43,0,'files/961e96441636e059a1b7227b687a1cd4',1629202023),(44,0,'files/26b10e05d85fb2261227abd44793c10d',1629202023),(45,0,'files/239cefa6bb5094030e2de5f12a5b69c8',1629202023),(46,0,'files/64f8167f62e1ed17e5fc32fa88df9d5a',1629202023),(47,0,'files/563bcd2be0cae5c60ac618f6968bc202',1629202023),(48,0,'files/83f44a83c313ebf8afb1ece18b387c24',1629202024),(51,0,'files/2c7eaecb9090bd89cef1dcd4d0d5881a',1629202024),(52,0,'files/cbc6f4e337332b94c2e02444d64b1c16',1629202024);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,-1,1629198383,1629198383,0,0,'611b97fba4a4d',23,''),(2,1,'appdata_ocd969xfz3tc','5b462d12067b978f249625d077e198ea',1,'appdata_ocd969xfz3tc',2,1,0,1629198374,1629198374,0,0,'611b97fba491e',31,''),(3,1,'appdata_ocd969xfz3tc/appstore','ed219604008dfe20e18323140ae44d47',2,'appstore',2,1,0,1629198334,1629198334,0,0,'611b97fbab81e',31,''),(4,1,'appdata_ocd969xfz3tc/appstore/apps.json','db38895d0fdab656e896e1caab97a147',3,'apps.json',4,3,1901643,1629198334,1629198334,0,0,'1ecba91337ffa7ce11b0c2077eb04a93',27,''),(5,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,22868402,1629198419,1629198419,0,0,'611b98533099b',23,''),(6,2,'files','45b963397aa40d4a0063e0d85e4fe7a1',5,'files',2,1,22868402,1629198338,1629198338,0,0,'611b98021e489',31,''),(7,2,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',6,'Documents',2,1,400389,1629198337,1629198337,0,0,'611b9801a05eb',31,''),(8,2,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',7,'Nextcloud flyer.pdf',5,3,374008,1629198337,1629198337,0,0,'eaa773dd48f632595a9fc968b9583230',27,''),(9,2,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',7,'Example.md',7,6,1095,1629198337,1629198337,0,0,'891a983032382ba938ceeae72cfd9779',27,''),(10,2,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',7,'Welcome to Nextcloud Hub.docx',8,3,25150,1629198337,1629198337,0,0,'474c1a595b1bad227efba417ca9e1283',27,''),(11,2,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',7,'Readme.md',7,6,136,1629198337,1629198337,0,0,'633fac41446b7588eba2ee6132a1b093',27,''),(12,2,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',6,'Nextcloud Manual.pdf',5,3,11639377,1629198337,1629198337,0,0,'a1ecbdf05e1709b368517019b19e1015',27,''),(13,2,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',6,'Nextcloud.png',10,9,50598,1629198337,1629198337,0,0,'bf050f589deb4668db94b295d89b6eb4',27,''),(14,2,'files/Шаблоны','32743fc4196709e150544bcf7d35be54',6,'Шаблоны',2,1,181914,1629198337,1629198337,0,0,'611b9801d0e35',31,''),(15,2,'files/Шаблоны/Product plan.md','a9763dd69fe6a70172c67cf932462e2c',14,'Product plan.md',7,6,573,1629198337,1629198337,0,0,'ffea0fbb36d7823fee8e9600ab81d282',27,''),(16,2,'files/Шаблоны/Letter.odt','41a85da1c31ae56a0e7528de96ac3779',14,'Letter.odt',11,3,15961,1629198337,1629198337,0,0,'726f689a924a1a78eb9dbd925abcdc3c',27,''),(17,2,'files/Шаблоны/Meeting notes.md','5f2853c91c82ee8cac05eca924947a6e',14,'Meeting notes.md',7,6,326,1629198337,1629198337,0,0,'1b8ee20312c03e4bd6f2146a99ff8fbc',27,''),(18,2,'files/Шаблоны/Elegant.odp','84e4d694b123ac2dd753daa10efb6ada',14,'Elegant.odp',12,3,14316,1629198337,1629198337,0,0,'06d37f0479cde9dd63b093d0c1a342d3',27,''),(19,2,'files/Шаблоны/SWOT analysis.whiteboard','e9b428ce26f8dcdc377c17ca0b1f3503',14,'SWOT analysis.whiteboard',13,3,38605,1629198337,1629198337,0,0,'657590037d054d05ef2cca2973be12a9',27,''),(20,2,'files/Шаблоны/Expense report.ods','81b3ac7c38dfc3c390e572de0f42e7f0',14,'Expense report.ods',14,3,13441,1629198337,1629198337,0,0,'4e61ba8c0cda092b5b07e024e99d4436',27,''),(21,2,'files/Шаблоны/Simple.odp','b3ded56369aeae536966c6b51faf0007',14,'Simple.odp',12,3,14810,1629198337,1629198337,0,0,'fbce074b11b8d05ccb7f025098fffb59',27,''),(22,2,'files/Шаблоны/Invoice.odt','4a60df9d144a0b680a3ef6bd6140ec9d',14,'Invoice.odt',11,3,17276,1629198337,1629198337,0,0,'bf48b8255fc80e4693d30aa5d803eb06',27,''),(23,2,'files/Шаблоны/Impact effort matrix.whiteboard','48f78fc60be0a64440c44a3fdc2e1d92',14,'Impact effort matrix.whiteboard',13,3,52674,1629198337,1629198337,0,0,'fa8f4f2ae76ae4a85e6e953d6560cafd',27,''),(24,2,'files/Шаблоны/Diagram & table.ods','ab7b65f2ffbaa387dff2a22166fcc422',14,'Diagram & table.ods',14,3,13378,1629198337,1629198337,0,0,'c3ce66141025d75020a06e3cccfda94d',27,''),(25,2,'files/Шаблоны/Readme.md','86f8b32fa5a3b87df88515298a8daf92',14,'Readme.md',7,6,554,1629198337,1629198337,0,0,'071f77183dbddc985afc4f1c79007de0',27,''),(26,2,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',6,'Reasons to use Nextcloud.pdf',5,3,976625,1629198337,1629198337,0,0,'7feec7da26a69935363e1e80ec1fd89f',27,''),(27,2,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',6,'Nextcloud intro.mp4',16,15,3963036,1629198337,1629198337,0,0,'9d4a779fd055bcd1862394da0f776092',27,''),(28,2,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',6,'Photos',2,1,5656463,1629198338,1629198338,0,0,'611b980207796',31,''),(29,2,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',28,'Frog.jpg',17,9,457744,1629198337,1629198337,0,0,'4efcdfe3894125bc271ac807185e52cb',27,''),(30,2,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',28,'Nextcloud community.jpg',17,9,797325,1629198337,1629198337,0,0,'03e1c411fec70562b05bfabe19043b4d',27,''),(31,2,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',28,'Library.jpg',17,9,2170375,1629198337,1629198337,0,0,'747caf385fe21075b93ba9f09222a53e',27,''),(32,2,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',28,'Birdie.jpg',17,9,593508,1629198337,1629198337,0,0,'df7285847ffd455b1755ed47fac02de8',27,''),(33,2,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',28,'Toucan.jpg',17,9,167989,1629198337,1629198337,0,0,'ae110d81a77f8a0f4e05f1fb72660ba0',27,''),(34,2,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',28,'Vineyard.jpg',17,9,427030,1629198337,1629198337,0,0,'f786543cf85864b5da9d1d2cfdcc90f0',27,''),(35,2,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',28,'Steps.jpg',17,9,567689,1629198338,1629198338,0,0,'deb4c42554f61c61c0899aa7f1b993d4',27,''),(36,2,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',28,'Readme.md',7,6,150,1629198338,1629198338,0,0,'ce660eef9c21b95b6f841fa60ceee110',27,''),(37,2,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',28,'Gorilla.jpg',17,9,474653,1629198338,1629198338,0,0,'efbbce9cf64135a6fa54e664cb43c935',27,''),(38,1,'appdata_ocd969xfz3tc/js','07a5fa1ac4c2d71ab1b8c5c2766f263b',2,'js',2,1,0,1629198373,1629198373,0,0,'611b9825bb698',31,''),(39,1,'appdata_ocd969xfz3tc/js/core','16aca266222759098387fd424b7f311b',38,'core',2,1,0,1629198373,1629198373,0,0,'611b9825bf311',31,''),(40,1,'appdata_ocd969xfz3tc/js/core/merged-template-prepend.js','aadf0dbc892d5a1fb4867ce6a33dc86d',39,'merged-template-prepend.js',18,3,11396,1629198373,1629198373,0,0,'fbcf09a1f06fd77f7e13d6869e98fb43',27,''),(41,1,'appdata_ocd969xfz3tc/js/core/merged-template-prepend.js.deps','6f92ca7051418e957bd64b558cf09ed6',39,'merged-template-prepend.js.deps',13,3,290,1629198373,1629198373,0,0,'e0bd283e9fe672b3465d437cb493c4c2',27,''),(42,1,'appdata_ocd969xfz3tc/js/core/merged-template-prepend.js.gzip','f6bf8a4025b5b049861e82cc25022c3c',39,'merged-template-prepend.js.gzip',19,3,2982,1629198373,1629198373,0,0,'1b70770d085ad2895bcaf32ba1ac6932',27,''),(43,1,'appdata_ocd969xfz3tc/css','0e454aca7a283b046b518faf0a68fd4e',2,'css',2,1,0,1629198374,1629198374,0,0,'611b9826165cf',31,''),(44,1,'appdata_ocd969xfz3tc/css/icons','dd2bd1f7823eb9240f76e60ffcbb91b0',43,'icons',2,1,0,1629198374,1629198374,0,0,'611b982620a72',31,''),(45,1,'appdata_ocd969xfz3tc/css/core','ee30ccb9c75fe0c155c514f3821e5019',43,'core',2,1,0,1629198374,1629198374,0,0,'611b98262ef7e',31,''),(46,1,'appdata_ocd969xfz3tc/css/icons/icons-vars.css','9e692f4f9c3c91756a0a408eb5d89744',44,'icons-vars.css',20,6,112909,1629198374,1629198374,0,0,'62719846aedb7971e8f258b1cd1d6ca7',27,''),(47,1,'appdata_ocd969xfz3tc/css/icons/icons-list.template','0fbf389b9a2a0186220628e636f2dc8f',44,'icons-list.template',13,3,16088,1629198374,1629198374,0,0,'f0f4f26c77b5089b187c05c7d104ed18',27,''),(48,1,'appdata_ocd969xfz3tc/css/core/cbe0-e832-server.css','e1bed9b05fa715562fe21846cbaea325',45,'cbe0-e832-server.css',20,6,138783,1629198374,1629198374,0,0,'15f065a7c7228a77f5396ab5209d9484',27,''),(49,1,'appdata_ocd969xfz3tc/css/core/cbe0-e832-server.css.deps','7244ffd3c72477ea078cb30353c191f7',45,'cbe0-e832-server.css.deps',13,3,913,1629198374,1629198374,0,0,'b7d4d511400390cf4bda14a7fcb3010e',27,''),(50,1,'appdata_ocd969xfz3tc/css/core/cbe0-e832-server.css.gzip','d2a8f355afa4596a8c87c389e9d13ae3',45,'cbe0-e832-server.css.gzip',19,3,19857,1629198374,1629198374,0,0,'44a016e5eab9d4a66ee1fe16a496745e',27,''),(51,1,'appdata_ocd969xfz3tc/css/core/cbe0-e832-css-variables.css','1efe71ec7df8a7cd51671b5bef2c984e',45,'cbe0-e832-css-variables.css',20,6,1613,1629198374,1629198374,0,0,'956e4b83ce200b9f68352c248333f1fe',27,''),(52,1,'appdata_ocd969xfz3tc/css/core/cbe0-e832-css-variables.css.deps','245fddfccc195cafee344a9e83260c02',45,'cbe0-e832-css-variables.css.deps',13,3,209,1629198374,1629198374,0,0,'bb603476fa0db35690938fd0966ee69b',27,''),(53,1,'appdata_ocd969xfz3tc/css/core/cbe0-e832-css-variables.css.gzip','35acfb1cadfb1bf01ac5808bfcc4278c',45,'cbe0-e832-css-variables.css.gzip',19,3,646,1629198374,1629198374,0,0,'55c6e0ad00346ab1344964f55bc6f0c1',27,''),(54,1,'appdata_ocxelmhf7fwn','9485b460158dc8d1db878e71d4c832ec',1,'appdata_ocxelmhf7fwn',2,1,0,1629198422,1629198422,0,0,'611b982f60b5d',31,''),(55,1,'appdata_ocxelmhf7fwn/js','dcc9caaa04cbb661964b50b7fd407eeb',54,'js',2,1,0,1629198419,1629198419,0,0,'611b982f63a94',31,''),(56,1,'appdata_ocxelmhf7fwn/js/core','1157c8aafabe8e5a035b4af4dbf33464',55,'core',2,1,0,1629198383,1629198383,0,0,'611b982f65c17',31,''),(57,1,'appdata_ocxelmhf7fwn/js/core/merged-template-prepend.js','e2a8fbcfc4504e20f69b90814ea5399b',56,'merged-template-prepend.js',18,3,11396,1629198383,1629198383,0,0,'1eb10692d3fc2fa81c1c188513ea5e76',27,''),(58,1,'appdata_ocxelmhf7fwn/js/core/merged-template-prepend.js.deps','88729c9474ef2070e7e062a6f49f7fc0',56,'merged-template-prepend.js.deps',13,3,290,1629198383,1629198383,0,0,'07457c30951d4cbafbf1d365162c9095',27,''),(59,1,'appdata_ocxelmhf7fwn/js/core/merged-template-prepend.js.gzip','122d7e32b4692d2134ef178668d02007',56,'merged-template-prepend.js.gzip',19,3,2982,1629198383,1629198383,0,0,'7d5529666219fb5fefdb74b156ee4f54',27,''),(60,1,'appdata_ocxelmhf7fwn/css','3bf066345a381093935e593db61f7ced',54,'css',2,1,0,1629198428,1629198428,0,0,'611b982f94099',31,''),(61,1,'appdata_ocxelmhf7fwn/css/icons','663c3ec303fd170d6a280522a38b0548',60,'icons',2,1,0,1629198419,1629198419,0,0,'611b982f96429',31,''),(62,1,'appdata_ocxelmhf7fwn/css/core','677d8bc03b0cfee93e06941bc3c6ecef',60,'core',2,1,0,1629198419,1629198419,0,0,'611b982f98761',31,''),(71,1,'appdata_ocxelmhf7fwn/css/theming','706b5c6b5d50db838120292011e64b29',60,'theming',2,1,0,1629198413,1629198413,0,0,'611b984d76678',31,''),(72,1,'appdata_ocxelmhf7fwn/css/theming/4039-e832-theming.css','fc73329eac5b55dc3fcffbe9ce4bee93',71,'4039-e832-theming.css',20,6,1621,1629198413,1629198413,0,0,'e1a817b15d2005d72a8bbf2dd2e55757',27,''),(73,1,'appdata_ocxelmhf7fwn/css/theming/4039-e832-theming.css.deps','940a3d50b2f2b1a2f993fe16c2b27d83',71,'4039-e832-theming.css.deps',13,3,212,1629198413,1629198413,0,0,'56f24757a0af11c205e1ae906fdfa316',27,''),(74,1,'appdata_ocxelmhf7fwn/css/theming/4039-e832-theming.css.gzip','c938e361e7f686d0c3cb5a4a87aa92f3',71,'4039-e832-theming.css.gzip',19,3,522,1629198413,1629198413,0,0,'57e7f55f0390c685a7d3d886f2e56475',27,''),(75,2,'cache','0fea6a13c52b4d4725368f24b045ca84',5,'cache',2,1,0,1629198419,1629198419,0,0,'611b98532dcd2',31,''),(76,1,'appdata_ocxelmhf7fwn/js/activity','9bf5cc94fa022747a757f8aacd2a67e1',55,'activity',2,1,0,1629198419,1629198419,0,0,'611b9853660c8',31,''),(77,1,'appdata_ocxelmhf7fwn/js/activity/activity-sidebar.js','1a8b0245feb2ec6194fd7831e75dc9ff',76,'activity-sidebar.js',18,3,1131414,1629198419,1629198419,0,0,'28bd442aa41a3339ff61595025310a31',27,''),(78,1,'appdata_ocxelmhf7fwn/js/activity/activity-sidebar.js.deps','09cc495c9eaaddba108d4b08e12885d8',76,'activity-sidebar.js.deps',13,3,493,1629198419,1629198419,0,0,'193f7baed544e27f8711cbaa4718f1f9',27,''),(79,1,'appdata_ocxelmhf7fwn/js/activity/activity-sidebar.js.gzip','cd22ab2f56f2977d236224929c2dd41e',76,'activity-sidebar.js.gzip',19,3,319706,1629198419,1629198419,0,0,'7293f820d8b038cf0ef4837787a67445',27,''),(80,1,'appdata_ocxelmhf7fwn/css/icons/icons-vars.css','56ce6783a86ff8fdc58e9c96d9f3499a',61,'icons-vars.css',20,6,151724,1629198428,1629198428,0,0,'cca123914a83aaf6f131b5359743ed72',27,''),(81,1,'appdata_ocxelmhf7fwn/css/icons/icons-list.template','b572331e9baed7a755d7eba1fadb18f4',61,'icons-list.template',13,3,20026,1629198428,1629198428,0,0,'5919fcdd81d046dfb40cb47978ca7e79',27,''),(82,1,'appdata_ocxelmhf7fwn/css/core/cbe0-e832-server.css','2df21332a1819fd4627bb45947d8cd46',62,'cbe0-e832-server.css',20,6,138783,1629198419,1629198419,0,0,'45799bbfe23fda94e1a4636eea7e64c6',27,''),(83,1,'appdata_ocxelmhf7fwn/css/core/cbe0-e832-server.css.deps','fa3155e2155cdc89df316f99b4a36d0e',62,'cbe0-e832-server.css.deps',13,3,913,1629198419,1629198419,0,0,'747b8b68c966715657d50faff3e843dc',27,''),(84,1,'appdata_ocxelmhf7fwn/css/core/cbe0-e832-server.css.gzip','2660e238daca4cb352ed45ebfd30c725',62,'cbe0-e832-server.css.gzip',19,3,19857,1629198419,1629198419,0,0,'4e9c5b524534d28cb8e7065e51b7b216',27,''),(85,1,'appdata_ocxelmhf7fwn/css/core/cbe0-e832-css-variables.css','8cb20dceff701ab1bed1829a1edd7b43',62,'cbe0-e832-css-variables.css',20,6,1585,1629198419,1629198419,0,0,'e2fde92ca45d7b98bd65e5932409da7a',27,''),(86,1,'appdata_ocxelmhf7fwn/css/core/cbe0-e832-css-variables.css.deps','3f6dfc8c5751aed0b0981d96fc062531',62,'cbe0-e832-css-variables.css.deps',13,3,209,1629198419,1629198419,0,0,'8450bf50169d017e4e13036bf91ec87a',27,''),(87,1,'appdata_ocxelmhf7fwn/css/core/cbe0-e832-css-variables.css.gzip','340b6a4b9a1fe5a81d1e59109a787279',62,'cbe0-e832-css-variables.css.gzip',19,3,636,1629198419,1629198419,0,0,'ff88aa52dd601c6dd578b1f30ead27ab',27,''),(88,1,'appdata_ocxelmhf7fwn/css/dashboard','54c41b14467eb8d26b4be3e669b3a0ab',60,'dashboard',2,1,0,1629198419,1629198419,0,0,'611b9853c4cee',31,''),(89,1,'appdata_ocxelmhf7fwn/css/dashboard/c108-e832-dashboard.css','6c8d2e910afdfcc3f56e96359c4eb3e5',88,'c108-e832-dashboard.css',20,6,2090,1629198419,1629198419,0,0,'ec3d2ee640fa177f54c3f06c1f4b6a38',27,''),(90,1,'appdata_ocxelmhf7fwn/css/dashboard/c108-e832-dashboard.css.deps','978a0400be336d4edd62f160aee73554',88,'c108-e832-dashboard.css.deps',13,3,216,1629198419,1629198419,0,0,'2dae4d582fb612aa69422d11b0a62d56',27,''),(91,1,'appdata_ocxelmhf7fwn/css/dashboard/c108-e832-dashboard.css.gzip','4bebb3790657e57b418476a9677db9e4',88,'c108-e832-dashboard.css.gzip',19,3,609,1629198419,1629198419,0,0,'4d47438c25ca45ceac1e0e9da482cea9',27,''),(92,1,'appdata_ocxelmhf7fwn/css/activity','f2cc52c056b9660d63dbf86fc76e1a5d',60,'activity',2,1,0,1629198419,1629198419,0,0,'611b9853d4d06',31,''),(93,1,'appdata_ocxelmhf7fwn/css/activity/96db-e832-style.css','0681df1dda23c37c38890fb8cc1ab308',92,'96db-e832-style.css',20,6,3330,1629198419,1629198419,0,0,'329894891cb04179a5f099c1f56e3d56',27,''),(94,1,'appdata_ocxelmhf7fwn/css/activity/96db-e832-style.css.deps','4f85467da8b2f0ba0bf340e8e880fd59',92,'96db-e832-style.css.deps',13,3,211,1629198419,1629198419,0,0,'8cf47d639089da119a15b65d530cdc3d',27,''),(95,1,'appdata_ocxelmhf7fwn/css/activity/96db-e832-style.css.gzip','93553fb0ae8d40bf202888a7124b95ee',92,'96db-e832-style.css.gzip',19,3,1095,1629198419,1629198419,0,0,'f4fd7469e09c1453f4b2f135193b5216',27,''),(96,1,'appdata_ocxelmhf7fwn/css/text','4d07750df4e150d8d046ece1ea39bc20',60,'text',2,1,0,1629198419,1629198419,0,0,'611b9853e45c7',31,''),(97,1,'appdata_ocxelmhf7fwn/css/text/593e-e832-icons.css','176944c54a1656cfda909d951fcd1241',96,'593e-e832-icons.css',20,6,2710,1629198419,1629198419,0,0,'9e5ffaa5c22d4488e089f4cc4c2bfba1',27,''),(98,1,'appdata_ocxelmhf7fwn/css/text/593e-e832-icons.css.deps','1418efef6e565c59bfc1019c470c14cd',96,'593e-e832-icons.css.deps',13,3,207,1629198419,1629198419,0,0,'4f03659490e44dbbe6e7832bb65b5fa8',27,''),(99,1,'appdata_ocxelmhf7fwn/css/text/593e-e832-icons.css.gzip','0d75596e7c8f0e96ba07854adbbd34c4',96,'593e-e832-icons.css.gzip',19,3,417,1629198419,1629198419,0,0,'4ea0f8079d2340ec90d6c24c8fda68ad',27,''),(100,1,'appdata_ocxelmhf7fwn/css/notifications','3ed172bce5ae21db4ee7bea8e762628d',60,'notifications',2,1,0,1629198420,1629198420,0,0,'611b985400a9b',31,''),(101,1,'appdata_ocxelmhf7fwn/css/notifications/e2ca-e832-styles.css','fe9777c92ac10cbb9e475fba27aab103',100,'e2ca-e832-styles.css',20,6,3505,1629198420,1629198420,0,0,'4fa929e9ff2ca435652f0b63693343be',27,''),(102,1,'appdata_ocxelmhf7fwn/css/notifications/e2ca-e832-styles.css.deps','03a24c7e860e74efabcdc4c228517120',100,'e2ca-e832-styles.css.deps',13,3,217,1629198420,1629198420,0,0,'b4ba70b601ac36971cadd6d63c510ceb',27,''),(103,1,'appdata_ocxelmhf7fwn/css/notifications/e2ca-e832-styles.css.gzip','a7fc063fafa3d9e4bbe9633484a8eb8e',100,'e2ca-e832-styles.css.gzip',19,3,858,1629198420,1629198420,0,0,'385f3d05b1a99cc0c01dc0cea6e5fabd',27,''),(104,1,'appdata_ocxelmhf7fwn/css/user_status','4de9bbeef6b563635acdcef8bf17ab3f',60,'user_status',2,1,0,1629198420,1629198420,0,0,'611b9854103ed',31,''),(105,1,'appdata_ocxelmhf7fwn/css/user_status/872c-e832-user-status-menu.css','9e0bd5fe875c6ccffdf97ec5507a4cf3',104,'872c-e832-user-status-menu.css',20,6,1109,1629198420,1629198420,0,0,'7d72715b47adb20e283a4a34131d31cc',27,''),(106,1,'appdata_ocxelmhf7fwn/css/user_status/872c-e832-user-status-menu.css.deps','987ba7ef90dcb05cb5339717579582a3',104,'872c-e832-user-status-menu.css.deps',13,3,225,1629198420,1629198420,0,0,'7d8527957d54163877ae41470ccf0d06',27,''),(107,1,'appdata_ocxelmhf7fwn/css/user_status/872c-e832-user-status-menu.css.gzip','305dc0b8bffdd9de8c149ab0eeeafd13',104,'872c-e832-user-status-menu.css.gzip',19,3,249,1629198420,1629198420,0,0,'394434b0649e62cc9738d0f3a91676b2',27,''),(108,1,'appdata_ocxelmhf7fwn/avatar','6a892e1b15f69dd98417ebcc3172e8c8',54,'avatar',2,1,0,1629198421,1629198421,0,0,'611b98552fe5f',31,''),(109,1,'appdata_ocxelmhf7fwn/avatar/admin','b52ac05ae7e221c74baa6932219ababe',108,'admin',2,1,0,1629198429,1629198429,0,0,'611b985536a66',31,''),(110,1,'appdata_ocxelmhf7fwn/avatar/admin/avatar.png','f9b3756acfab93b11d04cf179f517d2a',109,'avatar.png',10,9,15676,1629198421,1629198421,0,0,'95ee07e617002be8fc9b40ba94b078b2',27,''),(111,1,'appdata_ocxelmhf7fwn/avatar/admin/generated','6f68f0c5dd4d2d60b1b4fba24a4f95d3',109,'generated',13,3,0,1629198421,1629198421,0,0,'185628899c68594346ae4ed61ea304c7',27,''),(112,1,'appdata_ocxelmhf7fwn/avatar/admin/avatar.32.png','8e97af5af3cc8c0a56a75906800e7958',109,'avatar.32.png',10,9,391,1629198421,1629198421,0,0,'293e64dc1ffec8e94ece444444bf80c7',27,''),(113,1,'appdata_ocxelmhf7fwn/theming','98fd408ba584f298c8cdb82e990297c7',54,'theming',2,1,0,1629198422,1629198422,0,0,'611b98568835a',31,''),(114,1,'appdata_ocxelmhf7fwn/theming/0','7f55a771608e3d17bb5b26a52a36e2da',113,'0',2,1,0,1629198430,1629198430,0,0,'611b98568ed18',31,''),(115,1,'appdata_ocxelmhf7fwn/theming/0/icon-core-filetypes_image.svg','446dd508c9cd45ebfea22143e9eb0740',114,'icon-core-filetypes_image.svg',21,9,352,1629198422,1629198422,0,0,'d8c5234c53405b1fed7b8794750463bc',27,''),(116,1,'appdata_ocxelmhf7fwn/theming/0/icon-core-filetypes_x-office-document.svg','03c2d8b8db689ecf9083f7bfe6895c3c',114,'icon-core-filetypes_x-office-document.svg',21,9,295,1629198422,1629198422,0,0,'738775541f7933c09a7db1b176aee9a3',27,''),(117,1,'appdata_ocxelmhf7fwn/preview','26a57e209d66c813dd21beda15ad1fbf',54,'preview',2,1,0,1629198422,1629198422,0,0,'611b9856c51eb',31,''),(118,1,'appdata_ocxelmhf7fwn/preview/1','b41e0d981798fdd05349343480a6903b',117,'1',2,1,-1,1629198422,1629198422,0,0,'611b9856d3920',31,''),(119,1,'appdata_ocxelmhf7fwn/preview/a','21c577e73d038f720f187c10a6c7cb6d',117,'a',2,1,-1,1629198422,1629198422,0,0,'611b9856d2029',31,''),(120,1,'appdata_ocxelmhf7fwn/preview/a/5','5fa314f626eeb5746fc8927e08ce2970',119,'5',2,1,-1,1629198422,1629198422,0,0,'611b9856d0fa1',31,''),(121,1,'appdata_ocxelmhf7fwn/preview/1/9','c07e54fae0a6af73d7736ce749ecfccd',118,'9',2,1,-1,1629198422,1629198422,0,0,'611b9856d10dc',31,''),(123,1,'appdata_ocxelmhf7fwn/preview/a/5/b','594d3b4f0e2461a55280f7cea96fc0ad',120,'b',2,1,-1,1629198422,1629198422,0,0,'611b9856cf910',31,''),(124,1,'appdata_ocxelmhf7fwn/preview/1/9/c','278990da8afbaeb4cd44cc12af067d1e',121,'c',2,1,-1,1629198422,1629198422,0,0,'611b9856cf770',31,''),(125,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f','7918f0534a596ca476107b13a9fb17b9',123,'f',2,1,-1,1629198422,1629198422,0,0,'611b9856ce78b',31,''),(126,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a','b6bb2c13083d81de318bf45c07e215ce',124,'a',2,1,-1,1629198422,1629198422,0,0,'611b9856ce904',31,''),(127,1,'appdata_ocxelmhf7fwn/preview/1/c','18111acbccb30075780bfee173188ec3',118,'c',2,1,-1,1629198422,1629198422,0,0,'611b9856d174e',31,''),(128,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f/c','6bf36df9c30edcb16f0b3da9ed6e4d88',125,'c',2,1,-1,1629198422,1629198422,0,0,'611b9856cd402',31,''),(129,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a/1','f4c5863d2dcfa7ce2ea288311212b561',126,'1',2,1,-1,1629198422,1629198422,0,0,'611b9856cd545',31,''),(130,1,'appdata_ocxelmhf7fwn/preview/1/c/3','33eb143370f4e7da3ed966f07ea7156a',127,'3',2,1,-1,1629198422,1629198422,0,0,'611b9856d07f1',31,''),(131,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f/c/9','48839f99589b7254a7c2d9b9a0952f44',128,'9',2,1,-1,1629198422,1629198422,0,0,'611b9856cc534',31,''),(132,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a/1/4','69cc7b8feea5dcdad2e922fe455dcb19',129,'4',2,1,-1,1629198422,1629198422,0,0,'611b9856cc657',31,''),(133,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8','ef60a64e84d04c2e42f9aff795d4f047',130,'8',2,1,-1,1629198422,1629198422,0,0,'611b9856cefac',31,''),(134,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a/1/4/e','9b2a3241b8db7729e0606f4202de4174',132,'e',2,1,-1,1629198422,1629198422,0,0,'611b9856cb4f9',31,''),(135,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f/c/9/e','4037bff69670903998b11ee41f0f03a8',131,'e',2,1,-1,1629198422,1629198422,0,0,'611b9856cb67b',31,''),(136,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8/3','4d994fca97366a8f4df6511bb5163ebe',133,'3',2,1,-1,1629198422,1629198422,0,0,'611b9856cdccf',31,''),(137,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a/1/4/e/36','a294138574f17543c685cefb1442c99e',134,'36',2,1,0,1629198423,1629198423,0,0,'611b9856c8eda',31,''),(138,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f/c/9/e/37','7668185089bbb0759a167e33c70a2d18',135,'37',2,1,0,1629198423,1629198423,0,0,'611b9856c979a',31,''),(139,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8/3/c','f5b73f73518090401cc8f54e5253bde5',136,'c',2,1,-1,1629198422,1629198422,0,0,'611b9856ccc32',31,''),(140,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8/3/c/d','940bef048feb5db10214af04ef4c8a7d',139,'d',2,1,-1,1629198422,1629198422,0,0,'611b9856cbcb9',31,''),(141,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8/3/c/d/35','44e5f13974ecb4aac6442663d2932a51',140,'35',2,1,0,1629198423,1629198423,0,0,'611b9856cad97',31,''),(142,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8/3/c/d/35/1200-1800-max.jpg','fdd7a82fc1bb7e6662e221f1dac671b8',141,'1200-1800-max.jpg',17,9,496747,1629198423,1629198423,0,0,'0351ce0adbd13896a00bd7436293f4bd',27,''),(143,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f/c/9/e/37/1600-1067-max.jpg','0d3a0f411ed868a8ab05593a3f2dbdb7',138,'1600-1067-max.jpg',17,9,463069,1629198423,1629198423,0,0,'80cb957539b709cb0d860bee168eae7f',27,''),(144,1,'appdata_ocxelmhf7fwn/preview/1/c/3/8/3/c/d/35/64-64-crop.jpg','f414fdfad82c602faaf2eea182f90d96',141,'64-64-crop.jpg',17,9,2234,1629198423,1629198423,0,0,'e1684feb73f2cc998520b43ca3d5b63c',27,''),(145,1,'appdata_ocxelmhf7fwn/preview/a/5/b/f/c/9/e/37/64-64-crop.jpg','6b898df2746ef08e151a9a6667991393',138,'64-64-crop.jpg',17,9,2437,1629198423,1629198423,0,0,'e57cb31a789ae87fc1ab3e5a5b4aa313',27,''),(146,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a/1/4/e/36/4096-4096-max.png','af93cdb33a1df0f4f5ea2f036dae07b0',137,'4096-4096-max.png',10,9,37126,1629198423,1629198423,0,0,'9c692f0fdc507a1de6412f16c496cd7e',27,''),(147,1,'appdata_ocxelmhf7fwn/preview/4','1d5dfd8c282c09deff84886812dbe610',117,'4',2,1,-1,1629198423,1629198423,0,0,'611b985790b17',31,''),(148,1,'appdata_ocxelmhf7fwn/preview/4/5','8622baa7afa9203487eb4ef598ac5fac',147,'5',2,1,-1,1629198423,1629198423,0,0,'611b98578bf8a',31,''),(149,1,'appdata_ocxelmhf7fwn/preview/4/5/c','30f01e79ecf8260b03e88c67a1e77899',148,'c',2,1,-1,1629198423,1629198423,0,0,'611b985785c83',31,''),(150,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4','86f20d8afe37b1c9e5aa1086f7e182c4',149,'4',2,1,-1,1629198423,1629198423,0,0,'611b985784555',31,''),(151,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4/8','d5e0bd63d4dbe499eb5802140adafd3b',150,'8',2,1,-1,1629198423,1629198423,0,0,'611b985783a20',31,''),(152,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4/8/c','3dfe9ad9be6323f14ad9a8ae9adfe680',151,'c',2,1,-1,1629198423,1629198423,0,0,'611b985782aa9',31,''),(153,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4/8/c/c','c26c5dc10dc3f68d0ac236d1382aec22',152,'c',2,1,-1,1629198423,1629198423,0,0,'611b985780e94',31,''),(154,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4/8/c/c/9','09a569d6d374f6fe2e9d36e530f5ca1f',153,'9',2,1,0,1629198425,1629198425,0,0,'611b985779dac',31,''),(155,1,'appdata_ocxelmhf7fwn/preview/6','7a3147ea7abbe8f7f6c3b71e7c501863',117,'6',2,1,-1,1629198423,1629198423,0,0,'611b9857f224a',31,''),(156,1,'appdata_ocxelmhf7fwn/preview/1/9/c/a/1/4/e/36/64-64-crop.png','828a248d102fb6721ff7c8e0ed2c9e15',137,'64-64-crop.png',10,9,839,1629198423,1629198423,0,0,'30c28935b2b7f81db281674d22ee665b',27,''),(157,1,'appdata_ocxelmhf7fwn/preview/6/5','2eab2cc8a658f4c2c6264a053c07df72',155,'5',2,1,-1,1629198423,1629198423,0,0,'611b9857e86d5',31,''),(158,1,'appdata_ocxelmhf7fwn/preview/6/5/1','f098d6cf32396a7946576e1855d85d34',157,'1',2,1,-1,1629198423,1629198423,0,0,'611b9857d9462',31,''),(159,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2','90f0073d35c73ce2a941e6b2880bccf0',158,'2',2,1,-1,1629198423,1629198423,0,0,'611b9857ca9c2',31,''),(160,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2/b','2f4a51a0c108c735f22782be92d74e3c',159,'b',2,1,-1,1629198423,1629198423,0,0,'611b9857bf6c8',31,''),(161,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2/b/d','5ff2f9b8929916529500a5abfa9914ba',160,'d',2,1,-1,1629198423,1629198423,0,0,'611b9857b1401',31,''),(162,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2/b/d/4','f5efeb6550dc3937e465c085cd39dbf0',161,'4',2,1,-1,1629198423,1629198423,0,0,'611b9857a16f2',31,''),(163,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2/b/d/4/11','3e0874887204d4ada8eec2e7bc0c7a73',162,'11',2,1,0,1629198425,1629198425,0,0,'611b985794c77',31,''),(164,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4/8/c/c/9/4096-4096-max.png','683a390bdf385495ee5b20c8c4507506',154,'4096-4096-max.png',10,9,199843,1629198424,1629198424,0,0,'8d598f704eefab3e5aa0c53ad190febf',27,''),(165,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2/b/d/4/11/4096-4096-max.png','c8af1106e42e03594e04cd30120230d5',163,'4096-4096-max.png',10,9,37884,1629198424,1629198424,0,0,'d83d530f0c0b34dfc365f81887571d38',27,''),(166,1,'appdata_ocxelmhf7fwn/preview/4/5/c/4/8/c/c/9/64-64-crop.png','fd2bdcb8354fb5f44f0f6604eeab0648',154,'64-64-crop.png',10,9,3566,1629198425,1629198425,0,0,'dedceed7d1a6e520272ee69b4ddb9751',27,''),(167,1,'appdata_ocxelmhf7fwn/preview/6/5/1/2/b/d/4/11/64-64-crop.png','464ec9c96eb54eb8d4943200519c3310',163,'64-64-crop.png',10,9,844,1629198425,1629198425,0,0,'c0d1b7803034e0ad1ea010d490e2ff74',27,''),(168,1,'appdata_ocxelmhf7fwn/css/settings','c4a54454c7d940a7ef6a3df959161a6e',60,'settings',2,1,0,1629198428,1629198428,0,0,'611b985ca4c39',31,''),(169,1,'appdata_ocxelmhf7fwn/css/settings/1980-e832-settings.css','5587cb9b478f8560f650d490fba12700',168,'1980-e832-settings.css',20,6,33452,1629198428,1629198428,0,0,'b095a3888ed6cb23661bd1bf7886e6ab',27,''),(170,1,'appdata_ocxelmhf7fwn/css/settings/1980-e832-settings.css.deps','b6ecaf856643c09fbbf0fd3a2917162f',168,'1980-e832-settings.css.deps',13,3,214,1629198428,1629198428,0,0,'7437598386a0b19f0440b2a589e7ab38',27,''),(171,1,'appdata_ocxelmhf7fwn/css/settings/1980-e832-settings.css.gzip','162d4592eaa7028597567720e312e7b5',168,'1980-e832-settings.css.gzip',19,3,6110,1629198428,1629198428,0,0,'103fa3be1782a80d88eb4b0ed9b0f4b6',27,''),(172,1,'appdata_ocxelmhf7fwn/theming/0/icon-core-filetypes_folder.svg','de6ad46a62e340defa5e04b5e5fe7a48',114,'icon-core-filetypes_folder.svg',21,9,255,1629198429,1629198429,0,0,'386b8168cc8c4a18091aed8128185a9c',27,''),(173,1,'appdata_ocxelmhf7fwn/theming/0/icon-core-filetypes_text.svg','e625c41a3762c8df7b9b80199ba61f52',114,'icon-core-filetypes_text.svg',21,9,295,1629198429,1629198429,0,0,'8ff985cd234668f9a61b27e42530e28f',27,''),(174,1,'appdata_ocxelmhf7fwn/avatar/admin/avatar.145.png','beeaae839f1c75280df6f1e6ca24c4e9',109,'avatar.145.png',10,9,1788,1629198429,1629198429,0,0,'531b7fc285b7d90f2cb1f9e5f92b2c3c',27,''),(175,1,'appdata_ocxelmhf7fwn/theming/0/favIcon-settings','fd537e988a83f913ccba728fbe6b8c84',114,'favIcon-settings',13,3,90022,1629198430,1629198430,0,0,'9301fe94e8dee046a014a0a8a5c297fa',27,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8mb4_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `operator` varchar(16) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `name` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `checks` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `operation` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `entity` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `displayname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `argument` varchar(4000) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1629198413,1629198413,0,0),(2,'OCA\\Files_Sharing\\ExpireSharesJob','null',1629198422,1629198422,0,0),(3,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',1629198430,1629198429,0,0),(4,'OCA\\Federation\\SyncJob','null',1629198431,1629198431,0,0),(5,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',1629198441,1629198441,0,0),(6,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1629198327,0,0),(7,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1629198327,0,0),(8,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1629198328,0,0),(9,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1629198328,0,0),(10,'OCA\\Files\\BackgroundJob\\ScanFiles','null',0,1629198328,0,0),(11,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1629198328,0,0),(12,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1629198328,0,0),(13,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1629198328,0,0),(14,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1629198328,0,0),(15,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1629198328,0,0),(16,'OCA\\Circles\\Cron\\Maintenance','null',0,1629198329,0,0),(17,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1629198329,0,0),(18,'OCA\\Text\\Cron\\Cleanup','null',0,1629198329,0,0),(19,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1629198330,0,0),(20,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1629198330,0,0),(21,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1629198330,0,0),(22,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1629198330,0,0),(23,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1629198330,0,0),(24,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1629198330,0,0),(25,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1629198330,0,0),(26,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1629198330,0,0),(27,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',0,1629198330,0,0),(28,'OC\\Authentication\\Token\\DefaultTokenCleanupJob','null',0,1629198337,0,0),(29,'OC\\Log\\Rotate','null',0,1629198337,0,0),(30,'OC\\Preview\\BackgroundCleanupJob','null',0,1629198337,0,0),(31,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin\"}',0,1629198419,0,0);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `known_user` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `login_token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `public_key` text COLLATE utf8mb4_bin NOT NULL,
  `private_key` text COLLATE utf8mb4_bin NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `login_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `server` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `app_password` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_trashbin','1010Date20200630192639'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('privacy','100Date20190217131943'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('workflowengine','2000Date20190808074233');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(18,'application/javascript'),(4,'application/json'),(13,'application/octet-stream'),(5,'application/pdf'),(12,'application/vnd.oasis.opendocument.presentation'),(14,'application/vnd.oasis.opendocument.spreadsheet'),(11,'application/vnd.oasis.opendocument.text'),(8,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(19,'application/x-gzip'),(1,'httpd'),(2,'httpd/unix-directory'),(9,'image'),(17,'image/jpeg'),(10,'image/png'),(21,'image/svg+xml'),(6,'text'),(20,'text/css'),(7,'text/markdown'),(15,'video'),(16,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mount_point` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_user_root_index` (`user_id`,`root_id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,2,5,'admin','/admin/',NULL);
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject_parameters` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `message_parameters` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `actions` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','admin',1629198419,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(2,'firstrunwizard','admin',1629198419,'app','social','apphint-social','[]','','[]','','','[]'),(3,'firstrunwizard','admin',1629198419,'app','notes','apphint-notes','[]','','[]','','','[]'),(4,'firstrunwizard','admin',1629198419,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','admin',1629198419,'app','tasks','apphint-tasks','[]','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickey` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickeyhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `pushtokenhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `proxyserver` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `apptype` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `encrypted_token` varchar(786) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8mb4_bin NOT NULL,
  `client_identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `secret` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('admin','activity','configured','yes'),('admin','avatar','generated','true'),('admin','core','lang','ru'),('admin','core','templateDirectory','Шаблоны/'),('admin','core','timezone','Europe/Moscow'),('admin','dashboard','firstRun','0'),('admin','firstrunwizard','apphint','18'),('admin','firstrunwizard','show','0'),('admin','login','lastLogin','1629198419'),('admin','login_token','cUTM5HVQhXmIe1gq9oftDzcJMT/r9263','1629198419'),('admin','password_policy','failedLoginAttempts','0');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyvalue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`),
  KEY `properties_path_index` (`userid`,`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `federated_cloud_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `remote_id` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `share_token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mountpoint` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `mountpoint_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'local::/var/www/html/nextcloud/data/',1,NULL),(2,'home::admin',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `credentials` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `objecttype` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `base_version_etag` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `guest_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `url_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `token` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `shared_secret` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','admin',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_icon` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_message` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'admin','online',1629198422,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `target_user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_lower` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$VauUiICsWI/m19XvkWtQzg$eqvCz8m+gihUVsT0Ys1HxGScFKngKD9QfCKL7J3Nh8w','admin');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `public_key_credential_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '11',
  `etag` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-17 14:08:40
