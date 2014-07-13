package com.ztyj6.fs.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;

import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.model.page.Tree;

public interface IUserService extends IBaseService<User>{
	public int countByUsername(String account);
	public User getByUsername(String account);
	public void updateLogin(HttpServletRequest request, Authentication authentication);
	public void grant(Integer userId,String ids);
}
