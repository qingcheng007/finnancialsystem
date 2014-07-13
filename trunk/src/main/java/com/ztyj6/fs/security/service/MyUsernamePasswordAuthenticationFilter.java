package com.ztyj6.fs.security.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.ztyj6.fs.security.exception.MethodErrorException;
import com.ztyj6.fs.service.IUserService;
import com.ztyj6.fs.utils.CommonUtil;

public class MyUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	// 验证码字段
		private String validateCodeParameter = "validateCode";
		// 是否开启验证码功能
		private boolean openValidateCode = false;

		@Override
		public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {

			// 只接受POST方式传递的数据
			if (!"POST".equals(request.getMethod())) {
				throw new MethodErrorException("不支持非POST方式的请求!");
			}

			// 开启验证码功能的情况
			/*
			 * if (isOpenValidateCode()) { checkValidateCode(request); } else { if
			 * (logger.isDebugEnabled()) logger .debug(
			 * "UsernamePasswordAuthenticationExtendFilter --> attemptAuthentication --> 没有开启验证码功能"
			 * ); }
			 */

			// 获取Username和Password
			String username = obtainUsername(request);
			String password = obtainPassword(request);
			if (StringUtils.isBlank(username)) {
				throw new AuthenticationServiceException("用户名不能为空！");
			}
			if (StringUtils.isBlank(password)) {
				throw new AuthenticationServiceException("密码不能为空！");
			}

			// UsernamePasswordAuthenticationToken实现Authentication校验
			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(username, password);

			// 允许子类设置详细属性
			setDetails(request, auth);

			// 运行UserDetailsService的loadUserByUsername 再次封装Authentication
			return this.getAuthenticationManager().authenticate(auth);
		}

		// 匹对验证码的正确性
		/*
		 * public void checkValidateCode(HttpServletRequest request) {
		 * 
		 * String jcaptchaCode = obtainValidateCodeParameter(request); if (null ==
		 * jcaptchaCode) throw new ValidateCodeException("验证码超时,请重新获取!");
		 * 
		 * boolean b = false;
		 * 
		 * try { b = CaptchaServiceSingleton.getInstance().validateResponseForID(
		 * request.getSession().getId(), jcaptchaCode); } catch
		 * (CaptchaServiceException e) { throw new
		 * ValidateCodeException("请先获取验证码!"); }
		 * 
		 * if (!b) throw new ValidateCodeException("验证码不正确,请重新输入!"); }
		 */

		public String obtainValidateCodeParameter(HttpServletRequest request) {
			Object obj = request.getParameter(getValidateCodeParameter());
			return null == obj ? "" : obj.toString().trim();
		}

		@Override
		protected String obtainUsername(HttpServletRequest request) {
			Object obj = request.getParameter(getUsernameParameter());
			return null == obj ? "" : obj.toString().trim();
		}

		@Override
		protected String obtainPassword(HttpServletRequest request) {
			Object obj = request.getParameter(getPasswordParameter());
			return null == obj ? "" : obj.toString().trim();
		}

		public String getValidateCodeParameter() {
			return validateCodeParameter;
		}

		public void setValidateCodeParameter(String validateCodeParameter) {
			this.validateCodeParameter = validateCodeParameter;
		}

		public boolean isOpenValidateCode() {
			return openValidateCode;
		}

		public void setOpenValidateCode(boolean openValidateCode) {
			this.openValidateCode = openValidateCode;
		}
	
}
