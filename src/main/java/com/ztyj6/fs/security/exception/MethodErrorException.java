package com.ztyj6.fs.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * 请求方法错误异常
 * 
 */
@SuppressWarnings("serial")
public class MethodErrorException extends AuthenticationException {

	public MethodErrorException(String msg) {
		super(msg);
	}

	public MethodErrorException(String msg, Throwable t) {
		super(msg, t);
	}

}
