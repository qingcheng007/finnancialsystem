<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	var cls = parent.$.modalDialog.row;
	console.info(cls);
	$(function() {
		$('#invoiceTypeId').combobox('select', cls.invoiceTypeId);
		var invoiceSelect = cls.invoiceTypeId;
	
		switch(invoiceSelect)
		{
		case 1:{
		document.getElementById('tr11').style.display = '';
		document.getElementById('tr12').style.display = '';
		document.getElementById('tr13').style.display = '';
		
		$('#content11').attr('value', cls.invoiceDetails.content1);
		$('#content12').attr('value', cls.invoiceDetails.content2);
		$('#content13').attr('value', cls.invoiceDetails.content3);
		
		}break;
		case 2:{	
		document.getElementById('tr21').style.display = '';
		document.getElementById('tr22').style.display = '';
		document.getElementById('tr23').style.display = '';
		$('#content21').attr('value', cls.invoiceDetails.content1);
		$('#content22').attr('value', cls.invoiceDetails.content2);
		$('#content23').attr('value', cls.invoiceDetails.content3);
		}break;
		case 3:{	
		document.getElementById('tr31').style.display = '';
		document.getElementById('tr32').style.display = '';
		document.getElementById('tr33').style.display = '';
		$('#content31').attr('value', cls.invoiceDetails.content1);
		$('#content32').attr('value', cls.invoiceDetails.content2);
		$('#content33').attr('value', cls.invoiceDetails.content3);
		}break;
		case 4:{		
		document.getElementById('tr41').style.display = '';
		document.getElementById('tr42').style.display = '';
		$('#content41').attr('value', cls.invoiceDetails.content1);
		$('#content42').attr('value', cls.invoiceDetails.content2);
		
		}break;
		case 5:{
		document.getElementById('tr51').style.display = '';
		document.getElementById('tr52').style.display = '';
		$('#content51').attr('value', cls.invoiceDetails.content1);
		$('#content52').attr('value', cls.invoiceDetails.content2);
		
		}break;
		case 6:{}break;
		case 7:{	
		document.getElementById('tr71').style.display = '';
		document.getElementById('tr72').style.display = '';
		$('#content71').attr('value', cls.invoiceDetails.content1);
		$('#content72').attr('value', cls.invoiceDetails.content2);
		$('#content73').attr('value', cls.invoiceDetails.content3);
		}break;
		case 8:{
		document.getElementById('tr81').style.display = '';
		document.getElementById('tr82').style.display = '';
		$('#content81').attr('value', cls.invoiceDetails.content1);
		$('#content82').attr('value', cls.invoiceDetails.content2);
	

		}break;
		case 9:{		
		document.getElementById('tr91').style.display = '';
		document.getElementById('tr92').style.display = '';
		document.getElementById('tr93').style.display = '';
		$('#content91').attr('value', cls.invoiceDetails.content1);
		$('#content92').attr('value', cls.invoiceDetails.content2);
		$('#content93').attr('value', cls.invoiceDetails.content3);
		}break;
		case 10:{		
		document.getElementById('tr101').style.display = '';
		document.getElementById('tr102').style.display = '';
		document.getElementById('tr103').style.display = '';
		$('#content101').attr('value', cls.invoiceDetails.content1);
		$('#content102').attr('value', cls.invoiceDetails.content2);
		$('#content103').attr('value', cls.invoiceDetails.content3);
		}break;
		case 11:{
		document.getElementById('tr111').style.display = '';
		$('#content111').attr('value', cls.invoiceDetails.content1);
		}break;
		}
		//$('#invoiceTypeId').attr('value', cls.invoiceTypeId);
		var photoUrl='${pageContext.request.contextPath}/'+cls.photoUrl;
		$('#photoUrl').attr('src', photoUrl);
		$('#createDate').attr('value', cls.createDate);
		
		$('#occurDate').attr('value', cls.occurDate);
		$('#content').attr('value', cls.content);
		$('#money').attr('value', cls.money);
		$('#description').attr('value', cls.description);
		$('#projectName').attr('value', cls.projectName);
		$('#operatorName').attr('value', cls.operatorName);
		$('#proverName').attr('value', cls.proverName);
		$('#auditor1Name').attr('value', cls.auditor1Name);
		$('#auditor2Name').attr('value', cls.auditor2Name);
		$('#dearerName').attr('value', cls.dearerName);
		$('#remark').attr('value', cls.remark);
	});

	function closeDialog() {
		$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_invoice_check_form">
		<table border="1px">



			<tr>
				<td>票据类型</td>
				<td><select id="invoiceTypeId" disabled="disabled" class="easyui-combobox" data-options="required:true" style="width:150px;">
				
				<!-- <select id="invoiceTypeId" name="invoiceTypeId" style="width:166px;"> -->
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

			<tr id="tr11" style="display:none">
				<td>加油对象</td>
				<td><input class="easyui-validatebox" id="content11"
					name="content11" type="text" placeholder="加油对象"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr12" style="display:none">
				<td>加油升数</td>
				<td><input class="easyui-validatebox" id="content12"
					name="content12" type="text" placeholder="加油升数"
					style="width:160px;" /></td>
			</tr>
			<tr id="tr13" style="display:none">
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

			<tr>
				<td>录入时间</td>
				<td><input class="easyui-validatebox" id='createDate'
					name='createDate' readonly="readonly"
					placeholder="录入时间" style="width:160px;" /></td>
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
				<td><input class="easyui-validatebox" id="operatorName"
					name="operatorName" type="text" placeholder="经办人"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>证明人</td>
				<td><input class="easyui-validatebox" id="proverName" name="proverName"
					type="text" placeholder="证明人"
					style="width:160px;" />
				</td>
			</tr>
			<tr>
				<td>审核人</td>
				<td><input id="auditor1Name" name="auditor1Name"
					class="easyui-validatebox" data-options="required:true"
					style="width:160px;" placeholder="审核人"/>
				</td>
			</tr>
			<tr>
				<td>审批人</td>

				<td><input id="auditor2Name" name="auditor2Name"
					class="easyui-validatebox" data-options="required:true"
					style="width:160px;"/>
				</td>
			</tr>
			<tr>
				<td>审票人</td>
				<td><input id="dearerName" name="dearerName"
					class="easyui-validatebox" data-options="required:true"
					style="width:160px;"/>
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
				<td>
				<img id='photoUrl'/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
