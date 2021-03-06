<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>注册</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
function submit() {

			$.ajax({
					url : '${pageContext.request.contextPath}/userController/register.do',
					type : 'POST',
					data : $('#register_form').serialize(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
								alert("添加成功");	
						}
					
					},
					error : function() {
					alert("添加失敗");
									}
				});
		}
	
	function reset() {
		$('#register_form').form('clear');
	}
</script>
</head>
<body>
	<form id="register_form">
		<table>
			<tr>
				<td>用户名</td>
				<td><input class="easyui-validatebox" id="username" name="username" type="text" placeholder="请输入登录名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox" id="password" name="password" type="password" maxlength="16" placeholder="请输入密码" data-options="required:true,validType:'length[3,16]'">
			</tr>
			<tr>
				<td>重复密码</td>
				<td><input class="easyui-validatebox" id="rePassword" type="password" maxlength="16" placeholder="请再次输入密码" data-options="required:true,validType:'eqPwd[\'#register_form input[id=password]\']'" /></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input class="easyui-validatebox" id="realname" name="realname" type="text" placeholder="请输入真实姓名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input class="easyui-validatebox" id="phone" name="phone" type="text" placeholder="请输入手机号码（选填）" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input class="easyui-validatebox" id="email" name="email" type="text" placeholder="请输入电子邮箱（选填）" data-options="validType:'email'" /></td>
			</tr>
				<tr>
				<td>上级ID</td>
				<td><input class="easyui-validatebox" id="parentId" name="parentId" type="text" placeholder="请输上级ID" /></td>
			</tr>
			<tr>
				<td>余額ID</td>
				<td><input class="easyui-validatebox" id="balanceId" name="balanceId" type="text" placeholder="请输余額ID" /></td>
			</tr>
		
		<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
