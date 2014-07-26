insert into invoicetype(id,name) values(1,"卡加油费");
insert into invoicetype(id,name) values(2,"现金加油费");
insert into invoicetype(id,name) values(3,"住宿费");
insert into invoicetype(id,name) values(4,"交通费");
insert into invoicetype(id,name) values(5,"修理费");
insert into invoicetype(id,name) values(6,"过停费");
insert into invoicetype(id,name) values(7,"招待费");
insert into invoicetype(id,name) values(8,"办公费");
insert into invoicetype(id,name) values(9,"材料费");
insert into invoicetype(id,name) values(10,"工具费");
insert into invoicetype(id,name) values(11,"其他费");


赵文举的表插入按照以下顺序插入

-- ----------------------------
-- Records of balance
-- ----------------------------

insert into balance (Id,Available,Frozen) values('3', '4.00', '4.00');


-- ----------------------------
-- Records of user
-- ----------------------------
insert into user (Id,UserName,Password,RealName,Phone,Email,LastLoginDate,LastLoginIp,CreateIp,CreateDate,IsEnable,ParentId,BalanceId) values('4', 'admin', 'ceb4f32325eda6142bd65215f4c0f371', 'admin', '2333', '473028458@qq.com', '2014-07-18 20:27:02', '本地', '本地', '2014-07-18 18:21:38', 1, '4', '3');


