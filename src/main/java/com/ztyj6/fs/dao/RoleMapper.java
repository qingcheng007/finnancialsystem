package com.ztyj6.fs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import com.ztyj6.fs.model.Role;

public interface RoleMapper {

	void deleteByPrimaryKey(Integer id);
	
	void deleteByResourceIdNotIn(@Param("roleId")Integer roleId,@Param("ids")List ids);
	
	void deleteBatch(List ids);

	void insert(Role record);

	void insertSelective(Role record);
	
	void insertRoleResource(@Param("roleId")Integer roleId,@Param("ids")List ids);

	Role selectByPrimaryKey(Integer id);
	
	List selectByPage(PageBounds pageBounds);
	
	List selectAll();
	
	List selectByUserId(Integer userId);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);
}