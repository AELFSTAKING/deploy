-- MySQL dump 10.13  Distrib 5.7.25-28, for Linux (x86_64)
--
-- Host: localhost    Database: staking_dex_prod_btc_wo
-- ------------------------------------------------------
-- Server version	5.7.25-28-log

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `block_cache`
--

DROP TABLE IF EXISTS `block_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_cache` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `block_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `height` bigint(20) unsigned NOT NULL,
  `block_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_block_hash` (`block_hash`) USING BTREE,
  KEY `idx_height` (`height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `btc_block_height`
--

DROP TABLE IF EXISTS `btc_block_height`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btc_block_height` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_latest_block_height` bigint(20) unsigned DEFAULT '0',
  `latest_block_height` bigint(20) unsigned DEFAULT '0',
  `last_call_back_height` bigint(20) unsigned DEFAULT NULL,
  `last_call_back_time` datetime DEFAULT NULL,
  `analyze_block_height` bigint(20) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `btc_user_trans_list`
--

DROP TABLE IF EXISTS `btc_user_trans_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btc_user_trans_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_height` int(11) NOT NULL,
  `block_hash` varchar(100) NOT NULL,
  `block_time` bigint(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `direction` tinyint(2) NOT NULL,
  `counterpart_address` varchar(50) NOT NULL,
  `tx_id` varchar(200) NOT NULL,
  `index_list` varchar(50) NOT NULL,
  `amount` decimal(65,30) NOT NULL,
  `is_notified` tinyint(2) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(2) NOT NULL,
  `delete_reason` tinyint(2) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_trans_list_uni_1` (`biz_id`) USING BTREE,
  KEY `idx_user_trans_list_1` (`tx_id`) USING BTREE,
  KEY `idx_user_trans_list_2` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msg_queue`
--

DROP TABLE IF EXISTS `msg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_queue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_callback` tinyint(1) unsigned DEFAULT '0',
  `msg` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `msg_type` smallint(2) unsigned NOT NULL,
  `last_callback_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `height` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_height` (`height`) USING BTREE 
) ENGINE=InnoDB AUTO_INCREMENT=3269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_height`
--

DROP TABLE IF EXISTS `sync_height`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_height` (
  `id` bigint(20) unsigned NOT NULL,
  `sync_height` bigint(20) unsigned NOT NULL,
  `block_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `is_usdt` tinyint(2) NOT NULL,
  `address_type` int(10) unsigned NOT NULL,
  `address` varchar(64) NOT NULL,
  `is_deleted` tinyint(2) DEFAULT '0',
  `delete_reason` tinyint(2) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_address` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utxo`
--

DROP TABLE IF EXISTS `utxo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utxo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tx_id` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `amount` decimal(65,30) NOT NULL,
  `status` smallint(2) NOT NULL,
  `output_index` int(3) NOT NULL,
  `height` bigint(20) unsigned DEFAULT NULL,
  `address` varchar(34) CHARACTER SET utf8mb4 NOT NULL,
  `tx_type` varchar(16) CHARACTER SET utf8mb4 DEFAULT NULL,
  `spend_tx_id` varchar(64) CHARACTER SET utf8mb4 DEFAULT '',
  `script` varchar(125) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address_type` smallint(4) unsigned DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `output_point` varchar(80) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_txid_index` (`tx_id`,`output_index`) USING BTREE,
  KEY `idx_address` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-25 15:02:09
