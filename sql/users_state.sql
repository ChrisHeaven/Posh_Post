/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-05 18:33:44
*/

SET FOREIGN_KEY_CHECKS=0;

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
