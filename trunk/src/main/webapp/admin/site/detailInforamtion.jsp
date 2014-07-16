<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
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
	
	function closeDialog() {
		$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_site_detailInformation_form">
		<table>
			<tr>
				<td><input id="id" name="id" type="text" /></td>
			</tr>
			<tr>
				<td>站点名称</td>
				<td><input id="name" name="name" type="text" /></td>
			</tr>
			<tr>
				<td>站点地址</td>
				<td><input id="address" name="address" type="text" /></td>
			</tr>
			<tr>
				<td><input id="createDate" name="createDate" type="text" /></td>
			</tr>
			<tr>
				<td>创建人ID</td>
				<td><input id="userId" name="userId" type="text" /></td>
			</tr>
			<tr>
				<td>创建目的</td>
				<td><input id="createPurpose" name="createPurpose" type="text" /></td>
			</tr>
			<tr>
				<td>工程名</td>
				<td><input id="projectName" name="projectName" type="text" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="closeDialog()">关闭</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
