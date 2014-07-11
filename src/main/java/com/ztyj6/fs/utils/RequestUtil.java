package com.ztyj6.fs.utils;

import javax.servlet.http.HttpServletRequest;

public class RequestUtil {
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(header) ? true : false;
		return isAjax;
	}
}
