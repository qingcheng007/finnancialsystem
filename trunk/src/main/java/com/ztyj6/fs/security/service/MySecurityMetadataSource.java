package com.ztyj6.fs.security.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.Role;
import com.ztyj6.fs.service.IResourceService;
import com.ztyj6.fs.utils.CommonUtil;

public class MySecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

	private static final Logger logger = Logger.getLogger(MySecurityMetadataSource.class);

	private IResourceService resourceService;

	private RequestMatcher requestMatcher;

	private SessionRegistry sessionRegistry;

	private static Map<String, Collection<ConfigAttribute>> resourceMap;

	public IResourceService getResourceService() {
		return resourceService;
	}

	@Autowired
	public void setResourceService(IResourceService resourceService) {
		this.resourceService = resourceService;
	}

	public SessionRegistry getSessionRegistry() {
		return sessionRegistry;
	}

	@Autowired
	public void setSessionRegistry(SessionRegistry sessionRegistry) {
		this.sessionRegistry = sessionRegistry;
	}

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

	public MySecurityMetadataSource() {

	}

	// 初始化方法时候从数据库中读取资源
	@PostConstruct
	public void init() {
		load();
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		Set<ConfigAttribute> attributes = new HashSet<ConfigAttribute>();
		for (Map.Entry<String, Collection<ConfigAttribute>> entry : resourceMap.entrySet()) {
			attributes.addAll(entry.getValue());
		}
		return attributes;
	}

	public Collection<ConfigAttribute> getAttributes(Object object) {
		HttpServletRequest request = ((FilterInvocation) object).getRequest();

		if (logger.isDebugEnabled())
			logger.debug("当前请求URL: " + request.getRequestURI());

		// 检测请求与当前资源匹配的正确性
		Iterator<String> iterator = resourceMap.keySet().iterator();
		while (iterator.hasNext()) {
			String uri = iterator.next();
			requestMatcher = new AntPathRequestMatcher(uri);
			if (requestMatcher.matches(request))
				return resourceMap.get(uri);

		}
		return null;
	}

	public Collection<ConfigAttribute> getAttributes(String url) {
		Iterator<String> iterator = resourceMap.keySet().iterator();
		AntPathMatcher antMatcher = new AntPathMatcher();
		while (iterator.hasNext()) {
			String uri = iterator.next();
			if (antMatcher.match(uri, url))
				return resourceMap.get(uri);
		}
		return null;
	}

	/**
	 * 加载所有资源与权限的关系
	 */
	public void load() {
		if (resourceMap == null)
			resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		resourceMap.clear();
		List<Resource> ress = (List<Resource>) this.resourceService.getAll();
		if (ress != null && !ress.isEmpty())
			for (Resource res : ress) {
				if (!StringUtils.isBlank(res.getUrl())) {
					StringBuilder url = new StringBuilder();
					if (res.getUrl().contains((".")))
						url.append(res.getUrl()).append("*");
					else
						url.append(res.getUrl()).append("/**");
					resourceMap.put(url.toString(), list2Collection(res.getRoles()));
				}
			}
	}

	/**
	 * 将List<Role>集合转换为框架需要的Collection<ConfigAttribute>集合
	 * 
	 * @param roles
	 * @return Collection<ConfigAttribute>
	 */
	private Collection<ConfigAttribute> list2Collection(List<Role> roles) {
		List<ConfigAttribute> list = new ArrayList<ConfigAttribute>();
		for (Role role : roles) {
			ConfigAttribute configAttribute = new SecurityConfig(role.getCode());
			list.add(configAttribute);
		}
		return list;
	}

	public void expireNow() {
		resourceMap.clear();
		load();
		shotOff();
	}

	/** 把全部用户踢出系统,必须重新登录 */
	private void shotOff() {
		List<Object> users = sessionRegistry.getAllPrincipals();
		if (logger.isDebugEnabled())
			logger.debug("当前用户数: " + users.size());
		// 遍历所有用户
		for (Object o : users) {
			if (logger.isDebugEnabled()) {
				UserDetails user = (UserDetails) o;
				logger.debug("当前用户名: " + user.getUsername());
			}
			for (SessionInformation information : sessionRegistry.getAllSessions(o, false)) {
				information.expireNow();
				sessionRegistry.removeSessionInformation(information.getSessionId());
			}
		}
	}
}