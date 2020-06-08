/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : chain_order

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 24/10/2019 17:54:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ck_goods
-- ----------------------------
DROP TABLE IF EXISTS `ck_goods`;
CREATE TABLE `ck_goods` (
  `goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '商品名称',
  `father_id` int(20) DEFAULT NULL COMMENT '父级id',
  `standard_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '规格',
  `apply_standard_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '申请规格',
  `type` tinyint(2) DEFAULT NULL COMMENT '"1"正常销售，“2”库存报警，“3”断货',
  `is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `g_out_dep_id` int(20) DEFAULT NULL COMMENT '出货部门id',
  `alarm_weight` int(10) DEFAULT NULL COMMENT '库存报警重量',
  `quality_period` int(10) DEFAULT NULL COMMENT '保质期天数',
  `price` float(6,2) DEFAULT NULL COMMENT '零售价',
  `price_standard` varchar(6) COLLATE utf8_czech_ci DEFAULT NULL COMMENT '零售价单位',
  `g_sort` int(10) DEFAULT NULL COMMENT '商品排序',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1275 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of ck_goods
-- ----------------------------
BEGIN;
INSERT INTO `ck_goods` VALUES (1, '猪头肉(散)123', 1237, '斤', '斤', 1, 1, 2, 1, 200, NULL, NULL, NULL, 2);
INSERT INTO `ck_goods` VALUES (3, '红肠1234', 1237, '斤', '斤', 2, 1, 2, 1, 100, 90, 34.56, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1234, '你好d', 1237, '1', '2', 1, 1, 2, 1, 1000, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1235, '好不容易234', 1245, '斤', '公斤', 1, 1, 1, 1, 20, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1236, '比昂s', 1245, '1', '1', 1, 1, 2, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1237, '猪肉', 0, 'd', 'd', 1, 2, 2, 1, 1, NULL, NULL, NULL, 1);
INSERT INTO `ck_goods` VALUES (1238, '1', 1237, '1', '1', 1, 2, 3, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1239, '2', NULL, '2', '2', 2, 2, 2, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1240, '3', NULL, '3', '3', 1, 2, 1, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1241, '4', NULL, '4', '4', 1, 2, 2, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1242, '5', NULL, '5', '5', 1, 2, 3, 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1243, '6', NULL, '6', '6', 1, 2, 2, 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1244, '7', NULL, '7', '7', 1, 2, 3, 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1245, '肠', 0, '1', '1', 1, 2, 2, 2, 5, NULL, NULL, NULL, 2);
INSERT INTO `ck_goods` VALUES (1246, '蔬菜', 0, '212', '21', 1, 1, 2, 3, 5, NULL, NULL, NULL, 3);
INSERT INTO `ck_goods` VALUES (1247, 'dd', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `ck_goods` VALUES (1248, 'bb', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `ck_goods` VALUES (1249, 'yes', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `ck_goods` VALUES (1250, 'a', NULL, '1', '1', 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `ck_goods` VALUES (1251, '1', NULL, '1', '1', 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO `ck_goods` VALUES (1252, '2', NULL, '2', '2', 2, NULL, 3, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `ck_goods` VALUES (1253, '3', NULL, '3', '3', 3, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1254, '4por', 1237, '4', '4', 4, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1256, '5', 1237, '5', '5', 5, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1257, NULL, 1237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1258, '123', 1237, '12', '12', 12, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1259, 'fff', 1237, 'fff', 'fff', 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1260, '猪头肉（散）', 1237, '斤', '斤', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `ck_goods` VALUES (1261, '猪蹄', 1237, '斤', '斤', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1262, '猪耳朵', 1237, '斤', '斤', 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1263, 'y', 1249, 'y', 'y', 1, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1264, '567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 666, 123, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1265, 'filenemabcd', 1237, NULL, NULL, NULL, NULL, NULL, NULL, 911, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1266, 'ren', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `ck_goods` VALUES (1267, 'mei', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO `ck_goods` VALUES (1268, 'kkkk', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `ck_goods` VALUES (1269, 'xingoods', 1237, 'a', 'a', NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1270, NULL, 1237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1271, '55', 1237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1272, 'aaa', 1237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1273, '12345', 1237, 'ddd', 'ff', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_goods` VALUES (1274, '蔬菜', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for ck_line
-- ----------------------------
DROP TABLE IF EXISTS `ck_line`;
CREATE TABLE `ck_line` (
  `line_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '线路id',
  `line_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '线路名称',
  `origin_point` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL COMMENT '始发地',
  KEY `line_id` (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of ck_line
-- ----------------------------
BEGIN;
INSERT INTO `ck_line` VALUES (1, '燕郊线', NULL);
INSERT INTO `ck_line` VALUES (2, '测试线2', NULL);
INSERT INTO `ck_line` VALUES (3, '线路三', NULL);
INSERT INTO `ck_line` VALUES (4, '线路四', NULL);
INSERT INTO `ck_line` VALUES (5, 'xyz', NULL);
COMMIT;

-- ----------------------------
-- Table structure for ck_line_store
-- ----------------------------
DROP TABLE IF EXISTS `ck_line_store`;
CREATE TABLE `ck_line_store` (
  `line_store_id` int(20) NOT NULL AUTO_INCREMENT,
  `re_line_id` int(20) NOT NULL,
  `re_store_id` int(20) NOT NULL,
  `sort` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`line_store_id`,`re_line_id`,`re_store_id`) USING BTREE,
  KEY `line_rel` (`re_line_id`),
  KEY `store_rel` (`re_store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of ck_line_store
-- ----------------------------
BEGIN;
INSERT INTO `ck_line_store` VALUES (1, 1, 2, 1);
INSERT INTO `ck_line_store` VALUES (2, 1, 1, 1);
INSERT INTO `ck_line_store` VALUES (3, 2, 3, 1);
INSERT INTO `ck_line_store` VALUES (4, 2, 4, 1);
INSERT INTO `ck_line_store` VALUES (5, 2, 2, 1);
INSERT INTO `ck_line_store` VALUES (6, 2, 1, 1);
INSERT INTO `ck_line_store` VALUES (7, 3, 1, 1);
INSERT INTO `ck_line_store` VALUES (8, 3, 2, 1);
INSERT INTO `ck_line_store` VALUES (9, 3, 3, 1);
INSERT INTO `ck_line_store` VALUES (10, 3, 4, 1);
INSERT INTO `ck_line_store` VALUES (11, 4, 1, 1);
INSERT INTO `ck_line_store` VALUES (12, 4, 2, 1);
INSERT INTO `ck_line_store` VALUES (13, 4, 3, 1);
INSERT INTO `ck_line_store` VALUES (14, 5, 19, 1);
INSERT INTO `ck_line_store` VALUES (15, 5, 5, 1);
INSERT INTO `ck_line_store` VALUES (16, 5, 6, 1);
INSERT INTO `ck_line_store` VALUES (17, 5, 4, 1);
INSERT INTO `ck_line_store` VALUES (18, 5, 10, 1);
INSERT INTO `ck_line_store` VALUES (19, 5, 7, 1);
INSERT INTO `ck_line_store` VALUES (20, 5, 8, 1);
INSERT INTO `ck_line_store` VALUES (21, 5, 9, 1);
INSERT INTO `ck_line_store` VALUES (22, 5, 16, 1);
COMMIT;

-- ----------------------------
-- Table structure for ck_out_dep
-- ----------------------------
DROP TABLE IF EXISTS `ck_out_dep`;
CREATE TABLE `ck_out_dep` (
  `out_dep_id` int(20) NOT NULL AUTO_INCREMENT,
  `out_dep_name` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`out_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of ck_out_dep
-- ----------------------------
BEGIN;
INSERT INTO `ck_out_dep` VALUES (1, '库房');
INSERT INTO `ck_out_dep` VALUES (2, '市场采购');
INSERT INTO `ck_out_dep` VALUES (3, '蔬菜配送商管涛');
COMMIT;

-- ----------------------------
-- Table structure for ck_pur_dep
-- ----------------------------
DROP TABLE IF EXISTS `ck_pur_dep`;
CREATE TABLE `ck_pur_dep` (
  `pur_dep_id` int(20) NOT NULL AUTO_INCREMENT,
  `pur_dep_name` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`pur_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of ck_pur_dep
-- ----------------------------
BEGIN;
INSERT INTO `ck_pur_dep` VALUES (1, '市场采购');
COMMIT;

-- ----------------------------
-- Table structure for ck_store
-- ----------------------------
DROP TABLE IF EXISTS `ck_store`;
CREATE TABLE `ck_store` (
  `store_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '店铺Id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '店铺名称',
  `address` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '手机号码',
  `lat` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '横坐标',
  `lun` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '纵坐标',
  `district` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '区域',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '城市',
  `wx_nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '微信号码',
  `wx_openId` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '微信id',
  `wx_avatar_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '微信头像',
  `wx_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '微信号码',
  `print_label` varchar(10) COLLATE utf8_czech_ci DEFAULT NULL COMMENT '打印名称',
  `out_label` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL COMMENT '对外名称',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci COMMENT='零售终端';

-- ----------------------------
-- Records of ck_store
-- ----------------------------
BEGIN;
INSERT INTO `ck_store` VALUES (1, '美林湾华联', '阿看看短发凉快', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyeseejoy', '美林', '燕郊3店');
INSERT INTO `ck_store` VALUES (2, '鲜汇', '啊啊啊啊啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '鲜汇', '燕郊2店');
INSERT INTO `ck_store` VALUES (3, '天丰利', '阿凡达说法是否打算发', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '天', '北京1店');
INSERT INTO `ck_store` VALUES (4, '金鱼池熟食', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '金鱼池', '北京2店');
INSERT INTO `ck_store` VALUES (5, '店铺1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (6, '店铺2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (7, '店铺3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (8, '店铺4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (9, '店铺5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (10, '店铺6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (11, '店铺7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (12, '店铺8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (13, '店铺9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (15, '店铺10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (16, '店铺11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (17, '店铺12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (18, '店铺13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (19, '店铺14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ck_store` VALUES (20, '店铺15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ck_supplier
-- ----------------------------
DROP TABLE IF EXISTS `ck_supplier`;
CREATE TABLE `ck_supplier` (
  `supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '供货商id',
  `supplier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL COMMENT '供货商名称',
  `sales_person` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '业务员',
  `sales_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_czech_ci DEFAULT NULL COMMENT '业务电话',
  `has_app` tinyint(2) DEFAULT NULL COMMENT '是否有app',
  `pay_methods` tinyint(2) unsigned zerofill DEFAULT '00' COMMENT '付款方式',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------
-- Records of ck_supplier
-- ----------------------------
BEGIN;
INSERT INTO `ck_supplier` VALUES (1, '大红门批发部', '李文', '13910825707', 1, 02);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 9);
INSERT INTO `sys_menu` VALUES (2, 1, '员工列表', 'sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu.html', 'sys:menu:list', 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'sys/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
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
INSERT INTO `sys_menu` VALUES (28, 1, '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', 1, 'fa fa-rocket', 7);
INSERT INTO `sys_menu` VALUES (29, 0, '出货管理', NULL, NULL, 0, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (30, 29, '库房', 'ordering', NULL, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (31, 29, '市场采购', 'so_supplyProducts', NULL, 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (32, 29, '蔬菜配送', 'so_deliver', NULL, 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (38, 37, '店铺销售', '/point', NULL, 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (39, 37, '产品销售', '/sellProducts', NULL, 1, NULL, 30);
INSERT INTO `sys_menu` VALUES (40, 0, '业务数据', NULL, NULL, 0, 'fa fa-cog', 7);
INSERT INTO `sys_menu` VALUES (41, 40, '员工', '/users', NULL, 1, NULL, 7);
INSERT INTO `sys_menu` VALUES (42, 40, '硬件设备', '/printer', NULL, 1, NULL, 8);
INSERT INTO `sys_menu` VALUES (51, 37, '集团销售', '/groupSales', NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (52, 0, '店铺管理', NULL, NULL, 0, 'fa fa-cog', 4);
INSERT INTO `sys_menu` VALUES (53, 0, '供货商管理', NULL, NULL, 0, 'fa fa-cog', 4);
INSERT INTO `sys_menu` VALUES (56, 52, '经营数据', 'businessData', NULL, 1, 'fa fa-user', 0);
INSERT INTO `sys_menu` VALUES (57, 52, '盘库', 'store?store_id=', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (62, 53, '供货商列表', 'cksupplier/cksupplier.html', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (63, 40, '店铺', 'storeList', 'ckstore:list, ckstore:info, ckstore:save, ckstore:update, ckstore:delete', 1, 'fa fa-cog', 3);
INSERT INTO `sys_menu` VALUES (64, 40, '送货路线', 'ckLine', 'ckline:list, ckline:info, ckline:save, ckline:update, ckline:delete', 1, 'fa fa-cog', 6);
INSERT INTO `sys_menu` VALUES (65, 40, '产品', 'goods', 'ckgoods:list, ckgoods:info, ckgoods:save, ckgoods:update, ckgoods:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (66, 40, '出货部门', 'outDep', 'ckoutdep:list, ckoutdep:info, ckoutdep:save, ckoutdep:update, ckoutdep:delete', 1, NULL, 5);
INSERT INTO `sys_menu` VALUES (67, 65, 'btn1', NULL, 'ckgoods:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (69, 0, '库存商品管理', NULL, '', 0, 'fa fa-cog', 5);
INSERT INTO `sys_menu` VALUES (70, 69, '今日采购', '/purchase/today', NULL, 1, 'fa ', 0);
INSERT INTO `sys_menu` VALUES (71, 69, '历史采购', '/purchase/history', NULL, 1, 'fa', 2);
INSERT INTO `sys_menu` VALUES (72, 69, '采购分析', '/purchase/anlysise', NULL, 1, 'fa', 4);
INSERT INTO `sys_menu` VALUES (73, 52, '销售分析', 'store?store_id=', NULL, 1, 'fa fa-user', 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '司机', '', '2019-09-20 21:12:18');
INSERT INTO `sys_role` VALUES (2, '售货员', NULL, '2019-09-20 21:13:00');
INSERT INTO `sys_role` VALUES (3, '分拣员', NULL, '2019-09-20 21:13:58');
INSERT INTO `sys_role` VALUES (4, '文员', NULL, '2019-09-20 21:15:08');
INSERT INTO `sys_role` VALUES (5, '采购员', NULL, '2019-09-20 21:15:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1, 29);
INSERT INTO `sys_role_menu` VALUES (2, 1, 32);
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '100@qq.com', '13888888888', 1, '2017-05-01 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'sisy', '80e06f4bab2dc146c9ba40839d6ba012d12c4dd9e9be705ff0089faf144df77c', NULL, NULL, 1, '2019-09-22 01:48:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 2, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
