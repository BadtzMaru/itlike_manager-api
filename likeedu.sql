/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : likeedu

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 28/10/2020 23:17:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` VALUES ('BcO-DfCj09EynvCHR3v5-8rStmRoZ4sJ', 1603984491, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2020-10-29T15:14:36.776Z\",\"httpOnly\":true,\"path\":\"/\"},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiYWNjb3VudCI6ImFkbWluIiwicGFzc3dvcmQiOiIzZDdkYTIxNzExYTZlOTc5MmVmZWQyMzAzYmJmNjBhMyIsImFjY291bnRfbmFtZSI6IumZiOeCnOWYiSIsImFjY291bnRfaWNvbiI6Ii91cGxvYWRzL2ltYWdlcy9hZG1pbi8xNjAwMDU3ODM0NDU4LmpwZWciLCJpYXQiOjE2MDM4OTgwNzZ9.rOwvK4sZjwQPaz_MmbLfJNwxd1oKCpS5Ay6vN1TPMSg\"}');
INSERT INTO `sessions` VALUES ('JBNy-5d9GU6C12WgbJVoaHg_2n_UmPY4', 1600325435, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2020-09-17T05:40:50.397Z\",\"httpOnly\":true,\"path\":\"/\"},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiYWNjb3VudCI6ImFkbWluIiwicGFzc3dvcmQiOiIzZDdkYTIxNzExYTZlOTc5MmVmZWQyMzAzYmJmNjBhMyIsImFjY291bnRfbmFtZSI6IumZiOeCnOWYiSIsImFjY291bnRfaWNvbiI6Ii91cGxvYWRzL2ltYWdlcy9hZG1pbi8xNjAwMDU3ODM0NDU4LmpwZWciLCJpYXQiOjE2MDAyMzQ4NTB9.-yf73UV77H-yYRh6zyr5ZhFGRKXO70KbEd1fBH-GVhU\"}');
INSERT INTO `sessions` VALUES ('ZLcgkbKFqxqEPy5uHa3jWbDOKptvTD4r', 1600325211, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2020-09-17T06:46:50.859Z\",\"httpOnly\":true,\"path\":\"/\"}}');
INSERT INTO `sessions` VALUES ('a8n8_6H4Vg68FpzFoH410pQVDTVoIvMs', 1600321213, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2020-09-17T05:40:12.964Z\",\"httpOnly\":true,\"path\":\"/\"}}');
INSERT INTO `sessions` VALUES ('i1Seaqn1tJQw8E5IpNmEEI2RHQ4WI0EG', 1600321213, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2020-09-17T05:40:12.957Z\",\"httpOnly\":true,\"path\":\"/\"}}');
INSERT INTO `sessions` VALUES ('yW93bzziuhpnWnaqZeOf-GDS1AM4ZtgX', 1600325279, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2020-09-17T06:47:59.034Z\",\"httpOnly\":true,\"path\":\"/\"}}');
COMMIT;

-- ----------------------------
-- Table structure for t_activities
-- ----------------------------
DROP TABLE IF EXISTS `t_activities`;
CREATE TABLE `t_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activities_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '活动标题',
  `activities_time` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '活动时间',
  `activities_img` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '活动封面',
  `activities_price` float(10,2) NOT NULL COMMENT '活动价格',
  `activities_tag` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '活动标签',
  `activities_count` int(11) NOT NULL COMMENT '活动报名人数',
  `activities_address_id` int(11) NOT NULL COMMENT '活动地点id',
  `activities_object_id` int(11) NOT NULL COMMENT '所属招生对象id',
  `activities_bus_day_id` int(11) NOT NULL COMMENT '营期',
  `activities_intro` text COLLATE gbk_bin COMMENT '活动介绍',
  `activities_trip` text COLLATE gbk_bin COMMENT '活动行程安排',
  `activities_day` text COLLATE gbk_bin COMMENT '开营时间',
  `activities_notice` text COLLATE gbk_bin COMMENT '报名须知',
  `is_focus` int(1) DEFAULT '0' COMMENT '0不上轮播图, 1上轮播图',
  `focus_img` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '轮播图图片',
  `buy_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_activities
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_activities_address
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_address`;
CREATE TABLE `t_activities_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activities_address` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '活动地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_activities_address
-- ----------------------------
BEGIN;
INSERT INTO `t_activities_address` VALUES (1, '北京');
INSERT INTO `t_activities_address` VALUES (2, '上海');
INSERT INTO `t_activities_address` VALUES (3, '南京');
INSERT INTO `t_activities_address` VALUES (4, '杭州');
INSERT INTO `t_activities_address` VALUES (5, '深圳');
COMMIT;

