package com.ztyj6.fs.service;

import java.util.List;

import com.ztyj6.fs.model.Role;
import com.ztyj6.fs.model.page.Tree;

public interface IRoleService extends IBaseService<Role> {
	public void grant(Integer roleId,String ids);
	public List<Tree> getAllRoleTree();
	public List<Role> getByUserId(Integer userId);
}
