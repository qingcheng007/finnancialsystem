<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>发票信息添加</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8"
	src="../../jslib/kindeditor-4.1.10/kindeditor.js"></script>
<script type="text/javascript"
	src="../../jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../../style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if ($('#invoice_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			var data = toJson();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/invoiceController/add.do',
						type : 'POST',
						//data : $('#admin_class_add_form').serializeObject(),
						data : data,
						dataType : 'json',
						contentType : 'application/json;charset=utf-8',
						success : function(data) {
							console.info(data.msg);
							if (data.success) {
								parent.$.modalDialog.DataGrid.datagrid(
										'insertRow', {
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
	function toJson() {
		var invoice = new Object();

		//var question = new Object();
		//alert('fuck');

		var invoiceType = new Object();
		var invoiceDetails = new Object();
		if ($('#invoiceTypeId').val() != null)
			invoiceType.id = $('#invoiceTypeId').val();

		for ( var i = 1; i <= 3; i++) {
			var inputName = "content" + invoiceType.id;
			//console.info(inputName + i);
			var contenti = document.getElementById(inputName + i).value;
			console.info(inputName + i);
			if (contenti != null) {
				if (i == 1)
					invoiceDetails.content1 = contenti;
				if (i == 2)
					invoiceDetails.content2 = contenti;
				if (i == 3)
					invoiceDetails.content3 = contenti;
			}
		}
		invoice.invoiceType = invoiceType;
		invoice.invoiceDetails = invoiceDetails;
		invoice.createDate = $('#createDate').val();
		invoice.occurDate = $('#createDate').val();
		invoice.content = $('#content').val();
		invoice.money = $('#money').val();
		invoice.description = $('#description').val();
		invoice.projectName = $('#projectName').val();
		invoice.operatorId = $('#operatorId').val();
		invoice.proverId = $('#proverId').val();
		invoice.auditor1Id = $('#auditor1Id').val();
		invoice.auditor2Id = $('#auditor2Id').val();
		invoice.remark = $('#remark').val();
		invoice.Photourl=$('#photoUrl').val();
		//	invoice.proverId = $('#proverId').combobox('getValue');
		//	invoice.auditor1Id = $('#auditor1Id').combobox('getValue');
		//	invoice.auditor2Id = $('#auditor2Id').combobox('getValue');
		/*
			invoice.invoiceDetail = invoiceDetail;
			
			
			
			
			
			//invoice.operatorId = $('#operatorId').combobox('getValue');
			
			
			//invoice.dearerId = $('#dearerId').val();*/
		return JSON.stringify(invoice);
	}
	function reset() {
		$('#invoice_add_form').form('clear');
	}
	function onclicked() {
		console.info("test");
		//console.info(data);
		alert("test");
	}
	function switchHide(n) {
		//一样格式，但是有点问题
		//document.getElementById('tr11').style.diaplay = 'none';

		//document.getElementById('tr12').style.diaplay = 'none';
		//document.getElementById('tr13').style.diaplay = 'none';

		//document.getElementById('tr21').style.diaplay = 'none';
		//document.getElementById('tr22').style.diaplay = 'none';
		//document.getElementById('tr23').style.diaplay = 'none';

		//document.getElementById('tr31').style.diaplay = 'none';
		//document.getElementById('tr32').style.diaplay = 'none';
		//document.getElementById('tr33').style.diaplay = 'none';

		//document.getElementById('tr41').style.diaplay = 'none';
		//document.getElementById('tr42').style.diaplay = 'none';
		//document.getElementById('tr43').style.diaplay = 'none';

		//document.getElementById('tr51').style.diaplay = 'none';
		//document.getElementById('tr52').style.diaplay = 'none';

		//document.getElementById('tr61').style.diaplay = 'none';
		//document.getElementById('tr62').style.diaplay = 'none';

		//document.getElementById('tr81').style.diaplay = 'none';
		//document.getElementById('tr82').style.diaplay = 'none';

		//document.getElementById('tr91').style.diaplay = 'none';
		//document.getElementById('tr92').style.diaplay = 'none';
		//document.getElementById('tr93').style.diaplay = 'none';

		//document.getElementById('tr11').style.diaplay = 'none';
		//document.getElementById('tr12').style.diaplay = 'none';
		//document.getElementById('tr13').style.diaplay = 'none';
		document.getElementById('tr11').style.display = 'none';
		document.getElementById('tr12').style.display = 'none';
		document.getElementById('tr13').style.display = 'none';

		document.getElementById('tr21').style.display = 'none';
		document.getElementById('tr22').style.display = 'none';
		document.getElementById('tr23').style.display = 'none';

		document.getElementById('tr31').style.display = 'none';
		document.getElementById('tr32').style.display = 'none';
		document.getElementById('tr33').style.display = 'none';

		document.getElementById('tr41').style.display = 'none';
		document.getElementById('tr42').style.display = 'none';
		document.getElementById('tr43').style.display = 'none';

		document.getElementById('tr51').style.display = 'none';
		document.getElementById('tr52').style.display = 'none';

		document.getElementById('tr61').style.display = 'none';
		document.getElementById('tr62').style.display = 'none';

		document.getElementById('tr81').style.display = 'none';
		document.getElementById('tr82').style.display = 'none';

		document.getElementById('tr91').style.display = 'none';
		document.getElementById('tr92').style.display = 'none';
		document.getElementById('tr93').style.display = 'none';

		document.getElementById('tr101').style.display = 'none';
		document.getElementById('tr102').style.display = 'none';
		document.getElementById('tr103').style.display = 'none';

		document.getElementById('tr111').style.display = 'none';
		document.getElementById('tr112').style.display = 'none';
		document.getElementById('tr113').style.display = 'none';

		i = 1;
		for (; i <= 3; i++) {
			if (document.getElementById("tr" + n + i) != null) {
				document.getElementById("tr" + n + i).style.display = '';
				//alert(document.getElementById('id').value);
				//console.info(document.getElementById('id').value);
				//$('#tr11 input [name=content1]').required("true");
			}
		}

		//document.getElementById('tr1').style.display = '';
		//document.getElementById('tr2').style.display = 'none';

		//if (n == 2) {
		//	document.getElementById('tr1').style.display = 'none';
		//	document.getElementById('tr2').style.display = '';
		//}
	}

	//如果初始要显示第一个tr, 请在这里要加上：switchHide(1);
</script>
</head>
<body>
	<form id="invoice_add_form">

		<table>
<tr>
			<td>票据类型</td>
			<td><select onchange="switchHide(this.value)" id="invoiceTypeId"
				name="invoiceTypeId" style="width:166px;">
					<option value="1">卡加油费</option>
					<option value="2">现金加油费</option>
					<option value="3">住宿费</option>
					<option value="4">交通费</option>
					<option value="5">修理费</option>
					<option value="6">过停费</option>
					<option value="7">招待费</option>
					<option value="8">办公费</option>
					<option value="9">材料费</option>
					<option value="10">工具费</option>
					<option value="11">其他费</option>
			</select></td>
			</tr>

			<tr id="tr11">
				<td>加油对象</td>
				<td><input class="easyui-validatebox" id="content11"
					name="content11" type="text" placeholder="加油对象"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr12">
				<td>加油升数</td>
				<td><input class="easyui-validatebox" id="content12"
					name="content12" type="text" placeholder="加油升数"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr13">
				<td>车辆公里数</td>
				<td><input class="easyui-validatebox" id="content13"
					name="content13" type="text" placeholder="车辆公里数"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr21" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr22" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr23" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr31" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr32" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr33" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr41" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr42" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr43" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr51" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr52" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr61" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr62" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>


			<tr id="tr81" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr82" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>


			<tr id="tr91" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr92" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr93" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr101" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr102" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr103" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr111" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr112" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr113" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					style="width:160px;" /></td>
			</tr>


			<tr>
				<td>录入时间</td>
				<td><input class="easyui-validatebox" id='createDate'
					name='createDate' value="${csrqstart}"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"
					data-options="required:true" placeholder="录入时间"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>票据发生日期</td>
				<td><input class="easyui-validatebox" id='occurDate'
					name='occurDate' value="${csrqstart}"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"
					data-options="required:true" placeholder="票据发生时间"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="content"
					name="content" type="text" placeholder="费用内容"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>金额</td>
				<td><input class="easyui-validatebox" id="money" name="money"
					type="text" placeholder="金额" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>费用说明</td>
				<td><input class="easyui-validatebox" id="description"
					name="description" type="text" placeholder="费用说明"
					data-options="required:true" style="width:160px;" /></td>
			</tr>

			<tr>
				<td>所属工程</td>
				<td><input class="easyui-validatebox" id="projectName"
					name="projectName" type="text" placeholder="所属工程"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>经办人</td>
				<td><input class="easyui-validatebox" id="operatorId"
					name="operatorId" type="text" placeholder="经办人"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>证明人</td>
				<td><input class="easyui-validatebox" id="proverId"
					name="proverId" type="text" placeholder="证明人"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审核人</td>
				<td><input class="easyui-validatebox" id="auditor1Id"
					name="auditorId1" type="text" placeholder="审核人"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审批人</td>
				<td><input class="easyui-validatebox" id="auditor2Id"
					name="auditorId2" type="text" placeholder="审批人"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>清单附照片</td>
				<td><input type="file" name="file_upload" id="file_upload" />
				<input class="easyui-validatebox" id="photoUrl"
					name="photoUrl" type="text" placeholder="清单附照片"
					data-options="required:true" style="width:160px;" /> <textarea
						id="content_1" name="content" style="width:700px;height:300px;"></textarea>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input class="easyui-validatebox" id="remark" name="remark"
					type="text" placeholder="备注" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#"
					class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit"
					href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
