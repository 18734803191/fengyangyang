/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 28/06/2020 11:49:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(15) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (NULL, 'xxx', '123', '2020-06-24', '1', 'qqq');
INSERT INTO `user` VALUES (NULL, 'FYY', '123', '2020-06-26', '1', '123');
INSERT INTO `user` VALUES (NULL, 'fengyangyang', '123', '2020-06-26', '1', 'dww');
INSERT INTO `user` VALUES (NULL, '1979254002', '123', '2020-06-26', '1', 'rg');
INSERT INTO `user` VALUES (NULL, '18734803191', '123', '2020-06-26', '1', 'eff');
INSERT INTO `user` VALUES (NULL, '19834414970', '123', '2020-06-26', '1', '113');
INSERT INTO `user` VALUES (NULL, 'iloveyou', '123', '2020-06-26', '1', '11030');

SET FOREIGN_KEY_CHECKS = 1;
