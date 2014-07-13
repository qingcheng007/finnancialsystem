package com.ztyj6.fs.security.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.FilterInvocation;

public class MyVoter implements AccessDecisionVoter<FilterInvocation> {

	private MySecurityMetadataSource mySecurityMetadataSource;

	public MySecurityMetadataSource getMySecurityMetadataSource() {
		return mySecurityMetadataSource;
	}

	public void setMySecurityMetadataSource(MySecurityMetadataSource mySecurityMetadataSource) {
		this.mySecurityMetadataSource = mySecurityMetadataSource;
	}

	@Override
	public boolean supports(ConfigAttribute attribute) {
		return true;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public int vote(Authentication authentication, FilterInvocation object, Collection<ConfigAttribute> attributes) {
		int result = ACCESS_DENIED;
		Collection<ConfigAttribute> configAttributes = mySecurityMetadataSource.getAttributes(object);
		if (configAttributes != null && configAttributes.size() > 0) {
			Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
			for (ConfigAttribute configAttribute : configAttributes) {
				for (GrantedAuthority grantedAuthority : authorities)
					if (((SecurityConfig) configAttribute).getAttribute().equals(grantedAuthority.getAuthority())) {
						return ACCESS_GRANTED;
					}
			}
		} else {
			result = ACCESS_GRANTED;
		}
		return result;
	}
	
	public boolean vote(String url) {
		Collection<ConfigAttribute> configAttributes = mySecurityMetadataSource.getAttributes(url);
		if (configAttributes != null && configAttributes.size() > 0) {
			Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
			for (ConfigAttribute configAttribute : configAttributes) {
				for (GrantedAuthority grantedAuthority : authorities)
					if (((SecurityConfig) configAttribute).getAttribute().equals(grantedAuthority.getAuthority())) {
						return true;
					}
			}
		} else {
			return true;
		}
		return false;
	}
}
