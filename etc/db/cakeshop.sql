/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : cakeshop

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-05-14 18:49:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ads
-- ----------------------------

-- ----------------------------
-- Table structure for applys
-- ----------------------------
DROP TABLE IF EXISTS `applys`;
CREATE TABLE `applys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coname` varchar(80) NOT NULL DEFAULT '',
  `city` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `pnumber` smallint(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(10) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `applyed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applys
-- ----------------------------

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of areas
-- ----------------------------

-- ----------------------------
-- Table structure for categoryattrs
-- ----------------------------
DROP TABLE IF EXISTS `categoryattrs`;
CREATE TABLE `categoryattrs` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `cid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `dec` varchar(255) NOT NULL DEFAULT '',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categoryattrs_cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoryattrs
-- ----------------------------

-- ----------------------------
-- Table structure for categorys
-- ----------------------------
DROP TABLE IF EXISTS `categorys`;
CREATE TABLE `categorys` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `slug` varchar(20) NOT NULL DEFAULT '',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorys
-- ----------------------------
INSERT INTO `categorys` VALUES ('1', '积分商品', 'credit', '1');
INSERT INTO `categorys` VALUES ('2', '搭配购买', 'acc', '2');
INSERT INTO `categorys` VALUES ('3', '慕斯蛋糕', 'mousse', '3');
INSERT INTO `categorys` VALUES ('4', '巧克力蛋糕', 'chocolate', '4');
INSERT INTO `categorys` VALUES ('5', '乳酪蛋糕', 'cheese', '5');
INSERT INTO `categorys` VALUES ('6', '乳脂奶油蛋糕', 'creambutter', '6');
INSERT INTO `categorys` VALUES ('7', '冰淇淋蛋糕', 'icecream', '7');

-- ----------------------------
-- Table structure for consults
-- ----------------------------
DROP TABLE IF EXISTS `consults`;
CREATE TABLE `consults` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `posted` int(10) unsigned NOT NULL DEFAULT '0',
  `reply` text NOT NULL,
  `replyed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consults
-- ----------------------------

-- ----------------------------
-- Table structure for creditlogs
-- ----------------------------
DROP TABLE IF EXISTS `creditlogs`;
CREATE TABLE `creditlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `ctype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `affect` smallint(6) unsigned NOT NULL DEFAULT '0',
  `log` varchar(100) NOT NULL DEFAULT '',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creditlogs
-- ----------------------------

-- ----------------------------
-- Table structure for distributions
-- ----------------------------
DROP TABLE IF EXISTS `distributions`;
CREATE TABLE `distributions` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pdid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `price` float NOT NULL,
  `content` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of distributions
-- ----------------------------
INSERT INTO `distributions` VALUES ('1', '0', '免费配送', '0', '');
INSERT INTO `distributions` VALUES ('2', '0', '上门自提', '0', '');

-- ----------------------------
-- Table structure for marks
-- ----------------------------
DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `relation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL,
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marks
-- ----------------------------

-- ----------------------------
-- Table structure for oauths
-- ----------------------------
DROP TABLE IF EXISTS `oauths`;
CREATE TABLE `oauths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `src` varchar(10) NOT NULL DEFAULT '',
  `openid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauths
-- ----------------------------

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `said` int(10) unsigned NOT NULL DEFAULT '0',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitems
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `uaid` int(10) unsigned NOT NULL DEFAULT '0',
  `distrid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `distribbed` varchar(24) NOT NULL DEFAULT '',
  `payment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `isinvoice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `invoicesub` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `invoicename` varchar(80) NOT NULL DEFAULT '',
  `invoicecontent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shippingprice` float NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordered` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `slug` varchar(20) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `template` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pages_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', '吉米的厨房', 'aboutus', '', 'staticpage.html');
INSERT INTO `pages` VALUES ('2', '包装展示', 'bzzs', '', 'staticpage.html');
INSERT INTO `pages` VALUES ('3', '订购说明', 'dgsm', '', 'staticpage.html');
INSERT INTO `pages` VALUES ('4', '如何收货', 'rhsh', '', 'staticpage.html');
INSERT INTO `pages` VALUES ('5', '付款方式', 'fkfs', '', 'staticpage.html');
INSERT INTO `pages` VALUES ('6', '配送范围', 'psfw', '', 'staticpage.html');

-- ----------------------------
-- Table structure for shopattrs
-- ----------------------------
DROP TABLE IF EXISTS `shopattrs`;
CREATE TABLE `shopattrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` float NOT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopattrs
-- ----------------------------
INSERT INTO `shopattrs` VALUES ('1', '1', '100g', '10', '1');
INSERT INTO `shopattrs` VALUES ('2', '2', '50g', '15', '1');

-- ----------------------------
-- Table structure for shoppics
-- ----------------------------
DROP TABLE IF EXISTS `shoppics`;
CREATE TABLE `shoppics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppics
-- ----------------------------
INSERT INTO `shoppics` VALUES ('1', '1', '15578266344241.jpg');
INSERT INTO `shoppics` VALUES ('2', '2', '15578308745232.jpg');

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `ename` varchar(100) NOT NULL DEFAULT '',
  `price` varchar(30) NOT NULL DEFAULT '',
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resume` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `prompt` text NOT NULL,
  `args` text NOT NULL,
  `cover` varchar(20) NOT NULL DEFAULT '',
  `views` smallint(6) unsigned NOT NULL DEFAULT '0',
  `orders` smallint(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', 'ABC巧克力蛋糕', 'abc cake', '10.0', '4', '3', '沙巴巧克力蛋糕', '<div class=\"mVDMnf nJGrxf\" style=\"color: rgb(112, 117, 122); font-size: 12px; letter-spacing: 0.2px; line-height: 20px; max-height: 20px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">沙巴巧克力蛋糕</div><div style=\"top: 0px;\"><a jsname=\"hSRGPd\" href=\"https://www.google.com/imgres?imgurl=https%3A%2F%2Ftokyo-kitchen.icook.network%2Fuploads%2Frecipe%2Fcover%2F188864%2Flarge_5ffb0d3b5dbb710d.jpg&amp;imgrefurl=https%3A%2F%2Ficook.tw%2Frecipes%2F188864&amp;docid=7esjH2waMyqQxM&amp;tbnid=_unrf4Du4h12ZM%3A&amp;vet=10ahUKEwjs2o-u3JriAhVSPrwKHQfrBk0QMwguKAAwAA..i&amp;w=800&amp;h=600&amp;bih=969&amp;biw=1920&amp;q=%E5%B7%A7%E5%85%8B%E5%8A%9B%E8%9B%8B%E7%B3%95&amp;ved=0ahUKEwjs2o-u3JriAhVSPrwKHQfrBk0QMwguKAAwAA&amp;iact=mrc&amp;uact=8\" jsaction=\"fire.ivg_o;mouseover:str.hmov;mouseout:str.hmou\" class=\"rg_l\" rel=\"noopener\" style=\"display: inline-block; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: 176px; position: relative; text-decoration-line: none; width: 234px; overflow: hidden; z-index: 1; color: rgb(102, 0, 153); cursor: pointer; font-family: arial, sans-serif; font-size: 0px; left: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><img id=\"_unrf4Du4h12ZM:\" src=\"data:image/jpeg;base64,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\" jsaction=\"load:str.tbn\" class=\"rg_ic rg_i\" alt=\"“巧克力蛋糕”的图片搜索结果\" data-atf=\"1\" style=\"border: 0px; color: rgba(0, 0, 0, 0); display: block; width: 235px; height: 176px; margin-left: -1px; margin-right: 0px; margin-top: 0px;\" /></a><a class=\"iKjWAf irc-nic isr-rtc a-no-hover-decoration\" href=\"https://icook.tw/recipes/188864\" rel=\"noopener\" jsaction=\"mouseover:m8Yy5c;mousedown:QEDpme;focus:QEDpme;\" target=\"_blank\" style=\"bottom: 0px; box-sizing: border-box; display: inline-block; padding: 6px 4px 0px; position: relative; text-decoration-line: none; width: 234px; color: rgb(102, 0, 153); cursor: pointer; font-family: arial, sans-serif; font-size: 0px;\"></a><div class=\"mVDMnf nJGrxf\" style=\"color: rgb(112, 117, 122); font-size: 12px; letter-spacing: 0.2px; line-height: 20px; max-height: 20px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">沙巴巧克力蛋糕</div></div>', '', '{}', '15578266344241.jpg', '2', '0', '0', '1557826494');
INSERT INTO `shops` VALUES ('2', '草莓慕斯蛋糕', 'mush cake', '15.0', '3', '3', '草莓慕斯蛋糕简介', '香甜可口的草莓慕斯蛋糕', '<span style=\"font-family: 宋体, Arial, tahoma, arial, sans-serif;\">友情提示：请勿多吃，会胖。</span><br />', '{}', '15578308745232.jpg', '2', '0', '0', '1557830636');

-- ----------------------------
-- Table structure for useraddrs
-- ----------------------------
DROP TABLE IF EXISTS `useraddrs`;
CREATE TABLE `useraddrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `city` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(10) NOT NULL DEFAULT '',
  `tel` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `useraddrs_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraddrs
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(10) NOT NULL DEFAULT '',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `birthday` date NOT NULL,
  `tel` varchar(30) NOT NULL DEFAULT '',
  `credit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `order` smallint(6) unsigned NOT NULL DEFAULT '0',
  `consult` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `signuped` int(10) unsigned NOT NULL DEFAULT '0',
  `lsignined` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'root', '96e79218965eb72c92a549dd5a330112', '', '2', '', '1980-01-01', '', '0', '0', '0', '9', '1557823456', '1557830655');

-- ----------------------------
-- Table structure for uservcodes
-- ----------------------------
DROP TABLE IF EXISTS `uservcodes`;
CREATE TABLE `uservcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `vcode` smallint(4) unsigned NOT NULL DEFAULT '0',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uservcodes_mobile_vcode` (`mobile`,`vcode`),
  KEY `uservcodes_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uservcodes
-- ----------------------------
