<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if($('#admin_class_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/classController/admin/add.do',
					type : 'POST',
					data : $('#admin_class_add_form').serializeObject(),
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
	<form id="admin_class_add_form">
		<table>
			<tr>
				<td>年级</td>
				<td><input class="easyui-validatebox" id="year" name="year" type="text" placeholder="该班级是哪一届" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>学院</td>
				<td><input class="easyui-validatebox" id="college" name="college" type="text" placeholder="请输入所属学院" data-options="required:true" /></td>
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
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
