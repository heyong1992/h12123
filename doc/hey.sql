/*
 Navicat MySQL Data Transfer

 Source Server         : hey
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : hey

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 11/30/2017 11:34:32 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `api_token`
-- ----------------------------
DROP TABLE IF EXISTS `api_token`;
CREATE TABLE `api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '属于哪个用户',
  `valid_time` int(11) DEFAULT NULL COMMENT '有效时间(分钟)',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '登录时ip',
  `device_num` varchar(128) DEFAULT NULL COMMENT '设备号',
  `token` varchar(64) DEFAULT NULL COMMENT 'token',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='token表';

-- ----------------------------
--  Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `available` bit(1) DEFAULT NULL COMMENT '是否激活',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `parent_ids` varchar(255) DEFAULT NULL COMMENT '父id路径',
  `permission` varchar(255) DEFAULT NULL,
  `resource_type` enum('menu','button') DEFAULT NULL COMMENT '权限类型',
  `url` varchar(255) DEFAULT NULL COMMENT '访问路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('1', null, b'1', '系统管理', '0', '0/', '', 'menu', ''), ('2', null, b'1', '菜单管理', '1', '0/1', '', 'menu', 'sysPermission/list'), ('6', null, b'1', '角色管理', '1', null, null, 'menu', 'sysRole/list'), ('15', null, b'1', '用户管理', '1', '', 'userInfo:view', 'menu', 'userInfo/list'), ('21', null, b'0', '日志管理', '1', null, '', 'menu', 'sysLog/list'), ('22', null, b'0', '信息管理', '1', null, '', 'menu', 'sysInfo/list'), ('26', null, b'0', '订单管理', '1', null, '', 'menu', 'orderBaseInfo/list');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `available` bit(1) DEFAULT NULL COMMENT '是否有效',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '2017-11-12 08:59:20', b'1', '管理员', 'admin'), ('2', '2017-11-20 00:00:00', b'1', 'VIP会员', 'vip');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  KEY `FKomxrs8a388bknvhjokh440waq` (`permission_id`),
  KEY `FK9q28ewrhntqeipl1t04kh1be7` (`role_id`),
  CONSTRAINT `FK9q28ewrhntqeipl1t04kh1be7` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKomxrs8a388bknvhjokh440waq` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('1', '1'), ('1', '2'), ('1', '6'), ('2', '6'), ('2', '2'), ('2', '2'), ('1', '15'), ('1', '21'), ('1', '22'), ('2', '15'), ('1', '26');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `role_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  KEY `FKain422lxuquy497yt11gaja5n` (`id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`),
  CONSTRAINT `FKain422lxuquy497yt11gaja5n` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FKhh52n8vd4ny9ff4x9fb8v65qx` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '5'), ('1', '1'), ('2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码盐',
  `state` int(4) NOT NULL COMMENT '状态',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f2ksd6h8hsjtd57ipfq9myr64` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `user_info`
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES ('1', '2017-11-15 00:20:03', 'admin', 'd0943744a38289f7718f2bfd240c23a5', '21232F297A57A5A743894A0E4A801FC3', '1', 'admin'), ('5', '2017-11-15 13:40:40', 'hey', '4501fd22c3fcc761b87120bac23ad96c', '6057F13C496ECF7FD777CEB9E79AE285', '1', 'hey');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