-- ----------------------------
-- Records of role
-- ----------------------------
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(1, '系统管理员', 'ROLE_ADMIN', '拥有最高权限的管理员', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(2, '总经理', 'ROLE_GM', '总经理', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(3, '副总经理', 'ROLE_VICE_GM', '副总经理', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(4, '项目经理', 'ROLE_PM', '项目经理', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(5, '站长', 'ROLE_SM', '站长', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(6, '会计', 'ROLE_ACCOUNTANT', '会计', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(7, '普通员工', 'ROLE_STAFF', '普通员工', null, null, null, null, 1);
insert into role(Id,Name,Code,Description,CreateUserId,CreateDate,ModifyUserId,ModifyDate,IsEnable) values(8, '测试人员', 'ROLE_TEST', '测试人员，权限仅次于管理员', null, null, null, null, 1);


-- ----------------------------
-- Records of r_user_role
-- ----------------------------
insert into r_user_role(Id,UserId,RoleId) values('3', '4', '1');



-- ----------------------------
-- Records of resource
-- ----------------------------
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(1, '后台管理', null, '1', '/admin', '3', '后台主页', '0', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(2, '系统管理', null, '1', '/xtgl', '1', '管理系统模块', '1', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(3, '发票管理', null, '2', '/fpgl', '1', '管理发票模块', '1', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(4, '站点管理', null, '3', '/zdgl', '1', '管理站点模块', '1', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(5, '信息管理', null, '4', '/xxgl', '1', '管理信息模块', '1', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(6, '用户管理', null, '1', '/admin/user/manage.jsp', '1', '管理用户模块', '2', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(7, '查看用户', null, '1', '/userController/admin/get*.do', '2', '查看用户', '6', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(8, '添加用户', null, '2', '/userController/admin/add*.do', '2', '添加用户', '6', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(9, '编辑用户', null, '3', '/userController/admin/edit*.do', '2', '编辑用户', '6', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(10, '删除用户', null, '4', '/userController/admin/delete*.do', '2', '删除用户', '6', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(11, '角色管理', null, '2', '/admin/role/manage.jsp', '1', '管理角色模块', '2', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(12, '查看角色', null, '1', '/roleController/admin/get*.do', '2', '查看角色', '11', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(13, '添加角色', null, '2', '/roleController/admin/add*.do', '2', '添加角色', '11', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(14, '编辑角色', null, '3', '/roleController/admin/edit*.do', '2', '编辑角色', '11', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(15, '删除角色', null, '4', '/roleController/admin/delete*.do', '2', '删除角色', '11', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(16, '授予权限', null, '5', '/roleController/admin/grant*.do', '2', '授予角色权限', '11', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(17, '发票管理', null, '1', '/admin/invoice/manage.jsp', '1', '管理发票', '3', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(18, '查看发票', null, '1', '/invoiceController/get*.do', '2', '查看发票', '17', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(19, '添加发票', null, '2', '/invoiceController/add*.do', '2', '添加发票', '17', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(20, '编辑发票', null, '3', '/invoiceController/edit*.do', '2', '编辑发票', '17', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(21, '删除发票', null, '4', '/invoiceController/delete*.do', '2', '删除发票', '17', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(22, '审核发票', null, '2', '/admin/invoice/manageAudit.jsp', '1', '审核发票', '3', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(23, '职务管理', null, '2', '/admin/post/manage.jsp', '1', '职务管理模块', '4', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(24, '查看职务', null, '1', '/postController/admin/getByPage*.do', '2', '查看职务', '23', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(25, '添加职务', null, '2', '/postController/admin/add*.do', '2', '添加职务', '23', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(26, '编辑职务', null, '3', '/postController/admin/edit*.do', '2', '编辑职务', '23', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(27, '删除职务', null, '4', '/postController/admin/delete*.do', '2', '删除职务', '23', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(28, '站点管理', null, '1', '/admin/site/manage.jsp', '1', '站点管理模块', '4', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(29, '查看站点', null, '1', '/siteController/admin/getByPage*.do ', '2', '查看站点', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(30, '添加站点', null, '2', '/siteController/admin/add*.do', '2', '添加站点', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(31, '编辑站点', null, '3', '/siteController/admin/edit*.do', '2', '编辑站点', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(32, '删除站点', null, '4', '/siteController/admin/delete*.do', '2', '删除站点', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(33, '查看站点详细信息', null, '4', '/siteController/admin/getSiteInformation*.do', '2', '查看站点详细信息', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(34, '查看站点用户及其职务', null, '1', '/siteController/admin/getUserInformationOfOneSiteByPage*.do', '2', '查看站点用户及其职务', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(35, '添加站点用户', null, '2', '/siteController/admin/addUserSite*.do', '2', '添加站点用户', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(36, '删除站点用户', null, '3', '/siteController/admin/deleteUserSite*.do', '2', '删除站点用户', '28', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(37, '我的信息', null, '1', '/admin/userinfo/userinfo.jsp', '1', '查看个人信息', '5', 1, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(38, '我的审核信息', null, '2', '/admin/userinfo/myAudit.jsp', '1', '查看个人审核信息', '5', 1, 1);

-- ----------------------------
-- Records of r_role_resource
-- ----------------------------
insert into r_role_resource(Id,ResourceId,RoleId) values('1', '1', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('2', '2', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('3', '3', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('4', '4', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('5', '5', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('6', '6', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('7', '7', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('8', '8', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('9', '9', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('10', '10', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('11', '11', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('12', '12', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('13', '13', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('14', '14', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('15', '15', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('16', '16', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('17', '17', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('18', '18', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('19', '19', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('20', '20', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('21', '21', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('22', '22', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('23', '23', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('24', '24', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('25', '25', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('26', '26', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('27', '27', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('28', '28', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('29', '29', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('30', '30', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('31', '31', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('32', '32', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('33', '33', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('34', '34', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('35', '35', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('36', '36', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('37', '37', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('38', '38', '1');

insert into r_role_resource(Id,ResourceId,RoleId) values('39', '1', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('40', '2', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('41', '3', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('42', '4', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('43', '5', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('44', '6', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('45', '7', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('46', '17', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('47', '18', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('48', '19', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('49', '20', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('50', '21', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('51', '22', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('52', '23', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('53', '24', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('54', '28', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('55', '29', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('56', '33', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('57', '34', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('58', '37', '2');
insert into r_role_resource(Id,ResourceId,RoleId) values('59', '38', '2');