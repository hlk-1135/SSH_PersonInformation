/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : information

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-06-07 22:48:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `files`
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileTitle` varchar(255) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `fileDate` date NOT NULL,
  `contentType` varchar(255) NOT NULL,
  `filePath` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`fileId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('1', '朱婷', 'zt.jpg', '中国女排主攻手--朱婷', '2017-03-28', 'image/jpeg', '/file', '1');
INSERT INTO `files` VALUES ('2', '女排队长', '王.jpg', '美美哒排球师姐。', '2017-03-31', 'image/jpeg', '/file', '1');
INSERT INTO `files` VALUES ('3', '我的头像', 'touxiang.jpg', '使用的个人头像。', '2017-04-01', 'image/jpeg', '/file', '1');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `friendId` int(100) NOT NULL AUTO_INCREMENT,
  `userId` int(100) NOT NULL,
  `friendName` varchar(100) NOT NULL,
  `friendPhone` varchar(100) NOT NULL,
  `friendCompany` varchar(100) NOT NULL,
  `friendQQ` varchar(100) NOT NULL,
  PRIMARY KEY (`friendId`),
  KEY `user_id` (`userId`),
  CONSTRAINT `user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('1', '1', '张三', '15896236548', '腾讯', '364589621');
INSERT INTO `friends` VALUES ('2', '1', '李四', '15896324569', '阿里巴巴', '369875632');
INSERT INTO `friends` VALUES ('3', '1', '王五', '158962347893', '腾讯', '236542563');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(100) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `work` varchar(100) NOT NULL,
  `realName` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'hlk1135', '123456', '学生', '李四', '17862821585');
INSERT INTO `user` VALUES ('2', 'ldu1403', '123456', '老师', '张三', '15563893561');
INSERT INTO `user` VALUES ('3', 'llwwlql', '123456', '学生', '赵六', '17862821585');