-- ----------------------------
-- Table structure for t_activities_bus
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_bus`;
CREATE TABLE `t_activities_bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activities_bus_day` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '营期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_activities_bus
-- ----------------------------
BEGIN;
INSERT INTO `t_activities_bus` VALUES (1, '1天');
INSERT INTO `t_activities_bus` VALUES (2, '2天');
INSERT INTO `t_activities_bus` VALUES (3, '3天');
INSERT INTO `t_activities_bus` VALUES (4, '4天');
INSERT INTO `t_activities_bus` VALUES (5, '5天');
INSERT INTO `t_activities_bus` VALUES (6, '6天');
INSERT INTO `t_activities_bus` VALUES (7, '7天');
COMMIT;

-- ----------------------------
-- Table structure for t_activities_object
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_object`;
CREATE TABLE `t_activities_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activities_object_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '招生对象',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_activities_object
-- ----------------------------
BEGIN;
INSERT INTO `t_activities_object` VALUES (1, '幼儿');
INSERT INTO `t_activities_object` VALUES (2, '青少年');
INSERT INTO `t_activities_object` VALUES (3, '中老年');
COMMIT;

-- ----------------------------
-- Table structure for t_activities_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_tag`;
CREATE TABLE `t_activities_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activities_tag_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '活动标签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_activities_tag
-- ----------------------------
BEGIN;
INSERT INTO `t_activities_tag` VALUES (1, '体验军旅');
INSERT INTO `t_activities_tag` VALUES (2, '军事拓展');
INSERT INTO `t_activities_tag` VALUES (3, '实弹射击');
COMMIT;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE gbk_bin NOT NULL,
  `password` varchar(255) COLLATE gbk_bin NOT NULL,
  `account_name` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `account_icon` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES (1, 'admin', '3d7da21711a6e9792efed2303bbf60a3', '陈炜嘉', '/uploads/images/admin/1600057834458.jpeg');
COMMIT;

-- ----------------------------
-- Table structure for t_home_message
-- ----------------------------
DROP TABLE IF EXISTS `t_home_message`;
CREATE TABLE `t_home_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `site_keyword` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `site_des` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `site_logo` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `site_copy` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `site_bei` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_home_message
-- ----------------------------
BEGIN;
INSERT INTO `t_home_message` VALUES (1, '陈炜嘉', '嘻嘻嘻', '哈哈哈', '/uploads/images/home/1600223540021.jpeg', 'xxxx----CCC', '707380414');
COMMIT;

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '职场人生标题',
  `job_img` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '职场人生封面',
  `job_author` varchar(255) COLLATE gbk_bin NOT NULL,
  `job_time` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '文章发布时间',
  `job_views` int(11) NOT NULL,
  `job_content` text COLLATE gbk_bin NOT NULL,
  `job_pre_edu_id` int(11) NOT NULL,
  `job_family_edu_id` int(11) NOT NULL,
  `is_focus` int(1) NOT NULL DEFAULT '0' COMMENT '是否上轮播图, 0不上, 1上',
  `focus_img` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '轮播图图片',
  `buy_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_job_family
-- ----------------------------
DROP TABLE IF EXISTS `t_job_family`;
CREATE TABLE `t_job_family` (
  `id` int(11) NOT NULL,
  `job_family_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '家园共育培训',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_job_family
