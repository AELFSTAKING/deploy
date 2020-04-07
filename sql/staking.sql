-- MySQL dump 10.13  Distrib 5.7.25-28, for Linux (x86_64)
--
-- Host: localhost    Database: staking_dex
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platform_chain` varchar(20) NOT NULL,
  `platform_address` varchar(128) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_platform_address` (`platform_address`) USING BTREE,
  KEY `idx_chain_addr` (`platform_chain`,`platform_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_register_message`
--

DROP TABLE IF EXISTS `address_register_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_register_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platform_chain` varchar(20) NOT NULL,
  `platform_address` varchar(128) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_platform_address` (`platform_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_version`
--

DROP TABLE IF EXISTS `app_client_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_seq_no` bigint(20) NOT NULL,
  `os` int(11) NOT NULL,
  `version` varchar(100) NOT NULL,
  `latest_flag` int(11) NOT NULL,
  `download_url` varchar(500) DEFAULT NULL,
  `upload_user` varchar(100) DEFAULT NULL,
  `app_code` int(100) DEFAULT '0',
  `market_source` int(11) DEFAULT '0',
  `summary` varchar(500) DEFAULT NULL,
  `force_update` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `release_time` datetime(3) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  `md5` varchar(255) DEFAULT NULL,
  `lang` varchar(100) NOT NULL DEFAULT 'zh-CN',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_client_seq_no` (`client_seq_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `balance_snapshot`
--

DROP TABLE IF EXISTS `balance_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_snapshot` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platform_chain` varchar(20) DEFAULT NULL,
  `platform_currency` varchar(20) DEFAULT NULL,
  `platform_address` varchar(128) DEFAULT NULL,
  `balance` decimal(65,30) DEFAULT NULL,
  `block_height` int(11) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chain_currency_addr_balance` (`platform_chain`,`platform_currency`,`platform_address`,`balance`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bind_address`
--

DROP TABLE IF EXISTS `bind_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bind_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platform_chain` varchar(20) DEFAULT NULL,
  `platform_address` varchar(128) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_currency_address` (`currency`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `biz_currency_introduction_info`
--

DROP TABLE IF EXISTS `biz_currency_introduction_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_currency_introduction_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seq_no` bigint(20) NOT NULL,
  `currency_code` varchar(16) NOT NULL DEFAULT '',
  `block_chain_address_search` varchar(256) NOT NULL DEFAULT '',
  `issue_date` datetime DEFAULT NULL,
  `issue_quantity` decimal(65,30) DEFAULT NULL,
  `circulate_quantity` decimal(65,30) DEFAULT NULL,
  `issue_price` varchar(256) DEFAULT NULL,
  `white_paper` varchar(512) DEFAULT NULL,
  `official_website` varchar(512) DEFAULT NULL,
  `block_chain_website` varchar(512) DEFAULT NULL,
  `currency_cn_introduction` varchar(2048) DEFAULT NULL,
  `currency_tw_introduction` varchar(2048) DEFAULT NULL,
  `currency_en_introduction` varchar(2048) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  `utc_delete` datetime(3) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  `image_file_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_seq_no` (`seq_no`) USING BTREE,
  KEY `idx_currency_code` (`currency_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_diff_id` bigint(20) DEFAULT NULL,
  `article_seq_no` bigint(20) NOT NULL,
  `main_type` int(11) NOT NULL,
  `sub_type` int(11) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `image_file_no` bigint(20) DEFAULT NULL,
  `lang` varchar(100) NOT NULL,
  `client` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `utc_approval` datetime(3) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_article_seq_no` (`article_seq_no`) USING BTREE,
  KEY `idx_main_sub_type` (`main_type`,`sub_type`) USING BTREE,
  KEY `idx_query_all_list` (`lang`,`client`,`status`,`delete_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_article_doc`
--

DROP TABLE IF EXISTS `cms_article_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_doc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_seq_no` bigint(20) NOT NULL,
  `article_no` bigint(20) NOT NULL,
  `content_type` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_article_no_type` (`article_no`,`content_type`) USING BTREE,
  UNIQUE KEY `uniq_doc_seq_no` (`doc_seq_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_attention`
--

DROP TABLE IF EXISTS `cms_attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_attention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attention_seq_no` bigint(20) NOT NULL,
  `attention_type` int(11) NOT NULL,
  `currency_code` varchar(100) DEFAULT NULL,
  `lang` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `update_seq_no` bigint(20) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_banner`
--

DROP TABLE IF EXISTS `cms_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banner` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `seq_no` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `lang` varchar(100) NOT NULL,
  `language_type` int(255) DEFAULT NULL,
  `language_name` varchar(50) DEFAULT NULL,
  `client_type` int(255) DEFAULT NULL,
  `image_file_id` bigint(20) DEFAULT NULL,
  `url` varchar(4096) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `utc_create` datetime(3) DEFAULT NULL,
  `utc_update` datetime(3) DEFAULT NULL,
  `delete_flag` int(255) DEFAULT '0',
  `show_order` int(11) DEFAULT NULL,
  `update_seq_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_banner_seq_no` (`seq_no`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_utc_update` (`utc_update`) USING BTREE,
  KEY `idx_language_name` (`language_name`) USING BTREE,
  KEY `idx_language_type` (`language_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `token_chain` varchar(20) DEFAULT NULL,
  `token_currency` varchar(20) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `icon32` varchar(512) DEFAULT NULL,
  `icon128` varchar(512) DEFAULT NULL,
  `min_amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `max_amount` decimal(65,30) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `convert_rate` decimal(5,2) DEFAULT '1.00',
  `status` tinyint(2) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deposit_no` bigint(20) unsigned DEFAULT NULL,
  `deposit_tx_id` varchar(128) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `to_address` varchar(256) DEFAULT NULL,
  `amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `convert_rate` decimal(5,2) DEFAULT '1.00',
  `convert_chain` varchar(20) DEFAULT NULL,
  `convert_currency` varchar(20) DEFAULT NULL,
  `convert_address` varchar(128) DEFAULT NULL,
  `convert_amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `deposit_confirm_time` datetime(6) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `rate` decimal(65,30) DEFAULT NULL,
  `power_conversion_rate` decimal(60,30) DEFAULT NULL,
  `compute_power` decimal(65,30) DEFAULT NULL,
  `cycle_no` bigint(20) unsigned DEFAULT NULL,
  `gmt_create` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_deposit_no` (`deposit_no`) USING BTREE,
  UNIQUE KEY `uniq_deposit_tx_id` (`deposit_tx_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_transfer`
--

DROP TABLE IF EXISTS `deposit_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_transfer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deposit_no` bigint(20) unsigned DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `sender` varchar(256) DEFAULT NULL,
  `recevier` varchar(256) DEFAULT NULL,
  `amount` decimal(65,30) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `raw_transaction` varchar(4096) DEFAULT NULL,
  `ext_properties` varchar(4096) DEFAULT NULL,
  `transfer_tx_id` varchar(128) DEFAULT NULL,
  `transfer_confirm_time` datetime(6) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_deposit_no` (`deposit_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_url_record`
--

DROP TABLE IF EXISTS `file_url_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_url_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_no` bigint(20) NOT NULL,
  `object_no` bigint(20) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `file_type` int(11) DEFAULT NULL,
  `file_url` varchar(128) NOT NULL,
  `extension_name` varchar(128) NOT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_user_no_picture_type` (`object_no`,`file_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `latest_reward_cycle_info`
--

DROP TABLE IF EXISTS `latest_reward_cycle_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_reward_cycle_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calc_type` tinyint(2) DEFAULT NULL,
  `reward_type` tinyint(2) DEFAULT NULL,
  `first_reward_cycle_no` bigint(20) unsigned DEFAULT NULL,
  `latest_reward_cycle_no` bigint(20) unsigned DEFAULT NULL,
  `first_start_time` datetime(6) DEFAULT NULL,
  `latest_end_time` datetime(6) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_calc_type_reward_type` (`calc_type`,`reward_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `limit_symbol_config`
--

DROP TABLE IF EXISTS `limit_symbol_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limit_symbol_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_code` varchar(64) DEFAULT NULL,
  `group_name` varchar(128) DEFAULT NULL,
  `symbol` varchar(20) DEFAULT NULL,
  `quantity_min` decimal(65,30) DEFAULT NULL,
  `quantity_max` decimal(65,30) DEFAULT NULL,
  `amount_min` decimal(65,30) DEFAULT NULL,
  `amount_max` decimal(65,30) DEFAULT NULL,
  `trade_status` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `utc_create` datetime DEFAULT NULL,
  `utc_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_group_code` (`group_code`,`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `match_symbol_lock`
--

DROP TABLE IF EXISTS `match_symbol_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_symbol_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(32) NOT NULL,
  `lock_id` varchar(64) DEFAULT NULL,
  `ip_address` varchar(32) DEFAULT NULL,
  `expired_time` bigint(20) unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_symbol` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_cancel_message`
--

DROP TABLE IF EXISTS `order_cancel_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_cancel_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) unsigned DEFAULT NULL,
  `symbol` varchar(32) NOT NULL DEFAULT '',
  `tx_id` varchar(128) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `counter_chain` varchar(20) DEFAULT NULL,
  `counter_currency` varchar(20) DEFAULT NULL,
  `counter_chain_address` varchar(256) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `symbol` varchar(32) NOT NULL DEFAULT '',
  `action` int(10) unsigned NOT NULL DEFAULT '1',
  `order_type` int(10) unsigned NOT NULL DEFAULT '1',
  `price_limit` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `price_average` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `quantity` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `quantity_remaining` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `amount` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `amount_remaining` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `fee_currency` varchar(32) DEFAULT NULL,
  `fee` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `taker_fee_rate` decimal(65,30) unsigned DEFAULT '0.000000000000000000000000000000',
  `maker_fee_rate` decimal(65,30) unsigned DEFAULT '0.000000000000000000000000000000',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `from_client_type` int(255) DEFAULT NULL,
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  `product_code` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  `tx_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order_no` (`order_no`),
  KEY `idx_utc_create` (`utc_create`),
  KEY `idx_account` (`symbol`,`status`,`state`),
  KEY `idx_match_fat` (`symbol`,`status`,`action`,`order_type`,`state`,`price_limit`,`quantity_remaining`,`amount_remaining`,`utc_create`,`order_no`),
  KEY `idx_get_new` (`symbol`,`status`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_symbol`
--

DROP TABLE IF EXISTS `order_symbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_symbol` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(32) NOT NULL DEFAULT '',
  `product_code` varchar(50) NOT NULL,
  `system_product_code` varchar(50) DEFAULT NULL,
  `currency_code` varchar(50) NOT NULL,
  `deviation` double NOT NULL DEFAULT '1',
  `steps` varchar(255) DEFAULT NULL,
  `amount_scale` int(11) NOT NULL,
  `quantity_scale` int(11) NOT NULL,
  `price_scale` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `trade_status` int(10) DEFAULT '0',
  `show_status` int(10) DEFAULT '0',
  `order_factor` int(10) unsigned DEFAULT '0',
  `
  `del_flag` int(10) DEFAULT '0',
  `if_hot` int(10) DEFAULT NULL,
  `dig_flag` int(2) DEFAULT '0',
  `utc_show` datetime(3) DEFAULT NULL,
  `utc_create` datetime(3) DEFAULT NULL,
  `utc_update` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_symbol` (`symbol`),
  UNIQUE KEY `uniq_product_currency_code` (`product_code`,`currency_code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_cycle`
--

DROP TABLE IF EXISTS `reward_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_cycle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cycle_no` bigint(20) unsigned DEFAULT NULL,
  `reward_type` tinyint(2) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `cycle_minutes` int(11) DEFAULT NULL,
  `block_height` int(11) DEFAULT NULL,
  `amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `remain_amount` decimal(65,30) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `pay_cycle_no` bigint(20) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_cycle_no_reward_type` (`cycle_no`,`reward_type`),
  UNIQUE KEY `uniq_reward_type_start_time` (`reward_type`,`start_time`) USING BTREE,
  UNIQUE KEY `uniq_reward_type_end_time` (`reward_type`,`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12619 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_cycle_balance_power`
--

DROP TABLE IF EXISTS `reward_cycle_balance_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_cycle_balance_power` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cycle_no` bigint(20) unsigned DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `balance` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `rate` decimal(65,30) DEFAULT NULL,
  `power_conversion_rate` decimal(60,30) DEFAULT NULL,
  `compute_power` decimal(65,30) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_cycle_no_currency_address` (`cycle_no`,`currency`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62633 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_cycle_deposit_power`
--

DROP TABLE IF EXISTS `reward_cycle_deposit_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_cycle_deposit_power` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cycle_no` bigint(20) unsigned DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `deposit_amount` decimal(65,30) DEFAULT NULL,
  `compute_power` decimal(65,30) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_cycle_no_addr_currency` (`cycle_no`,`address`,`currency`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_cycle_reward_total`
--

DROP TABLE IF EXISTS `reward_cycle_reward_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_cycle_reward_total` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cycle_no` bigint(20) unsigned DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `amount` decimal(65,30) DEFAULT NULL,
  `computer_power` decimal(65,30) DEFAULT NULL,
  `reward_type` tinyint(2) DEFAULT NULL,
  `reward_chain` varchar(20) DEFAULT NULL,
  `reward_currency` varchar(20) DEFAULT NULL,
  `reward_amount` decimal(60,30) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `pay_cycle_no` bigint(20) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_cycle_no_addr_currency_type` (`cycle_no`,`address`,`currency`,`reward_type`) USING BTREE,
  KEY `idx_address` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41759 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_pay_cycle`
--

DROP TABLE IF EXISTS `reward_pay_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_pay_cycle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pay_cycle_no` bigint(20) unsigned DEFAULT NULL,
  `reward_type` tinyint(2) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_transfer_cycle_no` (`pay_cycle_no`) USING BTREE,
  KEY `uniq_start_time_end_time` (`start_time`,`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_pay_reward_total`
--

DROP TABLE IF EXISTS `reward_pay_reward_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_pay_reward_total` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pay_cycle_no` bigint(20) unsigned DEFAULT NULL,
  `reward_type` tinyint(2) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `sender` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `amount` decimal(65,30) DEFAULT NULL,
  `total_computer_power` decimal(65,30) DEFAULT NULL,
  `reward_chain` varchar(20) DEFAULT NULL,
  `reward_currency` varchar(20) DEFAULT NULL,
  `reward_amount` decimal(60,30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `transfer_tx_id` varchar(128) DEFAULT NULL,
  `transfer_no` bigint(20) unsigned DEFAULT NULL,
  `transfer_confirm_time` datetime(6) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_no_type_address_currency` (`pay_cycle_no`,`reward_type`,`address`,`currency`) USING BTREE,
  KEY `idx_pay_cycle_no_address` (`pay_cycle_no`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_pool`
--

DROP TABLE IF EXISTS `reward_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_pool` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reward_type` tinyint(2) DEFAULT NULL,
  `pool_total_amount` decimal(60,30) DEFAULT '0.000000000000000000000000000000',
  `latest_available_amount` decimal(60,30) DEFAULT '0.000000000000000000000000000000',
  `latest_cycle_no` bigint(20) unsigned DEFAULT NULL,
  `latest_end_time` datetime(6) DEFAULT NULL,
  `cycle_times` int(11) DEFAULT '0',
  `status` tinyint(2) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_reward_type` (`reward_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_pool_history`
--

DROP TABLE IF EXISTS `reward_pool_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_pool_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reward_type` tinyint(2) DEFAULT NULL,
  `before_pool_total_amount` decimal(60,30) DEFAULT '0.000000000000000000000000000000',
  `after_pool_total_amount` decimal(60,30) DEFAULT '0.000000000000000000000000000000',
  `before_latest_available_amount` decimal(60,30) DEFAULT '0.000000000000000000000000000000',
  `after_latest_available_amount` decimal(60,30) DEFAULT '0.000000000000000000000000000000',
  `latest_cycle_no` bigint(20) unsigned DEFAULT NULL,
  `latest_end_time` datetime(6) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_reward_type_end_time` (`reward_type`,`latest_end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6310 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reward_rule`
--

DROP TABLE IF EXISTS `reward_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rule_no` bigint(20) unsigned DEFAULT NULL,
  `reward_type` tinyint(2) DEFAULT NULL,
  `chain` varchar(20) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT '0.00',
  `min_amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `max_amount` decimal(65,30) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `end_date` datetime(6) DEFAULT NULL,
  `reward_cycle_minuts` int(11) DEFAULT NULL,
  `reward_pay_cycle_minuts` int(11) DEFAULT NULL,
  `start` tinyint(1) DEFAULT '1',
  `currency_publish_time` datetime(6) DEFAULT NULL,
  `status` int(10) DEFAULT '0',
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_type` (`reward_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistic_record`
--

DROP TABLE IF EXISTS `statistic_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistic_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chain` varchar(30) DEFAULT NULL,
  `currency` varchar(30) DEFAULT NULL,
  `deposit_amount` decimal(60,30) DEFAULT NULL,
  `deposite_all_amount` decimal(60,30) DEFAULT NULL,
  `withdraw_amount` decimal(60,30) DEFAULT NULL,
  `withdraw_all_amount` decimal(60,30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `order_all_num` int(11) DEFAULT NULL,
  `transaction_volume` decimal(60,30) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_deal`
--

DROP TABLE IF EXISTS `trade_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deal_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `address` varchar(256) NOT NULL DEFAULT '0',
  `chain` varchar(32) DEFAULT NULL,
  `order_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `order_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `counter_order_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `counter_order_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `symbol` varchar(32) NOT NULL DEFAULT '',
  `action` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `match_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `price` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `quantity` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `utc_deal` datetime(3) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fee_currency` varchar(50) DEFAULT NULL,
  `fee_amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `fee_rate` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `user_no` bigint(20) DEFAULT '0',
  `product_code` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_deal_no_match_type` (`deal_no`,`match_type`),
  KEY `idx_address` (`address`),
  KEY `idx_counter_order_no` (`counter_order_no`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_utc_deal` (`utc_deal`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_deal_message`
--

DROP TABLE IF EXISTS `trade_deal_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_deal_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `symbol` varchar(20) NOT NULL DEFAULT '',
  `maker_order_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taker_order_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '1',
  `price` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `quantity` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `utc_create` datetime(3) NOT NULL,
  `utc_update` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_type_maker_order_no_taker_order_no` (`type`,`maker_order_no`,`taker_order_no`),
  KEY `idx_maker_order_no` (`maker_order_no`),
  KEY `idx_symbol_status` (`symbol`,`status`),
  KEY `idx_taker_order_no` (`taker_order_no`),
  KEY `idx_utc_update` (`utc_update`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_deal_settlement_record`
--

DROP TABLE IF EXISTS `trade_deal_settlement_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_deal_settlement_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `settlement_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deal_no` bigint(20) DEFAULT NULL,
  `order_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `address` varchar(256) NOT NULL DEFAULT '0',
  `chain` varchar(32) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `amount` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `product_code` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  `tx_id` varchar(256) DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_settlement_no` (`settlement_no`),
  KEY `idx_address` (`address`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_deal_address` (`order_no`,`address`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_quotation`
--

DROP TABLE IF EXISTS `trade_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_quotation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deal_no` bigint(20) unsigned NOT NULL DEFAULT '0',
  `symbol` varchar(32) NOT NULL DEFAULT '',
  `price` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `quantity` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `action` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `utc_deal` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_deal_no` (`deal_no`),
  KEY `idx_symbol_time` (`symbol`,`utc_deal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_quotation_aggr`
--

DROP TABLE IF EXISTS `trade_quotation_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_quotation_aggr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(32) NOT NULL DEFAULT '',
  `first` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `last` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `max` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `min` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `avg` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `quantity` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  `time` datetime(3) NOT NULL,
  `range` int(11) unsigned NOT NULL DEFAULT '1',
  `minute_avg` decimal(65,30) unsigned NOT NULL DEFAULT '0.000000000000000000000000000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_range_symbol_time` (`range`,`symbol`,`time`),
  KEY `idx_symbol_time` (`symbol`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=71899 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdraw`
--

DROP TABLE IF EXISTS `withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraw` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `withdraw_no` bigint(20) unsigned NOT NULL,
  `taker_kofo_id` varchar(50) DEFAULT NULL,
  `taker_chain` varchar(20) DEFAULT NULL,
  `taker_currency` varchar(20) DEFAULT NULL,
  `taker_address` varchar(128) DEFAULT NULL,
  `taker_counter_address` varchar(128) DEFAULT NULL,
  `taker_amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `taker_fee` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `taker_signature` varchar(256) DEFAULT NULL,
  `maker_chain` varchar(20) DEFAULT NULL,
  `maker_currency` varchar(20) DEFAULT NULL,
  `maker_amount` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `maker_fee` decimal(65,30) DEFAULT '0.000000000000000000000000000000',
  `status` tinyint(2) DEFAULT NULL,
  `withdraw_tx_id` varchar(128) DEFAULT NULL,
  `settlement_id` varchar(25) DEFAULT NULL,
  `settlement_response` text,
  `gmt_create` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_withdraw_no` (`withdraw_no`) USING BTREE,
  UNIQUE KEY `uniq_withdraw_tx_id` (`withdraw_tx_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
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

-- Dump completed on 2020-03-25 15:01:52
