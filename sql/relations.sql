/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-05 18:33:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for relations
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `username` char(20) NOT NULL,
  `friends` char(20) NOT NULL,
  PRIMARY KEY (`username`,`friends`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relations
-- ----------------------------
INSERT INTO `relations` VALUES ('dbj', 'Chris');
INSERT INTO `relations` VALUES ('dbj', 'ld');
INSERT INTO `relations` VALUES ('yzh', 'Chris');
INSERT INTO `relations` VALUES ('yzh', 'dbj');
INSERT INTO `relations` VALUES ('yzh', 'ld');

-- ----------------------------
-- Table structure for users_information
-- ----------------------------
DROP TABLE IF EXISTS `users_information`;
CREATE TABLE `users_information` (
  `username` char(20) NOT NULL,
  `password` char(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_information
-- ----------------------------
INSERT INTO `users_information` VALUES ('Chris', 'pyz2016');
INSERT INTO `users_information` VALUES ('dbj', '930529');
INSERT INTO `users_information` VALUES ('ld', 'ld2016');
INSERT INTO `users_information` VALUES ('ljn', '12345');
INSERT INTO `users_information` VALUES ('Peng', '940305');
INSERT INTO `users_information` VALUES ('yzh', '930907');

-- ----------------------------
-- Table structure for users_state
-- ----------------------------
DROP TABLE IF EXISTS `users_state`;
CREATE TABLE `users_state` (
  `username` char(20) NOT NULL,
  `state` char(10) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_state
-- ----------------------------
INSERT INTO `users_state` VALUES ('Chris', '0');
INSERT INTO `users_state` VALUES ('dbj', '1');
INSERT INTO `users_state` VALUES ('ld', '0');
INSERT INTO `users_state` VALUES ('ljn', '0');
INSERT INTO `users_state` VALUES ('Peng', '0');
INSERT INTO `users_state` VALUES ('yzh', '0');

-- ----------------------------
-- Table structure for weibo
-- ----------------------------
DROP TABLE IF EXISTS `weibo`;
CREATE TABLE `weibo` (
  `username` char(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `post_time` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of weibo
-- ----------------------------
INSERT INTO `weibo` VALUES ('dbj', 'HELLO WORLD~', '2016-4-27 15:40:30');
INSERT INTO `weibo` VALUES ('dbj', 'da ba jiao', '2016-4-27 15:57:53');
INSERT INTO `weibo` VALUES ('dbj', 'qing jiao jia yan', '2016-4-27 16:27:58');
INSERT INTO `weibo` VALUES ('dbj', 'zhong yu cheng gong la', '2016-4-27 19:02:06');
INSERT INTO `weibo` VALUES ('yzh', 'HELLO WORLD!', '2016-4-30 22:35:39');
INSERT INTO `weibo` VALUES ('yzh', 'keng die de bug', '2016-5-1 23:47:24');
