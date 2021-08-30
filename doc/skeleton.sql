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

/*Table structure for table `article_category` */

DROP TABLE IF EXISTS `article_category`;

CREATE TABLE `article_category` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `is_parent` bit(1) DEFAULT NULL COMMENT '是否父类',
  `parent_id` varchar(32) NOT NULL DEFAULT '' COMMENT '父类ID',
  `sort_no` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `short_title` varchar(32) NOT NULL DEFAULT '' COMMENT '短标题',
  `relations` varchar(255) NOT NULL DEFAULT '' COMMENT '完整关系',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` varchar(32) NOT NULL DEFAULT '',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_by` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `article_category` */

insert  into `article_category`(`id`,`is_parent`,`parent_id`,`sort_no`,`title`,`short_title`,`relations`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('430917980780498944',NULL,'430917935918223360',1.00,'用户协议','用户协议','430917935918223360,430917980780498944',1,1627029993,'admin',1627029993,'admin'),
('430917935918223360','','0',1.00,'协议','协议','430917935918223360',1,1627029983,'admin',1627029993,'admin'),
('435887662428065792',NULL,'0',2.00,'公告','公告','435887662428065792',1,1628214858,'admin',1628214858,'admin');

/*Table structure for table `article_info` */

DROP TABLE IF EXISTS `article_info`;

CREATE TABLE `article_info` (
  `id` varchar(32) NOT NULL,
  `category_id` varchar(32) NOT NULL DEFAULT '' COMMENT '文章分类ID',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '文章标题',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '文章封面图',
  `summary` text COMMENT '文章简介',
  `content` text COMMENT '文章内容',
  `author` varchar(32) DEFAULT NULL COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` varchar(32) NOT NULL DEFAULT '',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_by` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `article_info` */

insert  into `article_info`(`id`,`category_id`,`title`,`thumb`,`summary`,`content`,`author`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('430919604101976064','430917980780498944','用户协议','','用户协议','<p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">一、总则</span><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">1.1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中勾选&quot;我已阅读并接受&quot;模块即表示用户与产品名称达成协议，完全接受本协议项下的全部条款。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">1.2　用户注册成功后，产品名称将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">1.3　用户可以使用产品名称各个频道单项服务，当用户使用产品名称各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及产品名称在该单项服务中发出的各类公告的同意。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">二、注册信息和隐私保护</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">2.1　产品名称帐号（即产品名称用户ID）的所有权归产品名称，用户完成注册申请后，获得产品名称帐号的使用权。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，产品名称不负任何责任。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">2.2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知产品名称。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，产品名称不承担任何责任。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">2.3　产品名称不对外公开或向第三方提供单个用户的注册资料，除非：</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 事先获得用户的明确授权；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 只有透露您的个人资料，才能提供您所要求的产品和服务；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 根据有关的法律法规要求；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 按照相关政府主管部门的要求；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 为维护产品名称的合法权益。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">2.4　在您注册产品名称，使用其他产品名称产品或服务，访问产品名称网页时，产品名称会收集您的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">三、使用规则</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">3.1　用户在使用产品名称服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 不得为任何非法目的而使用网络服务系统</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">不利用产品名称服务从事以下活动：</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 未经允许，对计算机信息网络功能进行删除、修改或者增加的；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 故意制作、传播计算机病毒等破坏性程序的；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">• 其他危害计算机信息网络安全的行为。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">3.2　用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿数据堂与合作公司、关联公司，并使之免受损害。对此，产品名称有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收产品名称帐号、追究法律责任等措施。对恶意注册产品名称帐号或利用产品名称帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，产品名称有权回收其帐号。同时，产品名称会视司法部门的要求，协助调查。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">3.3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">3.4　用户须对自己在使用产品名称服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在产品名称首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予产品名称等额的赔偿。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">四、服务内容</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.1　产品名称网络服务的具体内容由产品名称根据实际情况提供。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.2　除非您与产品名称另有约定，您同意本服务仅为您个人非商业性质的使用。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.3　产品名称的部分服务是以收费方式提供的，如您使用收费服务，请遵守相关的协议。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.4　产品名称可能根据实际需要对收费服务的收费标准、方式进行修改和变更，产品名称也可能会对部分免费服务开始收费。前述修改、变更或开始收费前，产品名称将在相应服务页面进行通知或公告。如果您不同意上述修改、变更或付费内容，则应停止使用该服务。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.5　产品名称网络需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，产品名称网络无需为此承担任何责任。产品名称网络保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.6　本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于产品名称网络无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，产品名称网络不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，产品名称网络亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、商品或服务所产生的任何损害或损失，产品名称网络不承担任何责任。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.7　产品名称网络对在服务网上得到的任何商品购物服务、交易进程、招聘信息，都不作担保。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.8　产品名称网络有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，产品名称对用户和任何第三人均无需承担任何责任。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">4.9　终止服务</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">您同意产品名称得基于其自行之考虑，因任何理由，包含但不限于产品名称认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并同意，产品名称可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您的帐号及相关信息和文件被关闭或删除，产品名称对您或任何第三人均不承担任何责任。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">5.1　产品名称在本服务中提供的内容（包括但不限于网页、文字、图片、音频、视频、图表等）的知识产权归产品名称所有，用户在使用本服务中所产生的内容的知识产权归用户或相关权利人所有。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">5.2 除另有特别声明外，产品名称提供本服务时所依托软件的著作权、专利权及其他知识产权均归产品名称所有。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">5.3 产品名称在本服务中所使用的“产品名称”等商业标识，其著作权或商标权归产品名称所有。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">5.4 上述及其他任何本服务包含的内容的知识产权均受到法律保护，未经产品名称、用户或相关权利人书面许可，任何人不得以任何形式进行使用或创造相关衍生作品。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">六、未成年人使用条款</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">6.1 若用户未满18周岁，则为未成年人，应在监护人监护、指导下阅读本协议和使用本服务。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">6.2 未成年人用户涉世未深，容易被网络虚象迷惑，且好奇心强，遇事缺乏随机应变的处理能力，很容易被别有用心的人利用而又缺乏自我保护能力。因此，未成年人用户在使用本服务时应注意以下事项，提高安全意识，加强自我保护：</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">（1）认清网络世界与现实世界的区别，避免沉迷于网络，影响日常的学习生活；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">（2）填写个人资料时，加强个人保护意识，以免不良分子对个人生活造成骚扰；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">（3）在监护人或老师的指导下，学习正确使用网络；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">（4）避免陌生网友随意会面或参与联谊活动，以免不法分子有机可乘，危及自身安全。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); line-height: 32px;\"><span style=\"font-weight: 700;\">七、其他</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">7.1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">7.2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向产品名称所在地的人民法院提起诉讼。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">7.3　产品名称未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">7.4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-feature-settings: &quot;kern&quot;; font-kerning: normal; color: rgb(51, 51, 51); font-family: &quot;微软雅黑 Bold&quot;, 微软雅黑; white-space: normal; background-color: rgb(249, 249, 249); font-size: 14px; line-height: 32px;\"><span style=\"font-family: 微软雅黑;\">请您在发现任何违反本服务协议以及其他任何单项服务的服务条款、产品名称各类公告之情形时，通知产品名称。</span></p><p><span style=\"font-family: 微软雅黑;\"><br/></span></p><p><br/></p>','XM 团队',1,1628560800,'admin',1628560800,'admin'),
('430919604101976065','435887662428065792','关于FIL 算力宝正式上线FIL (Filecoin)挖矿的公告','','公告','<p>尊敬的用户：</p><p>FIL 算力宝定于 2021 年 8 月 10 日 10:00 (UCT+8) 上线 FIL (Filecoin)挖矿。具体安排如下：</p><ul class=\" list-paddingleft-2\"><li><p>8&nbsp;月&nbsp;10 日 10：00 开放 USDT、FIL 充值；开放时间可能会根据实际充值情况进行调整（提前或推迟）；</p></li><li><p>2021 年 8 月 10 日 10:00 (UCT+8) 开放算力购买；</p></li><li><p>单个账户每次至少购买 1T 算力，上不封顶；</p></li><li><p>购买算力后，系统将立即扣除抵押代币；</p></li><li><p>完成购买后实行 T+1 产币，即算力购买成功后第二日 0点--1点 系统将自动进行收益结算，并自动扣除服务费。</p></li></ul><p>风险提示：</p><p>1.用户在进行充币前，建议仔细阅读该币充提页面的提示，以避免因为充值金额小于最小购买金额而无法成功购买算力。</p><ol class=\" list-paddingleft-2\"><li><p>数字资产交易是一种高风险的交易方式，可能导致部分或全部损失。请用户谨慎参与，在决定买卖之前慎重考虑交易数字资产的经验和能够承受风险的程度。本公告的内容和其他在 FIL 算力宝的信息不构成投资建议，FIL 算力宝不会承担任何依赖这些信息而产生的直接或间接损失。FIL 算力宝不对交易行为承担担保、赔偿等责任。</p></li></ol><p>FIL 算力宝</p><p>2021.8.10</p>','FIL 算力宝',1,1628560800,'admin',1628560800,'admin'),
('430919604101976066','435887662428065792','了凡社区周年庆FIL 活动开始啦！8000U FIL算力等你来瓜分（公告）','','公告','<p>尊敬的用户：</p><p>了凡社区已经成立一周年啦！为了感谢新老会员的支持与信任，了凡社区为此开起了一周年豪礼大放送活动。您可通过大转盘抽奖的方式参与活动，价值8000USDT的FIL算力等你来瓜分！</p><p>活动时间：2021年8月12日10:00 - 2021年8月25日24:00（UTC+8）</p><p>活动规则：关注了凡社区微信公众号并点击主页下方菜单栏的“抽奖——FIL”进行参与，每人每天3次抽奖机会。本期了凡社区将抽取69名幸运用户，详细获奖规则如下：</p><table><thead><tr><th style=\"text-align: left;\">抽中奖项</th><th style=\"text-align: left;\">可获奖人数</th><th style=\"text-align: left;\">奖品</th></tr></thead><tbody><tr><td style=\"text-align: left;\">一等奖</td><td style=\"text-align: left;\">1名</td><td style=\"text-align: left;\">3T FIL算力</td></tr><tr><td style=\"text-align: left;\">二等奖</td><td style=\"text-align: left;\">3名</td><td style=\"text-align: left;\">2T FIL算力</td></tr><tr><td style=\"text-align: left;\">三等奖</td><td style=\"text-align: left;\">5名</td><td style=\"text-align: left;\">1T FIL算力</td></tr><tr><td style=\"text-align: left;\">四等奖</td><td style=\"text-align: left;\">10名</td><td style=\"text-align: left;\">1T FIL算力五折券</td></tr><tr><td style=\"text-align: left;\">五等奖</td><td style=\"text-align: left;\">20名</td><td style=\"text-align: left;\">1T FIL算力七折券</td></tr><tr><td style=\"text-align: left;\">六等奖</td><td style=\"text-align: left;\">30名</td><td style=\"text-align: left;\">1T FIL算力九折券</td></tr></tbody></table><p>参与链接：</p><p>活动教程：</p><p>注：1.活动最终解释权归主办方所有；</p><p>2.活动不产生购买任何数字资产的建议。</p><p>风险提示：数字货币交易存在巨大风险，请务必注意市场风险，谨慎购买。</p><p>了凡社区保留随时全权酌情因任何理由修改、变更或取消此公告的权利，无需事先通知。</p><p>了凡社区团队</p><p>2021年8月10日</p>','FIL 算力宝',1,1628560800,'admin',1628560800,'admin');

/*Table structure for table `cfg_assets_info` */

DROP TABLE IF EXISTS `cfg_assets_info`;

CREATE TABLE `cfg_assets_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL DEFAULT '' COMMENT '资产编码',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '资产图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序(从大到小)',
  `status` varchar(8) NOT NULL DEFAULT '启用' COMMENT '状态：启用、禁用',
  `withdraw_status` varchar(8) NOT NULL DEFAULT '启用' COMMENT '提币状态：启用、禁用',
  `day_withdraw_times` smallint(1) NOT NULL DEFAULT '1' COMMENT '每日提币次数',
  `min_withdraw_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '提币最小限额，0：不限制',
  `max_withdraw_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '提币最大限额，0：不限制',
  `fee_json` varchar(255) NOT NULL DEFAULT '{}' COMMENT '手续费：{"ERC20":3,"TRC20":1} / {"DEFAULT":1}',
  `created_at` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='资产信息';

/*Data for the table `cfg_assets_info` */

insert  into `cfg_assets_info`(`id`,`code`,`icon`,`sort`,`status`,`withdraw_status`,`day_withdraw_times`,`min_withdraw_amount`,`max_withdraw_amount`,`fee_json`,`created_at`) values 
(1,'FIL','',0,'启用','启用',1,1.00000000,0.00000000,'{\"DEFAULT\":0.025}',1628560800),
(2,'USDT','',0,'启用','启用',1,5.00000000,0.00000000,'{\"ERC20\":3,\"TRC20\":1,\"DEFAULT\":1}',1628560800);

/*Table structure for table `cfg_cooperation` */

DROP TABLE IF EXISTS `cfg_cooperation`;

CREATE TABLE `cfg_cooperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '档位名称',
  `min_recommend_num` int(11) NOT NULL DEFAULT '0' COMMENT '最小推荐数量',
  `max_recommend_num` int(11) NOT NULL DEFAULT '0' COMMENT '最大推荐数量',
  `cooperation_per` int(11) NOT NULL DEFAULT '0' COMMENT '合作奖百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='合作奖配置表';

/*Data for the table `cfg_cooperation` */

insert  into `cfg_cooperation`(`id`,`name`,`min_recommend_num`,`max_recommend_num`,`cooperation_per`) values 
(1,'一档',1,2,5),
(2,'二档',3,5,8),
(3,'三档',6,0,10);

/*Table structure for table `cfg_level_info` */

DROP TABLE IF EXISTS `cfg_level_info`;

CREATE TABLE `cfg_level_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_history_children_power` int(11) NOT NULL DEFAULT '0' COMMENT '伞下历史总算力最小要求',
  `win_per` int(11) NOT NULL DEFAULT '0' COMMENT '共赢奖百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='等级信息表';

/*Data for the table `cfg_level_info` */

insert  into `cfg_level_info`(`id`,`name`,`min_history_children_power`,`win_per`) values 
(1,'普通用户',0,0),
(2,'激活用户',0,0),
(3,'经理',100,2),
(4,'总监',500,3),
(5,'总裁',1000,4);

/*Table structure for table `cfg_product_info` */

DROP TABLE IF EXISTS `cfg_product_info`;

CREATE TABLE `cfg_product_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '产品名称',
  `min_power` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '产品算力最小值（单位T）',
  `max_power` int(11) NOT NULL DEFAULT '0' COMMENT '产品算力最大值（单位T）',
  `deduction_usdt_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '每T算力扣除USDT数量',
  `pledge_fil_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '每T算力质押FIL数量',
  `pledge_fil_days` int(11) NOT NULL DEFAULT '0' COMMENT '质押FIL天数',
  `production_days` int(11) NOT NULL DEFAULT '0' COMMENT '生产天数',
  `discount_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '折扣说明',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '产品说明',
  `status` varchar(10) NOT NULL DEFAULT '启用' COMMENT '状态：启用、禁用',
  `created_at` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='产品算力配置表';

/*Data for the table `cfg_product_info` */

insert  into `cfg_product_info`(`id`,`name`,`min_power`,`max_power`,`deduction_usdt_amount`,`pledge_fil_amount`,`pledge_fil_days`,`production_days`,`discount_remark`,`remark`,`status`,`created_at`) values 
(1,'套餐1',1,4,319.00000000,7.00000000,1080,1080,'100','','启用',1628560800),
(2,'套餐2',5,9,309.00000000,7.00000000,1080,1080,'100','','启用',1628560800),
(3,'套餐3',10,99999,289.00000000,7.00000000,1080,1080,'100','','启用',1628560800);

/*Table structure for table `cfg_setting` */

DROP TABLE IF EXISTS `cfg_setting`;

CREATE TABLE `cfg_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_surplus_power` int(11) NOT NULL DEFAULT '0' COMMENT '矿池剩余算力数量',
  `pool_power_production` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '矿池每T算力FIL产量',
  `power_production_transfer_pre` decimal(6,2) NOT NULL DEFAULT '0.25' COMMENT '每T算力FIL产量划拨比例',
  `power_production_release_pre` decimal(6,2) NOT NULL DEFAULT '0.75' COMMENT '每T算力FIL产量释放例',
  `power_production_release_days` int(11) NOT NULL DEFAULT '180' COMMENT '矿池每T算力FIL产量释放天数',
  `win_reward_distribute_date` date DEFAULT '2021-10-01' COMMENT '共赢奖首次派发日期',
  `win_reward_distribute_cycle` int(11) DEFAULT '1' COMMENT '共赢奖派发周期（月）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='配置表';

/*Data for the table `cfg_setting` */

insert  into `cfg_setting`(`id`,`pool_surplus_power`,`pool_power_production`,`power_production_transfer_pre`,`power_production_release_pre`,`power_production_release_days`,`win_reward_distribute_date`,`win_reward_distribute_cycle`) values 
(1,248,0.03001000,0.25,0.75,180,'2021-10-01',1);

/*Table structure for table `settlement_cooperation` */

DROP TABLE IF EXISTS `settlement_cooperation`;

CREATE TABLE `settlement_cooperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settlement_date` datetime NOT NULL COMMENT '结算日',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被奖励用户ID',
  `cooperation_per` int(11) NOT NULL DEFAULT '0' COMMENT '合作奖百分比',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源用户ID',
  `from_user_product_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源用户产品订单ID',
  `assets_code` varchar(16) NOT NULL DEFAULT '' COMMENT '资产编码',
  `assets_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '资产数量',
  `status` varchar(16) NOT NULL DEFAULT '未派发' COMMENT '状态：未派发，已派发',
  PRIMARY KEY (`id`),
  KEY `settlement_date` (`settlement_date`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  KEY `from_user_product_order_id` (`from_user_product_order_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `settlement_cooperation` */

insert  into `settlement_cooperation`(`id`,`settlement_date`,`user_id`,`cooperation_per`,`from_user_id`,`from_user_product_order_id`,`assets_code`,`assets_amount`,`status`) values 
(1,'2021-08-11 00:05:00',2,10,6,3,'USDT',31.90000000,'已派发'),
(2,'2021-08-11 00:05:00',3,10,7,21,'USDT',31.90000000,'已派发'),
(3,'2021-08-11 00:05:00',4,10,12,18,'USDT',31.90000000,'已派发'),
(4,'2021-08-11 00:05:00',5,10,13,1,'USDT',31.90000000,'已派发'),
(5,'2021-08-11 00:05:00',13,5,14,2,'USDT',15.95000000,'已派发'),
(6,'2021-08-11 00:05:00',14,5,15,5,'USDT',15.95000000,'已派发'),
(7,'2021-08-11 00:05:00',6,10,17,4,'USDT',31.90000000,'已派发'),
(8,'2021-08-11 00:05:00',17,8,18,11,'USDT',25.52000000,'已派发'),
(9,'2021-08-11 00:05:00',6,10,19,14,'USDT',606.90000000,'已派发'),
(10,'2021-08-11 00:05:00',17,8,20,12,'USDT',25.52000000,'已派发'),
(11,'2021-08-11 00:05:00',17,8,21,6,'USDT',25.52000000,'已派发'),
(12,'2021-08-11 00:05:00',17,8,22,7,'USDT',25.52000000,'已派发'),
(13,'2021-08-11 00:05:00',6,10,23,8,'USDT',31.90000000,'已派发'),
(14,'2021-08-11 00:05:00',6,10,23,9,'USDT',31.90000000,'已派发'),
(15,'2021-08-11 00:05:00',6,10,23,10,'USDT',31.90000000,'已派发'),
(16,'2021-08-11 00:05:00',22,5,25,13,'USDT',63.80000000,'已派发'),
(17,'2021-08-11 00:05:00',18,5,26,15,'USDT',15.95000000,'已派发'),
(18,'2021-08-11 00:05:00',20,5,28,16,'USDT',63.80000000,'已派发'),
(19,'2021-08-11 00:05:00',21,5,45,17,'USDT',15.95000000,'已派发'),
(20,'2021-08-11 00:05:00',12,10,47,19,'USDT',31.90000000,'已派发'),
(21,'2021-08-11 00:05:00',18,5,50,20,'USDT',15.95000000,'已派发'),
(22,'2021-08-11 00:05:00',47,5,51,22,'USDT',15.95000000,'已派发'),
(23,'2021-08-11 00:05:00',47,5,53,23,'USDT',15.95000000,'已派发'),
(24,'2021-08-11 00:05:00',7,10,54,24,'USDT',31.90000000,'已派发'),
(25,'2021-08-11 00:05:00',7,10,56,25,'USDT',31.90000000,'已派发'),
(26,'2021-08-11 00:05:00',12,10,59,26,'USDT',31.90000000,'已派发');

/*Table structure for table `settlement_win` */

DROP TABLE IF EXISTS `settlement_win`;

CREATE TABLE `settlement_win` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settlement_date` datetime NOT NULL COMMENT '结算日',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被奖励用户ID',
  `user_win_per` int(11) NOT NULL DEFAULT '0' COMMENT '用户共赢奖比例',
  `assets_code` varchar(16) NOT NULL DEFAULT '' COMMENT '资产编码',
  `assets_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '资产数量',
  `children_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源子用户ID',
  `children_user_win_per` int(11) NOT NULL DEFAULT '0' COMMENT '子用户共赢奖比例',
  `children_user_today_income_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '子用户当日收入：当日产出划拨 + 当日产出释放',
  `children_user_children_today_income_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '子用户伞下当日收入：当日产出划拨 + 当日产出释放',
  `status` varchar(16) NOT NULL DEFAULT '未派发' COMMENT '状态：未派发，已派发',
  PRIMARY KEY (`id`),
  KEY `settlement_date` (`settlement_date`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `children_user_id` (`children_user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

/*Data for the table `settlement_win` */

insert  into `settlement_win`(`id`,`settlement_date`,`user_id`,`user_win_per`,`assets_code`,`assets_amount`,`children_user_id`,`children_user_win_per`,`children_user_today_income_amount`,`children_user_children_today_income_amount`,`status`) values 
(1,'2021-08-11 00:05:00',4,4,'FIL',0.00030510,12,4,0.00762754,0.03051016,'未派发'),
(2,'2021-08-11 00:05:00',5,4,'FIL',0.00091530,13,0,0.00762754,0.01525508,'未派发'),
(3,'2021-08-11 00:05:00',6,4,'FIL',0.00640713,19,0,0.16017837,0.00000000,'未派发'),
(4,'2021-08-11 00:05:00',6,4,'FIL',0.00488162,17,0,0.00762754,0.11441310,'未派发'),
(5,'2021-08-11 00:05:00',6,4,'FIL',0.00091530,23,0,0.02288262,0.00000000,'未派发'),
(6,'2021-08-11 00:05:00',3,4,'FIL',0.00030510,7,4,0.00762754,0.01525508,'未派发'),
(7,'2021-08-11 00:05:00',12,4,'FIL',0.00030510,59,0,0.00762754,0.00000000,'未派发'),
(8,'2021-08-11 00:05:00',2,4,'FIL',0.00030510,6,4,0.00762754,0.30510163,'未派发'),
(9,'2021-08-11 00:05:00',12,4,'FIL',0.00091530,47,0,0.00762754,0.01525508,'未派发'),
(10,'2021-08-11 00:05:00',7,4,'FIL',0.00030510,56,0,0.00762754,0.00000000,'未派发'),
(11,'2021-08-11 00:05:00',7,4,'FIL',0.00030510,54,0,0.00762754,0.00000000,'未派发'),
(12,'2021-08-11 09:53:21',4,4,'FIL',0.00031510,12,4,0.00787762,0.03151048,'未派发'),
(13,'2021-08-11 09:53:21',5,4,'FIL',0.00094530,13,0,0.00787762,0.01575524,'未派发'),
(14,'2021-08-11 09:53:21',6,4,'FIL',0.00661720,19,0,0.16543011,0.00000000,'未派发'),
(15,'2021-08-11 09:53:21',6,4,'FIL',0.00504167,17,0,0.00787762,0.11816430,'未派发'),
(16,'2021-08-11 09:53:21',6,4,'FIL',0.00094531,23,0,0.02363286,0.00000000,'未派发'),
(17,'2021-08-11 09:53:21',3,4,'FIL',0.00031510,7,4,0.00787762,0.01575524,'未派发'),
(18,'2021-08-11 09:53:21',12,4,'FIL',0.00031510,59,0,0.00787762,0.00000000,'未派发'),
(19,'2021-08-11 09:53:21',2,4,'FIL',0.00031510,6,4,0.00787762,0.31510489,'未派发'),
(20,'2021-08-11 09:53:21',12,4,'FIL',0.00094530,47,0,0.00787762,0.01575524,'未派发'),
(21,'2021-08-11 09:53:21',7,4,'FIL',0.00031510,56,0,0.00787762,0.00000000,'未派发'),
(22,'2021-08-11 09:53:21',7,4,'FIL',0.00031510,54,0,0.00787762,0.00000000,'未派发');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `sys_admin` */

insert  into `sys_admin`(`id`,`username`,`password`,`avatar`,`description`,`email`,`mobile`,`nickname`,`sex`,`status`,`role_id`,`department_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'admin','$2a$10$XaPueYVD74oGnlJJv/GzqunAvy8E6FBCcaL3PfxIvQ5p7B1/ik8L2','','超级管理员','DM@gmail.com','13888888888','超级管理员',1,1,9,1,1582959143,'admin',1629521450,'admin'),
(2,'zhanshan','$2a$10$ntE8WKJ5nKFqBpUU7IV59uWeHRN3EI/5L6EbkjUeXA9S7mYhTLB2u','','测试人员1','admin@qq.com','13555555555','张三',1,1,1,3,1626834498,'admin',1628836038,'admin'),
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

/*Table structure for table `sys_admin_role` */

DROP TABLE IF EXISTS `sys_admin_role`;

CREATE TABLE `sys_admin_role` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL DEFAULT '',
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` varchar(32) NOT NULL DEFAULT '',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_by` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_admin_role` */

insert  into `sys_admin_role`(`id`,`role_id`,`user_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('51919463095734273','496138616573953','51919414177566720',1582959143,'admin',1582959143,'admin'),
('126616146991386624','496138616573952','47599079840026624',1582959143,'admin',1582959143,'admin'),
('116844842029420544','496138616573952','116844841647738880',1582959143,'admin',1582959143,'admin'),
('116847350214823936','496138616573952','116846552936353792',1582959143,'admin',1582959143,'admin'),
('116851632993472512','116849032776650752','116847659427303424',1582959143,'admin',1582959143,'admin'),
('116850548648448000','496138616573952','116848891118227456',1582959143,'admin',1582959143,'admin'),
('117180303184760832','496138616573953','117180302777913344',1582959143,'admin',1582959143,'admin');

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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`type`,`name`,`parent_id`,`path`,`method`,`sort_order`,`icon`,`url`,`component`,`permision_code`,`status`,`is_display`,`is_external_link`,`is_cache`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,0,'系统管理',0,'1','',1.00,'ant-design:setting-outlined','/system','','',1,1,0,0,1629079245,'admin',1629958524,'admin'),
(2,1,'账号管理',1,'1,2','',1.00,'ant-design:usergroup-add-outlined','/system/account','/demo/system/account/index','system:account',1,1,0,1,1629088689,'admin',1629958526,'admin'),
(3,1,'角色管理',1,'1,3','',2.00,'ant-design:experiment-filled','system/role','/demo/system/role/index','system:role',1,1,0,1,1629088812,'admin',1629958529,'admin'),
(4,1,'菜单管理',1,'1,4','',3.00,'ant-design:unordered-list-outlined','/system/menu','/demo/system/menu/index','system:menu',1,1,0,1,1629088897,'admin',1629958531,'admin'),
(5,1,'部门管理',1,'1,5','',3.00,'ant-design:appstore-filled','/skeleton/department/*','/demo/system/dept/index','system:dept',1,1,0,1,1629088944,'admin',1630294865,'admin'),
(6,1,'首页',0,'6','',0.00,'ant-design:home-outlined','/dashboard','/dashboard/analysis/index','dashboard:home',1,1,0,0,1629521812,'admin',1629958521,'admin'),
(13,2,'编辑菜单',4,'1,4,13','POST',4.00,'','/permission/edit','','menu:btn:edit',1,0,0,0,1629521812,'admin',1630300030,'admin'),
(10,2,'获取用户信息',0,'10','GET',0.00,'','/admin/userInfo','','',1,0,0,0,1629521812,'admin',1630300030,'admin'),
(11,2,'获取用户菜单',4,'1,4,11','GET',2.00,'','/permission/getMenuList','','menu:btn:user',1,0,0,0,1629521812,'admin',1630300002,'admin'),
(12,2,'获取全部菜单',4,'1,4,12','GET',1.00,'','/permission/getMenuTree','','menu:btn:all',1,0,0,0,1629521812,'admin',1630299986,'admin'),
(14,2,'获取用户权限码',4,'1,4,14','GET',2.10,'','/permission/getPermCode','','menu:btn:code',1,1,0,0,1629521812,'admin',1630300153,'admin'),
(15,2,'添加菜单',4,'1,4,15','POST',3.00,'','/permission/add','','menu:btn:add',1,1,0,0,1629521812,'admin',1630300014,'admin'),
(16,2,'帐号列表',2,'1,2,16','GET',1.00,'','/admin/getAccountList','','admin:btn:list',1,0,0,0,1630293964,'admin',1630300249,'admin'),
(17,2,'角色列表',3,'1,3,17','GET',1.00,'','/role/getRoleList','','role:btn:list',1,1,0,0,1630294081,'admin',1630300218,'admin'),
(18,2,'编辑角色',3,'1,3,18','POST',3.00,'','/role/edit','','role:btn:edit',1,1,0,0,1630294225,'admin',1630299341,'admin'),
(19,2,'部门列表',5,'1,5,19','GET',1.00,'','/department/getDepartmentTree','','dept:btn:list',1,1,0,0,1630295040,'admin',1630299928,'admin'),
(20,2,'添加部门',5,'1,5,20','POST',2.00,'','/department/add','','dept:btn:add',1,1,0,0,1630295445,'admin',1630295445,'admin'),
(21,2,'编辑部门',5,'1,5,21','POST',3.00,'','/department/edit','','dept:btn:edit',1,1,0,0,1630295482,'admin',1630295482,'admin'),
(22,2,'添加帐号',2,'1,2,22','POST',3.00,'','/admin/add','','admin:btn:add',1,1,0,0,1630298703,'admin',1630298703,'admin'),
(23,2,'编辑帐号',2,'1,2,23','POST',3.00,'','/admin/edit','','admin:btn:edit',1,1,0,0,1630298743,'admin',1630298743,'admin'),
(24,2,'删除帐号',2,'1,2,24','DELETE',4.00,'','/admin/delete/*','','admin:btn:delete',1,1,0,0,1630298780,'admin',1630299095,'admin'),
(25,2,'获取所有角色',3,'1,3,25','GET',1.10,'','/role/getAllRoleList','','role:btn:all',1,1,0,0,1630298909,'admin',1630299361,'admin'),
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
(9,'超级管理员','ROLE_ADMIN','超级管理员角色',1,1629089045,'admin',1630300604,'admin');

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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

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
(54,2,9,1629958420,'admin',1629958420,'admin'),
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
(80,22,9,1630298966,'admin',1630298966,'admin'),
(81,23,9,1630298998,'admin',1630298998,'admin'),
(82,24,9,1630299017,'admin',1630299017,'admin'),
(83,26,9,1630299524,'admin',1630299524,'admin'),
(90,29,9,1630300490,'admin',1630300490,'admin'),
(91,19,9,1630300604,'admin',1630300604,'admin'),
(88,27,9,1630299535,'admin',1630299535,'admin');

/*Table structure for table `user_assets` */

DROP TABLE IF EXISTS `user_assets`;

CREATE TABLE `user_assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `assets_code` varchar(16) NOT NULL DEFAULT '' COMMENT '资产编码',
  `withdraw_address` varchar(128) NOT NULL DEFAULT '' COMMENT '提取地址',
  `available_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '可用资产数量',
  `pledge_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '质押资产数量',
  `frozen_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '冻结资产数量',
  `withdraw_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '提取资产数量',
  `today_production_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '当日产出资产数量：产量-服务费',
  `history_production_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '历史产出资产数量：产量-服务费',
  `today_transfer_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '当日划拨资产数量：产出 * 25%',
  `history_transfer_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '历史划拨资产数量：产出 * 25%',
  `today_release_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '当日释放资产数量：产出 * 75% / 180',
  `history_release_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '历史释放资产数量：产出 * 75% / 180',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `withdraw_address` (`withdraw_address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COMMENT='用户资产信息';

/*Data for the table `user_assets` */

insert  into `user_assets`(`id`,`user_id`,`assets_code`,`withdraw_address`,`available_amount`,`pledge_amount`,`frozen_amount`,`withdraw_amount`,`today_production_amount`,`history_production_amount`,`today_transfer_amount`,`history_transfer_amount`,`today_release_amount`,`history_release_amount`) values 
(1,1,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(2,1,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(3,2,'USDT','',31.90000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(4,2,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(5,3,'USDT','',31.90000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(6,3,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(7,4,'USDT','',31.90000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(8,4,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(9,5,'USDT','',31.90000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(10,5,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(11,6,'USDT','',734.50000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(12,6,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(13,7,'USDT','',63.80000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(14,7,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(15,8,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(16,8,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(17,9,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(18,9,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(19,10,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(20,10,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(21,11,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(22,11,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(23,12,'USDT','',63.80000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(24,12,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(25,13,'USDT','',15.95000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(26,13,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(27,14,'USDT','',15.95000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(28,14,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(29,15,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(30,15,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(31,16,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(32,16,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(33,17,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(34,17,'USDT','',102.08000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(35,18,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(36,18,'USDT','',31.90000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(37,19,'FIL','',0.48316098,147.00000000,0.00000000,0.00000000,0.63021000,1.89063000,0.15755250,0.47265750,0.00787761,0.01050348),
(38,19,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(39,20,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(40,20,'USDT','',63.80000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(41,21,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(42,21,'USDT','',15.95000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(43,22,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(44,22,'USDT','',0.00000000,0.00000000,63.80000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(45,23,'FIL','',0.06902298,21.00000000,0.00000000,0.00000000,0.09003000,0.27009000,0.02250750,0.06752250,0.00112536,0.00150048),
(46,23,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(47,24,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(48,24,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(49,25,'FIL','',0.09203064,28.00000000,0.00000000,0.00000000,0.12004000,0.36012000,0.03001000,0.09003000,0.00150048,0.00200064),
(50,25,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(51,26,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(52,26,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(53,27,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(54,27,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(55,28,'FIL','',0.09203064,28.00000000,0.00000000,0.00000000,0.12004000,0.36012000,0.03001000,0.09003000,0.00150048,0.00200064),
(56,28,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(57,29,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(58,29,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(59,30,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(60,30,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(61,31,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(62,31,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(63,32,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(64,32,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(65,33,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(66,33,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(67,34,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(68,34,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(69,35,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(70,35,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(71,36,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(72,36,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(73,37,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(74,37,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(75,38,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(76,38,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(77,39,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(78,39,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(79,40,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(80,40,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(81,41,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(82,41,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(83,42,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(84,42,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(85,43,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(86,43,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(87,44,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(88,44,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(89,45,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(90,45,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(91,46,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(92,46,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(93,47,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(94,47,'USDT','',31.90000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(95,48,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(96,48,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(97,49,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(98,49,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(99,50,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(100,50,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(101,51,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(102,51,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(103,52,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(104,52,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(105,53,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(106,53,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(107,54,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(108,54,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(109,55,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(110,55,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(111,56,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(112,56,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(113,57,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(114,57,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(115,58,'FIL','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(116,58,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000),
(117,59,'FIL','',0.02300766,7.00000000,0.00000000,0.00000000,0.03001000,0.09003000,0.00750250,0.02250750,0.00037512,0.00050016),
(118,59,'USDT','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000);

/*Table structure for table `user_assets_log` */

DROP TABLE IF EXISTS `user_assets_log`;

CREATE TABLE `user_assets_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `account_type` varchar(16) NOT NULL DEFAULT '' COMMENT '帐目类型：入帐、出帐',
  `event_type` varchar(32) NOT NULL DEFAULT '' COMMENT '事件类型：充值、提现、购买算力、质押、手续费、每日产出、推荐奖励、分红奖励',
  `event_source_flag` varchar(128) NOT NULL DEFAULT '' COMMENT '事件来源（可以是Code，也可以是Id，关联对应的业务关键字）',
  `assets_code` varchar(16) NOT NULL DEFAULT '' COMMENT '资产编码',
  `assets_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '资产数量',
  `show_content` varchar(1000) NOT NULL DEFAULT '' COMMENT '显示内容',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `account_type` (`account_type`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `event_type` (`event_type`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COMMENT='用户资产日志';

/*Data for the table `user_assets_log` */

insert  into `user_assets_log`(`id`,`user_id`,`account_type`,`event_type`,`event_source_flag`,`assets_code`,`assets_amount`,`show_content`,`created_at`) values 
(1,13,'入帐','人工充值','1','FIL',7.00000000,'杰哥 因 人工充值 入帐 FIL : 7',1628562320),
(2,13,'入帐','人工充值','2','USDT',319.00000000,'杰哥 因 人工充值 入帐 USDT : 319',1628562339),
(3,13,'出帐','购买订单','POTSU757O4WXOH3G','USDT',319.00000000,'杰哥 因 购买订单 出帐 USDT : 319.00000000',1628562382),
(4,14,'入帐','人工充值','3','FIL',7.00000000,'88559 因 人工充值 入帐 FIL : 7',1628562687),
(5,14,'入帐','人工充值','4','USDT',319.00000000,'88559 因 人工充值 入帐 USDT : 319',1628562703),
(6,15,'入帐','人工充值','5','FIL',7.00000000,'13143 因 人工充值 入帐 FIL : 7',1628562916),
(7,15,'入帐','人工充值','6','USDT',319.00000000,'13143 因 人工充值 入帐 USDT : 319',1628562925),
(8,6,'入帐','人工充值','7','FIL',7.00000000,'韦总 因 人工充值 入帐 FIL : 7',1628563083),
(9,6,'入帐','人工充值','8','USDT',319.00000000,'韦总 因 人工充值 入帐 USDT : 319',1628563096),
(10,14,'出帐','购买订单','POKW36MP6P5S8NMS','USDT',319.00000000,'88559 因 购买订单 出帐 USDT : 319.00000000',1628563282),
(11,7,'入帐','人工充值','9','FIL',7.00000000,'谢总 因 人工充值 入帐 FIL : 7',1628563487),
(12,7,'入帐','人工充值','10','USDT',319.00000000,'谢总 因 人工充值 入帐 USDT : 319',1628563501),
(13,6,'出帐','购买订单','POOPXVSIYGXW2A9R','USDT',319.00000000,'韦总 因 购买订单 出帐 USDT : 319.00000000',1628563538),
(14,17,'入帐','人工充值','11','FIL',7.00000000,'苏芸会所 因 人工充值 入帐 FIL : 7',1628564370),
(15,17,'入帐','人工充值','12','USDT',319.00000000,'苏芸会所 因 人工充值 入帐 USDT : 319',1628564380),
(16,17,'出帐','购买订单','POPQHRH9MZBKSKBY','USDT',319.00000000,'苏芸会所 因 购买订单 出帐 USDT : 319.00000000',1628564416),
(17,15,'出帐','购买订单','PO4V2KJG4G92ACE0','USDT',319.00000000,'13143 因 购买订单 出帐 USDT : 319.00000000',1628564848),
(18,20,'入帐','人工充值','13','FIL',7.00000000,'zjb9279 因 人工充值 入帐 FIL : 7',1628565070),
(19,20,'入帐','人工充值','14','USDT',319.00000000,'zjb9279 因 人工充值 入帐 USDT : 319',1628565081),
(20,18,'入帐','人工充值','15','FIL',7.00000000,'纷纷mm 因 人工充值 入帐 FIL : 7',1628565457),
(21,18,'入帐','人工充值','16','USDT',319.00000000,'纷纷mm 因 人工充值 入帐 USDT : 319',1628565466),
(22,21,'入帐','人工充值','17','FIL',7.00000000,'韦苏芸 因 人工充值 入帐 FIL : 7',1628565491),
(23,21,'入帐','人工充值','18','USDT',319.00000000,'韦苏芸 因 人工充值 入帐 USDT : 319',1628565501),
(24,22,'入帐','人工充值','19','FIL',7.00000000,'人怕出名猪怕壮 因 人工充值 入帐 FIL : 7',1628565529),
(25,22,'入帐','人工充值','20','USDT',319.00000000,'人怕出名猪怕壮 因 人工充值 入帐 USDT : 319',1628565541),
(28,23,'入帐','人工充值','23','FIL',21.00000000,'喲濕誰 因 人工充值 入帐 FIL : 21',1628565617),
(29,23,'入帐','人工充值','24','USDT',957.00000000,'喲濕誰 因 人工充值 入帐 USDT : 957',1628565640),
(30,21,'出帐','购买订单','POTQLRH6FYXXSIUC','USDT',319.00000000,'韦苏芸 因 购买订单 出帐 USDT : 319.00000000',1628565694),
(31,22,'出帐','购买订单','PONA875TZ608UZIP','USDT',319.00000000,'人怕出名猪怕壮 因 购买订单 出帐 USDT : 319.00000000',1628565720),
(32,23,'出帐','购买订单','POX8120XW413QB00','USDT',319.00000000,'喲濕誰 因 购买订单 出帐 USDT : 319.00000000',1628565808),
(33,23,'出帐','购买订单','PO6A35AAYC9ER6NH','USDT',319.00000000,'喲濕誰 因 购买订单 出帐 USDT : 319.00000000',1628565815),
(34,23,'出帐','购买订单','POXM1JOOLMV6C0SJ','USDT',319.00000000,'喲濕誰 因 购买订单 出帐 USDT : 319.00000000',1628565825),
(35,18,'出帐','购买订单','POZJBAT17A54ELUO','USDT',319.00000000,'纷纷mm 因 购买订单 出帐 USDT : 319.00000000',1628565998),
(36,20,'出帐','购买订单','POVUWLHR7NLBHXIN','USDT',319.00000000,'zjb9279 因 购买订单 出帐 USDT : 319.00000000',1628566020),
(37,25,'入帐','人工充值','25','FIL',28.00000000,'一只成熟的癞蛤蟆 因 人工充值 入帐 FIL : 28',1628566101),
(38,25,'入帐','人工充值','26','USDT',1276.00000000,'一只成熟的癞蛤蟆 因 人工充值 入帐 USDT : 1276',1628566134),
(39,25,'出帐','购买订单','POPMXQQJNVOPJ4WN','USDT',1276.00000000,'一只成熟的癞蛤蟆 因 购买订单 出帐 USDT : 1276.00000000',1628566187),
(42,28,'入帐','人工充值','29','FIL',28.00000000,'ZJB9279 因 人工充值 入帐 FIL : 28',1628566720),
(43,28,'入帐','人工充值','30','USDT',1276.00000000,'ZJB9279 因 人工充值 入帐 USDT : 1276',1628566737),
(45,19,'入帐','人工充值','32','FIL',147.00000000,'佳佳FIL 因 人工充值 入帐 FIL : 147',1628567191),
(46,19,'入帐','人工充值','33','USDT',6069.00000000,'佳佳FIL 因 人工充值 入帐 USDT : 6069',1628567218),
(47,19,'出帐','购买订单','PO8RRGQ345KKUODR','USDT',6069.00000000,'佳佳FIL 因 购买订单 出帐 USDT : 6069.00000000',1628567299),
(50,26,'入帐','人工充值','36','FIL',7.00000000,'均均同学 因 人工充值 入帐 FIL : 7',1628568069),
(51,26,'入帐','人工充值','37','USDT',319.00000000,'均均同学 因 人工充值 入帐 USDT : 319',1628568082),
(52,26,'出帐','购买订单','POH0N1F8MTWWDFEG','USDT',319.00000000,'均均同学 因 购买订单 出帐 USDT : 319.00000000',1628568310),
(53,28,'出帐','购买订单','PO65NF7QLOKZ9322','USDT',1276.00000000,'ZJB9279 因 购买订单 出帐 USDT : 1276.00000000',1628568751),
(54,12,'入帐','人工充值','38','USDT',319.00000000,'蔡总 因 人工充值 入帐 USDT : 319',1628569548),
(55,12,'入帐','人工充值','39','FIL',7.00000000,'蔡总 因 人工充值 入帐 FIL : 7',1628569548),
(56,45,'入帐','人工充值','40','USDT',319.00000000,'梁运财 因 人工充值 入帐 USDT : 319',1628569653),
(57,45,'入帐','人工充值','41','FIL',7.00000000,'梁运财 因 人工充值 入帐 FIL : 7',1628569653),
(58,45,'出帐','购买订单','POWFAERRLGZLZ4QK','USDT',319.00000000,'梁运财 因 购买订单 出帐 USDT : 319.00000000',1628569988),
(59,12,'出帐','购买订单','POJ7XBD01KJZQ7NQ','USDT',319.00000000,'蔡总 因 购买订单 出帐 USDT : 319.00000000',1628570022),
(60,47,'入帐','人工充值','42','USDT',319.00000000,'袁子涵 因 人工充值 入帐 USDT : 319',1628570731),
(61,47,'入帐','人工充值','43','FIL',7.00000000,'袁子涵 因 人工充值 入帐 FIL : 7',1628570731),
(62,47,'出帐','购买订单','PO63RZ2MWPL5NRHL','USDT',319.00000000,'袁子涵 因 购买订单 出帐 USDT : 319.00000000',1628570766),
(63,50,'入帐','人工充值','44','USDT',319.00000000,'覃菊友 因 人工充值 入帐 USDT : 319',1628574699),
(64,50,'入帐','人工充值','45','FIL',7.00000000,'覃菊友 因 人工充值 入帐 FIL : 7',1628574699),
(65,50,'出帐','购买订单','POYNCEH3BV3IXYN1','USDT',319.00000000,'覃菊友 因 购买订单 出帐 USDT : 319.00000000',1628575242),
(66,51,'入帐','人工充值','46','USDT',319.00000000,'陆姐姐 因 人工充值 入帐 USDT : 319',1628577072),
(67,51,'入帐','人工充值','47','FIL',7.00000000,'陆姐姐 因 人工充值 入帐 FIL : 7',1628577072),
(68,7,'出帐','购买订单','PO3HAGJW17WPX0HB','USDT',319.00000000,'谢总 因 购买订单 出帐 USDT : 319.00000000',1628577541),
(69,51,'出帐','购买订单','POF2ER4ZCVIASM5F','USDT',319.00000000,'陆姐姐 因 购买订单 出帐 USDT : 319.00000000',1628577851),
(70,53,'入帐','人工充值','48','USDT',319.00000000,'万里红 因 人工充值 入帐 USDT : 319',1628578253),
(71,53,'入帐','人工充值','49','FIL',7.00000000,'万里红 因 人工充值 入帐 FIL : 7',1628578253),
(72,53,'出帐','购买订单','PO9LBVILLGEGDJPS','USDT',319.00000000,'万里红 因 购买订单 出帐 USDT : 319.00000000',1628578449),
(73,54,'入帐','人工充值','50','USDT',319.00000000,'谢建强 因 人工充值 入帐 USDT : 319',1628579642),
(74,54,'入帐','人工充值','51','FIL',7.00000000,'谢建强 因 人工充值 入帐 FIL : 7',1628579642),
(75,56,'入帐','人工充值','52','USDT',319.00000000,'初宥廷 因 人工充值 入帐 USDT : 319',1628579673),
(76,56,'入帐','人工充值','53','FIL',7.00000000,'初宥廷 因 人工充值 入帐 FIL : 7',1628579673),
(77,54,'出帐','购买订单','POOA1X20X353H7G3','USDT',319.00000000,'谢建强 因 购买订单 出帐 USDT : 319.00000000',1628579755),
(78,56,'出帐','购买订单','POFDAFMVSRKI7SQ6','USDT',319.00000000,'初宥廷 因 购买订单 出帐 USDT : 319.00000000',1628579813),
(79,59,'入帐','人工充值','54','USDT',319.00000000,'金苹果 因 人工充值 入帐 USDT : 319',1628600508),
(80,59,'入帐','人工充值','55','FIL',7.00000000,'金苹果 因 人工充值 入帐 FIL : 7',1628600508),
(81,59,'出帐','购买订单','POKJZ8NL52R4RJTM','USDT',319.00000000,'金苹果 因 购买订单 出帐 USDT : 319.00000000',1628600723),
(82,2,'入帐','合作奖','POOPXVSIYGXW2A9R','USDT',31.90000000,'了凡 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(83,3,'入帐','合作奖','PO3HAGJW17WPX0HB','USDT',31.90000000,'了凡社区 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(84,4,'入帐','合作奖','POJ7XBD01KJZQ7NQ','USDT',31.90000000,'了凡单总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(85,5,'入帐','合作奖','POTSU757O4WXOH3G','USDT',31.90000000,'了凡超算 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(86,13,'入帐','合作奖','POKW36MP6P5S8NMS','USDT',15.95000000,'杰哥 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(87,14,'入帐','合作奖','PO4V2KJG4G92ACE0','USDT',15.95000000,'88559 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(88,6,'入帐','合作奖','POPQHRH9MZBKSKBY','USDT',31.90000000,'韦总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(89,17,'入帐','合作奖','POZJBAT17A54ELUO','USDT',25.52000000,'苏芸会所 因 合作奖 入帐 USDT : 25.52000000',1628611500),
(90,6,'入帐','合作奖','PO8RRGQ345KKUODR','USDT',606.90000000,'韦总 因 合作奖 入帐 USDT : 606.90000000',1628611500),
(91,17,'入帐','合作奖','POVUWLHR7NLBHXIN','USDT',25.52000000,'苏芸会所 因 合作奖 入帐 USDT : 25.52000000',1628611500),
(92,17,'入帐','合作奖','POTQLRH6FYXXSIUC','USDT',25.52000000,'苏芸会所 因 合作奖 入帐 USDT : 25.52000000',1628611500),
(93,17,'入帐','合作奖','PONA875TZ608UZIP','USDT',25.52000000,'苏芸会所 因 合作奖 入帐 USDT : 25.52000000',1628611500),
(94,6,'入帐','合作奖','POX8120XW413QB00','USDT',31.90000000,'韦总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(95,6,'入帐','合作奖','PO6A35AAYC9ER6NH','USDT',31.90000000,'韦总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(96,6,'入帐','合作奖','POXM1JOOLMV6C0SJ','USDT',31.90000000,'韦总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(97,22,'入帐','合作奖','POPMXQQJNVOPJ4WN','USDT',63.80000000,'人怕出名猪怕壮 因 合作奖 入帐 USDT : 63.80000000',1628611500),
(98,18,'入帐','合作奖','POH0N1F8MTWWDFEG','USDT',15.95000000,'纷纷mm 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(99,20,'入帐','合作奖','PO65NF7QLOKZ9322','USDT',63.80000000,'zjb9279 因 合作奖 入帐 USDT : 63.80000000',1628611500),
(100,21,'入帐','合作奖','POWFAERRLGZLZ4QK','USDT',15.95000000,'韦苏芸 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(101,12,'入帐','合作奖','PO63RZ2MWPL5NRHL','USDT',31.90000000,'蔡总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(102,18,'入帐','合作奖','POYNCEH3BV3IXYN1','USDT',15.95000000,'纷纷mm 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(103,47,'入帐','合作奖','POF2ER4ZCVIASM5F','USDT',15.95000000,'袁子涵 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(104,47,'入帐','合作奖','PO9LBVILLGEGDJPS','USDT',15.95000000,'袁子涵 因 合作奖 入帐 USDT : 15.95000000',1628611500),
(105,7,'入帐','合作奖','POOA1X20X353H7G3','USDT',31.90000000,'谢总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(106,7,'入帐','合作奖','POFDAFMVSRKI7SQ6','USDT',31.90000000,'谢总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(107,12,'入帐','合作奖','POKJZ8NL52R4RJTM','USDT',31.90000000,'蔡总 因 合作奖 入帐 USDT : 31.90000000',1628611500),
(108,6,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'韦总 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(109,7,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'谢总 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(110,12,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'蔡总 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(111,13,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'杰哥 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(112,14,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'88559 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(113,15,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'13143 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(114,17,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'苏芸会所 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(115,18,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'纷纷mm 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(116,19,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.15755250,'佳佳FIL 因 直接释放 入帐 FIL : 0.1575525000',1628611500),
(117,20,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'zjb9279 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(118,21,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'韦苏芸 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(119,22,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'人怕出名猪怕壮 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(120,23,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.02250750,'喲濕誰 因 直接释放 入帐 FIL : 0.0225075000',1628611500),
(121,25,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.03001000,'一只成熟的癞蛤蟆 因 直接释放 入帐 FIL : 0.0300100000',1628611500),
(122,26,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'均均同学 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(123,28,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.03001000,'ZJB9279 因 直接释放 入帐 FIL : 0.0300100000',1628611500),
(124,45,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'梁运财 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(125,47,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'袁子涵 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(126,50,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'覃菊友 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(127,51,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'陆姐姐 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(128,53,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'万里红 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(129,54,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'谢建强 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(130,56,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'初宥廷 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(131,59,'入帐','直接释放','2021-08-11 00:05:00','FIL',0.00750250,'金苹果 因 直接释放 入帐 FIL : 0.0075025000',1628611500),
(132,6,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'韦总 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(133,7,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'谢总 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(134,12,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'蔡总 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(135,13,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'杰哥 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(136,14,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'88559 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(137,15,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'13143 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(138,17,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'苏芸会所 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(139,18,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'纷纷mm 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(140,19,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00262587,'佳佳FIL 因 线性释放 入帐 FIL : 0.00262587',1628611500),
(141,20,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'zjb9279 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(142,21,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'韦苏芸 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(143,22,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'人怕出名猪怕壮 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(144,23,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00037512,'喲濕誰 因 线性释放 入帐 FIL : 0.00037512',1628611500),
(145,25,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00050016,'一只成熟的癞蛤蟆 因 线性释放 入帐 FIL : 0.00050016',1628611500),
(146,26,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'均均同学 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(147,28,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00050016,'ZJB9279 因 线性释放 入帐 FIL : 0.00050016',1628611500),
(148,45,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'梁运财 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(149,47,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'袁子涵 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(150,50,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'覃菊友 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(151,51,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'陆姐姐 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(152,53,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'万里红 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(153,54,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'谢建强 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(154,56,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'初宥廷 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(155,59,'入帐','线性释放','2021-08-11 00:05:00','FIL',0.00012504,'金苹果 因 线性释放 入帐 FIL : 0.00012504',1628611500),
(156,6,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'韦总 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(157,7,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'谢总 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(158,12,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'蔡总 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(159,13,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'杰哥 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(160,14,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'88559 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(161,15,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'13143 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(162,17,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'苏芸会所 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(163,18,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'纷纷mm 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(164,19,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.15755250,'佳佳FIL 因 直接释放 入帐 FIL : 0.1575525000',1628646777),
(165,20,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'zjb9279 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(166,21,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'韦苏芸 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(167,22,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'人怕出名猪怕壮 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(168,23,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.02250750,'喲濕誰 因 直接释放 入帐 FIL : 0.0225075000',1628646777),
(169,25,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.03001000,'一只成熟的癞蛤蟆 因 直接释放 入帐 FIL : 0.0300100000',1628646777),
(170,26,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'均均同学 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(171,28,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.03001000,'ZJB9279 因 直接释放 入帐 FIL : 0.0300100000',1628646777),
(172,45,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'梁运财 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(173,47,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'袁子涵 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(174,50,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'覃菊友 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(175,51,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'陆姐姐 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(176,53,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'万里红 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(177,54,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'谢建强 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(178,56,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'初宥廷 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(179,59,'入帐','直接释放','2021-08-11 09:52:57','FIL',0.00750250,'金苹果 因 直接释放 入帐 FIL : 0.0075025000',1628646777),
(180,6,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'韦总 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(181,7,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'谢总 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(182,12,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'蔡总 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(183,13,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'杰哥 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(184,14,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'88559 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(185,15,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'13143 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(186,17,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'苏芸会所 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(187,18,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'纷纷mm 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(188,19,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.15755250,'佳佳FIL 因 直接释放 入帐 FIL : 0.1575525000',1628646801),
(189,20,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'zjb9279 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(190,21,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'韦苏芸 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(191,22,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'人怕出名猪怕壮 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(192,23,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.02250750,'喲濕誰 因 直接释放 入帐 FIL : 0.0225075000',1628646801),
(193,25,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.03001000,'一只成熟的癞蛤蟆 因 直接释放 入帐 FIL : 0.0300100000',1628646801),
(194,26,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'均均同学 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(195,28,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.03001000,'ZJB9279 因 直接释放 入帐 FIL : 0.0300100000',1628646801),
(196,45,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'梁运财 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(197,47,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'袁子涵 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(198,50,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'覃菊友 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(199,51,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'陆姐姐 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(200,53,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'万里红 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(201,54,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'谢建强 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(202,56,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'初宥廷 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(203,59,'入帐','直接释放','2021-08-11 09:53:21','FIL',0.00750250,'金苹果 因 直接释放 入帐 FIL : 0.0075025000',1628646801),
(204,6,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'韦总 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(205,7,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'谢总 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(206,12,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'蔡总 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(207,13,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'杰哥 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(208,14,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'88559 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(209,15,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'13143 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(210,17,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'苏芸会所 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(211,18,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'纷纷mm 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(212,19,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00787761,'佳佳FIL 因 线性释放 入帐 FIL : 0.00787761',1628646801),
(213,20,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'zjb9279 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(214,21,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'韦苏芸 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(215,22,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'人怕出名猪怕壮 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(216,23,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00112536,'喲濕誰 因 线性释放 入帐 FIL : 0.00112536',1628646801),
(217,25,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00150048,'一只成熟的癞蛤蟆 因 线性释放 入帐 FIL : 0.00150048',1628646801),
(218,26,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'均均同学 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(219,28,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00150048,'ZJB9279 因 线性释放 入帐 FIL : 0.00150048',1628646801),
(220,45,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'梁运财 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(221,47,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'袁子涵 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(222,50,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'覃菊友 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(223,51,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'陆姐姐 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(224,53,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'万里红 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(225,54,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'谢建强 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(226,56,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'初宥廷 因 线性释放 入帐 FIL : 0.00037512',1628646801),
(227,59,'入帐','线性释放','2021-08-11 09:53:21','FIL',0.00037512,'金苹果 因 线性释放 入帐 FIL : 0.00037512',1628646801);

/*Table structure for table `user_assets_pledge` */

DROP TABLE IF EXISTS `user_assets_pledge`;

CREATE TABLE `user_assets_pledge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `assets_code` varchar(16) NOT NULL DEFAULT '0' COMMENT '资产编码',
  `pledge_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '质押资产数量',
  `pledge_days` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '质押天数',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `pledge_days` (`pledge_days`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='用户资产质押信息';

/*Data for the table `user_assets_pledge` */

insert  into `user_assets_pledge`(`id`,`user_id`,`assets_code`,`pledge_amount`,`pledge_days`,`created_at`) values 
(1,13,'FIL',7.00000000,1080,1628562382),
(2,14,'FIL',7.00000000,1080,1628563282),
(3,6,'FIL',7.00000000,1080,1628563538),
(4,17,'FIL',7.00000000,1080,1628564416),
(5,15,'FIL',7.00000000,1080,1628564848),
(6,21,'FIL',7.00000000,1080,1628565694),
(7,22,'FIL',7.00000000,1080,1628565720),
(8,23,'FIL',7.00000000,1080,1628565808),
(9,23,'FIL',7.00000000,1080,1628565815),
(10,23,'FIL',7.00000000,1080,1628565825),
(11,18,'FIL',7.00000000,1080,1628565998),
(12,20,'FIL',7.00000000,1080,1628566020),
(13,25,'FIL',28.00000000,1080,1628566187),
(14,19,'FIL',147.00000000,1080,1628567299),
(15,26,'FIL',7.00000000,1080,1628568310),
(16,28,'FIL',28.00000000,1080,1628568751),
(17,45,'FIL',7.00000000,1080,1628569988),
(18,12,'FIL',7.00000000,1080,1628570022),
(19,47,'FIL',7.00000000,1080,1628570766),
(20,50,'FIL',7.00000000,1080,1628575242),
(21,7,'FIL',7.00000000,1080,1628577541),
(22,51,'FIL',7.00000000,1080,1628577851),
(23,53,'FIL',7.00000000,1080,1628578449),
(24,54,'FIL',7.00000000,1080,1628579755),
(25,56,'FIL',7.00000000,1080,1628579813),
(26,59,'FIL',7.00000000,1080,1628600723);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL DEFAULT '' COMMENT '推荐码',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `pwd` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID（推荐人ID），0表示无推荐人',
  `relation_path` varchar(8000) NOT NULL DEFAULT '0' COMMENT '推荐关系路径，由每级推荐人ID组成，如：0/1/15/19',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` varchar(16) NOT NULL DEFAULT '启用' COMMENT '状态：启用、禁用',
  `withdraw_status` varchar(16) NOT NULL DEFAULT '启用' COMMENT '提现状态：启用、禁用',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '下单数量',
  `level_name` varchar(16) NOT NULL DEFAULT '普通用户' COMMENT '用户等级：普通用户、激活用户、经理、总监、总裁',
  `cooperation_per` int(11) NOT NULL DEFAULT '0' COMMENT '合作奖百分比',
  `win_per` int(11) NOT NULL DEFAULT '0' COMMENT '共赢奖百分比',
  `available_power` int(11) NOT NULL DEFAULT '0' COMMENT '可用总算力',
  `history_power` int(11) NOT NULL DEFAULT '0' COMMENT '历史总算力',
  `available_children_power` int(11) NOT NULL DEFAULT '0' COMMENT '所有子级可用总算力之和',
  `history_children_power` int(1) NOT NULL DEFAULT '0' COMMENT '所有子级可历史算力之和',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_unique` (`mobile`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `nick_name` (`nickname`) USING BTREE,
  KEY `available_power` (`available_power`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `withdraw_status` (`withdraw_status`) USING BTREE,
  KEY `order_num` (`order_num`) USING BTREE,
  KEY `level_name` (`level_name`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`code`,`mobile`,`pwd`,`nickname`,`parent_id`,`relation_path`,`created_at`,`status`,`withdraw_status`,`order_num`,`level_name`,`cooperation_per`,`win_per`,`available_power`,`history_power`,`available_children_power`,`history_children_power`) values 
(1,'88888','13888888888','$2a$10$iLJEdc6MXX3C/Vj0B8X4J.6q.1aE..js1N.gHTuWiI3NRymIIni8.','系统',0,'/1',1628560800,'启用','禁用',0,'激活用户',10,4,0,0,52,52),
(2,'LFLFF','13111111111','13111111111','了凡',1,'/1/2',1628560800,'禁用','禁用',0,'激活用户',10,4,0,0,41,41),
(3,'LFSQQ','13222222222','13222222222','了凡社区',1,'/1/3',1628560800,'禁用','禁用',0,'激活用户',10,4,0,0,3,3),
(4,'LFCSS','13333333333','13333333333','了凡单总',1,'/1/4',1628560800,'禁用','禁用',0,'激活用户',10,4,0,0,5,5),
(5,'LFSZZ','13555555555','13555555555','了凡超算',1,'/1/5',1628560800,'禁用','禁用',0,'激活用户',10,4,0,0,3,3),
(6,'RSQ1V','13471231014','$2a$10$EQ4TkqOz0GeKrgAl7DCcCucsJiE6PHnETshtIihJixa5OnaPO/KeS','韦总',2,'/1/2/6',1628560800,'启用','启用',1,'激活用户',10,4,1,1,40,40),
(7,'X3EDA','13394993111','$2a$10$e6Z9SiAvXifKKnld/jCNx.d3QdrM1jdongz5my21gxwA3hjNlKsva','谢总',3,'/1/3/7',1628560800,'启用','启用',1,'激活用户',10,4,1,1,2,2),
(8,'','15962399186','$2a$10$RmXRhC5M64E2Mo0eCKAogefwDQQbcUhvvllyVjLiWbxjnCuZ5Zm.u','赵总',4,'/1/4/8',1628560800,'启用','启用',0,'总裁',10,4,0,0,0,0),
(9,'','13852118788','$2a$10$YVLjZKghwhTJqCkr.UlHQ.9XA.5GSm5nONEvwtgsYJpYOcvhKxS0W','周总',4,'/1/4/9',1628560800,'启用','启用',0,'总裁',10,4,0,0,0,0),
(10,'','13952198246','$2a$10$/Jk8t7t5auS2h4XrVbFc1erMILjgrw5wtYJ5I5nyofauL8u11As72','张总',4,'/1/4/10',1628560800,'启用','启用',0,'总裁',10,4,0,0,0,0),
(11,'','13800000007','13800000007','冯总',4,'/1/4/11',1628560800,'启用','启用',0,'总裁',10,4,0,0,0,0),
(12,'5AG5P','13382894345','$2a$10$fcZbk92w6bwbZOI/Tsyy5eLx1jfHqGh/ufH6lviQPScch5DSJAE.a','蔡总',4,'/1/4/12',1628560800,'启用','启用',1,'激活用户',10,4,1,1,4,4),
(13,'F0AZE','19952255633','$2a$10$SQioVWfHF5OCLp15NcEM2eRCD5DME8tEoN8ZXKC5BLBl4Lc9Pb5SS','杰哥',5,'/1/5/13',1628560800,'启用','启用',1,'激活用户',5,0,1,1,2,2),
(14,'YB74F','13248088559','$2a$10$ygN3/wT1A3A8ArXiRn66duTafuX6.NiWIeClhgXvjEreZxF7g5h7G','88559',13,'/1/5/13/14',1628560800,'启用','启用',1,'激活用户',5,0,1,1,1,1),
(15,'BFKVE','15636413143','$2a$10$CWAMvCBI.UlGIxRth66RK.17fWTiFRgC6gWsy6nMsTQ5tuBHyUcJ.','13143',14,'/1/5/13/14/15',1628560800,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(16,'','13005495562','$2a$10$Zvolcay2XW5CzfPGiGBoPuoESee4eDgwm5wnHHtdUZrLgOhwAlY.W','qqqq',13,'/1/5/13/16',1628563526,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(17,'GLSPE','15877254185','$2a$10$yjGhwuVaFDvd2zFpnPpz8OUJ7QArI84cAu6GRkdpFYSlnLjA84oWa','苏芸会所',6,'/1/2/6/17',1628564012,'启用','启用',1,'激活用户',8,0,1,1,15,15),
(18,'U2Q5Q','15107787178','$2a$10$vTFujAwaarMGDyc01upwDOkpjZ3HZ5bytMvxzMoZTAxrLCMPfzpqq','纷纷mm',17,'/1/2/6/17/18',1628564647,'启用','启用',1,'激活用户',5,0,1,1,2,2),
(19,'4XJ2O','13457251014','$2a$10$NOOI2Eh3djlP2CMLoN3CjOP.X5y9NEYlqZRAziUgGcXWwtrcITvVq','佳佳FIL',6,'/1/2/6/19',1628564678,'启用','启用',1,'激活用户',0,0,21,21,0,0),
(20,'ARE3Y','13557625258','$2a$10$YC4YevDP4Ux2pLRcTscUheCZMRFqF6.O26opIVyvhuZ7s0Jf/yPoO','zjb9279',17,'/1/2/6/17/20',1628564710,'启用','启用',1,'激活用户',5,0,1,1,4,4),
(21,'HOT9W','13737261014','$2a$10$LU54ob..Xrjh21La84lPheH9TlqF/GW453d3EjoGXhYE4cimnRqpu','韦苏芸',17,'/1/2/6/17/21',1628564995,'启用','启用',1,'激活用户',5,0,1,1,1,1),
(22,'MXNV3','13558127064','$2a$10$Ij6O5xnRyxiVYU4zS7TCvObkpb8HsE1JvAqg1MINKuZS0BYatH1Py','人怕出名猪怕壮',17,'/1/2/6/17/22',1628564998,'启用','启用',1,'激活用户',5,0,1,1,4,4),
(23,'1NXNZ','18172286386','$2a$10$bprzJiaMGvqG6rgWU2W0meiHumLFXyf8HIGyU.NG.DWUHoUKJrmVO','喲濕誰',6,'/1/2/6/23',1628565333,'启用','启用',3,'激活用户',0,0,3,3,0,0),
(24,'','13977212837','$2a$10$/LTMImb1CdwUnb1FldIJR.VIM9phn.YzhOLi8N32uWgCvmfO2GutW','陈智平',21,'/1/2/6/17/21/24',1628565879,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(25,'VD33I','18077244220','$2a$10$b112drt7QjaD9CmAaz8yT.kCZIllU4k77sYR5SXojf9FW04NqZjVy','一只成熟的癞蛤蟆',22,'/1/2/6/17/22/25',1628565890,'启用','启用',1,'激活用户',0,0,4,4,0,0),
(26,'MEAYH','17707785707','$2a$10$XDS54wAvu8x8VKuejHNsBe9DBD7IOCYx1iaBgcls9KEanW42Vki1y','均均同学',18,'/1/2/6/17/18/26',1628566109,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(27,'','13605071567','$2a$10$w5P1eeeN4zW2Nlq0W7.qXuuLeQHTRas6F/Y7rJ9oOuHbSDT/CAhP.','绿色北溪',13,'/1/5/13/27',1628566172,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(28,'DNWU5','13978809279','$2a$10$j6QzBeYZWiSqVvv8WOJo6OmuBkcStjBlS8Oz0spNYhhxsck7CIdpy','ZJB9279',20,'/1/2/6/17/20/28',1628566595,'启用','启用',1,'激活用户',0,0,4,4,0,0),
(29,'','15882315387','$2a$10$Lo8sSsOFgNFjrMOFaiL2cuoOKguA8..D7o56D.UYRD5.n9c/v4gD.','Lily',13,'/1/5/13/29',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(30,'','13564920398','$2a$10$bXabq5nI/yHJBOYsXnZwAu5aKkIVpas3Ki68cfDwfV4flMAf8uA8O','Julian',13,'/1/5/13/30',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(31,'','13309998310','$2a$10$jguj49pBWiJoUlzeUf.OZeA/tn3jg/CKr4yR4N8OYnKHqs7HzSK3m','PengTao',13,'/1/5/13/31',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(32,'','18682003679','$2a$10$mXVzzgGJzawrxnwcMC7T1euL5CBpAKFjkp1.5UPvr.mTayS0yYL8u','David',13,'/1/5/13/32',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(33,'JACOB','13392837433','$2a$10$PsZ0QgD5iT46XhDmYv5jA.7ZlaqWswJ/d.qpJmjMKbCkKh358ml1i','Jacob',13,'/1/5/13/33',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(34,'JESSE','13854245221','$2a$10$X99zh993RdCXUi96aBg7P.pdkE1XSARLyzsE3qhu34heuiarccdm.','Jesse',13,'/1/5/13/34',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(35,'LOVAN','15889688346','$2a$10$epG85dh6g7EOgTKbIccIpO4ffNBxa4fnTLLFcRmA2oesl53zBJ6x.','Lovan',13,'/1/5/13/35',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(36,'','13040825925','$2a$10$qVbLO9Mbo46zeofSOJDd1.kRAuVjOh6BpdCIiJ3OemUBS2pSCZeH2','ZhaoHai',33,'/1/5/13/33/36',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(37,'','15271949181','$2a$10$U..yC7hZAMs7U.qBY7FGZukAJWA3D8ftEhMQw23O9A4JsugpDBxQW','ShengYi',34,'/1/5/13/34/37',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(38,'','18770053094','$2a$10$w.klDb5db.AoBX2gEvOD2eZx5LAKYFp8KeS9JA2FC/JkUOgVkFCga','ShenAo',34,'/1/5/13/34/38',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(39,'','15899885679','$2a$10$laOKQj1CjkRz1Fp2QhoYeuaT.ym9taf4C5UONIp4H1tccszZgMdXa','XiaoMan',34,'/1/5/13/34/39',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(40,'','15323718917','$2a$10$Tg.ta4S.yQT9QGS2rOS0oOpfx00qYWM/xoXlCAFGf5K5sslY/mHIS','XiaoHuo',35,'/1/5/13/35/40',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(41,'','13501582440','$2a$10$u/rYzTmryL/lRRDGHkDhfu54oO91RWQCgoo2LRdQ4jiOWhhjRI7oK','XiaoMaGe',35,'/1/5/13/35/41',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(42,'','18927447537','$2a$10$XzjkRYa7DArBITey9dDS9.a5V6YPx/zeD3ZO8Zz0U3Yv4M9BkzJO.','HuangGan',35,'/1/5/13/35/42',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(43,'','13377533560','$2a$10$nI.qCmy4I72D0RlSXtNip./sWvA1SurmLD96zeWxtShonRYcGP4UW','XiaoOu',35,'/1/5/13/35/43',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(44,'','15914063821','$2a$10$pRQcEiV3y4DdInhTuamoB.MwBErJABldTkCb1YuJ89EpGAt64afsO','ZhiMin',35,'/1/5/13/35/44',1628560800,'启用','禁用',0,'普通用户',0,0,0,0,0,0),
(45,'Z64L7','13237788637','$2a$10$Bq.cRsiv5v9qdmCO4/Jfgulo9Qf1OpOF4ybqmeVAPYwUOXMb.yakW','梁运财',21,'/1/2/6/17/21/45',1628568695,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(46,'ABBYY','19925191941','$2a$10$LUykStlwguij5U.HdBZmp.dcttPqozw1hzSpO4qkGR2aRTQ3qK3.G','Abby',13,'/1/5/13/46',1628560800,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(47,'9T5XP','13382273855','$2a$10$i6LRHgLBoDHdqHFlUngkWOI3hSF2girRuNp09N55KEszC1vlzgNxy','袁子涵',12,'/1/4/12/47',1628570247,'启用','启用',1,'激活用户',5,0,1,1,2,2),
(48,'','13860829366','$2a$10$O0gAN0pb5eItcPqAL8efmOCG2PhjbiWLpuWDHw0sPIKtuvTlerDJS','lmh9366',13,'/1/5/13/48',1628570321,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(49,'','18677839373','$2a$10$7yn9466mvumKEL1gveQvQumj0e4dvywpDiXxfR0XKRWa2cqF9zFQa','覃菊友',17,'/1/2/6/17/49',1628571642,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(50,'4YVKC','18507780767','$2a$10$7B69T3M60sa3M7NKuP3YtuLGUo6cEaK98w9pfNaBTSyGd14clh6a2','覃菊友',18,'/1/2/6/17/18/50',1628573124,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(51,'RIPP9','18721229693','$2a$10$pjQM0P2nMFcOhMQySUwnkuHebKXOxkYQo1xGY5i0yo3DU1kTHWn/u','陆姐姐',47,'/1/4/12/47/51',1628574639,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(52,'','13771010207','$2a$10$R6VN2DirL.1hxnVbEtJqhuZ7sxzOovIxl07M3gkTPx0pvrUzkRsIi','知足常乐',47,'/1/4/12/47/52',1628575924,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(53,'2LUM8','18795633180','$2a$10$ufeVhB7vhfky7rGAbI3I6.o02atZ2UK87otHx2uOBVbMBYtU8cSwS','万里红',47,'/1/4/12/47/53',1628576379,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(54,'M4AI5','15309997580','$2a$10$0ddaqeQ6KZbDCYDkJTtWoeJDtkn6dkjNxaPiyqwJ5Zj0xrntyAQ8C','谢建强',7,'/1/3/7/54',1628578071,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(55,'','13391278878','$2a$10$zSoZoeAa4JHTMvshOt8v/OB/SBRJUFKyW1wGBr1er6uE9YPQ3pbpG','果修1983',51,'/1/4/12/47/51/55',1628578610,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(56,'94O8V','18799153561','$2a$10$qMkYo/FVVT0VRzwXZffTcu3ydDDdtjFVDpsEc0jdzGp3wuZT9lzA2','初宥廷',7,'/1/3/7/56',1628579275,'启用','启用',1,'激活用户',0,0,1,1,0,0),
(57,'','18250440766','$2a$10$y/XiJJC2B1p26G3uDmX51ObPaAA.s2zH2/JPWJa9OkHv0YCPI7MzC','fff',13,'/1/5/13/57',1628582047,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(58,'','18629565762','$2a$10$vDL9LH0NCBoX70ypY4k4jOwJ6N1RJbutKup/OehaYfhSaUeiZWlHS','fyfy987654',7,'/1/3/7/58',1628592103,'启用','启用',0,'普通用户',0,0,0,0,0,0),
(59,'3H8ZI','18352575023','$2a$10$3LM//ZPD08krnE/Bekb51.iO50jD3IdlA0Rz8fStuZ73NwpqgVu3a','金苹果',12,'/1/4/12/59',1628598168,'启用','启用',1,'激活用户',0,0,1,1,0,0);

/*Table structure for table `user_power_production` */

DROP TABLE IF EXISTS `user_power_production`;

CREATE TABLE `user_power_production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_date` datetime NOT NULL COMMENT '生产日期',
  `pool_power_production` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '矿池当日每T算力FIL产量',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_power` int(11) NOT NULL DEFAULT '0' COMMENT '用户当日算力',
  `production_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '总产出FIL数量：产量-服务费',
  `transfer_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '总划拨FIL数量：产出 * 25%',
  `release_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '总释放FIL数量：产出 * 75%',
  `release_days` int(11) NOT NULL DEFAULT '0' COMMENT '释放天数',
  `surplus_release_days` int(11) NOT NULL DEFAULT '0' COMMENT '剩余释放天数',
  `every_day_release_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '每日释放FIL数量',
  `status` varchar(16) NOT NULL DEFAULT '待释放' COMMENT '状态：释放中，已完成',
  PRIMARY KEY (`id`),
  KEY `production_date` (`production_date`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `user_product_order_id` (`user_power`) USING BTREE,
  KEY `release_days` (`release_days`) USING BTREE,
  KEY `surplus_release_days` (`surplus_release_days`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COMMENT='用户算力产出表';

/*Data for the table `user_power_production` */

insert  into `user_power_production`(`id`,`production_date`,`pool_power_production`,`user_id`,`user_power`,`production_amount`,`transfer_amount`,`release_amount`,`release_days`,`surplus_release_days`,`every_day_release_amount`,`status`) values 
(1,'2021-08-11 00:05:00',0.03001000,6,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(2,'2021-08-11 00:05:00',0.03001000,7,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(3,'2021-08-11 00:05:00',0.03001000,12,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(4,'2021-08-11 00:05:00',0.03001000,13,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(5,'2021-08-11 00:05:00',0.03001000,14,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(6,'2021-08-11 00:05:00',0.03001000,15,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(7,'2021-08-11 00:05:00',0.03001000,17,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(8,'2021-08-11 00:05:00',0.03001000,18,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(9,'2021-08-11 00:05:00',0.03001000,19,21,0.63021000,0.15755250,0.47265750,180,178,0.00262587,'释放中'),
(10,'2021-08-11 00:05:00',0.03001000,20,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(11,'2021-08-11 00:05:00',0.03001000,21,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(12,'2021-08-11 00:05:00',0.03001000,22,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(13,'2021-08-11 00:05:00',0.03001000,23,3,0.09003000,0.02250750,0.06752250,180,178,0.00037512,'释放中'),
(14,'2021-08-11 00:05:00',0.03001000,25,4,0.12004000,0.03001000,0.09003000,180,178,0.00050016,'释放中'),
(15,'2021-08-11 00:05:00',0.03001000,26,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(16,'2021-08-11 00:05:00',0.03001000,28,4,0.12004000,0.03001000,0.09003000,180,178,0.00050016,'释放中'),
(17,'2021-08-11 00:05:00',0.03001000,45,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(18,'2021-08-11 00:05:00',0.03001000,47,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(19,'2021-08-11 00:05:00',0.03001000,50,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(20,'2021-08-11 00:05:00',0.03001000,51,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(21,'2021-08-11 00:05:00',0.03001000,53,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(22,'2021-08-11 00:05:00',0.03001000,54,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(23,'2021-08-11 00:05:00',0.03001000,56,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(24,'2021-08-11 00:05:00',0.03001000,59,1,0.03001000,0.00750250,0.02250750,180,178,0.00012504,'释放中'),
(25,'2021-08-11 09:52:58',0.03001000,6,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(26,'2021-08-11 09:52:58',0.03001000,7,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(27,'2021-08-11 09:52:58',0.03001000,12,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(28,'2021-08-11 09:52:58',0.03001000,13,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(29,'2021-08-11 09:52:58',0.03001000,14,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(30,'2021-08-11 09:52:58',0.03001000,15,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(31,'2021-08-11 09:52:58',0.03001000,17,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(32,'2021-08-11 09:52:58',0.03001000,18,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(33,'2021-08-11 09:52:58',0.03001000,19,21,0.63021000,0.15755250,0.47265750,180,179,0.00262587,'释放中'),
(34,'2021-08-11 09:52:58',0.03001000,20,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(35,'2021-08-11 09:52:58',0.03001000,21,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(36,'2021-08-11 09:52:58',0.03001000,22,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(37,'2021-08-11 09:52:58',0.03001000,23,3,0.09003000,0.02250750,0.06752250,180,179,0.00037512,'释放中'),
(38,'2021-08-11 09:52:58',0.03001000,25,4,0.12004000,0.03001000,0.09003000,180,179,0.00050016,'释放中'),
(39,'2021-08-11 09:52:58',0.03001000,26,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(40,'2021-08-11 09:52:58',0.03001000,28,4,0.12004000,0.03001000,0.09003000,180,179,0.00050016,'释放中'),
(41,'2021-08-11 09:52:58',0.03001000,45,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(42,'2021-08-11 09:52:58',0.03001000,47,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(43,'2021-08-11 09:52:58',0.03001000,50,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(44,'2021-08-11 09:52:58',0.03001000,51,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(45,'2021-08-11 09:52:58',0.03001000,53,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(46,'2021-08-11 09:52:58',0.03001000,54,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(47,'2021-08-11 09:52:58',0.03001000,56,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(48,'2021-08-11 09:52:58',0.03001000,59,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(49,'2021-08-11 09:53:21',0.03001000,6,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(50,'2021-08-11 09:53:21',0.03001000,7,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(51,'2021-08-11 09:53:21',0.03001000,12,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(52,'2021-08-11 09:53:21',0.03001000,13,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(53,'2021-08-11 09:53:21',0.03001000,14,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(54,'2021-08-11 09:53:21',0.03001000,15,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(55,'2021-08-11 09:53:21',0.03001000,17,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(56,'2021-08-11 09:53:21',0.03001000,18,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(57,'2021-08-11 09:53:21',0.03001000,19,21,0.63021000,0.15755250,0.47265750,180,179,0.00262587,'释放中'),
(58,'2021-08-11 09:53:21',0.03001000,20,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(59,'2021-08-11 09:53:21',0.03001000,21,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(60,'2021-08-11 09:53:21',0.03001000,22,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(61,'2021-08-11 09:53:21',0.03001000,23,3,0.09003000,0.02250750,0.06752250,180,179,0.00037512,'释放中'),
(62,'2021-08-11 09:53:21',0.03001000,25,4,0.12004000,0.03001000,0.09003000,180,179,0.00050016,'释放中'),
(63,'2021-08-11 09:53:21',0.03001000,26,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(64,'2021-08-11 09:53:21',0.03001000,28,4,0.12004000,0.03001000,0.09003000,180,179,0.00050016,'释放中'),
(65,'2021-08-11 09:53:21',0.03001000,45,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(66,'2021-08-11 09:53:21',0.03001000,47,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(67,'2021-08-11 09:53:21',0.03001000,50,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(68,'2021-08-11 09:53:21',0.03001000,51,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(69,'2021-08-11 09:53:21',0.03001000,53,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(70,'2021-08-11 09:53:21',0.03001000,54,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(71,'2021-08-11 09:53:21',0.03001000,56,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中'),
(72,'2021-08-11 09:53:21',0.03001000,59,1,0.03001000,0.00750250,0.02250750,180,179,0.00012504,'释放中');

/*Table structure for table `user_product_order` */

DROP TABLE IF EXISTS `user_product_order`;

CREATE TABLE `user_product_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL DEFAULT '' COMMENT '订单编码',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `power` int(11) NOT NULL DEFAULT '0' COMMENT '购买的算力（单位T）',
  `deduction_usdt_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '支付USDT数量',
  `pledge_fil_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '质押FIL数量',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `cooperation_status` varchar(16) NOT NULL DEFAULT '不派发' COMMENT '合作奖状态：不派发，待派发，已派发',
  `production_days` int(11) NOT NULL DEFAULT '0' COMMENT '生产天数',
  `surplus_production_days` int(11) NOT NULL DEFAULT '0' COMMENT '剩余生产天数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `surplus_product_days` (`surplus_production_days`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `cooperation_status` (`cooperation_status`) USING BTREE,
  KEY `production_days` (`production_days`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='产品订单表';

/*Data for the table `user_product_order` */

insert  into `user_product_order`(`id`,`code`,`user_id`,`product_id`,`power`,`deduction_usdt_amount`,`pledge_fil_amount`,`created_at`,`cooperation_status`,`production_days`,`surplus_production_days`) values 
(1,'POTSU757O4WXOH3G',13,1,1,319.00000000,7.00000000,1628562382,'已派发',1080,1078),
(2,'POKW36MP6P5S8NMS',14,1,1,319.00000000,7.00000000,1628563282,'已派发',1080,1078),
(3,'POOPXVSIYGXW2A9R',6,1,1,319.00000000,7.00000000,1628563538,'已派发',1080,1078),
(4,'POPQHRH9MZBKSKBY',17,1,1,319.00000000,7.00000000,1628564416,'已派发',1080,1078),
(5,'PO4V2KJG4G92ACE0',15,1,1,319.00000000,7.00000000,1628564848,'已派发',1080,1078),
(6,'POTQLRH6FYXXSIUC',21,1,1,319.00000000,7.00000000,1628565694,'已派发',1080,1078),
(7,'PONA875TZ608UZIP',22,1,1,319.00000000,7.00000000,1628565720,'已派发',1080,1078),
(8,'POX8120XW413QB00',23,1,1,319.00000000,7.00000000,1628565808,'已派发',1080,1078),
(9,'PO6A35AAYC9ER6NH',23,1,1,319.00000000,7.00000000,1628565815,'已派发',1080,1078),
(10,'POXM1JOOLMV6C0SJ',23,1,1,319.00000000,7.00000000,1628565825,'已派发',1080,1078),
(11,'POZJBAT17A54ELUO',18,1,1,319.00000000,7.00000000,1628565998,'已派发',1080,1078),
(12,'POVUWLHR7NLBHXIN',20,1,1,319.00000000,7.00000000,1628566020,'已派发',1080,1078),
(13,'POPMXQQJNVOPJ4WN',25,1,4,1276.00000000,28.00000000,1628566187,'已派发',1080,1078),
(14,'PO8RRGQ345KKUODR',19,3,21,6069.00000000,147.00000000,1628567299,'已派发',1080,1078),
(15,'POH0N1F8MTWWDFEG',26,1,1,319.00000000,7.00000000,1628568310,'已派发',1080,1078),
(16,'PO65NF7QLOKZ9322',28,1,4,1276.00000000,28.00000000,1628568751,'已派发',1080,1078),
(17,'POWFAERRLGZLZ4QK',45,1,1,319.00000000,7.00000000,1628569987,'已派发',1080,1078),
(18,'POJ7XBD01KJZQ7NQ',12,1,1,319.00000000,7.00000000,1628570022,'已派发',1080,1078),
(19,'PO63RZ2MWPL5NRHL',47,1,1,319.00000000,7.00000000,1628570766,'已派发',1080,1078),
(20,'POYNCEH3BV3IXYN1',50,1,1,319.00000000,7.00000000,1628575242,'已派发',1080,1078),
(21,'PO3HAGJW17WPX0HB',7,1,1,319.00000000,7.00000000,1628577541,'已派发',1080,1078),
(22,'POF2ER4ZCVIASM5F',51,1,1,319.00000000,7.00000000,1628577851,'已派发',1080,1078),
(23,'PO9LBVILLGEGDJPS',53,1,1,319.00000000,7.00000000,1628578449,'已派发',1080,1078),
(24,'POOA1X20X353H7G3',54,1,1,319.00000000,7.00000000,1628579755,'已派发',1080,1078),
(25,'POFDAFMVSRKI7SQ6',56,1,1,319.00000000,7.00000000,1628579813,'已派发',1080,1078),
(26,'POKJZ8NL52R4RJTM',59,1,1,319.00000000,7.00000000,1628600723,'已派发',1080,1078);

/*Table structure for table `user_recharge` */

DROP TABLE IF EXISTS `user_recharge`;

CREATE TABLE `user_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT '人工' COMMENT '类型：人工，区块',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '充值用户ID',
  `recharge_address` varchar(128) NOT NULL DEFAULT '' COMMENT '充值地址',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT 'EOS类转账.备注的用户唯一ID',
  `assets_code` varchar(16) NOT NULL DEFAULT '' COMMENT '充值资产编码',
  `assets_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '充值数量',
  `txid` varchar(255) NOT NULL DEFAULT '' COMMENT '交易ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `recharge_address` (`recharge_address`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COMMENT='用户充值表';

/*Data for the table `user_recharge` */

insert  into `user_recharge`(`id`,`type`,`user_id`,`recharge_address`,`memo`,`assets_code`,`assets_amount`,`txid`,`remark`,`created_at`) values 
(1,'人工',13,'','','FIL',7.00000000,'','',1628562320),
(2,'人工',13,'','','USDT',319.00000000,'','',1628562339),
(3,'人工',14,'','','FIL',7.00000000,'','',1628562687),
(4,'人工',14,'','','USDT',319.00000000,'','',1628562703),
(5,'人工',15,'','','FIL',7.00000000,'','',1628562916),
(6,'人工',15,'','','USDT',319.00000000,'','',1628562925),
(7,'人工',6,'','','FIL',7.00000000,'','',1628563083),
(8,'人工',6,'','','USDT',319.00000000,'','',1628563096),
(9,'人工',7,'','','FIL',7.00000000,'','',1628563487),
(10,'人工',7,'','','USDT',319.00000000,'','',1628563501),
(11,'人工',17,'','','FIL',7.00000000,'','',1628564370),
(12,'人工',17,'','','USDT',319.00000000,'','',1628564380),
(13,'人工',20,'','','FIL',7.00000000,'','',1628565070),
(14,'人工',20,'','','USDT',319.00000000,'','',1628565081),
(15,'人工',18,'','','FIL',7.00000000,'','',1628565457),
(16,'人工',18,'','','USDT',319.00000000,'','',1628565466),
(17,'人工',21,'','','FIL',7.00000000,'','',1628565491),
(18,'人工',21,'','','USDT',319.00000000,'','',1628565501),
(19,'人工',22,'','','FIL',7.00000000,'','',1628565529),
(20,'人工',22,'','','USDT',319.00000000,'','',1628565541),
(23,'人工',23,'','','FIL',21.00000000,'','',1628565617),
(24,'人工',23,'','','USDT',957.00000000,'','',1628565640),
(25,'人工',25,'','','FIL',28.00000000,'','',1628566101),
(26,'人工',25,'','','USDT',1276.00000000,'','',1628566134),
(29,'人工',28,'','','FIL',28.00000000,'','',1628566720),
(30,'人工',28,'','','USDT',1276.00000000,'','',1628566737),
(32,'人工',19,'','','FIL',147.00000000,'','',1628567191),
(33,'人工',19,'','','USDT',6069.00000000,'','',1628567218),
(36,'人工',26,'','','FIL',7.00000000,'','',1628568069),
(37,'人工',26,'','','USDT',319.00000000,'','',1628568082),
(38,'人工',12,'','','USDT',319.00000000,'','',1628569548),
(39,'人工',12,'','','FIL',7.00000000,'','',1628569548),
(40,'人工',45,'','','USDT',319.00000000,'','',1628569653),
(41,'人工',45,'','','FIL',7.00000000,'','',1628569653),
(42,'人工',47,'','','USDT',319.00000000,'','',1628570731),
(43,'人工',47,'','','FIL',7.00000000,'','',1628570731),
(44,'人工',50,'','','USDT',319.00000000,'','',1628574699),
(45,'人工',50,'','','FIL',7.00000000,'','',1628574699),
(46,'人工',51,'','','USDT',319.00000000,'','',1628577072),
(47,'人工',51,'','','FIL',7.00000000,'','',1628577072),
(48,'人工',53,'','','USDT',319.00000000,'','',1628578253),
(49,'人工',53,'','','FIL',7.00000000,'','',1628578253),
(50,'人工',54,'','','USDT',319.00000000,'','',1628579642),
(51,'人工',54,'','','FIL',7.00000000,'','',1628579642),
(52,'人工',56,'','','USDT',319.00000000,'','',1628579673),
(53,'人工',56,'','','FIL',7.00000000,'','',1628579673),
(54,'人工',59,'','','USDT',319.00000000,'','',1628600507),
(55,'人工',59,'','','FIL',7.00000000,'','',1628600508);

/*Table structure for table `user_withdraw` */

DROP TABLE IF EXISTS `user_withdraw`;

CREATE TABLE `user_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现用户ID',
  `withdraw_address` varchar(128) NOT NULL DEFAULT '' COMMENT '提现地址',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型：ERC20，TRC20等',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT 'EOS类转账.备注的用户唯一ID',
  `assets_code` varchar(16) NOT NULL DEFAULT '' COMMENT '提现资产编码',
  `assets_amount` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '提现数量',
  `txid` varchar(255) NOT NULL DEFAULT '' COMMENT '交易ID',
  `gas` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '矿工费',
  `fee` decimal(24,8) NOT NULL DEFAULT '0.00000000' COMMENT '手续费',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` varchar(16) NOT NULL DEFAULT '待审核' COMMENT '状态：待审核,失败,成功',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `withdraw_address` (`withdraw_address`) USING BTREE,
  KEY `assets_code` (`assets_code`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `txid` (`txid`) USING BTREE,
  KEY `created_at` (`created_at`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户提现表';

/*Data for the table `user_withdraw` */

insert  into `user_withdraw`(`id`,`user_id`,`withdraw_address`,`type`,`memo`,`assets_code`,`assets_amount`,`txid`,`gas`,`fee`,`remark`,`status`,`created_at`) values 
(1,22,'TZ11RRPRpCdkpFBicXgcnxyRruv9CUwcvR','TRC20','','USDT',63.80000000,'',0.00000000,1.00000000,'','待审核',1628641596);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
