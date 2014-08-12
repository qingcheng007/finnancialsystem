<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	var user = parent.$.modalDialog.row;
	$(function() {

	    $('#id').attr('value', user.id);
		$('#password').attr('value', user.password);
		$('#username').attr('value', user.username);
		$('#realname').attr('value', user.realname);
		$('#phone').attr('value', user.phone);
		$('#email').attr('value', user.email);
		$('#parentId').attr('value', user.parentId);
		$('#balanceId').attr('value', user.balanceId);
	});

	function submit() {
		if ($('#admin_user_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			$
					.ajax({
						url : '${pageContext.request.contextPath}/userController/admin/edit.do',
						type : 'POST',
						data : {
			
	                         id : $('#id').val(),
							username : $('#username').val(),
							password : $('#password').val(),
							realname : $('#realname').val(),
							phone : $('#phone').val(),
							email : $('#email').val(),
							parentId : $('#parentId').val()
						},
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								parent.$.modalDialog.DataGrid
										.datagrid(
												'updateRow',
												{
													index : parent.$.modalDialog.DataGrid
															.datagrid(
																	'getRowIndex',
																	user),
													row : {
														realname : data.obj.realname,
														phone : data.obj.phone,
														email : data.obj.email,
														classId : data.obj.classId,

													}
												});
								parent.$.modalDialog.handler.dialog('close');
								parent.$('#admin_user_addUser_form').form(
										'clear');
							}
							parent.$.messager.show({
								title : '提示',
								msg : data.msg,
								timeout : 2000,
								showType : 'slide'
							});
							$('#submit').linkbutton('enable');
						},
						error : function() {
							parent.$.messager.show({
								title : '提示',
								msg : '添加失败！',
								timeout : 2000,
								showType : 'slide'
							});
							$('#submit').linkbutton('enable');
						}
					});
		}
	}
	function closeDialog() {
		parent.$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_user_edit_form">
		<table>
			<tr>
				<td><input id="id" name="id" type="hidden"></input></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input id="username" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox" id="password" name="password" type="password" placeholder="请输入密码" data-options="required:true"></input></td>
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
			
				<td colspan='2' style="text-align: center;"><a id="submit" href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a href="#" class="easyui-linkbutton" onclick="submit()">保存修改</a></td>
			</tr>
		</table>
	</form>
</body>
</html>