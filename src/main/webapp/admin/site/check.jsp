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
	
	function closeDialog() {
		$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_site_check_form">
		<table>
			<tr>
			    <td>站点编号</td>
				<td><input id="id" name="id" type="text" style="width:300px;" readOnly/></td>
			</tr>
			<tr>
				<td>站点名称</td>
				<td><input id="name" name="name" type="text" style="width:300px;" readOnly/></td>
			</tr>
			<tr>
				<td>站点地址</td>
				<td><input id="address" name="address" type="text" style="width:300px;height:40px" readOnly/></td>
			</tr>
			<tr>
			    <td>站点创建日期</td>
				<td><input id="createDate" name="createDate" type="text" style="width:300px;" readOnly/></td>
			</tr>
			<tr>
				<td>创建人ID</td>
				<td><input id="userId" name="userId" type="text" style="width:300px;" readOnly/></td>
			</tr>
			<tr>
				<td>创建目的</td>
				<td><input id="createPurpose" name="createPurpose" type="text" style="width:300px;height:80px" readOnly/></td>
			</tr>
			<tr>
				<td>工程名</td>
				<td><input id="projectName" name="projectName" type="text" style="width:300px;height:80px" readOnly/></td>
			</tr>
		</table>
	</form>
</body>
</html>
