<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>添加职务</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	function submit() {
		if($('#admin_post_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/postController/admin/add.do',
					type : 'POST',
					data : $('#admin_post_add_form').serializeObject(),
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
		$('#admin_post_add_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_post_add_form">
		<table>
			<tr>
				<td>职务名称</td>
				<td><input class="easyui-validatebox" id="name" name="name" type="text" placeholder="请输入职务名称" data-options="required:true" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
