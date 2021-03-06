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
		console.info(cls);
		$('#id').attr('value', cls.id);
		$('#proverName').attr('value', cls.proverName);
		$('#audit1Name').attr('value', cls.auditor1Name);
		$('#audit2Name').attr('value', cls.auditor2Name);
		$('#dearerName').attr('value', cls.dearerName);
		console.info(cls.operatorId + "_" + cls.proverId + "_" + cls.auditor1Id
				+ "_" + cls.auditor2Id + "_" + cls.dearerId);
		var showWarn = 0;
	
			if (cls.auditState.prover == 0&&cls.auditState.prover != 2) {
				document.getElementById('provertr').style.display = '';
				document.getElementById('provertrState').style.display = '';
				showWarn++;
			}
		
		else
			if (cls.auditState.auditor1 == 0&&cls.auditState.auditor1 != 2) {
				document.getElementById('audit1tr').style.display = '';
				document.getElementById('audit1trState').style.display = '';
				showWarn++;
			}
	else 
			if (cls.auditState.auditor2 == 0&&cls.auditState.auditor2 != 2) {
				document.getElementById('audit2tr').style.display = '';
				document.getElementById('audit2trState').style.display = '';
				showWarn++;
			}
	
	else 
			if (cls.auditState.dearer == 0&&cls.auditState.dearer != 2) {
				document.getElementById('dearertr').style.display = '';
				document.getElementById('dearertrState').style.display = '';
				showWarn++;
			}
		
		if(showWarn == 0)
		{
		
		parent.$.messager.show({
								title : '提示',
								msg : "当前发票没有到您审核的状态",
								timeout : 2000,
								showType : 'slide'
							});
		parent.$.modalDialog.handler.dialog('close');
		
		}

		$('select').prop({
			'disabled' : true
		});
		// $("#proverauditState").attr('disabled','disabled');
		//	$(document).ready(function(){ $(":input[type='text']").attr("disabled","true");});YOUYONG
		//$(document).ready(function(){ $('#proverauditState').attr("disabled","true");});
		//$('#proverauditState').combobox('false');
		//console.info(document.getElementById('provertr').style.display);
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
			$.ajax({
						url : '${pageContext.request.contextPath}/invoiceController/admin/audit.do',
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
													index : parent.$.modalDialog.DataGrid.datagrid('getRowIndex', cls),
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
		//var invoiceType = new Object();
	//	var invoiceDetails = new Object();
		var auditState = new Object();
		//invoiceType = cls.invoiceType;
		//invoiceDetails = cls.invoiceDetails;
	//	invoice.invoiceType = invoiceType;
		//invoice.invoiceDetails = invoiceDetails;
		auditState.id = cls.auditStateId;
		auditState.prover = $('#proverauditState').combobox('getValue');
		auditState.auditor1 = $('#audit1State').combobox('getValue');
		auditState.auditor2 = $('#audit2State').combobox('getValue');
		auditState.dearer = $('#dearerState').combobox('getValue');
		//invoice.occurDate = cls.occurDate;
		//invoice.createDate = cls.createDate;
		invoice.id = cls.id;
		//console.info(invoice.id);
		//invoice.proverId = cls.proverId;
		//invoice.auditor1Id = cls.auditor1Id;
		//invoice.auditor2Id = cls.auditor2Id;
		//invoice.dearerId = cls.dearerId;
		//console.info(cls);
		//invoice.money = cls.money;
		//invoice.auditStateId = cls.auditStateId;
		//console.info(cls.auditStateId);

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
		
		parent.$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_class_add_form">
		<table>

			<tr>
				<td><input id="id" name="id" type="hidden"></input></td>
			</tr>


			<tr id="provertr" style="display:none">
				<td>证明人</td>

				<td><input class="easyui-validatebox" id="proverName"
					name="proverName" type="text" placeholder="证明人"
					data-options="required:true" style="width:160px;" readonly /></td>
			</tr>
			<tr id="provertrState" style="display:none">
				<td>证明人审核状态</td>
				<td><select id="proverauditState" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>
			<tr id="audit1tr" style="display:none">
				<td>审核人</td>
				<td><input class="easyui-validatebox" id="audit1Name"
					name="audit1Name" type="text" data-options="required:true"
					style="width:160px;" readonly /></td>
			</tr>
			<tr id="audit1trState" style="display:none">
				<td>审核人审批状态
				<td><select id="audit1State" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>
			<tr id="audit2tr" style="display:none">
				<td>审批人</td>
				<td><input class="easyui-validatebox" id="audit2Name"
					name="audit2Name" type="text" data-options="required:true"
					style="width:160px;" readonly /></td>
			</tr>
			<tr id="audit2trState" style="display:none">
				<td>审批人状态</td>
				<td><select id="audit2State" class="easyui-combobox"
					data-options="required:true" style="width:150px;">
						<option value='2'>审核不通过</option>
						<option value='1'>审核通过</option>
						<option value='0'>未审核</option>
				</select></td>
			</tr>
			<tr id="dearertr" style="display:none">
				<td>审票人</td>
				<td><input class="easyui-validatebox" id="dearerName"
					name="dearerName" type="text" data-options="required:true"
					style="width:160px;" readonly /></td>
			</tr>
			<tr id="dearertrState" style="display:none">
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
					class="easyui-linkbutton" onclick="submit()">审批</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
