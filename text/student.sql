/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 28/06/2020 11:49:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int(15) NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sage` int(15) NULL DEFAULT NULL,
  `ssex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `snativeplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smajor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `snative` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (111, '李四', 12, '男', '太原', '土木', '1703', '汉');
INSERT INTO `student` VALUES (173, '王涛', 22, '男', '太原', '土木', '1702', '汉');
INSERT INTO `student` VALUES (175, '王旭辉', 23, '男', '太原', '软件工程', '软工1701', '汉');
INSERT INTO `student` VALUES (211, '周时', 12, '男', '太原', '土木', '1703', '汉');
INSERT INTO `student` VALUES (1111, '冯阳阳', 12, '男', '太原', '土木', '1703', '汉');
INSERT INTO `student` VALUES (11111, '冯阳大爱的', 21, '男', '天堂', '软件工程', '1111', '汉');

SET FOREIGN_KEY_CHECKS = 1;
