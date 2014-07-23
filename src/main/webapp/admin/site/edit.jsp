<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	var cls = parent.$.modalDialog.row;
	$(function() {
		$('#id').attr('value', cls.id);
		$('#name').attr('value', cls.name);
		$('#address').attr('value', cls.address);
		$('#createDate').attr('value', cls.createDate);
		$('#userId').attr('value', cls.userId);
		$('#createPurpose').attr('value', cls.createPurpose);
		$('#projectName').attr('value', cls.projectName);
	});

	function submit() {
		if($('#admin_site_edit_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/siteController/admin/edit.do',
					type : 'POST',
					data : $('#admin_site_edit_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('updateRow',
									{
										index : parent.$.modalDialog.DataGrid
												.datagrid('getRowIndex', cls),
										row : data.obj
									});
							parent.$.messager.show({
								title : '提示',
								msg : data.msg,
								timeout : 2000,
								showType : 'slide'
							});
							parent.$.modalDialog.handler.dialog('close');
						}
						$('#submit').linkbutton('enable');
					},
					error : function() {
						parent.$.messager.show({
							title : '提示',
							msg : '更新失败！',
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
	<form id="admin_site_edit_form">
		<table>
			<tr>
				<td><input id="id" name="id" type="hidden"></input></td>
			</tr>
			<tr>
				<td>站点名称</td>
				<td><input class="easyui-validatebox" id="name" name="name" type="text" placeholder="请输入站点名称" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>站点地址</td>
				<td><input class="easyui-validatebox" id="address" name="address" type="text" placeholder="请输入站点物理地址" data-options="required:true" /></td>
			</tr>
			<tr>
				<td><input id="createDate" name="createDate" type="hidden"/></td>
			</tr>
			<tr>
				<td>创建人ID</td>
				<td><input class="easyui-validatebox" id="userId" name="userId" type="text" placeholder="请输入创建人ID" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>创建目的</td>
				<td><input class="easyui-validatebox" id="createPurpose" name="createPurpose" type="text" placeholder="请输入创建该站的目的" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>工程名</td>
				<td><input class="easyui-validatebox" id="projectName" name="projectName" type="text" placeholder="请输入该站点所管理的工程的名称" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="closeDialog()">取消</a> <a href="#" class="easyui-linkbutton" onclick="submit()">保存修改</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
