/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : salon

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-10 16:43:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for salon_activity
-- ----------------------------
DROP TABLE IF EXISTS `salon_activity`;
CREATE TABLE `salon_activity` (
  `act_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_title` varchar(255) NOT NULL COMMENT '活动标题',
  `act_content` text NOT NULL COMMENT '活动内容',
  `act_status` int(11) NOT NULL DEFAULT '0' COMMENT '活动状态（0关闭|1开启）',
  `act_new_time` datetime NOT NULL COMMENT '活动开启时间',
  `act_end_time` datetime NOT NULL COMMENT '活动结束时间',
  PRIMARY KEY (`act_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_admin
-- ----------------------------
DROP TABLE IF EXISTS `salon_admin`;
CREATE TABLE `salon_admin` (
  `a_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `a_name` varchar(255) NOT NULL COMMENT '管理员姓名',
  `a_password` char(32) NOT NULL COMMENT '管理员密码',
  `a_logo` varchar(255) NOT NULL DEFAULT '0' COMMENT '管理员头像',
  `a_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `a_oldtime` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_branch
-- ----------------------------
DROP TABLE IF EXISTS `salon_branch`;
CREATE TABLE `salon_branch` (
  `bm_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `bm_name` varchar(255) NOT NULL COMMENT '部门名称',
  `bm_num` int(11) NOT NULL COMMENT '部门人数',
  PRIMARY KEY (`bm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_chit
-- ----------------------------
DROP TABLE IF EXISTS `salon_chit`;
CREATE TABLE `salon_chit` (
  `ch_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '代金券ID',
  `ch_money` decimal(10,2) NOT NULL COMMENT '代金券金额',
  `ch_info` text NOT NULL COMMENT '代金券内容介绍',
  `ch_valid_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '代金券有效时间',
  PRIMARY KEY (`ch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_combo
-- ----------------------------
DROP TABLE IF EXISTS `salon_combo`;
CREATE TABLE `salon_combo` (
  `com_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `com_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `com_price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `com_info` text NOT NULL COMMENT '套餐介绍',
  PRIMARY KEY (`com_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_expend
-- ----------------------------
DROP TABLE IF EXISTS `salon_expend`;
CREATE TABLE `salon_expend` (
  `ex_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '消费ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `ex_type` varchar(255) NOT NULL COMMENT '消费类型',
  `ex_money` decimal(10,2) NOT NULL COMMENT '消费金额',
  `ch_id` int(11) NOT NULL COMMENT '代金券ID',
  `com_id` int(11) NOT NULL COMMENT '套餐ID',
  `ex_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '消费时间',
  PRIMARY KEY (`ex_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_servelog
-- ----------------------------
DROP TABLE IF EXISTS `salon_servelog`;
CREATE TABLE `salon_servelog` (
  `serve_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '服务记录ID',
  `st_id` int(11) NOT NULL COMMENT '员工ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `com_id` int(11) NOT NULL COMMENT '套餐ID',
  `serve_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '服务时间',
  PRIMARY KEY (`serve_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_staff
-- ----------------------------
DROP TABLE IF EXISTS `salon_staff`;
CREATE TABLE `salon_staff` (
  `st_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `st_power` int(2) NOT NULL DEFAULT '0' COMMENT '是否拥有管理员权限0无1有',
  `st_name` varchar(255) NOT NULL COMMENT '员工姓名',
  `bm_id` int(11) NOT NULL COMMENT '部门ID',
  `st_sex` varchar(255) NOT NULL COMMENT '员工性别',
  `st_age` int(11) NOT NULL COMMENT '员工年龄',
  `st_tel` varchar(11) NOT NULL COMMENT '员工电话',
  `st_server_num` int(11) NOT NULL COMMENT '员工服务次数',
  `st_logo` varchar(255) NOT NULL DEFAULT '0' COMMENT '员工头像',
  `st_pay` decimal(10,2) NOT NULL DEFAULT '1800.00' COMMENT '员工工资(底薪1800)',
  `st_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '入职时间',
  `a_oldtime` datetime DEFAULT NULL COMMENT '最后登陆时间（管理员）',
  PRIMARY KEY (`st_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_user
-- ----------------------------
DROP TABLE IF EXISTS `salon_user`;
CREATE TABLE `salon_user` (
  `u_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `u_name` varchar(255) NOT NULL COMMENT '用户姓名',
  `u_password` char(32) NOT NULL COMMENT '用户密码',
  `u_sex` varchar(10) NOT NULL COMMENT '用户性别',
  `u_age` int(25) NOT NULL COMMENT '年龄',
  `u_tel` varchar(11) NOT NULL COMMENT '电话',
  `u_vip` varchar(255) NOT NULL COMMENT '会员等级',
  `u_logo` varchar(255) NOT NULL DEFAULT '0' COMMENT '用户头像',
  `u_balance` decimal(10,2) NOT NULL COMMENT '余额',
  `u_jointime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for salon_userorder
-- ----------------------------
DROP TABLE IF EXISTS `salon_userorder`;
CREATE TABLE `salon_userorder` (
  `yy_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `st_id` int(11) NOT NULL COMMENT '员工ID',
  `com_id` int(11) NOT NULL COMMENT '套餐ID',
  `yy_status` varchar(255) NOT NULL DEFAULT '0' COMMENT '预约状态',
  `yy_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`yy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
