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
INSERT INTO `role` VALUES ('1', '系统管理员', 'ROLE_ADMIN', '拥有最高权限的管理员', null, null, null, null, '');
INSERT INTO `role` VALUES ('2', '总经理', 'ROLE_GM', '总经理', null, null, null, null, '');
INSERT INTO `role` VALUES ('3', '副总经理', 'ROLE_VICE_GM', '副总经理', null, null, null, null, '');
INSERT INTO `role` VALUES ('4', '项目经理', 'ROLE_PM', '项目经理', null, null, null, null, '');
INSERT INTO `role` VALUES ('5', '站长', 'ROLE_SM', '站长', null, null, null, null, '');
INSERT INTO `role` VALUES ('6', '会计', 'ROLE_ACCOUNTANT', '会计', null, null, null, null, '');
INSERT INTO `role` VALUES ('7', '普通员工', 'ROLE_STAFF', '普通员工', null, null, null, null, '');
INSERT INTO `role` VALUES ('8', '测试人员', 'ROLE_TEST', '测试人员，权限仅次于管理员', null, null, null, null, '');


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
