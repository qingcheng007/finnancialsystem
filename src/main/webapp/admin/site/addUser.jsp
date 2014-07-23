<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	function submit() {
		if($('#admin_site_addUser_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/siteController/admin/add.do',
					type : 'POST',
					data : $('#admin_site_addUser_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('insertRow',
									{
										index : 0,
										row : data.obj
									});
							parent.$.messager.show({
								title : '提示',
								msg : data.msg,
								timeout : 2000,
								showType : 'slide'
							});
							parent.$.modalDialog.handler.dialog('close');
						}else{
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
		$('#admin_site_addUser_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_site_addUser_form">
		<table>
			<tr>
				<td>用户ID</td>
				<td><input class="easyui-validatebox" id="userId" name="userId" type="text" placeholder="输入站点名称" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>站点地址</td>
				<td><input class="easyui-validatebox" id="address" name="address" type="text" placeholder="请输入站点物理地址" data-options="required:true" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