-- ----------------------------
BEGIN;
INSERT INTO `t_job_family` VALUES (1, '全部幼小衔接');
INSERT INTO `t_job_family` VALUES (2, '亲子活动案例');
COMMIT;

-- ----------------------------
-- Table structure for t_job_pre
-- ----------------------------
DROP TABLE IF EXISTS `t_job_pre`;
CREATE TABLE `t_job_pre` (
  `id` int(11) NOT NULL,
  `pre_edu_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '学前教师培训',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_job_pre
-- ----------------------------
BEGIN;
INSERT INTO `t_job_pre` VALUES (1, '学前教育发展最新趋势');
INSERT INTO `t_job_pre` VALUES (2, '学前教育基础理论');
INSERT INTO `t_job_pre` VALUES (3, '教育活动设计主要策略');
COMMIT;

-- ----------------------------
-- Table structure for t_live
-- ----------------------------
DROP TABLE IF EXISTS `t_live`;
CREATE TABLE `t_live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `live_title` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '直播标题',
  `live_img` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '直播封面',
  `live_begin_time` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '直播时间',
  `live_end_time` varchar(255) COLLATE gbk_bin NOT NULL,
  `live_author` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '直播作者',
  `live_url` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '直播跳转地址',
  `live_price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '直播价格',
  `live_person_id` int(11) NOT NULL COMMENT '直播适用人群',
  `live_theme_id` int(11) NOT NULL COMMENT '直播内容主题id',
  `is_focus` int(1) NOT NULL DEFAULT '0' COMMENT '是否上轮播图, 0不上, 1上',
  `focus_img` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '轮播图图片',
  `buy_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_live
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_live_person
-- ----------------------------
DROP TABLE IF EXISTS `t_live_person`;
CREATE TABLE `t_live_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `live_person_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '适用人群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_live_person
-- ----------------------------
BEGIN;
INSERT INTO `t_live_person` VALUES (1, '青少年');
INSERT INTO `t_live_person` VALUES (2, '中老年');
INSERT INTO `t_live_person` VALUES (3, '幼儿');
COMMIT;

-- ----------------------------
-- Table structure for t_live_theme
-- ----------------------------
DROP TABLE IF EXISTS `t_live_theme`;
CREATE TABLE `t_live_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `live_theme_title` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '直播主题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_live_theme
-- ----------------------------
BEGIN;
INSERT INTO `t_live_theme` VALUES (1, '园所管理');
INSERT INTO `t_live_theme` VALUES (2, '园所理念');
INSERT INTO `t_live_theme` VALUES (3, '园所发展');
COMMIT;

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) COLLATE gbk_bin NOT NULL,
  `resource_author` varchar(255) COLLATE gbk_bin NOT NULL,
  `resource_views` int(11) NOT NULL,
  `resource_publish_time` varchar(255) COLLATE gbk_bin NOT NULL,
  `resource_content` varchar(255) COLLATE gbk_bin NOT NULL,
  `resource_category_id` int(11) NOT NULL,
  `resource_classes_id` int(11) NOT NULL COMMENT '资源班级',
  `resource_area_id` int(11) NOT NULL COMMENT '资源领域',
  `resource_mate_id` int(11) NOT NULL COMMENT '资源素材',
  `resource_format_id` int(11) NOT NULL,
  `resource_img` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '资源列表封面图',
  `resource_price` float(10,2) DEFAULT NULL COMMENT '资源的价格',
  `is_focus` int(1) NOT NULL DEFAULT '0' COMMENT '是否上轮播图, 0不上,  1伤 ',
  `focus_img` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '轮播图图片',
  `buy_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_resource_area
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_area`;
CREATE TABLE `t_resource_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) COLLATE gbk_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource_area
-- ----------------------------
BEGIN;
INSERT INTO `t_resource_area` VALUES (1, '健康');
INSERT INTO `t_resource_area` VALUES (2, '语言');
INSERT INTO `t_resource_area` VALUES (3, '社会');
INSERT INTO `t_resource_area` VALUES (4, '科学');
INSERT INTO `t_resource_area` VALUES (5, '艺术');
COMMIT;

