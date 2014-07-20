<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>登陆</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/css/dialog.css"
	type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		$.ajax({
			url : '${pageContext.request.contextPath}/login.do',
			type : 'POST',
			data : $('#login_form').serialize(),
			dataType : 'json',
			success : function(data) {   
				if (data.success) {
				window.location.href = data.obj;
				}

			},
			error : function() {
				alert("登陆失敗");
			}
		});
	}

	function reset() {
		$('#login_form').form('clear');
	}
</script>
</head>
<body>
	<form id="login_form">
		<table>
			<tr>
				<td>用户名</td>
				<td><input class="easyui-validatebox" id="username"
					name="username" type="text" placeholder="请输入登录名"
					data-options="required:true" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox" id="password"
					name="password" type="password" maxlength="16" placeholder="请输入密码"
					data-options="required:true,validType:'length[3,16]'">
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#"
					class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit"
					href="#" class="easyui-linkbutton" onclick="submit()">登录</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
