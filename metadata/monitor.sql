-- MySQL dump 10.13  Distrib 5.6.16, for Linux (x86_64)
--
-- Host: 192.168.210.182    Database: monitor
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `SUP_MON_DB_SQL`
--

DROP TABLE IF EXISTS `SUP_MON_DB_SQL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_DB_SQL` (
  `ERROR_CODE` varchar(100) NOT NULL DEFAULT '',
  `driver_class_name` varchar(100) DEFAULT NULL,
  `db_url` varchar(200) DEFAULT NULL,
  `db_username` varchar(100) DEFAULT NULL,
  `db_password` varchar(100) DEFAULT NULL,
  `TYPE` varchar(100) DEFAULT NULL,
  `MONITOR_CONTENT` varchar(100) DEFAULT NULL,
  `SQL1` varchar(500) DEFAULT NULL,
  `COMPAREPARAM` varchar(500) DEFAULT NULL,
  `WARN_INTERVAL` int(11) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `PHONES` varchar(500) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ERROR_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_DB_SQL`
--

LOCK TABLES `SUP_MON_DB_SQL` WRITE;
/*!40000 ALTER TABLE `SUP_MON_DB_SQL` DISABLE KEYS */;
INSERT INTO `SUP_MON_DB_SQL` VALUES ('XXT_MMS_GW_001','com.mysql.jdbc.Driver','jdbc:mysql://192.168.210.183:3306/mms?autoReconnect=true&useUnicode=true&characterEncoding=GBK','root','jU3H8e3^d','MMS','900','select count(1) from CXDest where csmid is null','<=',5,'161彩信网关积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('HBXXT_MMS_GW_001','com.mysql.jdbc.Driver','jdbc:mysql://211.137.75.225/sms2?autoReconnect=true','hbdxsms','hb&sMs$30','MMS','900','SELECT COUNT(1) FROM tbDest WHERE csmid IS NULL','<=',5,'湖北短信积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1);
/*!40000 ALTER TABLE `SUP_MON_DB_SQL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_MON_MQ`
--

DROP TABLE IF EXISTS `SUP_MON_MQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_MQ` (
  `ERROR_CODE` varchar(100) NOT NULL DEFAULT '',
  `ACCOUNT` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `HOST` varchar(100) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `MONITOR_CONTENT` varchar(100) DEFAULT NULL,
  `QUEUE_NAMES` varchar(500) DEFAULT NULL,
  `COMPAREPARAM` varchar(500) DEFAULT NULL,
  `WARN_INTERVAL` int(11) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `REMARK` varchar(1000) DEFAULT NULL,
  `PHONES` varchar(500) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ERROR_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_MQ`
--

LOCK TABLES `SUP_MON_MQ` WRITE;
/*!40000 ALTER TABLE `SUP_MON_MQ` DISABLE KEYS */;
INSERT INTO `SUP_MON_MQ` VALUES ('XXT_MQ_179_101','guest','IIx82ndd','192.168.210.179',5672,'1000','sms-cmpp-061,sms-cmpp-827,sms-upstream-loadQueue,sms-fps-kq-group,sms-fps-group,sms-upstream-loadQueue_short,sms-free-group,sms-free-group-open,sms-mobile-group,sms-msg-group,sms-free-group-open-transfer','<',5,'179积压>=1000',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_MQ_181_101','guest','IIx82ndd','192.168.210.181',5672,'1000','sms-cmpp-061,sms-cmpp-827,sms-upstream-loadQueue,sms-upstream-loadQueue_short','<',5,'181积压>=1000',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1);
/*!40000 ALTER TABLE `SUP_MON_MQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_MON_REDIS`
--

DROP TABLE IF EXISTS `SUP_MON_REDIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_REDIS` (
  `ERROR_CODE` varchar(100) NOT NULL DEFAULT '',
  `TYPE` varchar(100) DEFAULT NULL,
  `MONITOR_CONTENT` varchar(100) DEFAULT NULL,
  `MONITOR_KEY` varchar(500) DEFAULT NULL,
  `HOST` varchar(500) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `PWD` varchar(500) DEFAULT NULL,
  `CONN_TIME_OUT` int(11) DEFAULT NULL,
  `COMPAREPARAM` varchar(500) DEFAULT NULL,
  `WARN_INTERVAL` int(11) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `PHONES` varchar(500) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ERROR_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_REDIS`
--

LOCK TABLES `SUP_MON_REDIS` WRITE;
/*!40000 ALTER TABLE `SUP_MON_REDIS` DISABLE KEYS */;
INSERT INTO `SUP_MON_REDIS` VALUES ('XXT_REDIS_82_101','redis','1','sup_monitor','192.168.210.182',6379,NULL,5000,'=',5,'182redis异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_REDIS_83_101','redis','1','sup_monitor','192.168.210.183',6379,NULL,5000,'=',5,'183redis异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_REDIS_84_101','redis','1','sup_monitor','192.168.210.184',6379,NULL,5000,'=',5,'184redis异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1);
/*!40000 ALTER TABLE `SUP_MON_REDIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_MON_RESTART`
--

DROP TABLE IF EXISTS `SUP_MON_RESTART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_RESTART` (
  `app_name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `is_auto_restart` int(11) DEFAULT NULL,
  `is_fault` int(11) DEFAULT NULL,
  `command` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fault_count_to_restart` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `warn_interval` int(11) DEFAULT NULL,
  `warn_msg` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `phones` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `lastRestartDate` date DEFAULT NULL,
  `server_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`app_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_RESTART`
--

LOCK TABLES `SUP_MON_RESTART` WRITE;
/*!40000 ALTER TABLE `SUP_MON_RESTART` DISABLE KEYS */;
INSERT INTO `SUP_MON_RESTART` VALUES ('XXT_WEB2_147',1,0,'ls','2',10,'XXT2_147_restart',NULL,'15989058634,13512719456',NULL,'1'),('XXT_WEB2_148',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('XXT_WEB2_149',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('XXT_WEB2_150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('XXT_WEB2_151',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `SUP_MON_RESTART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_MON_SCRIPT`
--

DROP TABLE IF EXISTS `SUP_MON_SCRIPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_SCRIPT` (
  `ERROR_CODE` varchar(100) NOT NULL DEFAULT '',
  `TYPE` varchar(100) DEFAULT NULL,
  `MONITOR_CONTENT` varchar(100) DEFAULT NULL,
  `SCRIPT` varchar(500) DEFAULT NULL,
  `COMPAREPARAM` varchar(500) DEFAULT NULL,
  `WARN_INTERVAL` int(11) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `PHONES` varchar(500) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ERROR_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_SCRIPT`
--

LOCK TABLES `SUP_MON_SCRIPT` WRITE;
/*!40000 ALTER TABLE `SUP_MON_SCRIPT` DISABLE KEYS */;
INSERT INTO `SUP_MON_SCRIPT` VALUES ('XXT_CMPP_137_101','cmpp','0','ssh 192.168.210.186 ps aux | grep cmpp.Main | wc -l','=',10,'186cmpp无pid',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DB_57_101','db','50','ssh 192.168.205.57 uptime | awk -F\",\" \'{print $(NF-1)}\' | awk -F\".\" \'{print $1}\'','<',10,'DB1负载>50',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_DB_58_101','db','50','ssh 192.168.205.58 uptime | awk -F\",\" \'{print $(NF-1)}\' | awk -F\".\" \'{print $1}\'','<',10,'DB2负载>50',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_DISK_147_101','disk','85','ssh 192.168.210.147 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'147disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_148_101','disk','85','ssh 192.168.210.148 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'148disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_149_101','disk','85','ssh 192.168.210.149 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'149disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_150_101','disk','85','ssh 192.168.210.150 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'150disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_151_101','disk','85','ssh 192.168.210.151 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'151disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_152_101','disk','85','ssh 192.168.210.152 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'152disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_153_101','disk','85','ssh 192.168.210.153 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'153disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_154_101','disk','85','ssh 192.168.210.154 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'154disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_155_101','disk','85','ssh 192.168.210.155 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'155disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_156_101','disk','85','ssh 192.168.210.156 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'156disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_157_101','disk','85','ssh 192.168.210.157 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'157disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_158_101','disk','85','ssh 192.168.210.158 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'158disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_159_101','disk','85','ssh 192.168.210.159 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'159disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_160_101','disk','85','ssh 192.168.210.160 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'160disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_161_101','disk','85','ssh 192.168.210.161 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'161disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_162_101','disk','85','ssh 192.168.210.162 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'162disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_163_101','disk','85','ssh 192.168.210.163 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'163disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_164_101','disk','85','ssh 192.168.210.164 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'164disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_165_101','disk','85','ssh 192.168.210.165 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'165disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_166_101','disk','85','ssh 192.168.210.166 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'166disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_167_101','disk','85','ssh 192.168.210.167 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'167disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_168_101','disk','85','ssh 192.168.210.168 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'168disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_169_101','disk','85','ssh 192.168.210.169 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'169disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_179_101','disk','85','ssh 192.168.210.179 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'179disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_180_101','disk','85','ssh 192.168.210.180 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'180disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_181_101','disk','85','ssh 192.168.210.181 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'181disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_182_101','disk','85','ssh 192.168.210.182 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'182disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_183_101','disk','85','ssh 192.168.210.183 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'183disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_184_101','disk','85','ssh 192.168.210.184 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'184disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_185_101','disk','85','ssh 192.168.210.185 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'185disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_186_101','disk','85','ssh 192.168.210.186 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'186disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_187_101','disk','85','ssh 192.168.210.187 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'187disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_188_101','disk','85','ssh 192.168.210.188 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'188disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_189_101','disk','85','ssh 192.168.210.189 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'189disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_190_101','disk','85','ssh 192.168.210.190 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'190disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_191_101','disk','85','ssh 192.168.210.191 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'191disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_192_101','disk','85','ssh 192.168.210.192 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'192disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_193_101','disk','85','ssh 192.168.210.193 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'193disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_194_101','disk','85','ssh 192.168.210.194 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'194disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_195_101','disk','85','ssh 192.168.210.195 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'195disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_196_101','disk','85','ssh 192.168.210.196 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'196disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_197_101','disk','85','ssh 192.168.210.197 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'197disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_170_101','disk','85','ssh 192.168.210.170 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'170disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_70_101','disk','85','ssh 192.168.210.70 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'70disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_71_101','disk','85','ssh 192.168.210.71 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'71disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_72_101','disk','85','ssh 192.168.210.72 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'72disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_73_101','disk','85','ssh 192.168.210.73 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'73disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_74_101','disk','85','ssh 192.168.210.74 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'74disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_75_101','disk','85','ssh 192.168.210.75 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'75disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_76_101','disk','85','ssh 192.168.210.76 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'76disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_77_101','disk','85','ssh 192.168.210.77 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'77disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_DISK_78_101','disk','85','ssh 192.168.210.78 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'78disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_DISK_79_101','disk','85','ssh 192.168.210.79 df -h | awk -F\" \" \'{ if(NR>1) print $5}\' | grep -E \'%\' | sort | tail -1 | sed s/%//','<',30,'79disk',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',-1),('XXT_FPS_155_201','fps','0','ssh 192.168.210.155 tail -500 /data/fpssocket_new/log/mainClass.log | grep SQLException | wc -l','=',5,'155fps SQLException',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_FPS_157_201','fps','0','ssh 192.168.210.157 tail -500 /data/fpssocket_new/log/mainClass.log | grep SQLException | wc -l','=',5,'157fps SQLException',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_FPS_158_201','fps','0','ssh 192.168.210.158 tail -500 /data/fpssocket_new/log/mainClass.log | grep SQLException | wc -l','=',5,'158fps SQLException',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_FPS_159_201','fps','0','ssh 192.168.210.159 tail -500 /data/fpssocket_new/log/mainClass.log | grep SQLException | wc -l','=',5,'159fps SQLException',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_FPS_160_201','fps','0','ssh 192.168.210.160 tail -500 /data/fpssocket_new/log/mainClass.log | grep SQLException | wc -l','=',5,'160fps SQLException',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1);
/*!40000 ALTER TABLE `SUP_MON_SCRIPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_MON_SQL`
--

DROP TABLE IF EXISTS `SUP_MON_SQL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_SQL` (
  `ERROR_CODE` varchar(100) NOT NULL DEFAULT '',
  `TYPE` varchar(100) DEFAULT NULL,
  `MONITOR_CONTENT` varchar(100) DEFAULT NULL,
  `SQL1` varchar(500) DEFAULT NULL,
  `COMPAREPARAM` varchar(500) DEFAULT NULL,
  `WARN_INTERVAL` int(11) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `PHONES` varchar(500) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ERROR_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_SQL`
--

LOCK TABLES `SUP_MON_SQL` WRITE;
/*!40000 ALTER TABLE `SUP_MON_SQL` DISABLE KEYS */;
INSERT INTO `SUP_MON_SQL` VALUES ('XXT_MQ_TEST_101','test','2','select 1 from dual','=',30,'WEBOK',NULL,'15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SMS_101','groupsenduni','1000','select count(1) from dx_groupsend_uni where send_over = 0  and create_time+10/24/60<sysdate and area_abb<>\'bs\' and OBJECT_MOBILE is not null','<=',5,'groupsenduni积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SMS_001','groupsend','1000','select count(1) from dx_groupsend where  object_mobile is not null and (send_time is null or send_time <sysdate) and to_char(create_time,\'yyyy-mm-dd\')=to_char(sysdate,\'yyyy-mm-dd\')  and send_over=0 and create_time+10/24/60<sysdate','<=',5,'groupsend积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_33E9_001','33E9','1000','select count(1) from esk.sms_mt_task ','<=',5,'sms_mt_task积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_FPS_001','FPS','3000','SELECT COUNT(1) FROM fps_phoneinfo WHERE last_conn_ok_time > SYSDATE - 10 / (24 * 60)','>',5,'云FPS连接数',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_33E9_002','33E9','1000','select count(1) from esk.sms_mt','<=',5,'sms_mt积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0),('XXT_IMP_TASK','imptask','10','select count(1) from imp_task_queue where (status=\'NEW\' or status=\'DEALING\') and  create_time>sysdate-5/24','<',5,'imptask积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SCHEDULE_SMS','sms','200','select count(1) from msgTaskMain where state=1 and flag=1 and (sendtime is null or sendtime+10/24/60<=sysdate)','<',5,'定时短信积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SGIP','SGIP','200','select count(1) from sgip_to_submit@dbsms where create_time+10/24/60<sysdate and status<>\'ERROR\'','<=',5,'sgip积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_ISAG','ISAG','200','select count(1) from ISAG_TO_SUBMIT@dbsms where create_time+10/24/60<sysdate and status<>\'ERROR\'','<=',5,'isag积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SGIP_ZD','SGIP_ZD','200','select count(1) from SGIP_TO_SUBMIT_ZD@dbsms where create_time+10/24/60<sysdate','<=',5,'sgip_zd71积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_UNIDEAL','UNIDEAL','200','select count(1) from ISMP_RELATION_UPDATE@dbsms','<=',5,'unidealer160积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SMGP_ZD','SMGP_ZD','200','select  count(1) from smgp_to_submit_zd@dbsms where status=\'NEW\' and create_time+10/24/60<sysdate','<=',5,'smgp_zd71积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SMS_GS','SMS_GS','1000','SELECT count(1) cnt  FROM mms_task   WHERE     (state = 0 OR state = 1)    AND resendnum < 3  AND start_time <= SYSDATE  AND (    sendTimeMin < TO_NUMBER (SYSDATE - TO_DATE (TO_CHAR (SYSDATE, \'YYYY-MM-DD\'), \'YYYY-MM-DD\')) * 1440  AND sendTimeMax >  TO_NUMBER (SYSDATE - TO_DATE (TO_CHAR (SYSDATE, \'YYYY-MM-DD\'),\'YYYY-MM-DD\')) * 1440)','<=',5,'彩信定时任务152积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_SCHEDULE','SMS_SCHEDULE','100','select count(1) from dx_time_main where send_time+10/24/60<sysdate and state=1','<=',5,'前台定时短信187积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('XXT_EMAIL','SMS_EMAIL','1000','select count(1) from Unitplatform_Mail','<=',30,'139邮箱积压162',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('ADC_REQ','ADC_REQ','100','select count(1) from adc_member_order_request where to_char(create_time,\'yyyymmdd\')=to_char(sysdate,\'yyyymmdd\')','>=',30,'adc_member_order_request',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('HZ_DATA_SYNC','HZ_DATA_SYNC','1','select count(1) from HZ_SYN_DATA_HIS where TO_CHAR(\"CREATE_DATE\",\'yyyy-mm-dd\')=\'2015-09-21\' ','>',5,'HZ同步147',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('SZ_SYN','SZ_SYN','50','select count(1) from sz_package_log where  SYNC_STATUS= 2 or   SYNC_STATUS is null','<',5,'SZ_DataSender_165',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('MMS_GS','MMS_GS','10','select count(1) from mms_task where state=0 and start_time <sysdate','<',5,'MMS_GS_152',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('SyncData','syncData','50','select count(1) from Sms_Revert_Toht where IS_DEAL=0','<',30,'同步课堂164积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1),('upstream','upstream','10','SELECT COUNT (1) FROM DX_REVERTSMS_NEW WHERE  send_over = 0 AND ALREADY = total AND TO_CHAR (dt, \'yyyymmdd\') = TO_CHAR (SYSDATE, \'yyyymmdd\')','<',5,'158上行短信积压',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1);
/*!40000 ALTER TABLE `SUP_MON_SQL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_MON_URL`
--

DROP TABLE IF EXISTS `SUP_MON_URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_MON_URL` (
  `ERROR_CODE` varchar(100) DEFAULT NULL,
  `TYPE` varchar(100) DEFAULT NULL,
  `MONITOR_CONTENT` varchar(100) DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  `COMPAREPARAM` varchar(500) DEFAULT NULL,
  `WARN_INTERVAL` int(11) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `REMARK` varchar(1000) DEFAULT NULL,
  `PHONES` varchar(500) DEFAULT NULL,
  `ENABLE` int(11) DEFAULT NULL,
  `conn_time_out` int(11) DEFAULT NULL,
  `req_type` varchar(20) DEFAULT NULL,
  `is_check_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_MON_URL`
--

LOCK TABLES `SUP_MON_URL` WRITE;
/*!40000 ALTER TABLE `SUP_MON_URL` DISABLE KEYS */;
INSERT INTO `SUP_MON_URL` VALUES ('XXT_WEB3_CURR','xxt3','OK','http://2012.edu.gd.chinamobile.com/servercheck.do','=',5,'现网新版异常',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,5000,NULL,NULL),('XXT_WEB2_147','xxt2','OK','http://192.168.210.147:8803/servercheck.do?area=xxt&show=chk&socketNum=0&attNum=0&smsNum=0','=',5,'2期147异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,5000,NULL,NULL),('XXT_WEB2_148','xxt2','OK','http://192.168.210.148:8803/servercheck.do?area=xxt&show=chk&socketNum=0&attNum=0&smsNum=0','=',5,'2期148异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,5000,NULL,NULL),('XXT_WEB3_147','xxt3','OK','http://192.168.210.147:8801/servercheck.do','=',5,'新版147异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,5000,NULL,NULL),('XXT_WEB3_148','xxt3','OK','http://192.168.210.148:8801/servercheck.do','=',5,'新版148异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,5000,NULL,NULL),('XXT_OPEN_CURR','xxtOpen','200','http://218.204.254.98:18081/services/eduSOAP?wsdl','=',5,'xxtOpen',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,2000,'GET',1),('XXT_OPEN_167a','xxtOpen','200','http://1.1.10.167:8080/services/eduSOAP?wsdl','=',5,'xxtOpen167a',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,2000,'GET',1),('XXT_OPEN_167b','xxtOpen','200','http://1.1.10.167:8082/services/eduSOAP?wsdl','=',5,'xxtOpen167b',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,2000,'GET',1),('XXT_OPEN_131','xxtOpen','200','http://1.1.10.131:3087/services/eduSOAP?wsdl','=',5,'xxtOpen131',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,2000,'GET',1),('XXT_SUPPORT','support','200','http://1.1.10.144:8083/support-qt/login.jsp','=',5,'工单系统144异常',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,2000,'GET',1),('XXT_OPEN_CLD_NGINX_163','xxtOpen','200','http://192.168.210.163:8083/services/eduSOAP?wsdl','=',5,'xxtOpen163_nginx_cld','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,2000,'GET',1),('XXT_WEB2_147','xxt2','OK','http://192.168.210.151:8803/SSS200806.do?show=serverCheckSM&mobile=13512719456&msg=webok','=',5,'WEBOK',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,5000,'GET',0),('XXT_OPEN_124b','xxtOpen','200','http://1.1.10.124:8082/services/eduSOAP?wsdl','=',5,'xxtOpen124b',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,2000,'GET',1),('XXT_OPEN_CLD_154','xxtOpen','200','http://192.168.210.154:8081/services/eduSOAP?wsdl','=',5,'xxtOpen154',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,2000,'GET',1),('XXT_OPEN_CLD_152','xxtOpen','200','http://192.168.210.152:8081/services/eduSOAP?wsdl','=',5,'xxtOpen152','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,2000,'GET',1),('XXT_OPEN_CLD_153','xxtOpen','200','http://192.168.210.153:8081/services/eduSOAP?wsdl','=',5,'xxtOpen153','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,2000,'GET',1),('XXT_WEB2_149','xxt2','OK','http://192.168.210.149:8803/servercheck.do?area=xxt&show=chk&socketNum=0&attNum=0&smsNum=0','=',5,'2期149异常',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,5000,NULL,NULL),('XXT_WEB3_149','xxt3','OK','http://192.168.210.149:8801/servercheck.do','=',5,'新版149异常',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,5000,NULL,NULL),('XXT_WEB2_151','xxt2','OK','http://192.168.210.151:8803/servercheck.do?area=xxt&show=chk&socketNum=0&attNum=0&smsNum=0','=',5,'2期151异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',1,10000,NULL,NULL),('XXT_ABILITY_150','ability','200','http://192.168.210.150:8082/services/','=',5,'150_ability异常','','13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,5000,'GET',1),('XXT_WEB2_150','xxt2','OK','http://192.168.210.150:8803/servercheck.do?area=xxt&show=chk&socketNum=0&attNum=0&smsNum=0','=',5,'2期150异常',NULL,'13512719456,15917241380,13560252653,15220916464,15900088686,15900080343,15989058634',0,5000,NULL,NULL);
/*!40000 ALTER TABLE `SUP_MON_URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUP_SERVER_LOGIN`
--

DROP TABLE IF EXISTS `SUP_SERVER_LOGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUP_SERVER_LOGIN` (
  `ID` varchar(32) CHARACTER SET latin1 NOT NULL,
  `IP` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `port` int(8) DEFAULT NULL,
  `is_auth_by_key` int(1) DEFAULT NULL,
  `login_user` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUP_SERVER_LOGIN`
--

LOCK TABLES `SUP_SERVER_LOGIN` WRITE;
/*!40000 ALTER TABLE `SUP_SERVER_LOGIN` DISABLE KEYS */;
INSERT INTO `SUP_SERVER_LOGIN` VALUES ('1','192.168.210.70',22,1,'xxtuser',NULL);
/*!40000 ALTER TABLE `SUP_SERVER_LOGIN` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-18 14:34:21
