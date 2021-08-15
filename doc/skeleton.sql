/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 8.0.20 : Database - skeleton
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`skeleton` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `skeleton`;

/*Table structure for table `sys_admin` */

DROP TABLE IF EXISTS `sys_admin`;

CREATE TABLE `sys_admin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '性别：0男;1女',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `department_id` int unsigned NOT NULL DEFAULT '0' COMMENT '部门ID',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `sys_admin` */

insert  into `sys_admin`(`id`,`username`,`password`,`avatar`,`description`,`email`,`mobile`,`nickname`,`sex`,`status`,`role_id`,`department_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'admin','$2a$10$RGLnlZ9VkE8e/DxNOQ3MOOait9cbuqjhI6vlmiQmPmyW.86ADysNa','','超级管理员','DM@gmail.com','13888888888','超级管理员',1,1,2,2,1582959143,'admin',1628857735,'admin'),
(2,'zhanshan','$2a$10$ntE8WKJ5nKFqBpUU7IV59uWeHRN3EI/5L6EbkjUeXA9S7mYhTLB2u','','测试人员1','admin@qq.com','13555555555','张三',1,1,1,3,1626834498,'admin',1628836038,'admin'),
(4,'wangwu','$2a$10$u60W0dYcaNKydj1kut8cFudh83pwWuUqdHEGH430.8vjqcJDCd85K','','这是王大爷','b@ccc.com','','王五',0,1,2,2,1628822166,'admin',1628836045,'admin');

/*Table structure for table `sys_admin_log` */

DROP TABLE IF EXISTS `sys_admin_log`;

CREATE TABLE `sys_admin_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cost_time` int unsigned NOT NULL DEFAULT '0' COMMENT '请求处理时长',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求ip地址',
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求ip信息',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志名称',
  `request_param` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求参数',
  `request_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求地址',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='请求日志';

/*Data for the table `sys_admin_log` */

insert  into `sys_admin_log`(`id`,`cost_time`,`ip`,`ip_info`,`name`,`request_param`,`request_type`,`request_url`,`username`,`created_at`) values 
(1,93,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"pszl\",\"captchaId\":\"f3b8204e89374b83a9f846bc2baaf47b\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628410528),
(2,32,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"gpfu\",\"captchaId\":\"bf5983cd32e54e55be5d032c1818b2b1\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628411019),
(3,442,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"c7z1\",\"captchaId\":\"558e4d9c807e44d8b50819f91f95c2e7\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628411521),
(4,485,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"4grm\",\"captchaId\":\"0ca98c372bbc47dd8364cc8efaab1f3b\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628818829),
(5,41,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"l8ph\",\"captchaId\":\"14cc5d852fdf49508b0b3744e54a1126\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628822448),
(6,55,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"jnqt\",\"captchaId\":\"3bfab08f5c8740acadc2a68b9398d7b2\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628826077),
(7,27,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"fnvo\",\"captchaId\":\"1c9850f43e0641de9498387ca95a28b7\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628832860),
(8,37,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"uqjq\",\"captchaId\":\"34fe7b40d603483ca81c6ca1a8bb9cc7\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628836529),
(9,44,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"cjkz\",\"captchaId\":\"7f31f064e79b40fe9564ff4132c87f91\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628856515),
(10,3,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"kilt\",\"captchaId\":\"3b9cdf7ce6f04dccbfbf92f1906f528e\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628860258),
(11,39,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"fi6y\",\"captchaId\":\"2db8e4b1500640e5984045a3daaca240\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1628996765);

/*Table structure for table `sys_department` */

DROP TABLE IF EXISTS `sys_department`;

CREATE TABLE `sys_department` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上级部门',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '部门名称',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `sys_department` */

insert  into `sys_department`(`id`,`parent_id`,`name`,`description`,`sort_order`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'0','技术部','技术部',1.00,1,1628818864,'admin',1628818868,'admin'),
(16,'0','财务部','财务部',1.00,1,1628996812,'admin',1628996812,'admin'),
(3,'1','研发一部','这是研发一部',1.00,1,1628818932,'admin',1628818932,'admin'),
(4,'1','研发二部','研发二部',2.00,1,1628818951,'admin',1628818951,'admin'),
(5,'4','二部一组','二部一组',1.00,1,1628818976,'admin',1628818976,'admin'),
(10,'2','asfdasdf','asdfasf',0.00,1,1628860751,'admin',1628860751,'admin'),
(11,'','asfas','',0.00,1,1628860951,'admin',1628860951,'admin'),
(12,'','sadfasdf','',0.00,1,1628861055,'admin',1628861055,'admin'),
(13,'','sdfas','',0.00,1,1628861135,'admin',1628861135,'admin'),
(14,'','safasf','',0.00,0,1628861213,'admin',1628861213,'admin'),
(15,'2','asdfaf11111','ccc11111',11.00,0,1628861484,'admin',1628861505,'admin');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型：0目录;1菜单;按钮',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `sort_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `permision_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `is_display` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_external_link` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否外链',
  `is_cache` tinyint unsigned DEFAULT '0' COMMENT '是否缓存',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`type`,`name`,`parent_id`,`sort_order`,`icon`,`url`,`component`,`permision_code`,`status`,`is_display`,`is_external_link`,`is_cache`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,0,'耍花枪',0,1.00,'ant-design:account-book-twotone','sda as as','','',0,0,0,0,1628997675,'admin',1628997675,'admin');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态：0停用;1启用',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`code`,`description`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'测试角色','ROLE_TEST','测试角色',1,1628833064,'admin',1628835553,'admin'),
(2,'超级管理员','ROLE_ADMIN','超级管理员',1,1628833105,'admin',1628835546,'admin');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `permission_id` int unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_at` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

/*Data for the table `sys_role_permission` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
