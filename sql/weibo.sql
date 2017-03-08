/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-05 18:34:48
*/

SET FOREIGN_KEY_CHECKS=0;

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
