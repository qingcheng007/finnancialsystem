package com.ztyj6.fs.dao;

import java.util.List;

import com.ztyj6.fs.model.Resource;

public interface ResourceMapper {
  
	void deleteByPrimaryKey(Integer id);

	void insert(Resource record);

	void insertSelective(Resource record);

	Resource selectByPrimaryKey(Integer id);

	void updateByPrimaryKeySelective(Resource record);

	void updateByPrimaryKey(Resource record);

	List selectMenuByParentId(Integer parentId);
	
	List selectByParentId(Integer parentId);
	
	List selectByRoleId(Integer roleId);
	
	List selectAll();
}