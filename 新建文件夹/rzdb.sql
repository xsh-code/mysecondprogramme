/*
 Navicat Premium Data Transfer

 Source Server         : aaa
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : rzdb

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 29/05/2019 10:54:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('schedulerFactoryBean', 'myTrigger_11', 'DEFAULT', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('schedulerFactoryBean', 'myTrigger_12', 'DEFAULT', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('schedulerFactoryBean', 'myTrigger_14', 'DEFAULT', '*/5 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('schedulerFactoryBean', 'myJob_11', 'DEFAULT', NULL, 'com.itqf.dtboot.job.MyJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400107363686564756C655F6A6F625F6B657974007B7B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313534373435313137363132342C2263726F6E45787072657373696F6E223A222A202A202A202A202A203F222C226A6F624964223A31312C226D6574686F644E616D65223A2274657374222C22737461747573223A307D7800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('schedulerFactoryBean', 'myJob_12', 'DEFAULT', NULL, 'com.itqf.dtboot.job.MyJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400107363686564756C655F6A6F625F6B657974007C7B226265616E4E616D65223A22746573745461736B32222C2263726561746554696D65223A313534373435323237313433312C2263726F6E45787072657373696F6E223A222A202A202A202A202A203F222C226A6F624964223A31322C226D6574686F644E616D65223A2274657374222C22737461747573223A307D7800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('schedulerFactoryBean', 'myJob_14', 'DEFAULT', NULL, 'com.itqf.dtboot.job.MyJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400107363686564756C655F6A6F625F6B65797400B57B226265616E4E616D65223A226261636B55704462222C2263726561746554696D65223A313534373531393438363036322C2263726F6E45787072657373696F6E223A222A2F35202A202A202A202A203F222C226A6F624964223A31342C226D6574686F644E616D65223A226261636B5570222C22706172616D73223A22E5A487E4BBBDE695B0E68DAEE5BA93222C2272656D61726B223A22E5A487E4BBBDE695B0E68DAEE5BA93222C22737461747573223A307D7800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('schedulerFactoryBean', 'myTrigger_11', 'DEFAULT', 'myJob_11', 'DEFAULT', NULL, 1547518038000, 1547518037000, 5, 'PAUSED', 'CRON', 1547451176000, 0, NULL, 0, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('schedulerFactoryBean', 'myTrigger_12', 'DEFAULT', 'myJob_12', 'DEFAULT', NULL, 1547518038000, 1547518037000, 5, 'PAUSED', 'CRON', 1547452271000, 0, NULL, 0, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('schedulerFactoryBean', 'myTrigger_14', 'DEFAULT', 'myJob_14', 'DEFAULT', NULL, 1547520295000, 1547520290000, 5, 'PAUSED', 'CRON', 1547519486000, 0, NULL, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (11, 'testTask', 'test', NULL, '* * * * * ?', 1, NULL, '2019-01-14 15:32:56');
INSERT INTO `schedule_job` VALUES (12, 'testTask2', 'test', NULL, '* * * * * ?', 1, NULL, '2019-01-14 15:51:11');
INSERT INTO `schedule_job` VALUES (14, 'backUpDb', 'backUp', '备份数据库', '*/5 * * * * ?', 1, '备份数据库', '2019-01-15 10:31:26');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` bigint(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES (1, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:00:59');
INSERT INTO `schedule_job_log` VALUES (2, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:00:59');
INSERT INTO `schedule_job_log` VALUES (3, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:00:59');
INSERT INTO `schedule_job_log` VALUES (4, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:00:59');
INSERT INTO `schedule_job_log` VALUES (5, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:00');
INSERT INTO `schedule_job_log` VALUES (6, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:00');
INSERT INTO `schedule_job_log` VALUES (7, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:01');
INSERT INTO `schedule_job_log` VALUES (8, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:01');
INSERT INTO `schedule_job_log` VALUES (9, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:02');
INSERT INTO `schedule_job_log` VALUES (10, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:02');
INSERT INTO `schedule_job_log` VALUES (11, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:03');
INSERT INTO `schedule_job_log` VALUES (12, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:03');
INSERT INTO `schedule_job_log` VALUES (13, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:04');
INSERT INTO `schedule_job_log` VALUES (14, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:04');
INSERT INTO `schedule_job_log` VALUES (15, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:05');
INSERT INTO `schedule_job_log` VALUES (16, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:05');
INSERT INTO `schedule_job_log` VALUES (17, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:06');
INSERT INTO `schedule_job_log` VALUES (18, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:06');
INSERT INTO `schedule_job_log` VALUES (19, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:07');
INSERT INTO `schedule_job_log` VALUES (20, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:07');
INSERT INTO `schedule_job_log` VALUES (21, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:08');
INSERT INTO `schedule_job_log` VALUES (22, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:08');
INSERT INTO `schedule_job_log` VALUES (23, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:09');
INSERT INTO `schedule_job_log` VALUES (24, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:09');
INSERT INTO `schedule_job_log` VALUES (25, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:10');
INSERT INTO `schedule_job_log` VALUES (26, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:10');
INSERT INTO `schedule_job_log` VALUES (27, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:11');
INSERT INTO `schedule_job_log` VALUES (28, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:11');
INSERT INTO `schedule_job_log` VALUES (29, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:12');
INSERT INTO `schedule_job_log` VALUES (30, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:12');
INSERT INTO `schedule_job_log` VALUES (31, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:13');
INSERT INTO `schedule_job_log` VALUES (32, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:13');
INSERT INTO `schedule_job_log` VALUES (33, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:14');
INSERT INTO `schedule_job_log` VALUES (34, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:14');
INSERT INTO `schedule_job_log` VALUES (35, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:15');
INSERT INTO `schedule_job_log` VALUES (36, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:15');
INSERT INTO `schedule_job_log` VALUES (37, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:16');
INSERT INTO `schedule_job_log` VALUES (38, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:01:16');
INSERT INTO `schedule_job_log` VALUES (39, 12, 'testTask2', 'test', NULL, 0, NULL, 44, '2019-01-15 10:03:50');
INSERT INTO `schedule_job_log` VALUES (40, 11, 'testTask', 'test', NULL, 0, NULL, 57, '2019-01-15 10:03:50');
INSERT INTO `schedule_job_log` VALUES (41, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:51');
INSERT INTO `schedule_job_log` VALUES (42, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:51');
INSERT INTO `schedule_job_log` VALUES (43, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:52');
INSERT INTO `schedule_job_log` VALUES (44, 12, 'testTask2', 'test', NULL, 0, NULL, 1, '2019-01-15 10:03:52');
INSERT INTO `schedule_job_log` VALUES (45, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:53');
INSERT INTO `schedule_job_log` VALUES (46, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:53');
INSERT INTO `schedule_job_log` VALUES (47, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:54');
INSERT INTO `schedule_job_log` VALUES (48, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:54');
INSERT INTO `schedule_job_log` VALUES (49, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:55');
INSERT INTO `schedule_job_log` VALUES (50, 12, 'testTask2', 'test', NULL, 0, NULL, 1, '2019-01-15 10:03:55');
INSERT INTO `schedule_job_log` VALUES (51, 11, 'testTask', 'test', NULL, 0, NULL, 1, '2019-01-15 10:03:56');
INSERT INTO `schedule_job_log` VALUES (52, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:56');
INSERT INTO `schedule_job_log` VALUES (53, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:57');
INSERT INTO `schedule_job_log` VALUES (54, 12, 'testTask2', 'test', NULL, 0, NULL, 1, '2019-01-15 10:03:57');
INSERT INTO `schedule_job_log` VALUES (55, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:58');
INSERT INTO `schedule_job_log` VALUES (56, 12, 'testTask2', 'test', NULL, 0, NULL, 1, '2019-01-15 10:03:58');
INSERT INTO `schedule_job_log` VALUES (57, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:59');
INSERT INTO `schedule_job_log` VALUES (58, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:03:59');
INSERT INTO `schedule_job_log` VALUES (59, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:00');
INSERT INTO `schedule_job_log` VALUES (60, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:00');
INSERT INTO `schedule_job_log` VALUES (61, 11, 'testTask', 'test', NULL, 0, NULL, 1, '2019-01-15 10:04:01');
INSERT INTO `schedule_job_log` VALUES (62, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:01');
INSERT INTO `schedule_job_log` VALUES (63, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:02');
INSERT INTO `schedule_job_log` VALUES (64, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:02');
INSERT INTO `schedule_job_log` VALUES (65, 11, 'testTask', 'test', NULL, 0, NULL, 1, '2019-01-15 10:04:03');
INSERT INTO `schedule_job_log` VALUES (66, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:03');
INSERT INTO `schedule_job_log` VALUES (67, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:04');
INSERT INTO `schedule_job_log` VALUES (68, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:04:04');
INSERT INTO `schedule_job_log` VALUES (69, 11, 'testTask', 'test', NULL, 0, NULL, 65, '2019-01-15 10:06:56');
INSERT INTO `schedule_job_log` VALUES (70, 12, 'testTask2', 'test', NULL, 0, NULL, 52, '2019-01-15 10:06:56');
INSERT INTO `schedule_job_log` VALUES (71, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:06:57');
INSERT INTO `schedule_job_log` VALUES (72, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:06:57');
INSERT INTO `schedule_job_log` VALUES (73, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:06:58');
INSERT INTO `schedule_job_log` VALUES (74, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:06:58');
INSERT INTO `schedule_job_log` VALUES (75, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:06:59');
INSERT INTO `schedule_job_log` VALUES (76, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:06:59');
INSERT INTO `schedule_job_log` VALUES (77, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:00');
INSERT INTO `schedule_job_log` VALUES (78, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:00');
INSERT INTO `schedule_job_log` VALUES (79, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:01');
INSERT INTO `schedule_job_log` VALUES (80, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:01');
INSERT INTO `schedule_job_log` VALUES (81, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:02');
INSERT INTO `schedule_job_log` VALUES (82, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:02');
INSERT INTO `schedule_job_log` VALUES (83, 11, 'testTask', 'test', NULL, 0, NULL, 1, '2019-01-15 10:07:03');
INSERT INTO `schedule_job_log` VALUES (84, 12, 'testTask2', 'test', NULL, 0, NULL, 1, '2019-01-15 10:07:03');
INSERT INTO `schedule_job_log` VALUES (85, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:04');
INSERT INTO `schedule_job_log` VALUES (86, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:04');
INSERT INTO `schedule_job_log` VALUES (87, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:05');
INSERT INTO `schedule_job_log` VALUES (88, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:05');
INSERT INTO `schedule_job_log` VALUES (89, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:06');
INSERT INTO `schedule_job_log` VALUES (90, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:06');
INSERT INTO `schedule_job_log` VALUES (91, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:07');
INSERT INTO `schedule_job_log` VALUES (92, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:07');
INSERT INTO `schedule_job_log` VALUES (93, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:08');
INSERT INTO `schedule_job_log` VALUES (94, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:08');
INSERT INTO `schedule_job_log` VALUES (95, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:09');
INSERT INTO `schedule_job_log` VALUES (96, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:09');
INSERT INTO `schedule_job_log` VALUES (97, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:10');
INSERT INTO `schedule_job_log` VALUES (98, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:10');
INSERT INTO `schedule_job_log` VALUES (99, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:11');
INSERT INTO `schedule_job_log` VALUES (100, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:11');
INSERT INTO `schedule_job_log` VALUES (101, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:12');
INSERT INTO `schedule_job_log` VALUES (102, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:12');
INSERT INTO `schedule_job_log` VALUES (103, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:13');
INSERT INTO `schedule_job_log` VALUES (104, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:13');
INSERT INTO `schedule_job_log` VALUES (105, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:14');
INSERT INTO `schedule_job_log` VALUES (106, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:14');
INSERT INTO `schedule_job_log` VALUES (107, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:15');
INSERT INTO `schedule_job_log` VALUES (108, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:15');
INSERT INTO `schedule_job_log` VALUES (109, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:16');
INSERT INTO `schedule_job_log` VALUES (110, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:16');
INSERT INTO `schedule_job_log` VALUES (111, 11, 'testTask', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:17');
INSERT INTO `schedule_job_log` VALUES (112, 12, 'testTask2', 'test', NULL, 0, NULL, 0, '2019-01-15 10:07:17');
INSERT INTO `schedule_job_log` VALUES (113, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 47, '2019-01-15 10:31:30');
INSERT INTO `schedule_job_log` VALUES (114, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 7, '2019-01-15 10:31:35');
INSERT INTO `schedule_job_log` VALUES (115, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 8, '2019-01-15 10:31:40');
INSERT INTO `schedule_job_log` VALUES (116, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 6, '2019-01-15 10:31:45');
INSERT INTO `schedule_job_log` VALUES (117, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 7, '2019-01-15 10:31:50');
INSERT INTO `schedule_job_log` VALUES (118, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 51, '2019-01-15 10:44:31');
INSERT INTO `schedule_job_log` VALUES (119, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 5, '2019-01-15 10:44:35');
INSERT INTO `schedule_job_log` VALUES (120, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 4, '2019-01-15 10:44:40');
INSERT INTO `schedule_job_log` VALUES (121, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 4, '2019-01-15 10:44:45');
INSERT INTO `schedule_job_log` VALUES (122, 14, 'backUpDb', 'backUp', '备份数据库', 0, NULL, 4, '2019-01-15 10:44:50');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) DEFAULT NULL COMMENT '部门',
  `dept_name` varchar(255) DEFAULT NULL COMMENT '部门名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, '教学部');
INSERT INTO `sys_dept` VALUES (2, '财务部');
INSERT INTO `sys_dept` VALUES (3, '人力资源部');
INSERT INTO `sys_dept` VALUES (4, '行政部');
INSERT INTO `sys_dept` VALUES (5, '市场部');
INSERT INTO `sys_dept` VALUES (6, '技术部');
INSERT INTO `sys_dept` VALUES (7, '测试部');
INSERT INTO `sys_dept` VALUES (9, '销售部');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 12:03:39');
INSERT INTO `sys_log` VALUES (2, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 12:03:39');
INSERT INTO `sys_log` VALUES (3, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-11 12:03:45');
INSERT INTO `sys_log` VALUES (4, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.224', '2019-01-11 12:09:24');
INSERT INTO `sys_log` VALUES (5, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.224', '2019-01-11 12:09:24');
INSERT INTO `sys_log` VALUES (6, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 13:50:39');
INSERT INTO `sys_log` VALUES (7, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 13:50:39');
INSERT INTO `sys_log` VALUES (8, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 14:02:34');
INSERT INTO `sys_log` VALUES (9, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 14:02:34');
INSERT INTO `sys_log` VALUES (10, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-11 14:08:20');
INSERT INTO `sys_log` VALUES (11, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-11 14:08:22');
INSERT INTO `sys_log` VALUES (12, 'admin', '新增菜单', 'com.itqf.dtboot.controller.MenuController.saveMenu', '[{\"icon\":\"fa fa-bus\",\"name\":\"测试目录\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}]', '0:0:0:0:0:0:0:1', '2019-01-11 14:09:01');
INSERT INTO `sys_log` VALUES (13, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-11 14:09:02');
INSERT INTO `sys_log` VALUES (14, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.180', '2019-01-11 14:09:06');
INSERT INTO `sys_log` VALUES (15, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.180', '2019-01-11 14:09:06');
INSERT INTO `sys_log` VALUES (16, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:48:31');
INSERT INTO `sys_log` VALUES (17, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:48:31');
INSERT INTO `sys_log` VALUES (18, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-14 09:48:40');
INSERT INTO `sys_log` VALUES (19, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:50:56');
INSERT INTO `sys_log` VALUES (20, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:50:56');
INSERT INTO `sys_log` VALUES (21, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:52:33');
INSERT INTO `sys_log` VALUES (22, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:52:33');
INSERT INTO `sys_log` VALUES (23, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-14 09:54:02');
INSERT INTO `sys_log` VALUES (24, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-14 09:54:03');
INSERT INTO `sys_log` VALUES (25, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:55:31');
INSERT INTO `sys_log` VALUES (26, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:55:31');
INSERT INTO `sys_log` VALUES (27, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:56:25');
INSERT INTO `sys_log` VALUES (28, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:56:25');
INSERT INTO `sys_log` VALUES (29, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:58:48');
INSERT INTO `sys_log` VALUES (30, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 09:58:48');
INSERT INTO `sys_log` VALUES (31, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:01:42');
INSERT INTO `sys_log` VALUES (32, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:01:42');
INSERT INTO `sys_log` VALUES (33, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:14:54');
INSERT INTO `sys_log` VALUES (34, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:14:54');
INSERT INTO `sys_log` VALUES (35, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:15:55');
INSERT INTO `sys_log` VALUES (36, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:15:55');
INSERT INTO `sys_log` VALUES (37, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:24:31');
INSERT INTO `sys_log` VALUES (38, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:24:31');
INSERT INTO `sys_log` VALUES (39, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:31:35');
INSERT INTO `sys_log` VALUES (40, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:31:35');
INSERT INTO `sys_log` VALUES (41, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:59:43');
INSERT INTO `sys_log` VALUES (42, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 10:59:43');
INSERT INTO `sys_log` VALUES (43, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 11:05:58');
INSERT INTO `sys_log` VALUES (44, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 11:05:58');
INSERT INTO `sys_log` VALUES (45, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 11:36:34');
INSERT INTO `sys_log` VALUES (46, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 11:36:34');
INSERT INTO `sys_log` VALUES (47, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 11:46:20');
INSERT INTO `sys_log` VALUES (48, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 11:46:20');
INSERT INTO `sys_log` VALUES (49, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:24:35');
INSERT INTO `sys_log` VALUES (50, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:24:35');
INSERT INTO `sys_log` VALUES (51, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:28:23');
INSERT INTO `sys_log` VALUES (52, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:28:23');
INSERT INTO `sys_log` VALUES (53, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:30:06');
INSERT INTO `sys_log` VALUES (54, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:30:06');
INSERT INTO `sys_log` VALUES (55, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:46:54');
INSERT INTO `sys_log` VALUES (56, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:46:54');
INSERT INTO `sys_log` VALUES (57, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:51:25');
INSERT INTO `sys_log` VALUES (58, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:51:25');
INSERT INTO `sys_log` VALUES (59, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.194', '2019-01-14 14:51:42');
INSERT INTO `sys_log` VALUES (60, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.194', '2019-01-14 14:51:42');
INSERT INTO `sys_log` VALUES (61, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:54:39');
INSERT INTO `sys_log` VALUES (62, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:54:39');
INSERT INTO `sys_log` VALUES (63, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:59:10');
INSERT INTO `sys_log` VALUES (64, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 14:59:10');
INSERT INTO `sys_log` VALUES (65, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:16:14');
INSERT INTO `sys_log` VALUES (66, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:16:14');
INSERT INTO `sys_log` VALUES (67, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.254', '2019-01-14 15:16:20');
INSERT INTO `sys_log` VALUES (68, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.254', '2019-01-14 15:16:20');
INSERT INTO `sys_log` VALUES (69, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:16:20');
INSERT INTO `sys_log` VALUES (70, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:16:20');
INSERT INTO `sys_log` VALUES (71, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:32:02');
INSERT INTO `sys_log` VALUES (72, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:32:02');
INSERT INTO `sys_log` VALUES (73, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:50:51');
INSERT INTO `sys_log` VALUES (74, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-14 15:50:51');
INSERT INTO `sys_log` VALUES (75, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:07:10');
INSERT INTO `sys_log` VALUES (76, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:07:10');
INSERT INTO `sys_log` VALUES (77, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:30:12');
INSERT INTO `sys_log` VALUES (78, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:30:12');
INSERT INTO `sys_log` VALUES (79, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:44:45');
INSERT INTO `sys_log` VALUES (80, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:44:45');
INSERT INTO `sys_log` VALUES (81, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:45:10');
INSERT INTO `sys_log` VALUES (82, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:45:18');
INSERT INTO `sys_log` VALUES (83, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:01');
INSERT INTO `sys_log` VALUES (84, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:01');
INSERT INTO `sys_log` VALUES (85, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:03');
INSERT INTO `sys_log` VALUES (86, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:03');
INSERT INTO `sys_log` VALUES (87, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:05');
INSERT INTO `sys_log` VALUES (88, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:05');
INSERT INTO `sys_log` VALUES (89, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:41');
INSERT INTO `sys_log` VALUES (90, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:41');
INSERT INTO `sys_log` VALUES (91, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:43');
INSERT INTO `sys_log` VALUES (92, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:50:43');
INSERT INTO `sys_log` VALUES (93, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:51:21');
INSERT INTO `sys_log` VALUES (94, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:51:21');
INSERT INTO `sys_log` VALUES (95, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:51:27');
INSERT INTO `sys_log` VALUES (96, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:51:56');
INSERT INTO `sys_log` VALUES (97, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:52:06');
INSERT INTO `sys_log` VALUES (98, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:52:08');
INSERT INTO `sys_log` VALUES (99, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:57:03');
INSERT INTO `sys_log` VALUES (100, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 10:57:03');
INSERT INTO `sys_log` VALUES (101, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 10:57:05');
INSERT INTO `sys_log` VALUES (102, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:37:13');
INSERT INTO `sys_log` VALUES (103, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:37:13');
INSERT INTO `sys_log` VALUES (104, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:37:31');
INSERT INTO `sys_log` VALUES (105, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:37:31');
INSERT INTO `sys_log` VALUES (106, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 11:37:36');
INSERT INTO `sys_log` VALUES (107, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:38:17');
INSERT INTO `sys_log` VALUES (108, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:38:17');
INSERT INTO `sys_log` VALUES (109, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:38:20');
INSERT INTO `sys_log` VALUES (110, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:38:20');
INSERT INTO `sys_log` VALUES (111, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:40:43');
INSERT INTO `sys_log` VALUES (112, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:40:43');
INSERT INTO `sys_log` VALUES (113, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:42:39');
INSERT INTO `sys_log` VALUES (114, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:42:39');
INSERT INTO `sys_log` VALUES (115, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:45:53');
INSERT INTO `sys_log` VALUES (116, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:45:53');
INSERT INTO `sys_log` VALUES (117, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 11:45:56');
INSERT INTO `sys_log` VALUES (118, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:48:04');
INSERT INTO `sys_log` VALUES (119, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:48:04');
INSERT INTO `sys_log` VALUES (120, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 11:48:06');
INSERT INTO `sys_log` VALUES (121, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:49:40');
INSERT INTO `sys_log` VALUES (122, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:49:40');
INSERT INTO `sys_log` VALUES (123, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 11:49:44');
INSERT INTO `sys_log` VALUES (124, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:51:09');
INSERT INTO `sys_log` VALUES (125, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:51:09');
INSERT INTO `sys_log` VALUES (126, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 11:51:09');
INSERT INTO `sys_log` VALUES (127, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:53:42');
INSERT INTO `sys_log` VALUES (128, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 11:53:42');
INSERT INTO `sys_log` VALUES (129, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-01-15 11:53:45');
INSERT INTO `sys_log` VALUES (130, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 14:20:19');
INSERT INTO `sys_log` VALUES (131, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 14:20:19');
INSERT INTO `sys_log` VALUES (132, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:20:23');
INSERT INTO `sys_log` VALUES (133, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:21:20');
INSERT INTO `sys_log` VALUES (134, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:21:20');
INSERT INTO `sys_log` VALUES (135, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:22:00');
INSERT INTO `sys_log` VALUES (136, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 14:22:02');
INSERT INTO `sys_log` VALUES (137, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 14:22:02');
INSERT INTO `sys_log` VALUES (138, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:22:02');
INSERT INTO `sys_log` VALUES (139, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:22:07');
INSERT INTO `sys_log` VALUES (140, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:22:07');
INSERT INTO `sys_log` VALUES (141, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:22:43');
INSERT INTO `sys_log` VALUES (142, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:23:07');
INSERT INTO `sys_log` VALUES (143, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:23:10');
INSERT INTO `sys_log` VALUES (144, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:23:11');
INSERT INTO `sys_log` VALUES (145, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 14:23:32');
INSERT INTO `sys_log` VALUES (146, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 14:23:32');
INSERT INTO `sys_log` VALUES (147, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:23:33');
INSERT INTO `sys_log` VALUES (148, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:23:33');
INSERT INTO `sys_log` VALUES (149, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 14:23:36');
INSERT INTO `sys_log` VALUES (150, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 14:23:36');
INSERT INTO `sys_log` VALUES (151, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:23:48');
INSERT INTO `sys_log` VALUES (152, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:23:58');
INSERT INTO `sys_log` VALUES (153, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[1]', '10.9.41.220', '2019-01-15 14:24:10');
INSERT INTO `sys_log` VALUES (154, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.220', '2019-01-15 14:24:10');
INSERT INTO `sys_log` VALUES (155, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:27:41');
INSERT INTO `sys_log` VALUES (156, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:27:46');
INSERT INTO `sys_log` VALUES (157, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:27:47');
INSERT INTO `sys_log` VALUES (158, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:28:41');
INSERT INTO `sys_log` VALUES (159, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":10,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:28:49');
INSERT INTO `sys_log` VALUES (160, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:28:49');
INSERT INTO `sys_log` VALUES (161, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[38]', '10.9.41.220', '2019-01-15 14:28:58');
INSERT INTO `sys_log` VALUES (162, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.220', '2019-01-15 14:28:58');
INSERT INTO `sys_log` VALUES (163, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:29:01');
INSERT INTO `sys_log` VALUES (164, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[36]', '10.9.41.220', '2019-01-15 14:29:04');
INSERT INTO `sys_log` VALUES (165, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.220', '2019-01-15 14:29:04');
INSERT INTO `sys_log` VALUES (166, 'admin', '修改菜单', 'com.itqf.dtboot.controller.MenuController.updateMenu', '[{\"icon\":\"fa fa-bus\",\"menuId\":36,\"name\":\"测试\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}]', '10.9.41.220', '2019-01-15 14:29:07');
INSERT INTO `sys_log` VALUES (167, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 14:29:08');
INSERT INTO `sys_log` VALUES (168, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:51:47');
INSERT INTO `sys_log` VALUES (169, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:51:47');
INSERT INTO `sys_log` VALUES (170, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 14:51:56');
INSERT INTO `sys_log` VALUES (171, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 14:51:56');
INSERT INTO `sys_log` VALUES (172, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:52:30');
INSERT INTO `sys_log` VALUES (173, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:52:30');
INSERT INTO `sys_log` VALUES (174, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 14:53:59');
INSERT INTO `sys_log` VALUES (175, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 14:53:59');
INSERT INTO `sys_log` VALUES (176, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:54:04');
INSERT INTO `sys_log` VALUES (177, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:54:04');
INSERT INTO `sys_log` VALUES (178, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:55:57');
INSERT INTO `sys_log` VALUES (179, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 14:55:57');
INSERT INTO `sys_log` VALUES (180, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 15:15:22');
INSERT INTO `sys_log` VALUES (181, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 15:15:22');
INSERT INTO `sys_log` VALUES (182, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 15:15:30');
INSERT INTO `sys_log` VALUES (183, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 15:15:30');
INSERT INTO `sys_log` VALUES (184, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 15:16:52');
INSERT INTO `sys_log` VALUES (185, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 15:16:52');
INSERT INTO `sys_log` VALUES (186, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 15:17:00');
INSERT INTO `sys_log` VALUES (187, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 15:17:00');
INSERT INTO `sys_log` VALUES (188, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 16:01:20');
INSERT INTO `sys_log` VALUES (189, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 16:01:20');
INSERT INTO `sys_log` VALUES (190, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 16:01:25');
INSERT INTO `sys_log` VALUES (191, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 16:01:25');
INSERT INTO `sys_log` VALUES (192, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 16:01:38');
INSERT INTO `sys_log` VALUES (193, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 16:01:47');
INSERT INTO `sys_log` VALUES (194, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 16:01:49');
INSERT INTO `sys_log` VALUES (195, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[38]', '10.9.41.220', '2019-01-15 16:01:56');
INSERT INTO `sys_log` VALUES (196, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.220', '2019-01-15 16:01:56');
INSERT INTO `sys_log` VALUES (197, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.194', '2019-01-15 16:02:42');
INSERT INTO `sys_log` VALUES (198, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.194', '2019-01-15 16:02:42');
INSERT INTO `sys_log` VALUES (199, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '10.9.41.220', '2019-01-15 16:02:50');
INSERT INTO `sys_log` VALUES (200, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '10.9.41.220', '2019-01-15 16:02:50');
INSERT INTO `sys_log` VALUES (201, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 16:02:54');
INSERT INTO `sys_log` VALUES (202, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 16:02:57');
INSERT INTO `sys_log` VALUES (203, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[38]', '10.9.41.220', '2019-01-15 16:02:59');
INSERT INTO `sys_log` VALUES (204, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.220', '2019-01-15 16:02:59');
INSERT INTO `sys_log` VALUES (205, 'admin', '查询当前用户信息', 'com.itqf.dtboot.controller.UserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 16:03:01');
INSERT INTO `sys_log` VALUES (206, 'admin', '查询用户能访问的菜单菜单', 'com.itqf.dtboot.controller.MenuController.userMenu', '[]', '0:0:0:0:0:0:0:1', '2019-01-15 16:03:01');
INSERT INTO `sys_log` VALUES (207, 'admin', '修改菜单', 'com.itqf.dtboot.controller.MenuController.updateMenu', '[{\"icon\":\"fa fa-line-chart\",\"menuId\":38,\"name\":\"老师唱个歌\",\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}]', '10.9.41.220', '2019-01-15 16:03:08');
INSERT INTO `sys_log` VALUES (208, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.220', '2019-01-15 16:03:09');
INSERT INTO `sys_log` VALUES (209, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:03:13');
INSERT INTO `sys_log` VALUES (210, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:04:13');
INSERT INTO `sys_log` VALUES (211, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:04:15');
INSERT INTO `sys_log` VALUES (212, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:04:19');
INSERT INTO `sys_log` VALUES (213, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":20,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:04:35');
INSERT INTO `sys_log` VALUES (214, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:04:42');
INSERT INTO `sys_log` VALUES (215, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":20,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:04:52');
INSERT INTO `sys_log` VALUES (216, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:05:18');
INSERT INTO `sys_log` VALUES (217, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":20,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:05:30');
INSERT INTO `sys_log` VALUES (218, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[30]', '10.9.41.194', '2019-01-15 16:05:42');
INSERT INTO `sys_log` VALUES (219, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.194', '2019-01-15 16:05:42');
INSERT INTO `sys_log` VALUES (220, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":20,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:05:53');
INSERT INTO `sys_log` VALUES (221, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[32]', '10.9.41.194', '2019-01-15 16:06:02');
INSERT INTO `sys_log` VALUES (222, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.194', '2019-01-15 16:06:02');
INSERT INTO `sys_log` VALUES (223, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":20,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:06:11');
INSERT INTO `sys_log` VALUES (224, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:06:13');
INSERT INTO `sys_log` VALUES (225, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[37]', '10.9.41.194', '2019-01-15 16:06:36');
INSERT INTO `sys_log` VALUES (226, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.194', '2019-01-15 16:06:36');
INSERT INTO `sys_log` VALUES (227, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:06:48');
INSERT INTO `sys_log` VALUES (228, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:06:49');
INSERT INTO `sys_log` VALUES (229, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[39]', '10.9.41.194', '2019-01-15 16:06:54');
INSERT INTO `sys_log` VALUES (230, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.194', '2019-01-15 16:06:54');
INSERT INTO `sys_log` VALUES (231, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:07:05');
INSERT INTO `sys_log` VALUES (232, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:07:07');
INSERT INTO `sys_log` VALUES (233, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.menuInfo', '[40]', '10.9.41.194', '2019-01-15 16:07:09');
INSERT INTO `sys_log` VALUES (234, 'admin', '查询菜单', 'com.itqf.dtboot.controller.MenuController.selectMenu', '[]', '10.9.41.194', '2019-01-15 16:07:09');
INSERT INTO `sys_log` VALUES (235, 'admin', '查询菜单列表', 'com.itqf.dtboot.controller.MenuController.findMenu', '[{\"limit\":10,\"offset\":30,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:07:17');
INSERT INTO `sys_log` VALUES (236, 'admin', '查询用户列表', 'com.itqf.dtboot.controller.UserController.findUser', '[{\"limit\":10,\"offset\":0,\"order\":\"asc\"}]', '10.9.41.194', '2019-01-15 16:07:31');
INSERT INTO `sys_log` VALUES (237, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:27:41');
INSERT INTO `sys_log` VALUES (238, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:27:41');
INSERT INTO `sys_log` VALUES (239, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:28:30');
INSERT INTO `sys_log` VALUES (240, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:28:30');
INSERT INTO `sys_log` VALUES (241, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:28:45');
INSERT INTO `sys_log` VALUES (242, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:28:45');
INSERT INTO `sys_log` VALUES (243, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:30:19');
INSERT INTO `sys_log` VALUES (244, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:30:19');
INSERT INTO `sys_log` VALUES (245, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:37:10');
INSERT INTO `sys_log` VALUES (246, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:37:10');
INSERT INTO `sys_log` VALUES (247, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:38:17');
INSERT INTO `sys_log` VALUES (248, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:38:17');
INSERT INTO `sys_log` VALUES (249, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:42:53');
INSERT INTO `sys_log` VALUES (250, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:42:53');
INSERT INTO `sys_log` VALUES (251, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:44:50');
INSERT INTO `sys_log` VALUES (252, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:44:50');
INSERT INTO `sys_log` VALUES (253, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:45:40');
INSERT INTO `sys_log` VALUES (254, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:45:40');
INSERT INTO `sys_log` VALUES (255, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:48:24');
INSERT INTO `sys_log` VALUES (256, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:48:24');
INSERT INTO `sys_log` VALUES (257, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:49:41');
INSERT INTO `sys_log` VALUES (258, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:49:41');
INSERT INTO `sys_log` VALUES (259, 'admin', '查询菜单信息', 'class com.itqf.controller.SysMenuController.menuList', '[10,0,null,null,\"asc\"]', '0:0:0:0:0:0:0:1', '2019-05-29 10:50:23');
INSERT INTO `sys_log` VALUES (260, 'admin', '用户列表', 'class com.itqf.controller.SysUserController.findUserByPage', '[{\"limit\":10,\"offset\":0},null,{\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-05-29 10:51:15');
INSERT INTO `sys_log` VALUES (261, 'admin', '查询菜单信息', 'class com.itqf.controller.SysMenuController.menuList', '[10,0,null,null,\"asc\"]', '0:0:0:0:0:0:0:1', '2019-05-29 10:51:18');
INSERT INTO `sys_log` VALUES (262, 'admin', '用户列表', 'class com.itqf.controller.SysUserController.findUserByPage', '[{\"limit\":10,\"offset\":0},null,{\"order\":\"asc\"}]', '0:0:0:0:0:0:0:1', '2019-05-29 10:51:25');
INSERT INTO `sys_log` VALUES (263, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:52:32');
INSERT INTO `sys_log` VALUES (264, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:52:32');
INSERT INTO `sys_log` VALUES (265, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:52:55');
INSERT INTO `sys_log` VALUES (266, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:52:55');
INSERT INTO `sys_log` VALUES (267, 'admin', '查询用户信息', 'class com.itqf.controller.SysUserController.userInfo', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:53:03');
INSERT INTO `sys_log` VALUES (268, 'admin', '查询用户能访问的菜单', 'class com.itqf.controller.SysMenuController.menuUser', '[]', '0:0:0:0:0:0:0:1', '2019-05-29 10:53:03');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 30, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务管理', 'schedule/job.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'schedule:job:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'schedule:job:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'schedule:job:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'schedule:job:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'schedule:job:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'schedule:job:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'schedule:job:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info,sys:user:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (30, 0, '监控管理', NULL, NULL, 0, 'fa fa-bug', NULL);
INSERT INTO `sys_menu` VALUES (32, 0, '测试1111', NULL, NULL, 0, 'fa fa-heartbeat', 0);
INSERT INTO `sys_menu` VALUES (33, 0, 'sdas', 'asdas', NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 0, 'asdsds', 'asdasdasd', NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 0, '老师唱个歌', NULL, NULL, 0, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 0, '测试', NULL, NULL, 0, 'fa fa-bus', 0);
INSERT INTO `sys_menu` VALUES (37, 2, '导出', NULL, 'sys:user:export', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (38, 0, '统计管理', NULL, NULL, 0, 'fa fa-line-chart', NULL);
INSERT INTO `sys_menu` VALUES (39, 38, '部门员工统计', 'echarts/pie.html', 'sys:user:pie', 1, 'fa fa-pie-chart', NULL);
INSERT INTO `sys_menu` VALUES (40, 38, '性别统计', 'echarts/bar.html', 'sys:user:bar', 1, 'fa fa-bar-chart', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (5, '管理员', '', NULL, '2017-10-15 18:05:57');
INSERT INTO `sys_role` VALUES (6, '测试人员', '', NULL, '2017-10-17 05:32:10');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (190, 5, 1);
INSERT INTO `sys_role_menu` VALUES (191, 5, 2);
INSERT INTO `sys_role_menu` VALUES (192, 5, 15);
INSERT INTO `sys_role_menu` VALUES (193, 5, 16);
INSERT INTO `sys_role_menu` VALUES (194, 5, 17);
INSERT INTO `sys_role_menu` VALUES (195, 5, 18);
INSERT INTO `sys_role_menu` VALUES (196, 5, 3);
INSERT INTO `sys_role_menu` VALUES (197, 5, 19);
INSERT INTO `sys_role_menu` VALUES (198, 5, 20);
INSERT INTO `sys_role_menu` VALUES (199, 5, 21);
INSERT INTO `sys_role_menu` VALUES (200, 5, 22);
INSERT INTO `sys_role_menu` VALUES (201, 5, 4);
INSERT INTO `sys_role_menu` VALUES (202, 5, 23);
INSERT INTO `sys_role_menu` VALUES (203, 5, 24);
INSERT INTO `sys_role_menu` VALUES (204, 5, 25);
INSERT INTO `sys_role_menu` VALUES (205, 5, 26);
INSERT INTO `sys_role_menu` VALUES (206, 5, 5);
INSERT INTO `sys_role_menu` VALUES (207, 5, 6);
INSERT INTO `sys_role_menu` VALUES (208, 5, 7);
INSERT INTO `sys_role_menu` VALUES (209, 5, 8);
INSERT INTO `sys_role_menu` VALUES (210, 5, 9);
INSERT INTO `sys_role_menu` VALUES (211, 5, 10);
INSERT INTO `sys_role_menu` VALUES (212, 5, 11);
INSERT INTO `sys_role_menu` VALUES (213, 5, 12);
INSERT INTO `sys_role_menu` VALUES (214, 5, 13);
INSERT INTO `sys_role_menu` VALUES (215, 5, 14);
INSERT INTO `sys_role_menu` VALUES (216, 5, 27);
INSERT INTO `sys_role_menu` VALUES (217, 5, 29);
INSERT INTO `sys_role_menu` VALUES (218, 5, 28);
INSERT INTO `sys_role_menu` VALUES (225, 6, 1);
INSERT INTO `sys_role_menu` VALUES (226, 6, 2);
INSERT INTO `sys_role_menu` VALUES (227, 6, 15);
INSERT INTO `sys_role_menu` VALUES (228, 6, 17);
INSERT INTO `sys_role_menu` VALUES (229, 6, 18);
INSERT INTO `sys_role_menu` VALUES (230, 6, 4);
INSERT INTO `sys_role_menu` VALUES (231, 6, 23);
INSERT INTO `sys_role_menu` VALUES (232, 6, 24);
INSERT INTO `sys_role_menu` VALUES (233, 5, 30);
INSERT INTO `sys_role_menu` VALUES (234, 5, 31);
INSERT INTO `sys_role_menu` VALUES (235, 5, 41);
INSERT INTO `sys_role_menu` VALUES (236, 5, 37);
INSERT INTO `sys_role_menu` VALUES (237, 5, 38);
INSERT INTO `sys_role_menu` VALUES (238, 5, 39);
INSERT INTO `sys_role_menu` VALUES (239, 5, 40);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门编号',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `lockdate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', 'df655ad8d3229f3269fad2a8bab59b6c', '100@qq.com', '13666666666', 1, 1, '2017-06-01 15:33:20', 1, '男', NULL);
INSERT INTO `sys_user` VALUES (2, 'zhangsan', 'a4d172a6b49f9fac2ed0c14c70518ee4', '100@qq.com', '13666666666', 1, 1, '2017-06-01 15:33:20', 2, '女', NULL);
INSERT INTO `sys_user` VALUES (3, 'lisi', 'df655ad8d3229f3269fad2a8bab59b6c', '100@qq.com', '13666666666', 1, 1, '2019-01-15 14:29:12', 1, '男', NULL);
INSERT INTO `sys_user` VALUES (4, 'jack', '13666666666', '13666666666', '13666666666', 1, 1, '2019-01-15 14:29:36', 1, '女', NULL);
INSERT INTO `sys_user` VALUES (5, 'rose', '13666666666', '13666666666', '13666666666', 1, 1, '2019-01-15 14:29:54', 2, '男', NULL);
INSERT INTO `sys_user` VALUES (6, 'jerry', '13666666666', '13666666666', '13666666666', 1, 1, '2019-01-15 14:30:23', 3, '女', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 2, 6);
INSERT INTO `sys_user_role` VALUES (67, 1, 5);
INSERT INTO `sys_user_role` VALUES (68, 1, 6);
COMMIT;

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'test', '13888888888', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
