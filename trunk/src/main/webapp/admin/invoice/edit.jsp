<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>发票信息修改</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	var cls = parent.$.modalDialog.row;
	$(function() {
		$('#id').attr('value', cls.id);
		$('#college').attr('value', cls.college);
		$('#year').attr('value', cls.year);
		$('#specialty').attr('value', cls.specialty);
		$('#name').attr('value', cls.name);
	});

	function submit() {
		if($('#admin_class_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/classController/admin/edit.do',
					type : 'POST',
					data : $('#admin_class_add_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('updateRow',
									{
										index : parent.$.modalDialog.DataGrid
												.datagrid('getRowIndex', cls),
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
		$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_class_add_form">
		<table>
			<tr>
				<td><input id="id" name="id" type="hidden"></input></td>
			</tr>
			<tr>
				<td>学院</td>
				<td><input class="easyui-validatebox" id="college" name="college" type="text" placeholder="请输入所属学院" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>年级</td>
				<td><input class="easyui-validatebox" id="year" name="year" type="text" placeholder="该班级是哪一届" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><input class="easyui-validatebox" id="specialty" name="specialty" type="text" placeholder="请输入专业" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>名称</td>
				<td><input class="easyui-validatebox" id="name" name="name" type="text" placeholder="请输入班级名称" data-options="required:true" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="closeDialog()">取消</a> <a href="#" class="easyui-linkbutton" onclick="submit()">保存修改</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
