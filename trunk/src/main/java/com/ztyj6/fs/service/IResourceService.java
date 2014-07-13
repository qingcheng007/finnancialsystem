package com.ztyj6.fs.service;

import java.util.List;

import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.page.Tree;

public interface IResourceService extends IBaseService<Resource>{
	public List<Tree> getMenuTree(Integer id);
	public List<Tree> getAllMenuTree(Integer id);
	public List<Resource> getByRoleId(Integer id);
}
