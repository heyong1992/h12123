/*
Navicat MySQL Data Transfer

Source Server         : hey
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : hey

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-15 21:55:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_permission`
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', null, '', '系统管理', '0', '0/', '', 'menu', '');
INSERT INTO `sys_permission` VALUES ('2', null, '', '菜单管理', '1', '0/1', '', 'menu', 'sysPermission/list');
INSERT INTO `sys_permission` VALUES ('6', null, '', '角色管理', '1', null, null, 'menu', 'sysRole/list');
INSERT INTO `sys_permission` VALUES ('15', null, '', '用户管理', '1', '', 'userInfo:view', 'menu', 'userInfo/list');

-- ----------------------------
-- Table structure for `sys_role`
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
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '2017-11-12 08:59:20', '', '管理员', 'admin');
INSERT INTO `sys_role` VALUES ('2', '2017-11-20 00:00:00', '', 'VIP会员', 'vip');

-- ----------------------------
-- Table structure for `sys_role_permission`
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
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '6');
INSERT INTO `sys_role_permission` VALUES ('2', '6');
INSERT INTO `sys_role_permission` VALUES ('2', '2');
INSERT INTO `sys_role_permission` VALUES ('2', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '15');

-- ----------------------------
-- Table structure for `sys_user_role`
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
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '2017-11-15 00:20:03', 'admin', 'd0943744a38289f7718f2bfd240c23a5', '21232F297A57A5A743894A0E4A801FC3', '1', 'admin');
INSERT INTO `user_info` VALUES ('5', '2017-11-15 13:40:40', 'hey', 'cabc676b056de45025053c89a4fc4a4a', '6057F13C496ECF7FD777CEB9E79AE285', '1', 'hey');
