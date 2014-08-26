<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>登录</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/styleC.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {

		$.ajax({
			url : '${pageContext.request.contextPath}/login.do',
			type : 'POST',
			data : $('#login_form').serialize(),
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					window.location.href = data.msg;
				} else
					alert("用户名或密码错误！");
			},
			error : function() {
				alert("未知错误！");
			}
		});
	}

	function reset() {
		$('#login_form').form('clear');
	}
</script>
</head>
<body>
	<div class="bkgd">
		<div class="top">
			<marquee direction=left>
				<span>欢迎登录手机报账系统！</span>
			</marquee>
		</div>
		<div class="logo">
			<strong><span class="title_top">手机报账系统</span></strong>
		</div>

		<div class="form">
			<div class="title">
				<span>登&nbsp;录</span>
			</div>
			<form id="login_form">
				<ul>
					<li><label class="input_tips_U" id="uin_tips" for="u">用户名</label> <input class="easyui-validatebox" id="username" name="username" type="text" placeholder="请输入登录名" data-options="required:true" /></li>
					<li><label class="input_tips_P" id="uin_tips" for="u">密&nbsp;&nbsp;&nbsp;码</label> <input class="easyui-validatebox" id="password" name="password" type="password" maxlength="16" placeholder="请输入密码" data-options="required:true,validType:'length[3,16]'"></li>
					<li class="reset"><a href="#" onclick="reset()">重&nbsp;置</a></li>
					<li class="login"><a id="submit" href="#" onclick="submit()">登&nbsp;录</a></li>
				</ul>
			</form>
			<div style="clear:both;"></div>
		</div>
        <div class="footer"> 
         <ul>
        <li><center><span style="line-height:1.5; color:#ccc;">手机报账系统 Copyright © 2014 陈宝光 版权所有</span></center></li>
        <li><center><span style="line-height:1.5; color:#ccc;">Power by <a href="www.cmsee.com" target="_blank">内蒙古大学系统开发团队</a></span></center></li>
        <li><center><a href="http://www.miibeian.gov.cn" target="_blank" >冀ICP备14015528号</a></center></li>
        </ul>   
        </div>
        <div style="clear:both;"></div>
	</div>
</body>
</html>
<script language="JavaScript" type="text/javascript">
 　document.onkeydown = function(evt){
   　 var evt = window.event?window.event:evt;
    　if (evt.keyCode==13) {
           submit();
    　}
   }
</script>