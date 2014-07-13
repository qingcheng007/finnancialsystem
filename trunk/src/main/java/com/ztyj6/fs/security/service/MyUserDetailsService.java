package com.ztyj6.fs.security.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.Role;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.service.IRoleService;
import com.ztyj6.fs.service.IUserService;

/**
 * SPRING SECURITY3用户登录处理
 * 
 */
public class MyUserDetailsService implements UserDetailsService {

	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		// 使用User服务类查询数据用户是否存在,如不存在或密码错误则抛出对应的异常
		User user = this.userService.getByUsername(username);

		// 判断用户是否存在
		if (user == null)
			throw new UsernameNotFoundException("用户不存在,请重新输入!");
		// 获取首个用户名
		return init(user);
	}

	/** 初始化 */
	private UserDetails init(User user) {
		// 角色权限集合
		Collection<GrantedAuthority> gaRoles = new HashSet<GrantedAuthority>();
		Collection<Resource> gaRess = new HashSet<Resource>();

		for (Role role : user.getRoles()) {
			gaRoles.add(new SimpleGrantedAuthority(role.getCode()));
			// role = (Role) this.roleService.findById(role).getValue();
			List<Resource> ress = role.getResources();
			if (ress != null && !ress.isEmpty())
				for (Resource res : ress) { // 取出角色所拥有的资源
					gaRess.add(res);
				}
		}

		user.setAuthorities(gaRoles);
		user.setResources(gaRess);

		return user;
	}
}