<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>向站点中添加用户</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
var postId;
$(function() {
	$('#post')
			.combobox(
					{
						url : '${pageContext.request.contextPath}/postController/admin/getAllPost.do',
						valueField : 'id',
						textField : 'name',
						mode : 'remote',
						method : 'get',
						panelHeight : 'auto',
						editable : false,
						onSelect: function(rec){
							postId = rec.id;
						}
					});
});

	function submit() {
		if($('#admin_site_addUser_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/siteController/admin/addUserSite.do?postId='+postId,
					type : 'POST',
					data : $('#admin_site_addUser_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
							parent.$.messager.show({
								title : '提示',
								msg : data.msg,
								timeout : 2000,
								showType : 'slide'
							});
							$('#submit').linkbutton('enable');
							parent.$.modalDialog.handler.dialog('close');
						  
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
				<td>职务</td>
				<td><select id="post" class="easyui-combobox" data-options="required:true" style="width:150px;"></select></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