-- ----------------------------
-- Table structure for t_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_category`;
CREATE TABLE `t_resource_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE gbk_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource_category
-- ----------------------------
BEGIN;
INSERT INTO `t_resource_category` VALUES (1, '教学小助手');
INSERT INTO `t_resource_category` VALUES (2, '亲子小学堂');
INSERT INTO `t_resource_category` VALUES (3, '培训教室');
INSERT INTO `t_resource_category` VALUES (4, 'GT课程');
COMMIT;

-- ----------------------------
-- Table structure for t_resource_classes
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_classes`;
CREATE TABLE `t_resource_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes_name` varchar(255) COLLATE gbk_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource_classes
-- ----------------------------
BEGIN;
INSERT INTO `t_resource_classes` VALUES (1, '托班');
INSERT INTO `t_resource_classes` VALUES (2, '小班');
INSERT INTO `t_resource_classes` VALUES (3, '中班');
INSERT INTO `t_resource_classes` VALUES (4, '大班');
COMMIT;

-- ----------------------------
-- Table structure for t_resource_file
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_file`;
CREATE TABLE `t_resource_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `name` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  `tag` varchar(255) COLLATE gbk_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_resource_format
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_format`;
CREATE TABLE `t_resource_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(255) COLLATE gbk_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource_format
-- ----------------------------
BEGIN;
INSERT INTO `t_resource_format` VALUES (1, '图片');
INSERT INTO `t_resource_format` VALUES (2, '文档');
INSERT INTO `t_resource_format` VALUES (3, '音频');
INSERT INTO `t_resource_format` VALUES (4, '视频');
INSERT INTO `t_resource_format` VALUES (5, '课件');
COMMIT;

-- ----------------------------
-- Table structure for t_resource_mate
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_mate`;
CREATE TABLE `t_resource_mate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mate_name` varchar(255) COLLATE gbk_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_resource_mate
-- ----------------------------
BEGIN;
INSERT INTO `t_resource_mate` VALUES (1, '教学设计');
INSERT INTO `t_resource_mate` VALUES (2, '教学课件');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '会员名',
  `user_password` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '登录密码',
  `user_phone` varchar(255) COLLATE gbk_bin NOT NULL COMMENT '用户手机号码',
  `user_count_money` float(10,2) DEFAULT NULL COMMENT '用户账户总学习币',
  `user_intro` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '用户介绍',
  `user_icon` varchar(255) COLLATE gbk_bin DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user_account
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account`;
CREATE TABLE `t_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account_change_time` varchar(255) COLLATE gbk_bin NOT NULL,
  `account_change_money` float(10,2) NOT NULL,
  `account_change_method` int(1) NOT NULL DEFAULT '0' COMMENT '0代表充值, 1代表支出',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_user_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user_activities
-- ----------------------------
DROP TABLE IF EXISTS `t_user_activities`;
CREATE TABLE `t_user_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `activities_id` int(11) NOT NULL COMMENT '报名活动的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_user_activities
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user_fav
-- ----------------------------
DROP TABLE IF EXISTS `t_user_fav`;
CREATE TABLE `t_user_fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `resource_id` int(11) DEFAULT NULL COMMENT '收藏资源id',
  `activities_id` int(11) DEFAULT NULL COMMENT '收藏活动id',
  `live_id` int(11) DEFAULT NULL COMMENT '收藏直播id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_user_fav
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user_live
-- ----------------------------
DROP TABLE IF EXISTS `t_user_live`;
CREATE TABLE `t_user_live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `live_id` int(11) NOT NULL COMMENT '直播id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_user_live
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_user_resource`;
CREATE TABLE `t_user_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '当前用户id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of t_user_resource
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
