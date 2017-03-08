/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-05 18:33:36
*/

SET FOREIGN_KEY_CHECKS=0;

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
