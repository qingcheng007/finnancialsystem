<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
						url : '${pageContext.request.contextPath}/userController/admin/transfer.do',
						type : 'POST',
						data : $('#admin_user_edit_form').serializeObject(),
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
														available: data.obj.money,
													
													
													}
												});
												parent.$('#admin_user_addUser_form').form(
										'reload');
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
				<td><input id="balanceId" name="balanceId" type="hidden"></input></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input id="username" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input class="easyui-validatebox" id="realname" name="realname" type="text" placeholder="请输入真实姓名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>转账余额</td>
				<td><input class="easyui-validatebox" id="money" name="money" type="text" placeholder="请输入转账余額" /></td>
			</tr>
		      <tr>
				<td colspan='2' style="text-align: center;"><a id="submit" href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a href="#" class="easyui-linkbutton" onclick="submit()">转账</a></td>
			</tr>
		</table>
	</form>
</body>
</html>