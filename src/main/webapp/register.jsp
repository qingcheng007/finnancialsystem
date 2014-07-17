<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>注册</title>
<jsp:include page="inc.jsp"></jsp:include>

<script type="text/javascript" charset="utf-8">
	$(function() {
		$('#register_form')
				.form(
						{
							url : '${pageContext.request.contextPath}/userController/register.do',
							onSubmit : function() {
								return $(this).form('validate');
							},
							success : function(data) {
								data = $.parseJSON(data);
								alert(data.msg);
							}
						});
	});

	/*$.extend($.fn.validatebox.defaults.rules, {
	 checkAccount: {
	 validator: function(value, param){
	 $
	 return 
	 },
	 message: 'Please enter at least {0} characters.'
	 }
	 });

	 function test(){  
	 //1.获取文本框中的值  
	 var value = $("#account").val();  
	 //2.将文本框中的内容发送给后台服务器  
	 //使用jQuery的XMLHTTPRequest的方法的封装  
	 $.get("/Ajax/servlet/AjaxServlet?name="+value,null,callback);  
	 }  
	
	 function callback(data){//回调函数  
	 //3.接受服务器的返回的数据  
	 //alert(data);  
	 //4.将结果显示在页面中  
	 $("#div1").html(data);  */
</script>

</head>

<body>
	<form id="register_form" method="post">
		<table>
			<tr>
				<td>用户名</td>
				<td><input class="easyui-validatebox" id="username"
					name="username" type="text" placeholder="请输入登录名"
					data-options="required:true,validType:'checkAccount'" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox" name="password"
					type="password" maxlength="16" placeholder="请输入密码"
					data-options="required:true" /></td>
			</tr>
			<tr>
				<td>重复密码</td>
				<td><input class="easyui-validatebox" name="rePassword"
					type="password" maxlength="16" placeholder="请再次输入密码"
					data-options="required:true,validType:'eqPwd[\'#register_form input[name=password]\']'" /></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input class="easyui-validatebox" name="realname"
					type="text" placeholder="请输入真实姓名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input class="easyui-validatebox" name="phone" type="text"
					placeholder="请输入手机号码" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input class="easyui-validatebox" name="email" type="text"
					placeholder="请输入电子邮箱"
					data-options="required:true,validType:'email'" /></td>
			</tr>
			<tr>
				<td>父ID</td>
				<td><input class="easyui-validatebox" name="parentId" type="text"
					placeholder="请输入父ID"
					data-options="required:true,validType:'parentId'" /></td>
			</tr>
			<tr>
				<td>余额ID</td>
				<td><input class="easyui-validatebox" name="balanceId" type="text"
					placeholder="请输入余额ID"
					data-options="required:true,validType:'balanceId'" /></td>
			</tr>
			<tr>
				<td><button type="reset">重置</button></td>
				<td><button type="submit">注册</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
