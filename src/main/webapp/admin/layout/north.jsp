<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
</head>
<body>
	<div style="position: absolute; right: 5px; bottom: 5px;">
		<sec:authentication property="principal" var="authentication" />
		[<strong>${authentication.realname }</strong>]，欢迎你！
		<sec:authentication property="details" var="myDetails" />
		您使用[<strong>${myDetails.remoteAddress}</strong>]IP登录！ 
		<a href="${pageContext.request.contextPath}/logout.do">注销</a>
	</div>
</body>
</html>
