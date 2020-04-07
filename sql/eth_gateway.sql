-- MySQL dump 10.13  Distrib 5.7.25-28, for Linux (x86_64)
--
-- Host: localhost    Database: stacking_prod_eth_gateway
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
-- Table structure for table `admin_create_tx`
--

DROP TABLE IF EXISTS `admin_create_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_create_tx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `req_id` varchar(25) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `currency` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `version` int(11) NOT NULL,
  `raw_transaction` varchar(4096) CHARACTER SET latin1 NOT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `ext_properties` varchar(8192) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `kofo_settlement_create_tx_id_uindex` (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_settlement_id_type_version_uindex` (`req_id`,`type`,`version`,`currency`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_send_tx`
--

DROP TABLE IF EXISTS `admin_send_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_send_tx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `req_id` varchar(25) NOT NULL,
  `tx_id` varchar(128) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `raw_transaction` varchar(4096) NOT NULL,
  `gmt_create` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_send_tx_tx_id_uindex` (`tx_id`),
  UNIQUE KEY `tx_id_raw_transaction_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `tx_id_raw_transaction_id_uindex` (`id`),
  UNIQUE KEY `req_id` (`req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `pre_hash` varchar(100) DEFAULT NULL,
  `nonce` varchar(100) DEFAULT NULL,
  `sha3_uncles` varchar(100) DEFAULT NULL,
  `logs_bloom` varchar(1024) DEFAULT NULL,
  `transactions_root` varchar(100) DEFAULT NULL,
  `state_root` varchar(100) DEFAULT NULL,
  `receipts_root` varchar(100) DEFAULT NULL,
  `miner` varchar(100) DEFAULT NULL,
  `difficulty` varchar(100) DEFAULT NULL,
  `total_difficulty` varchar(100) DEFAULT NULL,
  `extra_data` varchar(2048) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `gas_limit` varchar(30) DEFAULT NULL,
  `gas_used` varchar(30) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uncles` varchar(512) DEFAULT NULL,
  `rlp_encoded` varchar(2048) DEFAULT NULL,
  `threshold` int(11) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `idx_block_hash` (`block_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144145 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_approval_event`
--

DROP TABLE IF EXISTS `erc20_approval_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_approval_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `nonce` bigint(20) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `spender` varchar(100) DEFAULT NULL,
  `amount` varchar(78) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(3) unsigned DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_approve_callback`
--

DROP TABLE IF EXISTS `erc20_approve_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_approve_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `chain` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(128) NOT NULL DEFAULT '',
  `token_address` varchar(128) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value` varchar(128) NOT NULL DEFAULT '',
  `owner` varchar(128) NOT NULL DEFAULT '',
  `spender` varchar(128) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `sender_index` (`owner`),
  KEY `receiver_index` (`spender`),
  KEY `tx_id_index` (`tx_hash`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_configuration`
--

DROP TABLE IF EXISTS `erc20_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_configuration` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `decimals` smallint(5) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `is_stacking` tinyint(1) NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `delete_reason` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `idx_address` (`address`) USING BTREE,
  UNIQUE KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_kofo_order`
--

DROP TABLE IF EXISTS `erc20_kofo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_kofo_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `state` int(4) unsigned NOT NULL,
  `approve_tx` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `approve_nonce` bigint(20) DEFAULT NULL,
  `lock_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `settlement_id` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `chain` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `currency` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `value` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `settlement_index` (`settlement_id`),
  UNIQUE KEY `biz_id_index` (`biz_id`),
  KEY `lock_id_index` (`lock_id`) USING BTREE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_lock_callback`
--

DROP TABLE IF EXISTS `erc20_lock_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_lock_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `chain` varchar(64) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `lock_id` varchar(128) NOT NULL DEFAULT '',
  `token` varchar(128) NOT NULL DEFAULT '',
  `token_address` varchar(128) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(128) NOT NULL DEFAULT '',
  `receiver` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `hvalue` varchar(128) NOT NULL DEFAULT '',
  `nlock_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `sender_index` (`sender`),
  KEY `receiver_index` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_refund_callback`
--

DROP TABLE IF EXISTS `erc20_refund_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_refund_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `chain` varchar(64) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `lock_id` varchar(128) NOT NULL DEFAULT '',
  `token` varchar(128) NOT NULL DEFAULT '',
  `token_address` varchar(128) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `lock_id_index` (`lock_id`),
  KEY `tx_id_index` (`tx_hash`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_transfer_event`
--

DROP TABLE IF EXISTS `erc20_transfer_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_transfer_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `amount` varchar(78) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2405669 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erc20_withdraw_callback`
--

DROP TABLE IF EXISTS `erc20_withdraw_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erc20_withdraw_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `biz_id` bigint(20) NOT NULL,
  `chain` varchar(64) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `lock_id` varchar(128) NOT NULL DEFAULT '',
  `token` varchar(128) NOT NULL DEFAULT '',
  `token_address` varchar(128) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `preimage` varchar(255) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `lock_id_index` (`lock_id`),
  KEY `tx_id_index` (`tx_hash`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eth_kofo_order`
--

DROP TABLE IF EXISTS `eth_kofo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eth_kofo_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `lock_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `settlement_id` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `chain` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `currency` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `value` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `state` int(4) unsigned NOT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settlement_index` (`settlement_id`),
  UNIQUE KEY `lock_id_index` (`lock_id`),
  UNIQUE KEY `biz_id_index` (`biz_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eth_lock_callback`
--

DROP TABLE IF EXISTS `eth_lock_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eth_lock_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `chain` varchar(64) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `lock_id` varchar(128) NOT NULL DEFAULT '',
  `currency` varchar(64) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(128) NOT NULL DEFAULT '',
  `receiver` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `hvalue` varchar(128) NOT NULL DEFAULT '',
  `nlock_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `is_confirm` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `lock_id_index` (`lock_id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `sender_index` (`sender`),
  KEY `receiver_index` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eth_refund_callback`
--

DROP TABLE IF EXISTS `eth_refund_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eth_refund_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `chain` varchar(64) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `lock_id` varchar(128) NOT NULL DEFAULT '',
  `currency` varchar(128) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `lock_id_index` (`lock_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eth_withdraw_callback`
--

DROP TABLE IF EXISTS `eth_withdraw_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eth_withdraw_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(128) NOT NULL DEFAULT '',
  `chain` varchar(64) NOT NULL DEFAULT '',
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `lock_id` varchar(128) NOT NULL DEFAULT '',
  `currency` varchar(128) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `preimage` varchar(255) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `lock_id_index` (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inner_transaction`
--

DROP TABLE IF EXISTS `inner_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inner_transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `amount` varchar(78) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_block_confirm_threshold`
--

DROP TABLE IF EXISTS `kofo_block_confirm_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_block_confirm_threshold` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) DEFAULT NULL,
  `settlement_id` varchar(25) NOT NULL DEFAULT '',
  `threshold` int(10) unsigned DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_block_confirm_threshold_biz_id` (`biz_id`),
  KEY `settlement_id` (`settlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_lock_event`
--

DROP TABLE IF EXISTS `kofo_lock_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_lock_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `token_address` varchar(100) DEFAULT NULL,
  `lock_id` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `amount` varchar(78) DEFAULT NULL,
  `hvalue` varchar(100) DEFAULT NULL,
  `timelock` varchar(100) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_lock_id` (`lock_id`) USING HASH,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_refund_event`
--

DROP TABLE IF EXISTS `kofo_refund_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_refund_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `token_address` varchar(100) DEFAULT NULL,
  `lock_id` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `amount` varchar(78) DEFAULT NULL,
  `timelock` int(11) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_lock_id` (`lock_id`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_settlement_create_tx`
--

DROP TABLE IF EXISTS `kofo_settlement_create_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_settlement_create_tx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(25) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `version` int(11) NOT NULL,
  `raw_transaction` varchar(4096) NOT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0',
  `ext_properties` varchar(8192) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `kofo_settlement_create_tx_id_uindex` (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_settlement_id_type_version_uindex` (`settlement_id`,`type`,`version`,`currency`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_settlement_send_tx`
--

DROP TABLE IF EXISTS `kofo_settlement_send_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_settlement_send_tx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `settlement_id` varchar(25) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `tx_id` varchar(128) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT '',
  `raw_transaction` varchar(4096) NOT NULL,
  `gmt_create` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_send_tx_tx_id_uindex` (`tx_id`),
  UNIQUE KEY `tx_id_raw_transaction_biz_id_uindex` (`biz_id`),
  UNIQUE KEY `tx_id_raw_transaction_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_transfer_send_tx`
--

DROP TABLE IF EXISTS `kofo_transfer_send_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_transfer_send_tx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_id` varchar(128) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `actual_receiver` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(78) NOT NULL DEFAULT '',
  `raw_transaction` varchar(4096) NOT NULL,
  `gmt_create` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_send_tx_tx_id_uindex` (`tx_id`),
  UNIQUE KEY `tx_id_raw_transaction_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kofo_withdraw_event`
--

DROP TABLE IF EXISTS `kofo_withdraw_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kofo_withdraw_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `token_address` varchar(100) DEFAULT NULL,
  `lock_id` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `amount` varchar(78) DEFAULT NULL,
  `timelock` int(11) DEFAULT NULL,
  `preimage` varchar(1024) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_lock_id` (`lock_id`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `latest_block_info`
--

DROP TABLE IF EXISTS `latest_block_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_block_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `latest_block_num` int(10) unsigned DEFAULT NULL,
  `node_latest_block_num` int(10) unsigned DEFAULT NULL,
  `analyzer_latest_block_num` int(10) unsigned DEFAULT NULL,
  `pending_tx_num` int(10) unsigned DEFAULT NULL,
  `gas_price` varchar(78) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `data` mediumtext NOT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147552 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_cancel_order_callback`
--

DROP TABLE IF EXISTS `stacking_cancel_order_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_cancel_order_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_cancel_order_event`
--

DROP TABLE IF EXISTS `stacking_cancel_order_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_cancel_order_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(100) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_hash` varchar(100) NOT NULL DEFAULT '',
  `block_height` int(10) unsigned NOT NULL,
  `receiver` varchar(100) NOT NULL DEFAULT '',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`tx_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_create_order_callback`
--

DROP TABLE IF EXISTS `stacking_create_order_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_create_order_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL,
  `value` varchar(128) NOT NULL,
  `currency` varchar(64) NOT NULL DEFAULT '',
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_create_order_event`
--

DROP TABLE IF EXISTS `stacking_create_order_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_create_order_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(100) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL,
  `token_address` varchar(100) NOT NULL DEFAULT '',
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_hash` varchar(100) NOT NULL DEFAULT '',
  `block_height` int(10) unsigned NOT NULL,
  `receiver` varchar(100) NOT NULL DEFAULT '',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`tx_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_execute_order_callback`
--

DROP TABLE IF EXISTS `stacking_execute_order_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_execute_order_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `receiver` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL,
  `currency` varchar(64) NOT NULL,
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_execute_order_event`
--

DROP TABLE IF EXISTS `stacking_execute_order_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_execute_order_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(100) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `receiver` varchar(100) NOT NULL,
  `value` varchar(128) NOT NULL DEFAULT '',
  `token_address` varchar(100) NOT NULL DEFAULT '',
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_hash` varchar(100) NOT NULL DEFAULT '',
  `block_height` int(10) unsigned NOT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL,
  `senderCopy` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`tx_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_height_balance`
--

DROP TABLE IF EXISTS `stacking_height_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_height_balance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `block_height` int(10) unsigned NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `balance` varchar(128) NOT NULL DEFAULT '',
  `currency` varchar(64) NOT NULL DEFAULT '',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `height` (`block_height`),
  KEY `address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_order`
--

DROP TABLE IF EXISTS `stacking_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `order_id` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `tx_id` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` int(4) NOT NULL,
  `state` int(4) NOT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settlement_index` (`order_id`),
  UNIQUE KEY `biz_id_index` (`biz_id`) 
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_recharge_callback`
--

DROP TABLE IF EXISTS `stacking_recharge_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_recharge_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `value` varchar(128) NOT NULL,
  `currency` varchar(64) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `block_timestamp` datetime NOT NULL,
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_transfer_callback`
--

DROP TABLE IF EXISTS `stacking_transfer_callback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_transfer_callback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(128) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `receiver` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL,
  `currency` varchar(64) NOT NULL,
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_height` bigint(20) unsigned NOT NULL DEFAULT '0',
  `block_hash` varchar(128) NOT NULL DEFAULT '',
  `block_timestamp` datetime DEFAULT NULL,
  `is_callback` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `resp_msg` varchar(512) NOT NULL DEFAULT '',
  `callback_count` int(9) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_transfer_event`
--

DROP TABLE IF EXISTS `stacking_transfer_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_transfer_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `tx_hash` varchar(100) NOT NULL DEFAULT '',
  `sender` varchar(100) NOT NULL DEFAULT '',
  `receiver` varchar(100) NOT NULL,
  `value` varchar(128) NOT NULL,
  `token_address` varchar(64) NOT NULL DEFAULT '',
  `message` varchar(2048) NOT NULL DEFAULT '',
  `block_hash` varchar(100) NOT NULL DEFAULT '',
  `block_height` int(10) unsigned NOT NULL,
  `block_timestamp` datetime DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) unsigned NOT NULL,
  `senderCopy` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`tx_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_tx_create`
--

DROP TABLE IF EXISTS `stacking_tx_create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_tx_create` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `order_id` varchar(128) NOT NULL DEFAULT '',
  `currency` varchar(64) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `message` varchar(2048) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `raw_transaction` varchar(4096) NOT NULL DEFAULT '',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0',
  `ext_properties` varchar(8192) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stacking_tx_send`
--

DROP TABLE IF EXISTS `stacking_tx_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stacking_tx_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `order_id` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `tx_id` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `message` varchar(2048) CHARACTER SET utf8 DEFAULT NULL,
  `raw_transaction` varchar(4096) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `gmt_create` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_send_tx_tx_id_uindex` (`tx_id`),
  UNIQUE KEY `tx_id_raw_transaction_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `nonce` varchar(100) DEFAULT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `value` varchar(78) DEFAULT NULL,
  `gas_price` varchar(78) DEFAULT NULL,
  `gas` varchar(78) DEFAULT NULL,
  `input_data` text,
  `creates` varchar(100) DEFAULT NULL,
  `public_key` varchar(100) DEFAULT NULL,
  `raw` varchar(1024) DEFAULT NULL,
  `r` varchar(100) NOT NULL,
  `s` varchar(100) DEFAULT NULL,
  `v` varchar(255) DEFAULT NULL,
  `tag` int(10) unsigned DEFAULT NULL,
  `status` char(5) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_sender_tag_deleted` (`sender`,`tag`,`is_deleted`) USING BTREE,
  KEY `idx_receiver_tag_deleted` (`receiver`,`tag`,`is_deleted`) USING BTREE,
  KEY `idx_txid` (`hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2442969 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_log`
--

DROP TABLE IF EXISTS `transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `log_index` int(11) DEFAULT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(11) DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `data` text,
  `type` varchar(30) DEFAULT NULL,
  `topics` varchar(512) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2428841 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_receipt`
--

DROP TABLE IF EXISTS `transaction_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_receipt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `transaction_hash` varchar(100) DEFAULT NULL,
  `transaction_index` int(11) DEFAULT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(11) DEFAULT NULL,
  `cumulative_gas_used` varchar(78) DEFAULT NULL,
  `gas_used` varchar(78) DEFAULT NULL,
  `contract_address` varchar(100) DEFAULT NULL,
  `root` varchar(100) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `statusOk` char(1) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `logs_bloom` varchar(1024) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_transaction_hash` (`transaction_hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE,
  KEY `idx_block_hash` (`block_hash`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2442969 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_user`
--

DROP TABLE IF EXISTS `wallet_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_user_transaction`
--

DROP TABLE IF EXISTS `wallet_user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_user_transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` bigint(20) NOT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `tag` int(10) unsigned DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(100) DEFAULT NULL,
  `value` varchar(78) DEFAULT NULL,
  `block_hash` varchar(100) DEFAULT NULL,
  `block_height` int(10) unsigned DEFAULT NULL,
  `gas_price` varchar(78) DEFAULT NULL,
  `gas` varchar(78) DEFAULT NULL,
  `nonce` varchar(100) DEFAULT NULL,
  `status` char(5) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_deleted` tinyint(1) DEFAULT NULL,
  `delete_reason` char(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kofo_settlement_create_tx_biz_id_uindex` (`biz_id`),
  KEY `idx_sender_tag_deleted` (`sender`,`is_deleted`) USING BTREE,
  KEY `idx_receiver_tag_deleted` (`receiver`,`is_deleted`) USING BTREE,
  KEY `idx_txid` (`hash`) USING BTREE,
  KEY `idx_block_height` (`block_height`) USING BTREE,
  KEY `idx_tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4;
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

-- Dump completed on 2020-03-25 15:01:04
