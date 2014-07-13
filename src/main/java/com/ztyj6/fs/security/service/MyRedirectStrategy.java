package com.ztyj6.fs.security.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.util.UrlUtils;

import com.alibaba.fastjson.JSON;

import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.service.IUserService;

public class MyRedirectStrategy implements RedirectStrategy {

	protected final Log logger = LogFactory.getLog(getClass());
	
	private boolean contextRelative;

	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@Override
	public void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
		try {
			userService.updateLogin(request, SecurityContextHolder.getContext().getAuthentication());
		} catch (Exception e) {
		}

		String redirectUrl = calculateRedirectUrl(request.getContextPath(), url);
		redirectUrl = response.encodeRedirectURL(redirectUrl);

		if (logger.isDebugEnabled()) {
			logger.debug("Redirecting to '" + redirectUrl + "'");
		}

		Json j = new Json();
		j.setSuccess(true);
		j.setMsg("登陆成功！");
		j.setObj(redirectUrl);
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(j));
		out.flush();
		out.close();
	}

	private String calculateRedirectUrl(String contextPath, String url) {
		if (!UrlUtils.isAbsoluteUrl(url)) {
			if (contextRelative) {
				return url;
			} else {
				return contextPath + url;
			}
		}

		// Full URL, including http(s)://
		if (!contextRelative) {
			return url;
		}

		// Calculate the relative URL from the fully qualified URL, minus the
		// scheme and base context.
		url = url.substring(url.indexOf("://") + 3); // strip off scheme
		url = url.substring(url.indexOf(contextPath) + contextPath.length());

		if (url.length() > 1 && url.charAt(0) == '/') {
			url = url.substring(1);
		}

		return url;
	}

}
