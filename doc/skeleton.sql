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

/*Table structure for table `con_article_category` */

DROP TABLE IF EXISTS `con_article_category`;

CREATE TABLE `con_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(64) NOT NULL DEFAULT '' COMMENT '描述',
  `sort_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `con_article_category` */

insert  into `con_article_category`(`id`,`parent_id`,`name`,`description`,`sort_order`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,0,'新闻','新闻类主类',1.00,1,1632628674,'admin',1632799204,'admin'),
(2,1,'最新资讯','所有最新资讯内容',1.00,1,1632628772,'admin',1632628823,'admin'),
(3,1,'热门资讯','所有热点资讯内容',3.00,1,1632628800,'admin',1632628800,'admin'),
(5,0,'站内资讯','公司内部资讯内容',2.00,1,1632628874,'admin',1632731549,'admin');

/*Table structure for table `con_article_info` */

DROP TABLE IF EXISTS `con_article_info`;

CREATE TABLE `con_article_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类ID',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '文章标题',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '文章封面图',
  `summary` text COMMENT '文章简介',
  `content` longtext COMMENT '文章内容',
  `author` varchar(32) DEFAULT NULL COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0无效;1有效)',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `con_article_info` */

insert  into `con_article_info`(`id`,`category_id`,`title`,`thumb`,`summary`,`content`,`author`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(3,5,'ASDFASF','http://img.xm-bt.com/article-thumb/b03bffd09032838a5ede8ca054f80880.jpg','SADFAS','<p>ASFDASFDAS</p>',NULL,1,1632724471,'admin',1632724471,'admin'),
(5,5,'SFASDF','http://img.xm-bt.com/article-thumb/b03bffd09032838a5ede8ca054f80880.jpg','ASFDASF','<p>SADFASFAS<img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b03bffd09032838a5ede8ca054f80880.jpg\" /></p>',NULL,1,1632724529,'admin',1632724529,'admin'),
(6,5,'SFASDF','http://img.xm-bt.com/article-thumb/b03bffd09032838a5ede8ca054f80880.jpg','ASFDASF','<p>SADFASFAS<img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b03bffd09032838a5ede8ca054f80880.jpg\" /></p>',NULL,1,1632724530,'admin',1632732334,'admin'),
(7,5,'SFASDF','http://img.xm-bt.com/article-thumb/b03bffd09032838a5ede8ca054f80880.jpg','ASFDASF','<p>SADFASFAS<img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b03bffd09032838a5ede8ca054f80880.jpg\" /></p>',NULL,1,1632724532,'admin',1632724532,'admin'),
(8,5,'SFASDF','http://img.xm-bt.com/article-thumb/b03bffd09032838a5ede8ca054f80880.jpg','ASFDASF','<p>SADFASFAS<img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b03bffd09032838a5ede8ca054f80880.jpg\" /></p>',NULL,1,1632724539,'admin',1632724539,'admin'),
(9,1,'苛','http://img.xm-bt.com/article-thumb/b03bffd09032838a5ede8ca054f80880.jpg','朝秦暮楚','<p><img src=\"http://img.xm-bt.com/tinymce-upload/2021828/b03bffd09032838a5ede8ca054f80880.jpg\" />顶<img src=\"http://img.xm-bt.com/tinymce-upload/2021828/4cf6bbd0622ddb1f84d8ad519cbe0a80.jpg\" />戴 <img src=\"http://img.xm-bt.com/tinymce-upload/2021828/c2c87510e14c17629134ae4ea811df05.png\" /></p>',NULL,1,1632724596,'admin',1632799232,'admin'),
(10,5,'模压苛','http://img.xm-bt.com/article-thumb/4cf6bbd0622ddb1f84d8ad519cbe0a80.jpg','基在在在','<p>苛苛苛茜革枯</p>',NULL,0,1632724664,'admin',1632736908,'admin'),
(11,3,'数据告诉你为什么出现全国“限电潮”？会常态化么？','http://img.xm-bt.com/article-thumb/22181209a0562a4129b2dd2dce49e5e3.png','中国发电主要还是靠火电。界面数据根据国家统计局公布的发电量数据计算，2021年1月至8月，火力发电量累计值占全国发电量累计值的比重为71.9%，远高于其他发电方式的累计发电量。','<p class=\"one-p\">近日，&ldquo;限电潮&rdquo;席卷全国20省市。这次大范围限电的原因究竟是什么？</p>\n<p class=\"one-p\">煤炭不够用，价格猛涨</p>\n<p class=\"one-p\">中国发电主要还是靠火电。界面数据根据国家统计局公布的发电量数据计算，2021年1月至8月，火力发电量累计值占全国发电量累计值的比重为71.9%，远高于其他发电方式的累计发电量。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943191/1000\" /></p>\n<p class=\"one-p\">作为火力发电主要燃料的煤炭不够用了。据<span class=\"linkNormal\">国泰君安</span>分析，从历史数据来看，煤炭的产能周期大概在4年至6年。本轮产能周期开始于2017年，受疫情影响，2020年煤炭产能一直处于低位震荡，而真正的拐点出现在2021年初。目前，煤炭产能已经处于下行趋势中，煤炭供给将持续承压。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943192/1000\" /></p>\n<p class=\"one-p\">今年煤炭进口量也在下降。据海关总署数据，2021年1月至5月，煤炭进口量同比&ldquo;五连降&rdquo;。截至8月，今年中国累计进口煤炭1.98亿吨，比去年同期下降10.3%。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943193/1000\" /></p>\n<p class=\"one-p\">煤炭越来越不够用，价格自然也跟着上涨。据商务部数据，2021年以来，国内煤炭价格总体呈上涨趋势。1月至8月，煤炭价格同比持续上涨。4月以来，煤炭价格环比连续5个月上涨。最新数据（9月13日-19日）显示，动力煤价格为780元/吨，较年初上涨约27%。二号无烟块煤价格为1089元/吨，较年初上涨约15%。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943194/1000\" /></p>\n<p class=\"one-p\">电价跟着涨了吗？2020年起，国内取消煤电价格联动机制，将现行标杆上网电价机制，改为&ldquo;基准价+上下浮动&rdquo;的市场化机制。据国家发改委文件要求，2020年暂不上浮，确保工商业平均电价只降不升。据国泰君安证券分析，从历史电价数据来看，2015年以后电力PPI增速基本维持为负值，近5年电价&ldquo;只降不升&rdquo;。未来要想还原电力的商品属性，电价上浮的关口亟需打开。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943195/1000\" /></p>\n<p class=\"one-p\">用电量涨得比发电量快</p>\n<p class=\"one-p\">电力需求涨得越来越快。界面数据将2016年至2021年前8个月的发电量、用电量数据进行对比发现，6年来，全社会用电量历年1月至8月的累计增速均高于全国发电量累计增速，今年两者差距达6年来最大值，为2.5%。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943196/1000\" /></p>\n<p class=\"one-p\">据全球能源互联网发展合作组织发布的《中国2030年能源电力发展规划研究及2060年展望》，未来五年我国电力供需缺口将持续存在。其中，2024年可能是最&ldquo;缺电&rdquo;的时候。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943198/1000\" /></p>\n<p class=\"one-p\">9省上半年能耗不降反升</p>\n<p class=\"one-p\">据国家发改委，今年上半年，全国9个省（区）能耗强度同比不降反升。10个省上半年能耗强度降低率未达到进度要求，达二级预警。国家发改委在通知中强调，将采取有力措施，确保完成全年能耗双控目标特别是能耗强度降低目标任务。</p>\n<p class=\"one-p\"><img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/14015943200/1000\" /></p>',NULL,1,1632728116,'admin',1632804381,'admin'),
(12,5,'dd','https://weison.oss-cn-beijing.aliyuncs.com/xboot/demo/article-thumb/1632808047741.jpg','adf','<p><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/7a2146677434da3ac3ad0514984ea870.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b1aaa238a3bf9a19295face48bd5c607.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/f91aad1ccf6f4208273084d950ba2912.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/ebd604aa08efdefcd90a91d0aaf03579.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/4cacb80c0c46472c508759680de736c6.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/74490cd22d105985d4e422e5956d3848.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/08563ace7205f676ccecc649e1eeebb1.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/163e453038257f40a375cc2be2251b99.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/2cb463fb78222ea7be096ee66e1674a0.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/de4e05eba61eaa9ec487a1297fece9e6.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/e683388cffa3bf9c2db843b2a386be73.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/6f788bf3b809a28d44267b0a2514354f.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/40f4281b0b3e18dcb0b4410d98418c0a.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b96de5e4270ce2b38129423b13780b8a.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/543a188641d56331698cb6bead0ebf73.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/9b32e97de177b7d01073643205de766b.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/23e584d8b3d89289be3cb4198d16871d.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/fd165d0f72e8a1858862015cf79a0dc0.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/5fb7a9348c98b8206c13fb4e2b440a31.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/ad799cb05d3645c376825664b0a6a593.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/aa2f44427d51c9d285a7bfcf03b54fe1.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/d0c50f9fedcf51effaaffb4c2fde4293.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/bf7a43ef335b403f2b02929d7c8fded1.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/844ce0e7de19980cb8261132d50ca1f9.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/a0f5e0bf835e92f4f07791eb18fe1bb5.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/27fa51dc9eb068ef16ee644733cb12d8.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/ec16b143db2cc1a41ec8518bd360a6d0.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/ae63fd2e0a38bd93fce04fef035fbb13.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/949e2f1a86e492d6dd1c3a2720aeae40.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/cce896cb756bf274c0d87e82419f76cd.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/88b757133689ac02b9bafb12e73a7497.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/f06e0e9bdae49a26964a2ae01d9581ca.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/6aef1560b96186cb27905c5b438de1fa.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/3922e72230e00f1a0f83c4ef5e3d3cbb.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/bdce076d75de045e71bb8eb747e38a80.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/d5e2d2138b9fbdb813c1627899974259.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/ee989e3ba973dc1773316a3755695519.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/ef53c9d53e1807378201d86be207628d.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/c9127b8d05b33618b4f56346f5ea0331.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/cf5b19fa3ff5f10238c7108d2c3a1e09.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/6f43c02f23adb2e9c2c4a19ecfcd36f3.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/4997a94285b16244e6b1507c21f67e02.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/32b4a759383211d86836e057632a846d.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/f443284d929abd547736a20ef05030ef.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/3a19222610728295fadf56ae54e688ab.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/e8bfbdc8dcb20d960deb66d91d1fc682.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/02979bc1ef67413044a2ecdf336f9577.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/d41fd19bf24f8b7c89a29911a4eb9b4c.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/bbeef7cbe2f327575bfd222a79c11de4.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/fd7212c143e01a1a88ed954ae06520bb.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/dba12497c234a22546f929d81972a223.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/8b92441ea59b6366ebd295f46d3dbda3.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/231fb9b97be60884d5fc799dd4fe5cc9.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/d54da7c5aa3ea7b2d79cf16b45a14c11.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/32676abd2474b7c91800fdb557022cd7.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/08000ea144fa8e9ab4a5abcc8997d508.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b8bfce1f82e19c1053da2ffa8e3d2cc9.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/e279c901e58cd7e458f1e06186440958.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/812d03654f322e6b1694781d6d413067.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b418be0acb1334464c82cfc62bfe18a7.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/4cf6bbd0622ddb1f84d8ad519cbe0a80.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/11a9c6a3355cda7e5ad61323551a6189.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/4f8490bbdddf6ca2cd95779057e7796d.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/c2c87510e14c17629134ae4ea811df05.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/9b81ee590d27c91277ce8f36280285e3.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/93dd1e06e1769cae48862d2069f3e19b.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/6dfe8354f0f8d8d2fe2fde1061251636.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/22181209a0562a4129b2dd2dce49e5e3.png\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/b03bffd09032838a5ede8ca054f80880.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/fc9e624f188aec38d71096487227d9e5.jpg\" /><img src=\"http://img.xm-bt.com/tinymce-upload/2021827/e787949d1bd4baf0944ffb26fddde351.png\" />sadf<img src=\"http://img.xm-bt.com/tinymce-upload/2021827/7d108db512f6a6a929cd0d0ad3b593e8.jpg\" /></p>',NULL,1,1632736205,'admin',1632808055,'admin');

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
(1,'admin','$2a$10$Dapy0OfUzakPppxYTeCuUeFuyJYMuhdIs8i6WrSBD7NcMMeO1.SMO','http://img.xm-bt.com/admin-avatar/fc9e624f188aec38d71096487227d9e5.jpg','超级管理员','admin@admin.com','13888888888','超级管理员',1,1,1,1,1582959143,'admin',1632813087,'admin'),
(2,'zhangsan','$2a$10$Ngw6Iusrhi5Dql7k2IKq6Om1MIsnMfzxpvIXIz1z9VTAevUFHmCMS','http://img.xm-bt.com/admin-avatar/b03bffd09032838a5ede8ca054f80880.jpg','内容管理','admin@qq.com','13555555555','张三',1,1,2,3,1626834498,'admin',1632804925,'zhangsan');

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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='请求日志';

/*Data for the table `sys_admin_log` */

insert  into `sys_admin_log`(`id`,`cost_time`,`ip`,`ip_info`,`name`,`request_param`,`request_type`,`request_url`,`username`,`created_at`) values 
(37,15,'192.168.56.1','','删除菜单权限','{\"routePath\":\"/content\",\"orderNo\":\"0.9\",\"icon\":\"ant-design:switcher-filled\",\"show\":\"1\",\"menuName\":\"内容管理\",\"isExt\":\"0\",\"id\":\"22\",\"type\":\"0\",\"parentMenu\":\"0\",\"status\":\"1\"}','POST','/skeleton/permission/edit','admin',1632813098),
(36,4,'192.168.56.1','','删除部门','{\"deptName\":\"财务部\",\"orderNo\":\"1\",\"remark\":\"财务部\",\"id\":\"16\",\"parentDept\":\"0\",\"status\":\"1\"}','POST','/skeleton/department/edit','admin',1632813094),
(35,19,'192.168.56.1','','删除角色','{\"menu[]\":\"27\",\"roleValue\":\"ROLE_ADMIN\",\"roleName\":\"超级管理员\",\"remark\":\"管理所有业务的角色\",\"id\":\"1\",\"status\":\"1\"}','POST','/skeleton/role/edit','admin',1632813091),
(34,109,'192.168.56.1','','修改管理用户','{\"role\":\"1\",\"nickname\":\"超级管理员\",\"remark\":\"超级管理员\",\"dept\":\"1\",\"id\":\"1\",\"pwd\":\"******\",\"account\":\"admin\",\"email\":\"admin@admin.com\"}','POST','/skeleton/admin/edit','admin',1632813087);

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
(1,'0','技术部','技术部',1.00,1,1628818864,'admin',1632799285,'admin'),
(16,'0','财务部','财务部',1.00,1,1628996812,'admin',1632813094,'admin'),
(3,'1','研发一部','这是研发一部',1.00,1,1628818932,'admin',1632278464,'admin'),
(4,'1','研发二部','研发二部',2.00,1,1628818951,'admin',1628818951,'admin'),
(5,'4','二部一组','二部一组',1.00,1,1628818976,'admin',1632297885,'admin'),
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
  `current_active_menu` varchar(255) NOT NULL DEFAULT '' COMMENT '当前激活菜单(类型为隐藏菜单时有效)',
  `is_external_link` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链',
  `is_cache` tinyint(3) unsigned DEFAULT '0' COMMENT '是否缓存',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`type`,`name`,`parent_id`,`path`,`method`,`sort_order`,`icon`,`url`,`component`,`permision_code`,`status`,`is_display`,`current_active_menu`,`is_external_link`,`is_cache`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,0,'系统管理',0,'1','',1.00,'ant-design:setting-outlined','/system','','',1,1,'',0,0,1629079245,'admin',1632797146,'admin'),
(2,1,'账号管理',1,'1,2','',1.00,'ant-design:usergroup-add-outlined','/system/admin','/sys/rbac/admin/index','system:admin',1,1,'',0,1,1629088689,'admin',1629958526,'admin'),
(3,1,'角色管理',1,'1,3','',2.00,'ant-design:experiment-filled','/system/role','/sys/rbac/role/index','system:role',1,1,'',0,1,1629088812,'admin',1629958529,'admin'),
(4,1,'菜单权限',1,'1,4','',3.00,'ant-design:unordered-list-outlined','/system/menu','/sys/rbac/menu/index','system:menu',1,1,'',0,1,1629088897,'admin',1632805027,'admin'),
(5,1,'部门管理',1,'1,5','',3.00,'ant-design:appstore-filled','/system/department','/sys/rbac/dept/index','system:dept',1,1,'',0,1,1629088944,'admin',1630294865,'admin'),
(6,1,'首页',0,'6','',0.00,'ant-design:home-outlined','/dashboard','/sys/dashboard/index','dashboard:home',1,1,'',0,0,1629521812,'admin',1632799290,'admin'),
(7,2,'添加菜单',4,'1,4,7','POST',3.00,'','/permission/add','','menu:btn:add',1,1,'',0,0,1629521812,'admin',1630300014,'admin'),
(8,2,'编辑菜单',4,'1,4,8','POST',4.00,'','/permission/edit','','menu:btn:edit',1,0,'',0,0,1629521812,'admin',1630300030,'admin'),
(9,2,'删除菜单',4,'1,4,9','DELETE',5.00,'','/permission/delete/*','','menu:btn:delete',1,1,'',0,0,1630300134,'admin',1630300134,'admin'),
(10,2,'添加部门',5,'1,5,10','POST',2.00,'','/department/add','','dept:btn:add',1,1,'',0,0,1630295445,'admin',1630295445,'admin'),
(11,2,'编辑部门',5,'1,5,11','POST',3.00,'','/department/edit','','dept:btn:edit',1,1,'',0,0,1630295482,'admin',1630295482,'admin'),
(12,2,'删除部门',5,'1,5,12','DELETE',4.00,'','/department/delete/*','','dept:btn:delete',1,1,'',0,0,1630299886,'admin',1630299903,'admin'),
(13,2,'添加帐号',2,'1,2,13','POST',3.00,'','/admin/add','','admin:btn:add',1,1,'',0,0,1630298703,'admin',1630298703,'admin'),
(14,2,'编辑帐号',2,'1,2,14','POST',3.00,'','/admin/edit','','admin:btn:edit',1,1,'',0,0,1630298743,'admin',1630298743,'admin'),
(15,2,'删除帐号',2,'1,2,15','DELETE',4.00,'','/admin/delete/*','','admin:btn:delete',1,1,'',0,0,1630298780,'admin',1630299095,'admin'),
(16,2,'添加角色',3,'1,3,16','POST',2.00,'','/role/add','','role:btn:add',1,1,'',0,0,1630299327,'admin',1630299327,'admin'),
(17,2,'编辑角色',3,'1,3,17','POST',3.00,'','/role/edit','','role:btn:edit',1,1,'',0,0,1630294225,'admin',1630299341,'admin'),
(18,2,'删除角色',3,'1,3,18','DELETE',5.00,'','/role/delete/*','','role:btn:delete',1,1,'',0,0,1630299397,'admin',1630299563,'admin'),
(19,1,'个人设置',0,'19','',0.00,'ant-design:info-circle-filled','/account-setting','/sys/account/setting/index','account:setting',1,0,'',0,0,1632280083,'admin',1632804815,'admin'),
(20,2,'修改基本信息',19,'19,20','POST',0.00,'','/account/edit','','setting:btn:basic',1,1,'',0,0,1632283251,'admin',1632297136,'admin'),
(21,2,'修改密码',19,'19,21','POST',2.00,'','/account/changePassword','','setting:btn:password',1,1,'',0,0,1632283394,'admin',1632290580,'admin'),
(22,0,'内容管理',0,'22','',0.90,'ant-design:switcher-filled','/content','','',1,1,'',0,0,1632620349,'admin',1632813098,'admin'),
(23,0,'文章管理',22,'22,23','',1.00,'ant-design:book-twotone','/content/article','','',1,1,'',0,0,1632620433,'admin',1632620433,'admin'),
(24,1,'分类列表',23,'22,23,24','',1.00,'ant-design:align-center-outlined','/content/article/category','/content/article/category/index','article:category',1,1,'',0,0,1632620594,'admin',1632641367,'admin'),
(25,1,'文章列表',23,'22,23,25','',2.00,'ant-design:book-twotone','/content/article/info','/content/article/info/index','article:info',1,1,'',0,0,1632620703,'admin',1632731137,'admin'),
(26,2,'添加分类',24,'22,23,24,26','POST',1.00,'','/article/category/add','','article-category:btn:add',1,1,'',0,0,1632624513,'admin',1632624547,'admin'),
(27,2,'编辑分类',24,'22,23,24,27','POST',2.00,'','/article/category/edit','','article-category:btn:edit',1,1,'',0,0,1632624602,'admin',1632624602,'admin'),
(28,2,'删除分类',24,'22,23,24,28','DELETE',3.00,'','/article/category/delete','','article-category:btn:delete',1,1,'',0,0,1632624661,'admin',1632624661,'admin'),
(29,2,'添加文章',25,'22,23,25,29','POST',2.00,'','/article/add','','article:btn:add',1,1,'',0,0,1632635734,'admin',1632635734,'admin'),
(30,2,'编辑文章',25,'22,23,25,30','POST',3.00,'','/article/edit/*','','article:btn:edit',1,1,'',0,0,1632635778,'admin',1632635778,'admin'),
(31,2,'删除文章',25,'22,23,25,31','DELETE',4.00,'','/article/delete/*','','article:btn:delete',1,1,'',0,0,1632635813,'admin',1632635813,'admin'),
(32,2,'查看详情',25,'22,23,25,32','GET',1.00,'','/article/detail/*','','article:btn:detail',1,1,'',0,0,1632640875,'admin',1632640875,'admin'),
(33,1,'编辑文章',23,'22,23,33','',3.10,'','article_edit','/content/article/info/ArticleAddOrEdit','',1,0,'/content/article/info',0,0,1632641345,'admin',1632718034,'admin'),
(34,1,'添加文章',23,'22,23,34','',3.00,'','article_add','/content/article/info/ArticleAddOrEdit','',1,0,'/content/article/info',0,0,1632641599,'admin',1632642095,'admin'),
(35,1,'文章详情',23,'22,23,35','',3.60,'','article_detail/:id','/content/article/info/ArticleDetail','',1,0,'/content/article/info',0,0,1632635696,'admin',1632641629,'admin'),
(36,1,'系统日志',1,'1,36','',5.00,'ant-design:info-circle-filled','/system/log','/sys/log/index','',1,1,'',0,0,1632809068,'admin',1632809068,'admin'),
(37,2,'删除日志',36,'1,36,37','DELETE',1.00,'','/log/delByIds/*','','log:btn:delete',1,1,'',0,0,1632809836,'admin',1632809836,'admin'),
(38,2,'清空日志',36,'1,36,38','DELETE',2.00,'','/log/delAll','','log:btn:clear',1,1,'',0,0,1632809902,'admin',1632809902,'admin');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`code`,`description`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,'超级管理员','ROLE_ADMIN','管理所有业务的角色',1,1628833064,'admin',1632813091,'admin'),
(2,'内容管理','ROLE_CONTENT','管理文章等内容的角色',1,1628833064,'admin',1632804891,'admin');

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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`permission_id`,`role_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
(1,1,1,1632297304,'admin',1632297304,'admin'),
(2,2,1,1632297304,'admin',1632297304,'admin'),
(3,3,1,1632297304,'admin',1632297304,'admin'),
(4,4,1,1632297304,'admin',1632297304,'admin'),
(5,5,1,1632297304,'admin',1632297304,'admin'),
(6,6,1,1632297304,'admin',1632297304,'admin'),
(7,7,1,1632297304,'admin',1632297304,'admin'),
(8,8,1,1632297304,'admin',1632297304,'admin'),
(9,9,1,1632297304,'admin',1632297304,'admin'),
(10,10,1,1632297304,'admin',1632297304,'admin'),
(11,11,1,1632297304,'admin',1632297304,'admin'),
(12,12,1,1632297304,'admin',1632297304,'admin'),
(13,13,1,1632297304,'admin',1632297304,'admin'),
(14,14,1,1632297304,'admin',1632297304,'admin'),
(15,15,1,1632297304,'admin',1632297304,'admin'),
(16,16,1,1632297304,'admin',1632297304,'admin'),
(17,17,1,1632297304,'admin',1632297304,'admin'),
(18,18,1,1632297304,'admin',1632297304,'admin'),
(19,19,1,1632297304,'admin',1632297304,'admin'),
(20,20,1,1632297304,'admin',1632297304,'admin'),
(21,21,1,1632297304,'admin',1632297304,'admin'),
(22,22,1,1632297304,'admin',1632297304,'admin'),
(23,23,1,1632297304,'admin',1632297304,'admin'),
(24,24,1,1632297304,'admin',1632297304,'admin'),
(25,25,1,1632297304,'admin',1632297304,'admin'),
(26,26,1,1632297304,'admin',1632297304,'admin'),
(27,27,1,1632297304,'admin',1632297304,'admin'),
(28,28,1,1632297304,'admin',1632297304,'admin'),
(29,29,1,1632297304,'admin',1632297304,'admin'),
(30,30,1,1632297304,'admin',1632297304,'admin'),
(31,31,1,1632297304,'admin',1632297304,'admin'),
(32,32,1,1632297304,'admin',1632297304,'admin'),
(33,33,1,1632297304,'admin',1632297304,'admin'),
(34,34,1,1632297304,'admin',1632297304,'admin'),
(35,35,1,1632297304,'admin',1632297304,'admin'),
(36,6,2,1632804483,'admin',1632804483,'admin'),
(37,23,2,1632804483,'admin',1632804483,'admin'),
(38,24,2,1632804483,'admin',1632804483,'admin'),
(39,26,2,1632804483,'admin',1632804483,'admin'),
(40,27,2,1632804483,'admin',1632804483,'admin'),
(41,28,2,1632804483,'admin',1632804483,'admin'),
(42,19,2,1632804483,'admin',1632804483,'admin'),
(43,21,2,1632804483,'admin',1632804483,'admin'),
(44,20,2,1632804483,'admin',1632804483,'admin'),
(45,22,2,1632804659,'admin',1632804659,'admin'),
(46,25,2,1632804659,'admin',1632804659,'admin'),
(47,34,2,1632804659,'admin',1632804659,'admin'),
(48,33,2,1632804659,'admin',1632804659,'admin'),
(49,35,2,1632804659,'admin',1632804659,'admin'),
(50,32,2,1632804686,'admin',1632804686,'admin'),
(51,29,2,1632804686,'admin',1632804686,'admin'),
(52,30,2,1632804686,'admin',1632804686,'admin'),
(53,31,2,1632804686,'admin',1632804686,'admin'),
(55,36,1,1632809087,'admin',1632809087,'admin'),
(56,37,1,1632809916,'admin',1632809916,'admin'),
(57,38,1,1632809916,'admin',1632809916,'admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
