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
		//$('#invoiceTypeId').attr('value', cls.invoiceTypeId);
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
	<form id="admin_invoice_check_form">
		<table>



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
			<tr style="display:none">
				<td>经办人</td>
				<td><input class="easyui-validatebox" id="operatorId"
					name="operatorId" type="text" placeholder="经办人"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>证明人</td>
				<td><select id="proverId" name="proverId"
					class="easyui-combobox" data-options="required:true"
					style="width:160px;" placeholder="证明人">
				</select></td>
			</tr>
			<tr>
				<td>审核人</td>
				<td><select id="auditor1Id" name="auditor1Id"
					class="easyui-combobox" data-options="required:true"
					style="width:160px;" placeholder="审核人">
				</select></td>
			</tr>
			<tr>
				<td>审批人</td>

				<td><select id="auditor2Id" name="auditor2Id"
					class="easyui-combobox" data-options="required:true"
					style="width:160px;">
				</select></td>
			</tr>
			<tr>
				<td>审票人</td>
				<td><select id="dearerId" name="dearerId"
					class="easyui-combobox" data-options="required:true"
					style="width:160px;">
				</select></td>
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
					<%
						String url = request.getParameter("url");
						String showphoto = "<img src=\"" + url + "\"/>";
						out.println(showphoto);
					%>
				</td>
			</tr>










			<tr>
				<td>站点编号</td>
				<td><input id="id" name="id" type="text" style="width:300px;"
					readOnly /></td>
			</tr>
			<tr>
				<td>站点名称</td>
				<td><input id="name" name="name" type="text"
					style="width:300px;" readOnly /></td>
			</tr>
			<tr>
				<td>站点地址</td>
				<td><input id="address" name="address" type="text"
					style="width:300px;height:40px" readOnly /></td>
			</tr>
			<tr>
				<td>站点创建日期</td>
				<td><input id="createDate" name="createDate" type="text"
					style="width:300px;" readOnly /></td>
			</tr>
			<tr>
				<td>创建人ID</td>
				<td><input id="userId" name="userId" type="text"
					style="width:300px;" readOnly /></td>
			</tr>
			<tr>
				<td>创建目的</td>
				<td><input id="createPurpose" name="createPurpose" type="text"
					style="width:300px;height:80px" readOnly /></td>
			</tr>
			<tr>
				<td>工程名</td>
				<td><input id="projectName" name="projectName" type="text"
					style="width:300px;height:80px" readOnly /></td>
			</tr>
		</table>
	</form>
</body>
</html>
