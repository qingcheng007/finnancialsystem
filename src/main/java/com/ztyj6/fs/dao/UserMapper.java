package com.ztyj6.fs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.sun.xml.internal.bind.v2.model.core.ID;

import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.PageFilter;

public interface UserMapper {
 
	void deleteByPrimaryKey(Integer id);
	
	void delete(List ids);
	
	void deleteByRoleIdNotIn(@Param("userId")Integer userId,@Param("ids")List ids);

	void insert(User record);

	int insertSelective(User record);
    
	void insertRole(@Param("userId")Integer userId, @Param("roleId")Integer roleId);
    
    void insertUserRole(@Param("userId")Integer userId,@Param("ids")List ids);

    User selectByPrimaryKey(Integer id);
    
    User selectByUsername(@Param("username")String username);
    
    User selectByUsernamePassword(@Param("username")String username,@Param("password")String password);
    
    List selectByFilter(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds);
    
    List selectByIdFilter(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds,@Param("id") Integer id);
    
    List selectbalanceById(@Param("id") Integer id);
    
    List selectAll();
    
    List selectPartion();
    
    User selectByUrl(@Param("url") String url);
    
    void updateByPrimaryKeySelective(User record);

    void updateByPrimaryKey(User record);
    
    void updateStateByPrimaryKey(@Param("param")Map param, @Param("id")Integer id);
    
    void count();
    
    int countByUsername(String username);
    
    Balance selectBalanceById(int id);
}