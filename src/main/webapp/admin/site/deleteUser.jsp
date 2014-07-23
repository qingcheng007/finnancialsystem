<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>从站点删除用户</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	function submit() {
		if ($('#admin_site_delete_form').form('validate')) {
			$('#submit').linkbutton('disable');
			$
					.ajax({
						url : '${pageContext.request.contextPath}/siteController/admin/deleteUserSite.do',
						type : 'POST',
						data : $('#admin_site_delete_form').serializeObject(),
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								parent.$.messager.show({
									title : '提示',
									msg : data.msg,
									timeout : 2000,
									showType : 'slide'
								});
							}else{
								parent.$.messager.show({
									title : '提示',
									msg : data.msg,
									timeout : 2000,
									showType : 'slide'
								});
							}
							$('#submit').linkbutton('enable');
						},
						error : function() {
							parent.$.messager.show({
								title : '提示',
								msg : '删除失败！',
								timeout : 2000,
								showType : 'slide'
							});
							$('#submit').linkbutton('enable');
						}
					});
		}
	}
	function closeDialog() {
		window
				.close('${pageContext.request.contextPath}/admin/site/deleteUser.jsp');
	}
</script>
</head>
<body>
		<form id="admin_site_delete_form">
			<table>
				<tr>
					<td>用户ID</td>
					<td><input class="easyui-validatebox" id="userId"
						name="userId" type="text" placeholder="请输入该站点中所要删除的用户的ID"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td colspan='2' style="text-align: center;"><a href="#"
						class="easyui-linkbutton" onclick="closeDialog()">取消</a> <a
						href="#" class="easyui-linkbutton" onclick="submit()"> 删除</a></td>
				</tr>
			</table>
		</form>
</body>
</html>
