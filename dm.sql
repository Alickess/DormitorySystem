/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : dm

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2020-11-16 15:08:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrator`
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('1', 'tom', '$2a$10$iBhHIIym.flhqeCcglcSoOw0Gjgb8GZP6zLro9J7k4ALVqA0kMuXa', '汤姆', '123456789', '1');
INSERT INTO `administrator` VALUES ('2', 'zy', '$2a$10$njUusu5jOLQxcneNybYYqurUvTClRKeljq/U8nTqEWEch.0TuOW36', '朱玉', '1381381381', '1');
INSERT INTO `administrator` VALUES ('3', 'zs', '$2a$10$zdSiSIwMIaYoXyhRu52gbu3jZdv9/.9e0Js1hE5qbY2RQQZD3s006', '张三', '123456789', '2');
INSERT INTO `administrator` VALUES ('4', 'ls', '$2a$10$EI0NUcVldxyQfOupNBQjQ.pLDhgSuANzmDdapmFbNtf1xeUbXun1W', '李四', '123456789', '2');
INSERT INTO `administrator` VALUES ('5', 'ww', '$2a$10$Yh.7M.njLGuj20mat6M.5OiWtTOVQZwApox4hTb8ouELs8sr.1GIO', '王五', '123456789', '2');
INSERT INTO `administrator` VALUES ('6', 'zl', '$2a$10$YF1WuzCZ52kyeJFoN2i/t.O067IGdl2ksDL9VEgP.VX7fE6NGYkGG', '赵六', '123456789', '2');
INSERT INTO `administrator` VALUES ('7', 'sq', '$2a$10$Nqx6UAQEXKr.KQCF0dz7cuXK/BCkbWqQlBxXMaplWji9Y7IZE1yp6', '孙七', '123456789', '2');
INSERT INTO `administrator` VALUES ('8', 'zb', '$2a$10$dX.AcnHEy3VBtf.SHlG7HOpFsPkTP7hzcEueUkgiG8cpLA76S4MNS', '周八', '123456789', '2');

-- ----------------------------
-- Table structure for `dormitory`
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dormitoryName` int(11) DEFAULT NULL,
  `buildingName` int(11) DEFAULT NULL,
  `totalBed` int(11) DEFAULT NULL,
  `useBed` int(11) DEFAULT NULL,
  `administrator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('1', '101', '1', '4', '3', '张三');
INSERT INTO `dormitory` VALUES ('2', '102', '1', '4', '3', '张三');
INSERT INTO `dormitory` VALUES ('3', '101', '2', '4', '0', '李四');
INSERT INTO `dormitory` VALUES ('4', '102', '2', '4', '0', '李四');
INSERT INTO `dormitory` VALUES ('5', '101', '3', '4', '0', '王五');
INSERT INTO `dormitory` VALUES ('6', '102', '3', '4', '0', '王五');
INSERT INTO `dormitory` VALUES ('7', '101', '4', '4', '0', '赵六');
INSERT INTO `dormitory` VALUES ('8', '102', '4', '4', '2', '赵六');
INSERT INTO `dormitory` VALUES ('9', '101', '5', '4', '0', '孙七');
INSERT INTO `dormitory` VALUES ('10', '102', '5', '4', '0', '孙七');
INSERT INTO `dormitory` VALUES ('11', '101', '6', '4', '0', '周八');
INSERT INTO `dormitory` VALUES ('12', '102', '6', '4', '0', '周八');
INSERT INTO `dormitory` VALUES ('13', '101', '7', '4', '0', '吴九');
INSERT INTO `dormitory` VALUES ('14', '102', '7', '4', '0', '吴九');

-- ----------------------------
-- Table structure for `dormitoryclean`
-- ----------------------------
DROP TABLE IF EXISTS `dormitoryclean`;
CREATE TABLE `dormitoryclean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dormitoryId` int(11) DEFAULT NULL,
  `creatTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `appraise` varchar(50) DEFAULT NULL,
  `administrator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dormitoryclean
-- ----------------------------
INSERT INTO `dormitoryclean` VALUES ('1', '1', '2020-11-16 00:00:00', '2020-11-16 13:14:54', '91', '很好', '张三');
INSERT INTO `dormitoryclean` VALUES ('2', '2', '2020-11-16 12:40:36', '2020-11-16 13:15:00', '80', '良好', '张三');
INSERT INTO `dormitoryclean` VALUES ('3', '8', '2020-11-16 13:35:48', '2020-11-16 13:35:48', '60', '及格', '赵六');

-- ----------------------------
-- Table structure for `professional`
-- ----------------------------
DROP TABLE IF EXISTS `professional`;
CREATE TABLE `professional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) DEFAULT NULL,
  `className` varchar(50) DEFAULT NULL,
  `counselor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of professional
-- ----------------------------
INSERT INTO `professional` VALUES ('1', '171', '物联网工程', '小明');
INSERT INTO `professional` VALUES ('2', '172', '物联网工程', '小明');
INSERT INTO `professional` VALUES ('3', '173', '物联网工程', '小明');
INSERT INTO `professional` VALUES ('4', '174', '物联网工程', '小明');
INSERT INTO `professional` VALUES ('5', '171', '电子商务', '小红');
INSERT INTO `professional` VALUES ('6', '172', '电子商务', '小红');
INSERT INTO `professional` VALUES ('7', '173', '电子商务', '小红');
INSERT INTO `professional` VALUES ('8', '171', '机械自动化', '小刚');
INSERT INTO `professional` VALUES ('9', '172', '机械自动化', '小刚');
INSERT INTO `professional` VALUES ('10', '173', '机械自动化', '小刚');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'SUPER', '超级管理员');
INSERT INTO `role` VALUES ('2', 'ROOT', '管理员');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` int(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `dormitoryId` int(11) DEFAULT NULL,
  `professionalId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '20170101', '小樱姐', '女', '23', '138138138', '1', '5');
INSERT INTO `student` VALUES ('2', '20170102', '陈橙', '女', '22', '138138138', '1', '6');
INSERT INTO `student` VALUES ('3', '20170103', '赵晶', '女', '22', '1381381', '1', '7');
INSERT INTO `student` VALUES ('4', '20170201', '麻果斌', '男', '22', '1381381111', '2', '1');
INSERT INTO `student` VALUES ('5', '20170202', '猫叔烦', '男', '22', '1381381381', '2', '2');
INSERT INTO `student` VALUES ('6', '20170203', '阿瑟东', '男', '23', '1381381381', '2', '3');
INSERT INTO `student` VALUES ('7', '20170301', '郑一凡', '男', '22', '147147147', '8', '8');
INSERT INTO `student` VALUES ('8', '20170302', '胡斯托', '男', '25', '158158158', '8', '9');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(100) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('1', '2020-11-15 23:03:27', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '20', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('2', '2020-11-16 12:23:39', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '4', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('3', '2020-11-16 12:27:05', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '6', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('4', '2020-11-16 12:27:11', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '4', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('5', '2020-11-16 12:30:18', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '6', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('6', '2020-11-16 12:33:01', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '4', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('7', '2020-11-16 12:34:06', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '43', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('8', '2020-11-16 12:38:02', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '8', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('9', '2020-11-16 12:40:36', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitoryClean.do/dormitoryClean', '8', '[类名]com.zwu.controller.DormitoryCleanController[方法名] saveDormitoryClean');
INSERT INTO `syslog` VALUES ('10', '2020-11-16 12:40:49', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '3', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('11', '2020-11-16 12:40:52', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '3', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('12', '2020-11-16 12:57:43', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '78', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('13', '2020-11-16 12:58:03', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '77', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('14', '2020-11-16 12:58:25', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '75', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('15', '2020-11-16 12:58:44', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '80', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('16', '2020-11-16 12:59:29', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '78', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('17', '2020-11-16 12:59:54', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '75', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('18', '2020-11-16 13:00:12', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('19', '2020-11-16 13:00:17', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('20', '2020-11-16 13:00:22', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('21', '2020-11-16 13:00:27', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('22', '2020-11-16 13:01:51', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '14', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('23', '2020-11-16 13:02:18', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('24', '2020-11-16 13:02:31', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('25', '2020-11-16 13:02:41', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('26', '2020-11-16 13:03:04', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('27', '2020-11-16 13:03:14', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('28', '2020-11-16 13:03:26', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('29', '2020-11-16 13:03:42', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('30', '2020-11-16 13:04:26', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '3', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
INSERT INTO `syslog` VALUES ('31', '2020-11-16 13:06:14', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '6', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('32', '2020-11-16 13:06:29', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('33', '2020-11-16 13:06:41', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('34', '2020-11-16 13:06:51', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('35', '2020-11-16 13:07:08', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('36', '2020-11-16 13:07:20', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('37', '2020-11-16 13:07:46', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('38', '2020-11-16 13:07:53', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('39', '2020-11-16 13:08:02', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('40', '2020-11-16 13:08:11', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('41', '2020-11-16 13:09:28', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('42', '2020-11-16 13:09:42', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] saveDormitory');
INSERT INTO `syslog` VALUES ('43', '2020-11-16 13:11:10', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '2', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('44', '2020-11-16 13:11:15', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '1', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('45', '2020-11-16 13:11:52', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '13', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('46', '2020-11-16 13:12:48', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('47', '2020-11-16 13:13:05', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('48', '2020-11-16 13:13:19', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('49', '2020-11-16 13:13:25', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '10', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('50', '2020-11-16 13:13:32', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('51', '2020-11-16 13:13:47', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('52', '2020-11-16 13:13:48', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('53', '2020-11-16 13:14:00', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('54', '2020-11-16 13:14:21', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('55', '2020-11-16 13:14:37', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('56', '2020-11-16 13:14:54', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '2', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('57', '2020-11-16 13:15:00', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitoryClean.do/dormitoryClean', '2', '[类名]com.zwu.controller.DormitoryCleanController[方法名] updateDormitoryClean');
INSERT INTO `syslog` VALUES ('58', '2020-11-16 13:15:15', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '3', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
INSERT INTO `syslog` VALUES ('59', '2020-11-16 13:15:20', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
INSERT INTO `syslog` VALUES ('60', '2020-11-16 13:15:24', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
INSERT INTO `syslog` VALUES ('61', '2020-11-16 13:15:38', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('62', '2020-11-16 13:15:49', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('63', '2020-11-16 13:15:59', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('64', '2020-11-16 13:16:05', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '3', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('65', '2020-11-16 13:16:12', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
INSERT INTO `syslog` VALUES ('66', '2020-11-16 13:16:16', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '1', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
INSERT INTO `syslog` VALUES ('67', '2020-11-16 13:16:30', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('68', '2020-11-16 13:16:37', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '1', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('69', '2020-11-16 13:16:43', 'tom', '0:0:0:0:0:0:0:1', '/saveProfessional.do/professional', '2', '[类名]com.zwu.controller.ProfessionalController[方法名] saveProfessional');
INSERT INTO `syslog` VALUES ('70', '2020-11-16 13:17:57', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('71', '2020-11-16 13:18:22', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('72', '2020-11-16 13:18:49', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '8', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('73', '2020-11-16 13:18:54', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '2', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('74', '2020-11-16 13:19:02', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '1', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('75', '2020-11-16 13:19:09', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '1', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('76', '2020-11-16 13:19:15', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '1', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('77', '2020-11-16 13:19:26', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('78', '2020-11-16 13:19:31', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('79', '2020-11-16 13:20:20', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('80', '2020-11-16 13:20:38', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '8', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('81', '2020-11-16 13:20:50', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '6', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('82', '2020-11-16 13:20:54', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '8', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('83', '2020-11-16 13:20:59', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('84', '2020-11-16 13:21:06', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('85', '2020-11-16 13:23:07', 'tom', '127.0.0.1', '/updateDormitory.do/dormitory', '6', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('86', '2020-11-16 13:23:20', 'tom', '127.0.0.1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('87', '2020-11-16 13:25:54', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '5', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('88', '2020-11-16 13:26:06', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '15', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('89', '2020-11-16 13:26:10', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '12', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('90', '2020-11-16 13:26:22', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('91', '2020-11-16 13:26:59', 'tom', '0:0:0:0:0:0:0:1', '/saveStudent.do/student', '6', '[类名]com.zwu.controller.StudentController[方法名] saveStudent');
INSERT INTO `syslog` VALUES ('92', '2020-11-16 13:27:09', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('93', '2020-11-16 13:27:13', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('94', '2020-11-16 13:27:18', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '2', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('95', '2020-11-16 13:27:24', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('96', '2020-11-16 13:27:30', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('97', '2020-11-16 13:27:36', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('98', '2020-11-16 13:28:14', 'tom', '0:0:0:0:0:0:0:1', '/saveStudent.do/student', '2', '[类名]com.zwu.controller.StudentController[方法名] saveStudent');
INSERT INTO `syslog` VALUES ('99', '2020-11-16 13:28:20', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('100', '2020-11-16 13:28:23', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('101', '2020-11-16 13:28:56', 'tom', '0:0:0:0:0:0:0:1', '/saveStudent.do/student', '5', '[类名]com.zwu.controller.StudentController[方法名] saveStudent');
INSERT INTO `syslog` VALUES ('102', '2020-11-16 13:30:55', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '12', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('103', '2020-11-16 13:31:00', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('104', '2020-11-16 13:31:05', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '10', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('105', '2020-11-16 13:32:49', 'tom', '0:0:0:0:0:0:0:1', '/saveStudent.do/student', '21', '[类名]com.zwu.controller.StudentController[方法名] saveStudent');
INSERT INTO `syslog` VALUES ('106', '2020-11-16 13:33:23', 'tom', '0:0:0:0:0:0:0:1', '/saveStudent.do/student', '13', '[类名]com.zwu.controller.StudentController[方法名] saveStudent');
INSERT INTO `syslog` VALUES ('107', '2020-11-16 13:34:15', 'tom', '0:0:0:0:0:0:0:1', '/saveStudent.do/student', '6', '[类名]com.zwu.controller.StudentController[方法名] saveStudent');
INSERT INTO `syslog` VALUES ('108', '2020-11-16 13:34:44', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '9', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('109', '2020-11-16 13:34:48', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '4', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('110', '2020-11-16 13:34:51', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '3', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('111', '2020-11-16 13:35:48', 'tom', '0:0:0:0:0:0:0:1', '/saveDormitoryClean.do/dormitoryClean', '3', '[类名]com.zwu.controller.DormitoryCleanController[方法名] saveDormitoryClean');
INSERT INTO `syslog` VALUES ('112', '2020-11-16 13:44:34', 'tom', '0:0:0:0:0:0:0:1', '/deleteStudent.do/student', '12', '[类名]com.zwu.controller.StudentController[方法名] deleteStudent');
INSERT INTO `syslog` VALUES ('113', '2020-11-16 13:50:59', 'tom', '0:0:0:0:0:0:0:1', '/saveAdmin.do/admin', '79', '[类名]com.zwu.controller.AdminController[方法名] saveAdmin');
INSERT INTO `syslog` VALUES ('114', '2020-11-16 13:51:02', 'tom', '0:0:0:0:0:0:0:1', '/deleteAdmin.do/admin', '4', '[类名]com.zwu.controller.AdminController[方法名] deleteAdmin');
INSERT INTO `syslog` VALUES ('115', '2020-11-16 14:02:43', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '6', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('116', '2020-11-16 14:02:47', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '10', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('117', '2020-11-16 14:02:55', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '9', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('118', '2020-11-16 14:03:05', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '12', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('119', '2020-11-16 14:03:23', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('120', '2020-11-16 14:07:56', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('121', '2020-11-16 14:08:00', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '7', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('122', '2020-11-16 14:08:15', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('123', '2020-11-16 14:08:34', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '12', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('124', '2020-11-16 14:12:36', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '5', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('125', '2020-11-16 14:12:42', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '12', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('126', '2020-11-16 14:12:51', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '11', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('127', '2020-11-16 14:13:17', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('128', '2020-11-16 14:13:20', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '7', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('129', '2020-11-16 14:13:24', 'tom', '0:0:0:0:0:0:0:1', '/updateStudent.do/student', '7', '[类名]com.zwu.controller.StudentController[方法名] updateStudent');
INSERT INTO `syslog` VALUES ('130', '2020-11-16 14:13:29', 'tom', '0:0:0:0:0:0:0:1', '/updateDormitory.do/dormitory', '2', '[类名]com.zwu.controller.DormitoryController[方法名] updateDormitory');
INSERT INTO `syslog` VALUES ('131', '2020-11-16 14:59:48', 'tom', '0:0:0:0:0:0:0:1', '/updateAdmin.do/admin', '6', '[类名]com.zwu.controller.AdminController[方法名] updateAdmin');
INSERT INTO `syslog` VALUES ('132', '2020-11-16 14:59:56', 'tom', '0:0:0:0:0:0:0:1', '/updateAdmin.do/admin', '4', '[类名]com.zwu.controller.AdminController[方法名] updateAdmin');
INSERT INTO `syslog` VALUES ('133', '2020-11-16 15:02:48', 'tom', '0:0:0:0:0:0:0:1', '/updateAdminToInformational.do/admin', '36', '[类名]com.zwu.controller.AdminController[方法名] updateAdminToInformational');
INSERT INTO `syslog` VALUES ('134', '2020-11-16 15:03:31', 'tom', '0:0:0:0:0:0:0:1', '/updateAdminToInformational.do/admin', '4', '[类名]com.zwu.controller.AdminController[方法名] updateAdminToInformational');
INSERT INTO `syslog` VALUES ('135', '2020-11-16 15:05:59', 'tom', '0:0:0:0:0:0:0:1', '/updateAdminToInformational.do/admin', '36', '[类名]com.zwu.controller.AdminController[方法名] updateAdminToInformational');
INSERT INTO `syslog` VALUES ('136', '2020-11-16 15:06:31', 'tom', '0:0:0:0:0:0:0:1', '/updateProfessional.do/professional', '4', '[类名]com.zwu.controller.ProfessionalController[方法名] updateProfessional');
