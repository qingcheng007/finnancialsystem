/*
Navicat MySQL Data Transfer

Source Server         : dddd
Source Server Version : 50147
Source Host           : localhost:3306
Source Database       : financialsystem

Target Server Type    : MYSQL
Target Server Version : 50147
File Encoding         : 65001

Date: 2014-07-14 17:50:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auditstate
-- ----------------------------
DROP TABLE IF EXISTS `auditstate`;
CREATE TABLE `auditstate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Operator` bit(1) NOT NULL DEFAULT b'0' COMMENT '经办人审核状态',
  `Prover` bit(1) NOT NULL DEFAULT b'0' COMMENT '证明人审核状态',
  `Auditor1` bit(1) NOT NULL DEFAULT b'0' COMMENT '审核人1审核状态',
  `Auditor2` bit(1) NOT NULL DEFAULT b'0' COMMENT '审核人2审核状态',
  `Dearer` bit(1) NOT NULL DEFAULT b'0' COMMENT '审票人审核状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票状态审核表';

-- ----------------------------
-- Records of auditstate
-- ----------------------------

-- ----------------------------
-- Table structure for balance
-- ----------------------------
DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Available` decimal(12,2) NOT NULL COMMENT '账户可用余额',
  `Frozen` decimal(12,2) NOT NULL COMMENT '账户冻结余额',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户余额表';

-- ----------------------------
-- Records of balance
-- ----------------------------

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `CreateDate` datetime NOT NULL COMMENT '录入时间',
  `OccurDate` datetime NOT NULL COMMENT '发票发生日期',
  `Content` varchar(128) NOT NULL COMMENT '费用内容',
  `Money` decimal(12,2) NOT NULL COMMENT '应报销金额',
  `Penalty` decimal(12,2) DEFAULT NULL COMMENT '罚款金额',
  `Description` varchar(32) NOT NULL COMMENT '费用说明',
  `InvoiceDetailsId` int(11) NOT NULL COMMENT '票据详细信息 ID 对应的是 TicketDetails 中的ID字段',
  `InvoiceTypeId` int(11) NOT NULL COMMENT '票据类型ID 对应的是 TicketType 中的 Id 字段',
  `ProjectName` varchar(32) NOT NULL COMMENT '所属工程',
  `OperatorId` int(11) NOT NULL COMMENT '经办人 ID 参照的是 User 表中的 Id 字段',
  `ProverId` int(11) NOT NULL COMMENT '证明人 Id 参照的是 User 表中的 Id 字段',
  `Auditor1Id` int(11) NOT NULL COMMENT '审核人 1 的 id 参照的是 User 表中的 Id 字段',
  `Auditor2Id` int(11) NOT NULL COMMENT '审核人 2 的Id 参照的是 User 表中的 Id 字段',
  `AuditStateId` int(11) NOT NULL COMMENT '票据实物核对结果 参照 AuditState 表中的 Id 字段',
  `PhotoUrl` varchar(64) NOT NULL COMMENT '照片清单地址',
  `Remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `DearerId` int(11) NOT NULL COMMENT '审票人ID 参照 User 表中的 ID 字段',
  PRIMARY KEY (`Id`,`InvoiceDetailsId`,`InvoiceTypeId`,`OperatorId`,`ProverId`,`Auditor1Id`,`Auditor2Id`,`AuditStateId`,`DearerId`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_Invoice_User1_idx` (`OperatorId`),
  KEY `fk_Invoice_User2_idx` (`ProverId`),
  KEY `fk_Invoice_User3_idx` (`Auditor1Id`),
  KEY `fk_Invoice_User4_idx` (`Auditor2Id`),
  KEY `fk_Invoice_TicketType1_idx` (`InvoiceTypeId`),
  KEY `fk_Invoice_TicketDetails1_idx` (`InvoiceDetailsId`),
  KEY `fk_Invoice_AuditState1_idx` (`AuditStateId`),
  KEY `fk_Invoice_User5_idx` (`DearerId`),
  CONSTRAINT `fk_Invoice_User5` FOREIGN KEY (`DearerId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_AuditState1` FOREIGN KEY (`AuditStateId`) REFERENCES `auditstate` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_TicketDetails1` FOREIGN KEY (`InvoiceDetailsId`) REFERENCES `invoicedetails` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_TicketType1` FOREIGN KEY (`InvoiceTypeId`) REFERENCES `invoicetype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_User1` FOREIGN KEY (`OperatorId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_User2` FOREIGN KEY (`ProverId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_User3` FOREIGN KEY (`Auditor1Id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_User4` FOREIGN KEY (`Auditor2Id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票总表';

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for invoicedetails
-- ----------------------------
DROP TABLE IF EXISTS `invoicedetails`;
CREATE TABLE `invoicedetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Content1` varchar(64) DEFAULT NULL COMMENT '内容1',
  `Content2` varchar(64) DEFAULT NULL COMMENT '内容2',
  `Content3` varchar(64) DEFAULT NULL COMMENT '内容3',
  `Content4` varchar(64) DEFAULT NULL COMMENT '内容4',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='票务详细信息';

-- ----------------------------
-- Records of invoicedetails
-- ----------------------------

-- ----------------------------
-- Table structure for invoicetype
-- ----------------------------
DROP TABLE IF EXISTS `invoicetype`;
CREATE TABLE `invoicetype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Name` varchar(64) NOT NULL COMMENT '对应的票务类型名称',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='票务实际内容';

-- ----------------------------
-- Records of invoicetype
-- ----------------------------

-- ----------------------------
-- Table structure for penaltyrate
-- ----------------------------
DROP TABLE IF EXISTS `penaltyrate`;
CREATE TABLE `penaltyrate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rate` decimal(5,2) NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='利率表';

-- ----------------------------
-- Records of penaltyrate
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号   分别代表了 站内的 和 站外的职务 普通员工  站长  经理   总裁 等',
  `Name` varchar(64) NOT NULL COMMENT '职位名称',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户职位表';

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `Name` varchar(32) NOT NULL COMMENT '权限名称',
  `Icon` varchar(32) DEFAULT NULL,
  `Sequence` smallint(6) NOT NULL,
  `Url` varchar(64) DEFAULT NULL COMMENT '资源',
  `Type` smallint(6) NOT NULL COMMENT '权限类型',
  `Description` varchar(64) NOT NULL COMMENT '权限描述',
  `ParentId` int(11) NOT NULL DEFAULT '0',
  `IsLeaf` bit(1) NOT NULL DEFAULT b'0',
  `IsEnable` bit(1) DEFAULT b'1' COMMENT '是否可用',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='资源权限表				';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '后台管理', null, '1', '/admin', '3', '后台主页', '0', '\0', '');
INSERT INTO `resource` VALUES ('2', '系统管理', null, '1', null, '1', '管理系统模块', '1', '\0', '');
INSERT INTO `resource` VALUES ('3', '用户管理', null, '1', null, '1', '管理用户模块', '2', '\0', '');
INSERT INTO `resource` VALUES ('4', '角色管理', null, '2', null, '1', '管理角色模块', '2', '\0', '');
INSERT INTO `resource` VALUES ('5', '查看用户', null, '1', null, '2', '查看用户', '3', '\0', '');
INSERT INTO `resource` VALUES ('6', '添加用户', null, '2', null, '2', '添加用户', '3', '\0', '');
INSERT INTO `resource` VALUES ('7', '编辑用户', null, '3', null, '2', '编辑用户', '3', '\0', '');
INSERT INTO `resource` VALUES ('8', '删除用户', null, '4', null, '2', '删除用户', '3', '\0', '');
INSERT INTO `resource` VALUES ('9', '查看角色', null, '1', null, '2', '查看角色', '4', '\0', '');
INSERT INTO `resource` VALUES ('10', '添加角色', null, '2', null, '2', '添加角色', '4', '\0', '');
INSERT INTO `resource` VALUES ('11', '编辑角色', null, '3', null, '2', '编辑角色', '4', '\0', '');
INSERT INTO `resource` VALUES ('12', '删除角色', null, '4', null, '2', '删除角色', '4', '\0', '');
INSERT INTO `resource` VALUES ('13', '授予权限', null, '5', null, '2', '授予角色权限', '4', '\0', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `Name` varchar(64) NOT NULL COMMENT '角色名称',
  `Code` varchar(32) NOT NULL COMMENT '角色代码',
  `Description` varchar(64) DEFAULT NULL COMMENT '角色描述',
  `CreateUserId` int(11) DEFAULT NULL COMMENT '创建角色的用户ID',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` int(11) DEFAULT NULL COMMENT '修改角色的用户ID',
  `ModifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `IsEnable` bit(1) DEFAULT b'1' COMMENT '是否可用',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系统管理员', 'ROLE_ADMIN', '拥有最高权限的管理员', null, null, null, null, '');
INSERT INTO `role` VALUES ('2', '总经理', 'ROLE_GM', '总经理', null, null, null, null, '');
INSERT INTO `role` VALUES ('3', '副总经理', 'ROLE_VICE_GM', '副总经理', null, null, null, null, '');
INSERT INTO `role` VALUES ('4', '项目经理', 'ROLE_PM', '项目经理', null, null, null, null, '');
INSERT INTO `role` VALUES ('5', '站长', 'ROLE_SM', '站长', null, null, null, null, '');
INSERT INTO `role` VALUES ('6', '会计', 'ROLE_ACCOUNTANT', '会计', null, null, null, null, '');
INSERT INTO `role` VALUES ('7', '普通员工', 'ROLE_STAFF', '普通员工', null, null, null, null, '');
INSERT INTO `role` VALUES ('8', '测试人员', 'ROLE_TEST', '测试人员，权限仅次于管理员', null, null, null, null, '');

-- ----------------------------
-- Table structure for r_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `r_role_resource`;
CREATE TABLE `r_role_resource` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 号',
  `ResourceId` int(11) NOT NULL COMMENT '资源ID号 参照 Resource 表中的ID号',
  `RoleId` int(11) NOT NULL COMMENT '角色ID 号  参照 role 表中的 id 号',
  PRIMARY KEY (`Id`,`ResourceId`,`RoleId`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_Role_has_Resource_Resource1_idx` (`ResourceId`),
  KEY `fk_Role_has_Resource_Role1_idx` (`RoleId`),
  CONSTRAINT `fk_Role_has_Resource_Role1` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Role_has_Resource_Resource1` FOREIGN KEY (`ResourceId`) REFERENCES `resource` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色 权限中间表';

-- ----------------------------
-- Records of r_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for r_site_user
-- ----------------------------
DROP TABLE IF EXISTS `r_site_user`;
CREATE TABLE `r_site_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `SiteId` int(11) NOT NULL COMMENT '参照site表中的id字段',
  `UserId` int(11) NOT NULL COMMENT '参照 User 表中的 Id 字段',
  PRIMARY KEY (`Id`,`UserId`,`SiteId`),
  KEY `fk_Site_has_User_User1_idx` (`UserId`),
  KEY `fk_Site_has_User_Site_idx` (`SiteId`),
  CONSTRAINT `fk_Site_has_User_Site` FOREIGN KEY (`SiteId`) REFERENCES `site` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_Site_has_User_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点 用户 关系表';

-- ----------------------------
-- Records of r_site_user
-- ----------------------------

-- ----------------------------
-- Table structure for r_site_user_post
-- ----------------------------
DROP TABLE IF EXISTS `r_site_user_post`;
CREATE TABLE `r_site_user_post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `RSiteUserId` int(11) NOT NULL COMMENT '站点用户表序号  参照 R_Site_User 中的  Id 字段',
  `PostId` int(11) NOT NULL COMMENT '职务Id  参照 Post表中的Id字段',
  PRIMARY KEY (`Id`,`PostId`,`RSiteUserId`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_R_Site_User_has_Post_Post1_idx` (`PostId`),
  KEY `fk_R_Site_User_has_Post_R_Site_User1_idx` (`RSiteUserId`),
  CONSTRAINT `fk_R_Site_User_has_Post_R_Site_User1` FOREIGN KEY (`RSiteUserId`) REFERENCES `r_site_user` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_R_Site_User_has_Post_Post1` FOREIGN KEY (`PostId`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点 用户 职位 三者关系表';

-- ----------------------------
-- Records of r_site_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_post
-- ----------------------------
DROP TABLE IF EXISTS `r_user_post`;
CREATE TABLE `r_user_post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `UserId` int(11) NOT NULL COMMENT '用户Id 参照 User 表中Id 字段',
  `PostId` int(11) NOT NULL COMMENT '职位Id 参照 Post 表中的 Id 字段',
  PRIMARY KEY (`Id`,`PostId`,`UserId`),
  KEY `fk_User_has_Post_Post1_idx` (`PostId`),
  KEY `fk_User_has_Post_User1_idx` (`UserId`),
  CONSTRAINT `fk_User_has_Post_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Post_Post1` FOREIGN KEY (`PostId`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户 职位关系表';

-- ----------------------------
-- Records of r_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for r_user_role
-- ----------------------------
DROP TABLE IF EXISTS `r_user_role`;
CREATE TABLE `r_user_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号 ID',
  `UserId` int(11) NOT NULL COMMENT '用户ID 参照 User表中的 ID',
  `RoleId` int(11) NOT NULL COMMENT '角色 ID 参照 Role 表中的 ID',
  PRIMARY KEY (`Id`,`UserId`,`RoleId`),
  UNIQUE KEY `id_UNIQUE` (`Id`),
  KEY `fk_User_has_Role_Role1_idx` (`RoleId`),
  KEY `fk_User_has_Role_User1_idx` (`UserId`),
  CONSTRAINT `fk_User_has_Role_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Role_Role1` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色中间表';

-- ----------------------------
-- Records of r_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `Name` varchar(128) NOT NULL COMMENT '站点名称',
  `Address` varchar(256) NOT NULL COMMENT '站点物理地址',
  `CreateDate` datetime DEFAULT NULL COMMENT '建站日期',
  `UserId` int(11) NOT NULL COMMENT '建站人用户ID',
  `CreatePurpose` varchar(256) DEFAULT NULL COMMENT '建站目的',
  `ProjectName` varchar(1024) DEFAULT NULL COMMENT '工程名',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `id_UNIQUE` (`Id`),
  UNIQUE KEY `SiteName_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点基本信息表';

-- ----------------------------
-- Records of site
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `UserName` varchar(32) NOT NULL COMMENT '用户名',
  `Password` varchar(128) NOT NULL COMMENT '用户密码',
  `RealName` varchar(32) NOT NULL COMMENT '用户真名',
  `Phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `Email` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `LastLoginDate` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `LastLoginIp` varchar(64) DEFAULT NULL COMMENT '最后一次登录的Ip地址',
  `CreateIp` varchar(64) DEFAULT NULL COMMENT '创建IP',
  `CreateDate` datetime DEFAULT NULL COMMENT '创建时间',
  `IsEnable` bit(1) DEFAULT b'1' COMMENT '是否可用',
  `ParentId` int(11) NOT NULL,
  `BalanceId` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`ParentId`,`BalanceId`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_User_User1_idx` (`ParentId`),
  KEY `fk_User_Balance1_idx` (`BalanceId`),
  CONSTRAINT `fk_User_User1` FOREIGN KEY (`ParentId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Balance1` FOREIGN KEY (`BalanceId`) REFERENCES `balance` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
