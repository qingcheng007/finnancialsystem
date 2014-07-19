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






-- Records of r_role_resource
-- ----------------------------
insert into r_role_resource(Id,ResourceId,RoleId) values('1', '1', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('17', '2', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('18', '3', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('19', '4', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('20', '5', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('21', '6', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values ('22', '7', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('23', '8', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('24', '9', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('25', '10', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('26', '11', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('27', '12', '1');
insert into r_role_resource(Id,ResourceId,RoleId) values('28', '13', '1');




-- ----------------------------
-- Records of resource
-- ----------------------------
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(1, '后台管理', null, '1', '/admin', '3', '后台主页', '0', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(2, '系统管理', null, '1', '/xtgl', '1', '管理系统模块', '1', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(3, '用户管理', null, '1', '/admin/user/manage.jsp', '1', '管理用户模块', '2', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(4, '查看用户', null, '1', '/userController/admin/get*.do', '2', '查看用户', '3', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(5, '添加用户', null, '2', '/userController/admin/add*.do', '2', '添加用户', '3', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(6, '编辑用户', null, '3', '/userController/admin/edit*.do', '2', '编辑用户', '3', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(7, '删除用户', null, '4', '/userController/admin/delete*.do', '2', '删除用户', '3', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(8, '角色管理', null, '2', '/admin/role/manage.jsp', '1', '管理角色模块', '2', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(9, '查看角色', null, '1', '/roleController/admin/get*.do', '2', '查看角色', '8', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(10, '添加角色', null, '2', '/roleController/admin/add*.do', '2', '添加角色', '8', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(11, '编辑角色', null, '3', '/roleController/admin/edit*.do', '2', '编辑角色', '8', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(12, '删除角色', null, '4', '/roleController/admin/delete*.do', '2', '删除角色', '8', 0, 1);
insert into resource(Id,Name,Icon,Sequence,Url,Type,Description,ParentId,IsLeaf,IsEnable) values(13, '授予权限', null, '5', '/roleController/admin/grant*.do', '2', '授予角色权限', '8', 0, 1);




-- ----------------------------
-- Records of r_user_role
-- ----------------------------
insert into r_user_role(Id,UserId,RoleId) values('1', '2', '3');
insert into r_user_role(Id,UserId,RoleId) values('2', '2', '4');
insert into r_user_role(Id,UserId,RoleId) values('3', '4', '1');


-- ----------------------------
-- Records of user
-- ----------------------------
insert into user (Id,UserName,Password,RealName,Phone,Email,LastLoginDate,LastLoginIp,CreateIp,CreateDate,IsEnable,ParentId,BalanceId) values('4', 'admin', 'ceb4f32325eda6142bd65215f4c0f371', 'admin', '2333', '473028458@qq.com', '2014-07-18 20:27:02', '本地', '本地', '2014-07-18 18:21:38', 1, '2', '3');
