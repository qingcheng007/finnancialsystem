<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	var role = parent.$.modalDialog.row;
	$(function() {
		$('#id').attr('value', role.id);
		$('#name').attr('value', role.name);
		$('#code').attr('value', role.code);
		$('#description').text(role.description);
		if (role.isEnable == true)
			$('#isEnable').attr('checked', false);
		else
			$('#isEnable').attr('checked', true);
	});

	function submit() {
		if($('#admin_role_edit_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/roleController/admin/edit.do',
					type : 'POST',
					data : {
						id : $('#id').val(),
						name : $('#name').val(),
						code : $('#code').val(),
						description : $('#description').val(),
						isEnable : $('#isEnable').is(':checked') ? '0' : '1'
					},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('updateRow',
									{
										index : parent.$.modalDialog.DataGrid
												.datagrid('getRowIndex', role),
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
	function closeDialog() {
		parent.$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_role_edit_form">
		<table>
			<tr>
				<td><input id="id" name="id" type="hidden"></input></td>
			</tr>
			<tr>
				<td>角色名称</td>
				<td><input class="easyui-validatebox" id="name" name="name" type="text" placeholder="请输入角色名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>角色代号</td>
				<td><input class="easyui-validatebox" id="code" name="code" type="text" placeholder="角色代号以ROLE_开头" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>角色描述</td>
				<td><textarea id="description" name="description" rows="3" cols="15" placeholder="请输入角色描述（选填）" /></textarea></td>
			</tr>
			<tr>
				<td>是否禁用此角色</td>
				<td><input id="isEnable" name="isEnable" type="checkbox" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="closeDialog()">取消</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">保存修改</a></td>
			</tr>
		</table>
	</form>
</body>
</html>