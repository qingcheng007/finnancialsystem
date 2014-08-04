<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>发票信息修改</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8"
	src="../../jslib/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
	src="../../jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../../style/css/dialog.css" type="text/css">
<script type="text/javascript"
	src="../../jslib/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" href="../../jslib/uploadify/uploadify.css"
	type="text/css">
<link rel="stylesheet" href="../../style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">

	var cls = parent.$.modalDialog.row;
	$(function() {
		$('#id').attr('value', cls.id);
		$('#proverId').attr('value', cls.proverid);
		$('#audit1Id').attr('value', cls.auditor1id);
		$('#audit2Id').attr('value', cls.auditor2id);
		$('#dearerId').attr('value', cls.dearerid);
		console.info(cls);
		
		$('select').prop({'disabled':true});
		// $("#proverauditState").attr('disabled','disabled');
	//	$(document).ready(function(){ $(":input[type='text']").attr("disabled","true");});YOUYONG
		//$(document).ready(function(){ $('#proverauditState').attr("disabled","true");});
		//$('#proverauditState').combobox('false');
		$('#proverauditState').combobox('select', cls.auditState.prover);
		$('#audit1State').combobox('select', cls.auditState.auditor1);
		$('#audit2State').combobox('select', cls.auditState.auditor2);
		$('#dearerState').combobox('select', cls.auditState.dearer);
		$('#proverauditState').css("display", "none");
		//$('#ID').combobox('disable');
		//document.getElementById("proverauditState").readOnly=true;
		//console.info(document.getElementById("proverauditState").readOnly);
		//	if(cls.auditState.prover)
		//{
		//	document.getElementById("proverauditState").select=1;
		//	
		//	}
		//else
		//	document.getElementById("proverauditState").select=0;
		//	document.getElementByid('audit1State').value='1'; 
		//	document.getElementByid('audit1State').innerHtml='cls.auditState.auditor1';
		//	$('#subject').combobox(
		//					{
		//						url : '${pageContext.request.contextPath}/invoiceController/getAllTest.do',
		//						valueField : 'id',
		//						textField : 'name',
		//					mode : 'remote',
		//				method : 'get',
		//			panelHeight : 'auto',
		//		editable : false
		//});
	});

	function submit() {
		if ($('#admin_class_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			var data = toJson();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/invoiceController/audit.do',
						type : 'POST',
						data : data,
						dataType : 'json',
						contentType : 'application/json;charset=utf-8',
						success : function(data) {
							if (data.success) {
								parent.$.modalDialog.DataGrid
										.datagrid(
												'updateRow',
												{
													index : parent.$.modalDialog.DataGrid
															.datagrid(
																	'getRowIndex',
																	cls),
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
	function toJson() {
		var invoice = new Object();

		//var question = new Object();
		//alert('fuck');
		var invoiceTyp = new Object();
		var invoiceDetails = new Object();
		var auditState = new Object();
		invoiceType = cls.invoiceType;
		invoiceDetails = cls.invoiceDetails;
		invoice.invoiceType = invoiceType;
		invoice.invoiceDetails = invoiceDetails;
		auditState.id = cls.auditstateid;
		auditState.prover = $('#proverauditState').combobox('getValue');
		auditState.auditor1 = $('#audit1State').combobox('getValue');
		auditState.auditor2 = $('#audit2State').combobox('getValue');
		auditState.dearer = $('#dearerState').combobox('getValue');
		invoice.occurDate =cls.occurDate;
		invoice.createDate=cls.createDate;
		invoice.id = cls.id;
		console.info(invoice.id);
		invoice.proverId = $('#proverId').val();
		invoice.auditor1Id = $('#auditor1Id').val();
		invoice.auditor2Id = $('#auditor2Id').val();
		invoice.dearerId = $('#dearerId').val();
		console.info(cls);
		invoice.money = cls.money;
		invoice.auditStateId = cls.auditstateid;
		console.info(cls.auditstateid);

		invoice.auditState = auditState;

		//	invoice.proverId = $('#proverId').combobox('getValue');
		//	invoice.auditor1Id = $('#auditor1Id').combobox('getValue');
		//	invoice.auditor2Id = $('#auditor2Id').combobox('getValue');
		/*
			invoice.invoiceDetail = invoiceDetail;
			
			
			
			
			
			//invoice.operatorId = $('#operatorId').combobox('getValue');
			
			
			//invoice.dearerId = $('#dearerId').val();*/
		return JSON.stringify(invoice);
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
				<td>证明人</td>

				<td><input class="easyui-validatebox" id="proverId"
					name="proverId" type="text" placeholder="证明人"
					data-options="required:true" style="width:160px;" readonly /></td>
			</tr>
			<tr>
				<td>证明人审核状态</td>
				<td><select id="proverauditState" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>
			<tr>
				<td>审核人</td>
				<td><input class="easyui-validatebox" id="audit1Id"
					name="audit1Id" type="text" placeholder="证明人"
					data-options="required:true" style="width:160px;" readonly /></td>
			</tr>
			<tr>
				<td>审核人审批状态
				<td><select id="audit1State" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>
			<tr>
				<td>审批人</td>
				<td><input class="easyui-validatebox" id="audit2Id"
					name="audit2Id" type="text" placeholder="证明人"
					data-options="required:true" style="width:160px;" readonly /></td>
			</tr>
			<tr>
				<td>审批人状态</td>
				<td><select id="audit2State" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>
			<tr>
				<td>审票人</td>
				<td><input class="easyui-validatebox" id="dearerId"
					name="dearerId" type="text" placeholder="证明人"
					data-options="required:true" style="width:160px;" readonly /></td>
			</tr>
			<tr>
				<td>审票人审核状态</td>
				<td><select id="dearerState" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>

			<tr>
				<td colspan='2' style="text-align: center;"><a href="#"
					class="easyui-linkbutton" onclick="closeDialog()">取消</a><a href="#"
					class="easyui-linkbutton" onclick="submit()">保存修改</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
