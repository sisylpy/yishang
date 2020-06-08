/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : Yishang

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 10/02/2020 16:48:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ys_goods
-- ----------------------------
DROP TABLE IF EXISTS `ys_goods`;
CREATE TABLE `ys_goods` (
  `g_id` int(20) NOT NULL AUTO_INCREMENT,
  `father_id` int(20) DEFAULT NULL,
  `goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `products_amount` int(4) DEFAULT '0',
  `color` varchar(15) COLLATE utf16_czech_ci DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `pinyin` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  `py` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of ys_goods
-- ----------------------------
BEGIN;
INSERT INTO `ys_goods` VALUES (1, 0, '生鲜', 0, '#20afb8', 1, NULL, NULL);
INSERT INTO `ys_goods` VALUES (2, 0, '食品', 0, '#1ebaee', 2, NULL, NULL);
INSERT INTO `ys_goods` VALUES (3, 0, '冻品', 0, '#3cc36e', 3, NULL, NULL);
INSERT INTO `ys_goods` VALUES (4, 0, '一次性用品', 0, '#f5c832', 4, NULL, NULL);
INSERT INTO `ys_goods` VALUES (5, 0, '服装,厨具', 0, '#f09628', 5, NULL, NULL);
INSERT INTO `ys_goods` VALUES (6, 0, '酒类', 0, '#f05a32', 6, NULL, NULL);
INSERT INTO `ys_goods` VALUES (7, 0, '食品', 0, '#20afb8', 7, NULL, NULL);
INSERT INTO `ys_goods` VALUES (8, 0, '其它', 0, '#969696', 8, NULL, NULL);
INSERT INTO `ys_goods` VALUES (9, 1, '新鲜蔬菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (10, 1, '肉禽蛋品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (11, 1, '新鲜水果', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (12, 1, '海鲜水产', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (13, 1, '豆制品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (14, 1, '新鲜蔬菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (15, 2, '主食', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (16, 2, '粮油调味', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (17, 2, '干果食品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (18, 2, '罐头', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (19, 2, '进口食品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (20, 2, '休闲食品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (21, 2, '主食', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (22, 2, '饮料冲调', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (23, 3, '冻猪肉', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (24, 3, '冻牛肉', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (25, 9, '根茎类', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (26, 9, '葱姜蒜椒', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (27, 9, '茄果瓜类', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (28, 9, '叶菜类', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (29, 9, '鲜菌菇', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (30, 25, '白萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (31, 25, '春笋', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (32, 25, '白萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (33, 25, '春笋', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (34, 25, '苦苣', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (35, 25, '荷兰豆', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (36, 25, '胡萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (37, 25, '黄花菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (38, 25, '苤蓝', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (39, 25, '宽豆角', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (40, 25, '秋葵', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (41, 25, '山药', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (42, 25, '蒜苔', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (43, 25, '土豆', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (44, 25, '西兰花', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (45, 25, '铁棍山药', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (46, 25, '莲藕', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (47, 25, '凉姜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (48, 25, '小萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (49, 25, '青笋', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (50, 25, '豆角', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (51, 25, '心里美', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (53, 25, '芥菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (54, 25, '樱桃萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (55, 25, '红薯', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (56, 25, '小芋头', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (57, 25, '小土豆', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (58, 25, '南瓜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (59, 26, '大蒜', 0, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
