<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	String sessionid = session.getId();
%>
<html>
<head>

<title>发票信息添加</title>
<sec:authentication property="principal" var="authentication" />
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

<script type="text/javascript" charset="utf-8">
$(function() {
	$('#proverId').combobox(
			{
				url:'${pageContext.request.contextPath}/userController/admin/getAll.do',
				valueField : 'id',
				textField : 'realname',
				mode : 'remote',
				method : 'get',
				panelHeight : 'auto',
				editable : false,
				formatter: function(row){
			            row.realname = row.username
						+ ' '
						+ row.realname;
			    		return row.realname;
					},
			});
	
	$('#auditor1Id').combobox(
			{
				url:'${pageContext.request.contextPath}/userController/admin/getAll.do',
				valueField : 'id',
				textField : 'realname',
				mode : 'remote',
				method : 'get',
				panelHeight : 'auto',
				editable : false,
				formatter: function(row){
			            row.realname = row.username
						+ ' '
						+ row.realname;
			    		return row.realname;
					},
			});
	$('#auditor2Id').combobox(
			{
				url:'${pageContext.request.contextPath}/userController/admin/getAll.do',
				valueField : 'id',
				textField : 'realname',
				mode : 'remote',
				method : 'get',
				panelHeight : 'auto',
				editable : false,
				formatter: function(row){
			            row.realname = row.username
						+ ' '
						+ row.realname;
			    		return row.realname;
					},
			});
	$('#dearerId').combobox(
			{
				url:'${pageContext.request.contextPath}/userController/admin/getAll.do',
				valueField : 'id',
				textField : 'realname',
				mode : 'remote',
				method : 'get',
				panelHeight : 'auto',
				editable : false,
				formatter: function(row){
			            row.realname = row.username
						+ ' '
						+ row.realname;
			    		return row.realname;
					},
			});
	$('#photoUrl').uploadify({
		swf : '${pageContext.request.contextPath}/jslib/uploadify/uploadify.swf',
        cancelImg : '${pageContext.request.contextPath}/jslib/uploadify/uploadify-cancel.png',
        uploader : '${pageContext.request.contextPath}/fileController/upload.do;jsessionid=<%=sessionid%>?type=addStudentExcel',
							multi : false,
							queueSizeLimit : 1,
							fileSizeLimit : '10MB',
							fileTypeExts : '*.jpg; *.jpeg;',
							buttonText : '选择文件',
							onUploadSuccess : function(file, data, response) {
								var obj = JSON.parse(data);
								console.info(obj.url);
								//alert(obj.url);
								document.getElementById("photoUrl").value = obj.url;
							}
						});
	});
	function submit() {
		//if($('#invoice_add_form input[name=photoUrl]').val()==null)
	//	if (document.getElementById("photoUrl").value == null) {
		//	$.messager.show({
		//		title : '提示',
		//		msg : '图片信息为空',
		//		timeout : 2000,
		//		showType : 'slide'
		//	});
	//	} else
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
			invoiceType.name = $("#invoiceTypeId").find('option:selected').text();
		var inputName = "content" + invoiceType.id;
		for ( var i = 1; i <= 3; i++) {
			
			console.info(inputName + i);
	
			console.info(invoiceType.id);
			switch(invoiceType.id)
			{
			case '1':{
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
				if (i == 3)
					invoiceDetails.content3 = document.getElementById(inputName + i).value;
				
			}break;
			case '2':{
				
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
				if (i == 3)
					invoiceDetails.content3 = document.getElementById(inputName + i).value;
				
			}break;
			case '3':{
				
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
				if (i == 3)
					invoiceDetails.content3 = document.getElementById(inputName + i).value;
				
			}break;
			case '4':{
				
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
					
			}break;
			case '5':{
			
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
			
			}break;
			case '6':{
					
			}break;
			case '7':{
			
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
		
			}break;
			case '8':{
				
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
		
			}break;
			case '9':{
				
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
				if (i == 3)
					invoiceDetails.content3 = document.getElementById(inputName + i).value;
	
			}break;
			case '10':{
				
				if (i == 1)
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
				if (i == 2)
					invoiceDetails.content2 = document.getElementById(inputName + i).value;
				if (i == 3)
					invoiceDetails.content3 = document.getElementById(inputName + i).value;
	
			}break;
			case '11':{
				
				if (i == 1)
					{
					invoiceDetails.content1 = document.getElementById(inputName + i).value;
					console.info(document.getElementById(inputName + i).value);
					}
				
			}break;

			}
			
		}
		invoice.invoiceType = invoiceType;
		invoice.invoiceDetails = invoiceDetails;
		invoice.createDate = $('#createDate').val();
		invoice.occurDate = $('#occurDate').val();
		invoice.content = $('#content').val();
		invoice.money = $('#money').val();
		invoice.description = $('#description').val();
		invoice.projectName = $('#projectName').val();
		//invoice.operatorId = $('#operatorId').val();
		invoice.operatorId = ${authentication.id};
		//invoice.proverId = $('#proverId').val();
		//invoice.auditor1Id = $('#auditor1Id').val();
		//invoice.auditor2Id = $('#auditor2Id').val();
		invoice.remark = $('#remark').val();
		invoice.photoUrl = $('#photoUrl').val();
		//invoice.dearerId = $('#dearerId').val();
		invoice.dearerId = $('#dearerId').combobox('getValue');
		invoice.proverId = $('#proverId').combobox('getValue');
	//	console.info(invoice.proverId);
		invoice.auditor1Id = $('#auditor1Id').combobox('getValue');
		invoice.auditor2Id = $('#auditor2Id').combobox('getValue');
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

		document.getElementById('tr51').style.display = 'none';
		document.getElementById('tr52').style.display = 'none';

		document.getElementById('tr71').style.display = 'none';
		document.getElementById('tr72').style.display = 'none';

		document.getElementById('tr81').style.display = 'none';
		document.getElementById('tr82').style.display = 'none';

		document.getElementById('tr91').style.display = 'none';
		document.getElementById('tr92').style.display = 'none';
		document.getElementById('tr93').style.display = 'none';

		document.getElementById('tr101').style.display = 'none';
		document.getElementById('tr102').style.display = 'none';
		document.getElementById('tr103').style.display = 'none';

		document.getElementById('tr111').style.display = 'none';

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
				<td><select onchange="switchHide(this.value)"
					id="invoiceTypeId" name="invoiceTypeId" style="width:166px;">
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
				<td>加油对象</td>
				<td><input class="easyui-validatebox" id="content21"
					name="content21" type="text" placeholder="加油对象"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr22" style="display:none">
				<td>加油升数</td>
				<td><input class="easyui-validatebox" id="content22"
					name="content22" type="text" placeholder="加油升数"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr23" style="display:none">
				<td>车辆公里数</td>
				<td><input class="easyui-validatebox" id="content23"
					name="content23" type="text" placeholder="车辆公里数"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr31" style="display:none">
				<td>天数</td>
				<td><input class="easyui-validatebox" id="content31"
					name="content31" type="text" placeholder="天数" style="width:160px;" /></td>
			</tr>
			<tr id="tr32" style="display:none">
				<td>人数</td>
				<td><input class="easyui-validatebox" id="content32"
					name="content32" type="text" placeholder="人数" style="width:160px;" /></td>
			</tr>
			<tr id="tr33" style="display:none">
				<td>住宿地点</td>
				<td><input class="easyui-validatebox" id="content33"
					name="content33" type="text" placeholder="住宿地点"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr41" style="display:none">
				<td>交通工具</td>
				<td><input class="easyui-validatebox" id="content41"
					name="content41" type="text" placeholder="交通工具"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr42" style="display:none">
				<td>起止点</td>
				<td><input class="easyui-validatebox" id="content42"
					name="content42" type="text" placeholder="起止点" style="width:160px;" /></td>
			</tr>


			<tr id="tr51" style="display:none">
				<td>修理对象</td>
				<td><input class="easyui-validatebox" id="content51"
					name="content51" type="text" placeholder="修理对象"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr52" style="display:none">
				<td>修理内容</td>
				<td><input class="easyui-validatebox" id="content52"
					name="content52" type="text" placeholder="修理内容"
					style="width:160px;" /></td>
			</tr>

			<tr id="tr71" style="display:none">
				<td>招待事由</td>
				<td><input class="easyui-validatebox" id="content71"
					name="content71" type="text" placeholder="招待事由"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr72" style="display:none">
				<td>饭店名称</td>
				<td><input class="easyui-validatebox" id="content72"
					name="content72" type="text" placeholder="饭店名称"
					style="width:160px;" /></td>
			</tr>


			<tr id="tr81" style="display:none">
				<td>票据内容</td>
				<td><input class="easyui-validatebox" id="content81"
					name="content81" type="text" placeholder="票据内容"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr82" style="display:none">
				<td>数量</td>
				<td><input class="easyui-validatebox" id="content82"
					name="content81" type="text" placeholder="数据" style="width:160px;" /></td>
			</tr>
			<tr id="tr83" style="display:none">
				<td>单价</td>
				<td><input class="easyui-validatebox" id="content83"
					name="content83" type="text" placeholder="单价" style="width:160px;" /></td>
			</tr>


			<tr id="tr91" style="display:none">
				<td>票据内容</td>
				<td><input class="easyui-validatebox" id="content91"
					name="content91" type="text" placeholder="票据内容"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr92" style="display:none">
				<td>数量</td>
				<td><input class="easyui-validatebox" id="content92"
					name="content92" type="text" placeholder="数量" style="width:160px;" /></td>
			</tr>
			<tr id="tr93" style="display:none">
				<td>单价</td>
				<td><input class="easyui-validatebox" id="content93"
					name="content93" type="text" placeholder="单价" style="width:160px;" /></td>
			</tr>

			<tr id="tr101" style="display:none">
				<td>票据内容</td>
				<td><input class="easyui-validatebox" id="content101"
					name="content101" type="text" placeholder="票据内容"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr102" style="display:none">
				<td>数量</td>
				<td><input class="easyui-validatebox" id="content102"
					name="content102" type="text" placeholder="数量" style="width:160px;" /></td>
			</tr>
			<tr id="tr103" style="display:none">
				<td>单价</td>
				<td><input class="easyui-validatebox" id="content103"
					name="content103" type="text" placeholder="单价" style="width:160px;" /></td>
			</tr>

			<tr id="tr111" style="display:none">
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="content111"
					name="content111" type="text" placeholder="费用内容"
					style="width:160px;" /></td>
			</tr>

			<tr style="display:none">
				<td>录入时间</td>
				<td><input class="easyui-validatebox" id='createDate'
					name='createDate' value="${csrqstart}"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="readonly"
					placeholder="录入时间"
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
			<tr  style="display:none">
				<td>经办人</td>
				<td><input class="easyui-validatebox" id="operatorId"
					name="operatorId" type="text" placeholder="经办人"
					 style="width:160px;"/></td>
			</tr>
			<tr>
				<td>证明人</td>
				<td>
				<select id="proverId" name="proverId" class="easyui-combobox" data-options="required:true" style="width:160px;" placeholder="证明人">
				</select>
				</td>
			</tr>
			<tr>
				<td>审核人</td>
				<td>
				<select id="auditor1Id" name="auditor1Id" class="easyui-combobox" data-options="required:true" style="width:160px;" placeholder="审核人">
				</select>
				</td>
			</tr>
			<tr>
				<td>审批人</td>
				
				<td>
				<select id="auditor2Id" name="auditor2Id" class="easyui-combobox" data-options="required:true" style="width:160px;">
				</select>
			</td>
			</tr>
			<tr>
				<td>审票人</td>
				<td>
				<select id="dearerId" name="dearerId" class="easyui-combobox" data-options="required:true" style="width:160px;">
				</select>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input class="easyui-validatebox" id="remark" name="remark"
					type="text" placeholder="备注" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
				<tr>
				<td>清单附照片</td>
				<td><input type="file" name="photoUrl" id="photoUrl" /></td>
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
