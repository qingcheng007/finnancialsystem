<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sessionid = session.getId();
%>
<html>
<head>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/style/css/dialog.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jslib/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/jslib/uploadify/uploadify.css"
	type="text/css">
<script type="text/javascript" charset="utf-8">
$(function() {
$('#file_upload').display('');
//document.getElementById('file_upload').style.display = '';
	$('#class').combobox({
	    url:'${pageContext.request.contextPath}/invoiceController/getAllTest.do',
	    valueField:'id',
	    textField:'name',
	    mode:'remote',
	    method:'get', 
	    panelHeight:'auto',
	    editable:false,
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
	
	$('#file_upload').uploadify({
		swf : '${pageContext.request.contextPath}/jslib/uploadify/uploadify.swf',
        cancelImg : '${pageContext.request.contextPath}/jslib/uploadify/uploadify-cancel.png',
     //   uploader : '${pageContext.request.contextPath}/fileController/upload.do;jsessionid=<%=sessionid%>?type=addStudentExcel',

		uploader : '${pageContext.request.contextPath}/fileController/upload.do;jsessionid=<%=sessionid%>
	?type=addStudentExcel',

							multi : false,
							queueSizeLimit : 1,
							fileSizeLimit : '10MB',
							fileTypeExts : '*.xls; *.xlsx;',
							buttonText : '选择文件',
							onUploadSuccess : function(file, data, response) {
								var obj = JSON.parse(data);
								parent.$.messager.progress({
									text : '数据加载中....'
								});
								$
										.ajax({
											url : '${pageContext.request.contextPath}/FileController/admin/addBatch.do',
											type : 'POST',
											data : {
												classId : $('#class').combobox(
														'getValue'),
												excelUrl : obj.url
											},
											dataType : 'json',
											success : function(data) {
												parent.$.messager
														.progress('close');
												if (data.success) {
													parent.$.modalDialog.DataGrid
															.datagrid('reload');
													parent.$.messager.show({
														title : '提示',
														msg : data.msg,
														timeout : 2000,
														showType : 'slide'
													});
													parent.$.modalDialog.handler
															.dialog('close');
												} else {
													parent.$.messager.show({
														title : '提示',
														msg : data.msg,
														timeout : 2000,
														showType : 'slide'
													});
												}
											},
											error : function() {
												parent.$.messager
														.progress('close');
												parent.$.messager.show({
													title : '提示',
													msg : '添加失败！',
													timeout : 2000,
													showType : 'slide'
												});
											}
										});
							}
						});
	});

	function checkTemplate() {
		window
				.open('${pageContext.request.contextPath}/admin/student/addStudentExcelTemplate.jpg');
	}
</script>
</head>
<body>
	<div style="margin-top:20px;margin-bottom:20px;">
		所属班级:<select id="class" name="classId" class="easyui-combobox"
			data-options="required:true" style="width:150px;">
		</select>
	</div>
	<div>
		导入Excel格式文件，支持.xls，.xlsx格式</br>
		<a href="javascript:void(0)" onclick="checkTemplate()">点击查看Excel格式</a>
		<input type="file" name="file_upload" id="file_upload" />
	</div>
</body>
</html>

