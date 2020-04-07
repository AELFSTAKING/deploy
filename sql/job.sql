-- MySQL dump 10.13  Distrib 5.7.25-28, for Linux (x86_64)
--
-- Host: localhost    Database: staking_prod_job
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
-- Table structure for table `job_execution_log`
--

DROP TABLE IF EXISTS `job_execution_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_execution_log` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `task_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `hostname` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) COLLATE utf8_bin NOT NULL,
  `failure_cause` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `complete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_JOB_EXECUTION_LOG_1` (`start_time`),
  KEY `IDX_job_execution_log_2` (`job_name`),
  KEY `IDX_job_execution_log_3` (`complete_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_status_trace_log`
--

DROP TABLE IF EXISTS `job_status_trace_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_status_trace_log` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `original_task_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `task_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `slave_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `source` varchar(50) COLLATE utf8_bin NOT NULL,
  `execution_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `sharding_item` varchar(100) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `message` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `creation_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TASK_ID_STATE_INDEX` (`task_id`,`state`),
  KEY `IDX_JOB_STATUS_TRACE_LOG_1` (`creation_time`),
  KEY `IDX_JOB_STATUS_TRACE_LOG_2` (`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_job_config_info`
--

DROP TABLE IF EXISTS `t_job_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_job_config_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `JOB_CLASS` varchar(500) COLLATE utf8_bin NOT NULL,
  `JOB_TYPE` varchar(20) COLLATE utf8_bin NOT NULL,
  `SHARDING_TOTAL_COUNT` int(11) DEFAULT '1',
  `SHARDING_ITEM_PARAMETERS` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `JOB_PARAMETER` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `CRON` varchar(50) COLLATE utf8_bin NOT NULL,
  `JOB_INIT_CLASS` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `FAIL_OVER` char(1) COLLATE utf8_bin DEFAULT '1',
  `MIS_FIRE` char(1) COLLATE utf8_bin DEFAULT '1',
  `IS_STREAM` char(1) COLLATE utf8_bin DEFAULT '0',
  `COMMAND_LINE` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `IS_MONITOR` char(1) COLLATE utf8_bin DEFAULT '0',
  `MONITOR_PORT` int(11) DEFAULT '-1',
  `MAX_TIME_DIFF_SECONDS` int(11) DEFAULT '-1',
  `RECONCILE_INTERVAL_MINUTES` int(11) DEFAULT '10',
  `JOB_SHARDING_STRATEGY_CLASS` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `EVENT_TRACE_RDB_DATASOURCE` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OVER_WRITER` char(1) COLLATE utf8_bin DEFAULT '1',
  `IS_DISABLED` char(1) COLLATE utf8_bin DEFAULT '0',
  `LISTENER_CLASS` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `DOMAIN` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTOR_SERVICE_HANDLER` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `GMT_CREATE` datetime(6) DEFAULT NULL,
  `GMT_MODIFIED` datetime(6) DEFAULT NULL,
  `IS_STOP` char(1) COLLATE utf8_bin DEFAULT '0',
  `JOB_EXCEPTION_HANDLER` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `NAMESPACE` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX_T_JOB_CONFIG_INFO_1` (`JOB_NAME`,`NAMESPACE`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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

-- Dump completed on 2020-03-25 15:02:19
