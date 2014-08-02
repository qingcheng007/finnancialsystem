<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/styleC.css" type="text/css">
</head>
<body>
	<div class="content_top" >
    <ul>
    <li class="topL"><span style="margin-left:10px;">欢迎登录中国通信建设第一工程局第六分公司电子报账系统！</span></li>
	<li class="topR"><sec:authentication property="principal" var="authentication" />[<strong>${authentication.realname }</strong>]，欢迎您！
		<sec:authentication property="details" var="myDetails" />您使用[<strong>${myDetails.remoteAddress}</strong>]IP登录！ 
		<a href="${pageContext.request.contextPath}/logout.do">注销</a>
	</li>
    </ul>
   </div>
   <div style="clear:both;"></div>

