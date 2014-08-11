-- ----------------------------
-- Records of invoicetype
-- ----------------------------

insert into InvoiceType(id,name) values(1,"卡加油费");
insert into InvoiceType(id,name) values(2,"现金加油费");
insert into InvoiceType(id,name) values(3,"住宿费");
insert into InvoiceType(id,name) values(4,"交通费");
insert into InvoiceType(id,name) values(5,"修理费");
insert into InvoiceType(id,name) values(6,"过停费");
insert into InvoiceType(id,name) values(7,"招待费");
insert into InvoiceType(id,name) values(8,"办公费");
insert into InvoiceType(id,name) values(9,"材料费");
insert into InvoiceType(id,name) values(10,"工具费");
insert into InvoiceType(id,name) values(11,"其他费");


-- ----------------------------
-- Records of balance
-- ----------------------------

insert into Balance (Id,Available,Frozen) values('1', '4.00', '4.00');


-- ----------------------------
-- Records of user
-- ----------------------------
insert into User (Id,UserName,Password,RealName,Phone,Email,LastLoginDate,LastLoginIp,CreateIp,CreateDate,IsEnable,ParentId,BalanceId) values('1', 'admin', 'ceb4f32325eda6142bd65215f4c0f371', 'admin', '2333', '473028458@qq.com', '2014-07-18 20:27:02', '本地', '本地', '2014-07-18 18:21:38', 1, '4', '1');


