package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import com.ztyj6.fs.dao.UserMapper;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.model.page.Tree;
import com.ztyj6.fs.model.page.UserPage;
import com.ztyj6.fs.security.service.MySecurityMetadataSource;
import com.ztyj6.fs.service.IUserService;
import com.ztyj6.fs.utils.IPUtil;
import com.ztyj6.fs.utils.PageFilterUtil;

@Service("userService")
public class UserServiceImpl implements IUserService {

	private UserMapper userMapper;

	private PasswordEncoder passwordEncoder;

	private MySecurityMetadataSource mySecurityMetadataSource;

	public MySecurityMetadataSource getMySecurityMetadataSource() {
		return mySecurityMetadataSource;
	}

	@Autowired
	public void setMySecurityMetadataSource(MySecurityMetadataSource mySecurityMetadataSource) {
		this.mySecurityMetadataSource = mySecurityMetadataSource;
	}

	public PasswordEncoder getPasswordEncoder() {
		return passwordEncoder;
	}

	@Autowired
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public Serializable save(User o) {
		if (userMapper.countByUsername(o.getUsername()) > 0)
			return 0;
		String encodedPassword = passwordEncoder.encodePassword(o.getPassword(), o.getUsername());
		o.setPassword(encodedPassword);
		o.setCreateDate(new Date());
		o.setIsEnable(true);
		return userMapper.insertSelective(o);
	}

	public List<User> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataGrid getByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	public DataGrid getByPageFilter(PageFilter pageFilter) {
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList users = (PageList) userMapper.selectByFilter(pageFilter, pageBounds);
		dg.setRows(users);
		dg.setTotal(users.getPaginator().getTotalCount());
		return dg;
	}

	public void delete(User o) {

	}

	public void update(User o) {
		userMapper.updateByPrimaryKeySelective(o);
	}

	public void saveOrUpdate(User o) {

	}

	public User getById(Integer id) {
		return userMapper.selectByPrimaryKey(Integer.valueOf(id));
	}

	public User getByUsername(String username) {
		return userMapper.selectByUsername(username);
	}

	public int countByUsername(String username) {
		return userMapper.countByUsername(username);
	}

	public Long count() {
		return null;
	}

	@Override
	public void delete(String ids) {
		List<String> arrays = Arrays.asList(ids.split(","));
		userMapper.delete(arrays);
	}

	@Override
	public void updateLogin(HttpServletRequest request, Authentication authentication) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("lastLoginDate", new Date());
		param.put("lastLoginIp", IPUtil.getIp(request));
		userMapper.updateStateByPrimaryKey(param, ((User) authentication.getPrincipal()).getId());
	}

	@Override
	public void grant(Integer userId, String ids) {
		List<String> arrays = Arrays.asList(ids.split(","));
		userMapper.deleteByRoleIdNotIn(userId, arrays);
		userMapper.insertUserRole(userId, arrays);
		mySecurityMetadataSource.load();
	}

}