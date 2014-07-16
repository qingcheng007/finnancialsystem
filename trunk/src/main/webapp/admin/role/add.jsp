<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if($('#admin_role_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/roleController/admin/add.do',
					type : 'POST',
					data : $('#admin_role_add_form').serializeObject(),
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
						$('#submit').linkbutton('enable');
					}
				});
		}
	}
	function reset() {
		$('#admin_role_add_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_role_add_form">
		<table>
			<tr>
				<td>角色名称</td>
				<td><input class="easyui-validatebox" id="name" name="name" type="text" placeholder="请输入名称" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>角色代码</td>
				<td><input class="easyui-validatebox" id="code" name="code" type="text" placeholder="以ROLE_开头" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>角色描述</td>
				<td><textarea id="description" name="description" placeholder="选填" cols="15" row="3" ></textarea></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
