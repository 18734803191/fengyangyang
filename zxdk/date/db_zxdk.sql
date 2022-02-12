/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : db_zxdk

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-05-12 19:07:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `sf` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '陈道明', '男', '22', '成都市金牛区', '13900000000', '2019-02-23 17:50:31', '管理员');
INSERT INTO `admin` VALUES ('2', 'xi', '123456', '习总', '男', '55', '测试地址', '13800000000/38880000', '2019-02-25', '系领导');
INSERT INTO `admin` VALUES ('3', 'yuan', '123456', '李总', '男', '33', '测试地址', '13900000000', '2019-02-25', '学院领导');

-- ----------------------------
-- Table structure for `dk`
-- ----------------------------
DROP TABLE IF EXISTS `dk`;
CREATE TABLE `dk` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zt` varchar(500) DEFAULT NULL,
  `dj` varchar(500) DEFAULT NULL,
  `ly` varchar(500) DEFAULT NULL,
  `sm` varchar(500) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `xm` varchar(500) DEFAULT NULL,
  `bj` varchar(500) DEFAULT NULL,
  `tjsj` varchar(500) DEFAULT NULL,
  `xsp` varchar(500) DEFAULT NULL,
  `xyj` varchar(500) DEFAULT NULL,
  `xld` varchar(500) DEFAULT NULL,
  `ysp` varchar(500) DEFAULT NULL,
  `yyj` varchar(500) DEFAULT NULL,
  `yld` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `ch` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of dk
-- ----------------------------
INSERT INTO `dk` VALUES ('1', '助学贷款申请', '5000', '本人由于家境相当贫寒，每天喝西北风。', '本人由于家境相当贫寒，每天喝西北风。', 'xiaoniucr', '杨工', '2019届软件10班', '2019-05-12', '通过', '通过', 'xi', '通过', '通过', 'yuan', '通过', '否');
INSERT INTO `dk` VALUES ('2', '申请助学贷款', '4000', '申请助学贷款', '申请助学贷款', 'xiaoniucr', '杨工', '2019届软件10班', '2019-05-12', '暂无', '暂无', '暂无', '暂无', '暂无', '暂无', '暂无', '是');

-- ----------------------------
-- Table structure for `jxj`
-- ----------------------------
DROP TABLE IF EXISTS `jxj`;
CREATE TABLE `jxj` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zt` varchar(500) DEFAULT NULL,
  `dj` varchar(500) DEFAULT NULL,
  `ly` varchar(500) DEFAULT NULL,
  `sm` varchar(500) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `xm` varchar(500) DEFAULT NULL,
  `bj` varchar(500) DEFAULT NULL,
  `tjsj` varchar(500) DEFAULT NULL,
  `xsp` varchar(500) DEFAULT NULL,
  `xyj` varchar(500) DEFAULT NULL,
  `xld` varchar(500) DEFAULT NULL,
  `ysp` varchar(500) DEFAULT NULL,
  `yyj` varchar(500) DEFAULT NULL,
  `yld` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `ch` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of jxj
-- ----------------------------
INSERT INTO `jxj` VALUES ('1', '奖学金申请', '特等奖学金', '本人学习成绩相当优秀，会秀，脸皮厚，特此申请特等奖学金。', '本人学习成绩相当优秀，会秀，脸皮厚，特此申请特等奖学金。', 'xiaoniucr', '杨工', '2019届软件10班', '2019-05-12', '通过', '通过', 'xi', '通过', '通过', 'yuan', '通过', '否');
INSERT INTO `jxj` VALUES ('2', '申请奖学金', '特级', '申请奖学金', '申请奖学金', 'xiaoniucr', '杨工', '2019届软件10班', '2019-05-12', '暂无', '暂无', '暂无', '暂无', '暂无', '暂无', '暂无', '是');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `regtime` varchar(50) DEFAULT NULL,
  `ifuse` varchar(50) DEFAULT '在用',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'xiaoniucr', '123456', '杨工', '2019届软件10班', '13900000000', '男', '123@163.com', '2019-02-23 21:32:28', '在用');

-- ----------------------------
-- Table structure for `zxj`
-- ----------------------------
DROP TABLE IF EXISTS `zxj`;
CREATE TABLE `zxj` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zt` varchar(500) DEFAULT NULL,
  `dj` varchar(500) DEFAULT NULL,
  `ly` varchar(500) DEFAULT NULL,
  `sm` varchar(500) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `xm` varchar(500) DEFAULT NULL,
  `bj` varchar(500) DEFAULT NULL,
  `tjsj` varchar(500) DEFAULT NULL,
  `xsp` varchar(500) DEFAULT NULL,
  `xyj` varchar(500) DEFAULT NULL,
  `xld` varchar(500) DEFAULT NULL,
  `ysp` varchar(500) DEFAULT NULL,
  `yyj` varchar(500) DEFAULT NULL,
  `yld` varchar(500) DEFAULT NULL,
  `spjg` varchar(500) DEFAULT NULL,
  `ch` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of zxj
-- ----------------------------
INSERT INTO `zxj` VALUES ('1', '助学金申请', '5000', '本人由于家境贫寒，特此申请助学金。', '本人由于家境贫寒，特此申请助学金。', 'xiaoniucr', '杨工', '2019届软件10班', '2019-05-12', '通过', '通过', 'xi', '通过', '通过', 'yuan', '通过', '否');
INSERT INTO `zxj` VALUES ('2', '申请助学金', '4000', '申请助学金', '申请助学金', 'xiaoniucr', '杨工', '2019届软件10班', '2019-05-12', '暂无', '暂无', '暂无', '暂无', '暂无', '暂无', '暂无', '是');
