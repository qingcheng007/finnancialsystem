<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if($('#admin_user_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/userController/admin/add.do',
					type : 'POST',
					data : $('#admin_user_add_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('insertRow',
									{
										index : 0,
										row : data.obj
									});
							parent.$.modalDialog.handler.dialog('close');
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
					}
				});
		}
	}
	function reset() {
		$('#admin_user_add_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_user_add_form">
		<table>
			<tr>
				<td>用户名</td>
				<td><input class="easyui-validatebox" id="username" name="username" type="text" placeholder="请输入登录名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input class="easyui-validatebox" id="realname" name="realname" type="text" placeholder="请输入真实姓名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>转账金额</td>
				<td><input class="easyui-validatebox" id="rePassword" type="password" maxlength="16" placeholder="请再次输入密码" data-options="required:true,validType:'eqPwd[\'#admin_user_add_form input[id=password]\']'" /></td>
			</tr>
			
             <tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
