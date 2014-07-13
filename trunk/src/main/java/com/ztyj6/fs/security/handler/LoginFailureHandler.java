package com.ztyj6.fs.security.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;

import com.alibaba.fastjson.JSON;

import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.security.exception.MethodErrorException;
import com.ztyj6.fs.security.exception.ValidateCodeException;
import com.ztyj6.fs.utils.RequestUtil;

/**
 * spring security登录失败处理
 * 
 * @author shadow
 * @email 124010356@qq.com
 * @create 2012.04.28
 */
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String timeoutUrl;

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException ex) throws IOException, ServletException {
		if (ex instanceof SessionAuthenticationException) {
			if (!RequestUtil.isAjaxRequest(request))
				response.sendRedirect(request.getContextPath() + timeoutUrl);
		} else {
			if (RequestUtil.isAjaxRequest(request)) {
				Json j = new Json();
				j.setSuccess(false);

				if (ex instanceof UsernameNotFoundException) {
					j.setMsg("用户名不存在!");
				} else if (ex instanceof BadCredentialsException) {
					j.setMsg("密码错误!");
				} else if (ex instanceof ValidateCodeException) {
					j.setMsg("验证码错误!");
				} else if (ex instanceof MethodErrorException) {
					j.setMsg("请求方法错误!");
				} else if (ex instanceof LockedException) {
					j.setMsg("账号已锁定!");
				} else if (ex instanceof DisabledException || ex instanceof CredentialsExpiredException || ex instanceof AccountExpiredException) {
					j.setMsg("账号已失效!");
				}
				PrintWriter out = response.getWriter();
				out.write(JSON.toJSONString(j));
				out.flush();
				out.close();
			}
		}
	}

	public String getTimeoutUrl() {
		return timeoutUrl;
	}

	public void setTimeoutUrl(String timeoutUrl) {
		this.timeoutUrl = timeoutUrl;
	}

}
