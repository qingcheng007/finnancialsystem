package com.ztyj6.fs.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * 验证码错误异常
 * 
 * @author shadow
 * @email 124010356@qq.com
 * @create 2012.04.28
 */
@SuppressWarnings("serial")
public class ValidateCodeException extends AuthenticationException {

	public ValidateCodeException(String msg) {
		super(msg);
	}

	public ValidateCodeException(String msg, Throwable t) {
		super(msg, t);
	}
}
