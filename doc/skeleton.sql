/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.26 : Database - skeleton
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`skeleton` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `skeleton`;

/*Table structure for table `sys_admin` */

DROP TABLE IF EXISTS `sys_admin`;

CREATE TABLE `sys_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别：0男;1女',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `department_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '部门ID',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `sys_admin` */

insert  into `sys_admin`(`id`,`username`,`password`,`avatar`,`description`,`email`,`mobile`,`nickname`,`sex`,`status`,`role_id`,`department_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'admin','$2a$10$wE5VyaamTGBLF72ETK.ijuoQySJZ8HK0GREnyeIQWk1t9Vu/YGElK','','超级管理员','DM@gmail.com','13888888888','超级管理员',1,1,9,1,1582959143,'admin',1631936110,'admin'),
(2,'zhanshan','$2a$10$ntE8WKJ5nKFqBpUU7IV59uWeHRN3EI/5L6EbkjUeXA9S7mYhTLB2u','','测试人员1','admin@qq.com','13555555555','张三',1,1,1,3,1626834498,'admin',1631933444,'admin'),
(4,'wangwu','$2a$10$u60W0dYcaNKydj1kut8cFudh83pwWuUqdHEGH430.8vjqcJDCd85K','','这是王大爷','b@ccc.com','','王五1',0,1,9,16,1628822166,'admin',1629521456,'admin');

/*Table structure for table `sys_admin_log` */

DROP TABLE IF EXISTS `sys_admin_log`;

CREATE TABLE `sys_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cost_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '请求处理时长',
  `ip` varchar(64) NOT NULL DEFAULT '' COMMENT '请求ip地址',
  `ip_info` varchar(255) NOT NULL DEFAULT '' COMMENT '请求ip信息',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '日志名称',
  `request_param` varchar(512) NOT NULL DEFAULT '' COMMENT '请求参数',
  `request_type` varchar(16) NOT NULL DEFAULT '' COMMENT '请求类型',
  `request_url` varchar(255) NOT NULL DEFAULT '' COMMENT '请求地址',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='请求日志';

/*Data for the table `sys_admin_log` */

insert  into `sys_admin_log`(`id`,`cost_time`,`ip`,`ip_info`,`name`,`request_param`,`request_type`,`request_url`,`username`,`created_at`) values 
(1,1,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"55am\",\"captchaId\":\"2ddc11d0c4b1483e948836a61c1f8871\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629963304),
(2,1,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"nw7x\",\"captchaId\":\"f22b0c68cdd84a61b95e4e68553318ae\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629963334),
(3,1,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"tw53\",\"captchaId\":\"6dc6f76cbd1f4624a4e9cebb32b95242\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629963364),
(4,2,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"akp4\",\"captchaId\":\"af21d6a5f8b6454e91587e6bc9d8b6d0\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629963395),
(5,3,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"ebrh\",\"captchaId\":\"996ad8601a414dd0a46e028a8615ee84\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629963548),
(6,2929,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"ducy\",\"captchaId\":\"1992a62d288f4091916233570af76d77\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629963780),
(7,3,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"qnmf\",\"captchaId\":\"db19bc4ddab6407496458fecaac11d52\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629964764),
(8,2,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"ek1j\",\"captchaId\":\"1dabbf9d53ed40ec945fe6ef45f79d81\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629964775),
(9,43,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"spgx\",\"captchaId\":\"51c88b907cb441df9710a540f08cc273\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629965182),
(10,6753,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"mijn\",\"captchaId\":\"908b2427f62a4abebddc9527a3b2b800\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629965289),
(11,4,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"mijn\",\"captchaId\":\"908b2427f62a4abebddc9527a3b2b800\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629965308),
(12,3,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"mijn\",\"captchaId\":\"908b2427f62a4abebddc9527a3b2b800\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629965311),
(13,49,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"OTY8\",\"captchaId\":\"8d0a71c4a5c74510a73dd5549d9ac54b\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1629971262),
(14,17,'192.168.56.1','','登录系统','{\"password\":\"******\",\"captcha\":\"f8nl\",\"captchaId\":\"9eb0edd43ace4488982e7d2c95f602b9\",\"username\":\"admin\"}','POST','/skeleton/login','admin',1630031387);

/*Table structure for table `sys_app_version` */

DROP TABLE IF EXISTS `sys_app_version`;

CREATE TABLE `sys_app_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本',
  `code` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `platform` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型(0安卓;1苹果)',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `is_force` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强更',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0不启用;1启用)',
  `description` text COMMENT '描述',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `sys_app_version` */

insert  into `sys_app_version`(`id`,`version`,`code`,`platform`,`url`,`is_force`,`status`,`description`,`created_at`) values 
(1,'1.0.0',100,0,'https://liaofanshequ.oss-cn-shenzhen.aliyuncs.com/fil/app-release.apk',0,1,'',1628560800),
(21,'1.0.1',101,0,'https://liaofanshequ.oss-cn-shenzhen.aliyuncs.com/fil/app-release.apk',1,1,'1、修正行情数据',1628587617);

/*Table structure for table `sys_department` */

DROP TABLE IF EXISTS `sys_department`;

CREATE TABLE `sys_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` varchar(32) NOT NULL DEFAULT '' COMMENT '上级部门',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '部门名称',
  `description` varchar(64) NOT NULL DEFAULT '' COMMENT '描述',
  `sort_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `sys_department` */

insert  into `sys_department`(`id`,`parent_id`,`name`,`description`,`sort_order`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'0','技术部','技术部',1.00,1,1628818864,'admin',1628818868,'admin'),
(16,'0','财务部','财务部',1.00,1,1628996812,'admin',1630295496,'admin'),
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0目录;1菜单;按钮',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '关系链',
  `method` varchar(8) NOT NULL DEFAULT '' COMMENT '请求方法',
  `sort_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) NOT NULL DEFAULT '' COMMENT '组件路径',
  `permision_code` varchar(128) NOT NULL DEFAULT '' COMMENT '权限标识',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_external_link` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链',
  `is_cache` tinyint(3) unsigned DEFAULT '0' COMMENT '是否缓存',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`type`,`name`,`parent_id`,`path`,`method`,`sort_order`,`icon`,`url`,`component`,`permision_code`,`status`,`is_display`,`is_external_link`,`is_cache`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,0,'系统管理',0,'1','',1.00,'ant-design:setting-outlined','/system','','',1,1,0,0,1629079245,'admin',1629958524,'admin'),
(2,1,'账号管理',1,'1,2','',1.00,'ant-design:usergroup-add-outlined','/system/account','/demo/system/account/index','system:account',1,1,0,1,1629088689,'admin',1629958526,'admin'),
(3,1,'角色管理',1,'1,3','',2.00,'ant-design:experiment-filled','/system/role','/demo/system/role/index','system:role',1,1,0,1,1629088812,'admin',1629958529,'admin'),
(4,1,'菜单管理',1,'1,4','',3.00,'ant-design:unordered-list-outlined','/system/menu','/demo/system/menu/index','system:menu',1,1,0,1,1629088897,'admin',1629958531,'admin'),
(5,1,'部门管理',1,'1,5','',3.00,'ant-design:appstore-filled','/system/department','/demo/system/dept/index','system:dept',1,1,0,1,1629088944,'admin',1630294865,'admin'),
(6,1,'首页',0,'6','',0.00,'ant-design:home-outlined','/dashboard','/dashboard/analysis/index','dashboard:home',1,1,0,0,1629521812,'admin',1629958521,'admin'),
(13,2,'编辑菜单',4,'1,4,13','POST',4.00,'','/permission/edit','','menu:btn:edit',1,0,0,0,1629521812,'admin',1630300030,'admin'),
(15,2,'添加菜单',4,'1,4,15','POST',3.00,'','/permission/add','','menu:btn:add',1,1,0,0,1629521812,'admin',1630300014,'admin'),
(18,2,'编辑角色',3,'1,3,18','POST',3.00,'','/role/edit','','role:btn:edit',1,1,0,0,1630294225,'admin',1630299341,'admin'),
(20,2,'添加部门',5,'1,5,20','POST',2.00,'','/department/add','','dept:btn:add',1,1,0,0,1630295445,'admin',1630295445,'admin'),
(21,2,'编辑部门',5,'1,5,21','POST',3.00,'','/department/edit','','dept:btn:edit',1,1,0,0,1630295482,'admin',1630295482,'admin'),
(22,2,'添加帐号',2,'1,2,22','POST',3.00,'','/admin/add','','admin:btn:add',1,1,0,0,1630298703,'admin',1630298703,'admin'),
(23,2,'编辑帐号',2,'1,2,23','POST',3.00,'','/admin/edit','','admin:btn:edit',1,1,0,0,1630298743,'admin',1630298743,'admin'),
(24,2,'删除帐号',2,'1,2,24','DELETE',4.00,'','/admin/delete/*','','admin:btn:delete',1,1,0,0,1630298780,'admin',1630299095,'admin'),
(26,2,'添加角色',3,'1,3,26','POST',2.00,'','/role/add','','role:btn:add',1,1,0,0,1630299327,'admin',1630299327,'admin'),
(27,2,'删除角色',3,'1,3,27','DELETE',5.00,'','/role/delete/*','','role:btn:delete',1,1,0,0,1630299397,'admin',1630299563,'admin'),
(28,2,'删除部门',5,'1,5,28','DELETE',4.00,'','/department/delete/*','','dept:btn:delete',1,1,0,0,1630299886,'admin',1630299903,'admin'),
(29,2,'删除菜单',4,'1,4,29','DELETE',5.00,'','/permission/delete/*','','menu:btn:delete',1,1,0,0,1630300134,'admin',1630300134,'admin');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：0停用;1启用',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`code`,`description`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'测试角色','ROLE_TEST','测试角色',1,1628833064,'admin',1629959441,'admin'),
(9,'超级管理员','ROLE_ADMIN','超级管理员角色',1,1629089045,'admin',1631936494,'admin');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `permission_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`permission_id`,`role_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(22,4,1,1629179173,'admin',1629179173,'admin'),
(56,1,9,1629958565,'admin',1629958565,'admin'),
(21,1,1,1629179173,'admin',1629179173,'admin'),
(49,3,9,1629520966,'admin',1629520966,'admin'),
(65,5,9,1629971274,'admin',1629971274,'admin'),
(14,2,1,1629179015,'admin',1629179015,'admin'),
(47,4,9,1629520962,'admin',1629520962,'admin'),
(20,3,1,1629179158,'admin',1629179158,'admin'),
(17,5,1,1629179015,'admin',1629179015,'admin'),
(99,2,9,1631936101,'admin',1631936101,'admin'),
(59,6,9,1629960314,'admin',1629960314,'admin'),
(66,9,9,1630031896,'admin',1630031896,'admin'),
(67,10,9,1630031896,'admin',1630031896,'admin'),
(68,11,9,1630031896,'admin',1630031896,'admin'),
(69,12,9,1630031896,'admin',1630031896,'admin'),
(70,13,9,1630031896,'admin',1630031896,'admin'),
(71,14,9,1630031896,'admin',1630031896,'admin'),
(72,15,9,1630031896,'admin',1630031896,'admin'),
(73,17,9,0,'',0,''),
(74,18,9,0,'',0,''),
(75,16,9,1630294294,'admin',1630294294,'admin'),
(94,28,9,1630300604,'admin',1630300604,'admin'),
(93,21,9,1630300604,'admin',1630300604,'admin'),
(92,20,9,1630300604,'admin',1630300604,'admin'),
(79,25,9,1630298922,'admin',1630298922,'admin'),
(103,24,9,1631936494,'admin',1631936494,'admin'),
(101,23,9,1631936101,'admin',1631936101,'admin'),
(100,22,9,1631936101,'admin',1631936101,'admin'),
(83,26,9,1630299524,'admin',1630299524,'admin'),
(96,36,9,1630404326,'admin',1630404326,'admin'),
(95,35,9,1630403267,'admin',1630403267,'admin'),
(90,29,9,1630300490,'admin',1630300490,'admin'),
(91,19,9,1630300604,'admin',1630300604,'admin'),
(88,27,9,1630299535,'admin',1630299535,'admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