-- ----------------------------
-- Records of role
-- ----------------------------
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(1, '系统管理员', 'ROLE_ADMIN', '拥有最高权限的管理员', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(2, '总经理', 'ROLE_GM', '总经理', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(3, '副总经理', 'ROLE_VICE_GM', '副总经理', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(4, '项目经理', 'ROLE_PM', '项目经理', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(5, '站长', 'ROLE_SM', '站长', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(6, '会计', 'ROLE_ACCOUNTANT', '会计', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(7, '普通员工', 'ROLE_STAFF', '普通员工', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(8, '职工', 'ROLE_WORK', '职工', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(9, '核票员', 'ROLE_AUDIT', '核票员', null, null, null, null, 1);
insert into Role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(10, '测试人员', 'ROLE_TEST', '测试人员，权限仅次于管理员', null, null, null, null, 1);


-- ----------------------------
-- Records of r_user_role
-- ----------------------------
insert into R_User_Role(Id,UserId,RoleId) values('3', '1', '1');



-- ----------------------------
-- Records of Resource
-- ----------------------------
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(1, '后台管理', null, '1', '/admin', '3', '后台主页', '0', 0, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(2, '系统管理', null, '1', '/xtgl', '1', '管理系统模块', '1', 0, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(3, '发票管理', null, '2', '/fpgl', '1', '管理发票模块', '1', 0, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(4, '站点管理', null, '3', '/zdgl', '1', '管理站点模块', '1', 0, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(5, '信息管理', null, '4', '/xxgl', '1', '管理信息模块', '1', 0, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(6, '用户管理', null, '1', '/admin/user/manage.jsp', '1', '管理用户模块', '2', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(7, '查看用户', null, '1', '/userController/admin/get*.do', '2', '查看用户', '6', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(8, '添加用户', null, '2', '/userController/admin/add*.do', '2', '添加用户', '6', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(9, '编辑用户', null, '3', '/userController/admin/edit*.do', '2', '编辑用户', '6', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(10, '删除用户', null, '4', '/userController/admin/delete*.do', '2', '删除用户', '6', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(11, '用户授权', null, '5', '/userController/admin/grant*.do', '2', '授权用户', '6', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(12, '角色管理', null, '2', '/admin/role/manage.jsp', '1', '管理角色模块', '2', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(13, '查看角色', null, '1', '/roleController/admin/get*.do', '2', '查看角色', '12', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(14, '添加角色', null, '2', '/roleController/admin/add*.do', '2', '添加角色', '12', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(15, '编辑角色', null, '3', '/roleController/admin/edit*.do', '2', '编辑角色', '12', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(16, '删除角色', null, '4', '/roleController/admin/delete*.do', '2', '删除角色', '12', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(17, '授予权限', null, '5', '/roleController/admin/grant*.do', '2', '授予角色权限', '12', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(18, '发票管理', null, '1', '/admin/invoice/manage.jsp', '1', '管理发票', '3', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(19, '查看发票', null, '1', '/invoiceController/get*.do', '2', '查看发票', '18', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(20, '添加发票', null, '2', '/invoiceController/add*.do', '2', '添加发票', '18', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(21, '编辑发票', null, '3', '/invoiceController/edit*.do', '2', '编辑发票', '18', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(22, '删除发票', null, '4', '/invoiceController/delete*.do', '2', '删除发票', '18', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(23, '审核发票', null, '2', '/admin/invoiceAudit/manageAudit.jsp', '1', '审核发票', '3', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(24, '职务管理', null, '2', '/admin/post/manage.jsp', '1', '职务管理模块', '4', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(25, '查看职务', null, '1', '/postController/admin/getByPage*.do', '2', '查看职务', '24', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(26, '添加职务', null, '2', '/postController/admin/add*.do', '2', '添加职务', '24', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(27, '编辑职务', null, '3', '/postController/admin/edit*.do', '2', '编辑职务', '24', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(28, '删除职务', null, '4', '/postController/admin/delete*.do', '2', '删除职务', '24', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(29, '站点管理', null, '1', '/admin/site/manage.jsp', '1', '站点管理模块', '4', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(30, '查看站点', null, '1', ' /siteController/admin/getSiteByUserId*.do ', '2', '查看站点', '29', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(31, '添加站点', null, '2', '/siteController/admin/add*.do', '2', '添加站点', '29', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(32, '编辑站点', null, '3', '/siteController/admin/update*.do', '2', '编辑站点', '29', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(33, '查看全部站点', null, '4', ' /siteController/admin/getByPage.*.do', '2', '编辑站点', '29', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(34, '删除站点', null, '5', '/siteController/admin/deleteBatch*.do', '2', '删除站点', '29', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(35, '管理站点用户', null, '6', '/siteController/admin/getUserByPage*.do', '2', '管理站点用户', '29', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(36, '我的信息', null, '1', '/admin/userinfo/manage.jsp', '1', '查看个人信息', '5', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(37, '我的审核信息', null, '2', '/admin/myaudit/manage.jsp', '1', '查看个人审核信息', '5', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(38, '我的报账信息', null, '3', '/admin/myinvoice/manage.jsp', '1', '查看个人报账信息', '5', 1, 1);
insert into Resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(39, '会计转账', null, '6', '/userController/admin/transfer*.do', '2', '转账给用户', '6', 1, 1);
-- ----------------------------
-- Records of R_Role_Resource
-- ----------------------------
insert into R_Role_Resource(Id,ResourceId,RoleId) values('1', '1', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('2', '2', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('3', '3', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('4', '4', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('5', '5', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('6', '6', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('7', '7', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('8', '8', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('9', '9', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('10', '10', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('11', '11', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('12', '12', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('13', '13', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('14', '14', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('15', '15', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('16', '16', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('17', '17', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('18', '18', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('19', '19', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('20', '20', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('21', '21', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('22', '22', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('23', '23', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('24', '24', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('25', '25', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('26', '26', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('27', '27', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('28', '28', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('29', '29', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('30', '30', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('31', '31', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('32', '32', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('33', '33', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('34', '34', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('35', '35', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('36', '36', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('37', '37', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('38', '38', '1');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('39', '39', '1');

insert into R_Role_Resource(Id,ResourceId,RoleId) values('41', '1', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('42', '2', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('43', '3', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('44', '4', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('45', '5', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('46', '6', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('47', '7', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('48', '18', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('49', '19', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('50', '20', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('51', '21', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('52', '22', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('53', '23', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('54', '24', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('55', '25', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('56', '29', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('57', '30', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('58', '33', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('59', '35', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('60', '36', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('61', '37', '2');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('62', '38', '2');

insert into R_Role_Resource(Id,ResourceId,RoleId) values('63', '1', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('64', '2', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('65', '3', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('66', '4', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('67', '5', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('68', '6', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('69', '7', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('70', '18', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('71', '19', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('72', '20', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('73', '21', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('74', '22', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('75', '23', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('76', '24', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('77', '25', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('78', '29', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('79', '30', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('80', '33', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('81', '35', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('82', '36', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('83', '37', '3');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('84', '38', '3');

insert into R_Role_Resource(Id,ResourceId,RoleId) values('85', '1', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('86', '2', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('87', '3', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('88', '4', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('89', '5', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('90', '6', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('91', '7', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('92', '18', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('93', '19', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('94', '20', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('95', '21', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('96', '22', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('97', '23', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('98', '24', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('99', '25', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('100', '29', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('101', '30', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('102', '33', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('103', '35', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('104', '36', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('105', '37', '4');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('106', '38', '4');

insert into R_Role_Resource(Id,ResourceId,RoleId) values('107', '1', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('108', '2', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('109', '3', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('110', '4', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('111', '5', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('112', '6', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('113', '7', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('114', '18', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('115', '19', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('116', '20', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('117', '21', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('118', '22', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('119', '23', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('120', '24', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('121', '25', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('122', '29', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('123', '30', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('125', '35', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('126', '36', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('127', '37', '5');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('128', '38', '5');


insert into R_Role_Resource(Id,ResourceId,RoleId) values('129', '1', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('130', '2', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('131', '3', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('132', '5', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('133', '6', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('134', '7', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('135', '18', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('136', '19', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('137', '20', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('138', '21', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('139', '22', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('140', '23', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('141', '36', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('142', '37', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('143', '38', '6');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('164', '39', '6');

insert into R_Role_Resource(Id,ResourceId,RoleId) values('144', '1', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('145', '2', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('146', '3', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('147', '5', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('150', '18', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('151', '19', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('152', '20', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('153', '21', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('154', '22', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('155', '36', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('156', '37', '7');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('157', '38', '7');

insert into R_Role_Resource(Id,ResourceId,RoleId) values('158', '1', '8');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('160', '5', '8');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('161', '36', '8');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('162', '37', '8');
insert into R_Role_Resource(Id,ResourceId,RoleId) values('163', '38', '8');







