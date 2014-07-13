<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>添加作业</title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript" src="../../jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">

	$(function() {	
		$('#class').combobox({
		    url:'${pageContext.request.contextPath}/classController/admin/getAll.do',
		    valueField:'id',
		    textField:'name',
		    mode:'remote',
		    method:'get', 
		    panelHeight:'auto',
		    editable:false,
		    multiple:true,
		    formatter: function(row){
		    	var str = row.college
				+ ' '
				+ row.year
				+ ' '
				+ row.specialty
				+ ' '
				+ row.name;
		        row.name = str + ',';
				return row.name;
			},
		});
	});
	
	function submit() {
		if($('#admin_homework_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			var data = toJson();
			$.ajax({
					url : '${pageContext.request.contextPath}/homeworkController/admin/add.do',
					type : 'POST',
					data : data,
					dataType : 'json',
					contentType : 'application/json; charset=utf-8',
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
	
	function toJson(){
		var homework = new Object();
		homework.title = $('#title').val();
		homework.content = $('#content').val();
		homework.deadline = $('#deadline').val();
		var val = $('#class').combobox('getValues').join(',');
		homework.classes = val;
		homework.hasAttachment = $('#hasAttachment').is(':checked') ? '0' : '1';
		if ($('#description').val() != '')
			homework.description = $('#description').val();
		return JSON.stringify(homework);
	}
	
	function reset() {
		$('#admin_role_add_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_homework_add_form">
		<table>
			<tr>
				<td>标题</td>
				<td><input class="easyui-validatebox" id="title" name="title" type="text" placeholder="请输入作业标题" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>内容</td>
				<td><textarea class="easyui-validatebox" id="content" name="content" placeholder="请输入作业内容" data-options="required:true"></textarea></td>
			</tr>
			<tr>
				<td>截止日期</td>
				<td><input class="Wdate easyui-validatebox" id="deadline" name="deadline" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd 23:59:59'})" readonly="readonly" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>关联班级</td>
				<td><select id="class" name="class" class="easyui-combobox" data-options="required:true" style="width:150px;">
				</select></td>
			</tr>
			<tr>
				<td>是否以附件提交</td>
				<td><input id="hasAttachment" name="hasAttachment" type="checkbox" checked="checked"/></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input class="easyui-validatebox" id="description" name="description" type="text" placeholder="选填" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
