<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>发票信息添加</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/css/dialog.css"
	type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if ($('#admin_class_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			$
					.ajax({
						url : '${pageContext.request.contextPath}/invoiceController/add.do',
						type : 'POST',
						data : $('#admin_class_add_form').toJson(),
						dataType : 'json',
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
	function toJson() {
	var question = new Object();
	alert('fuck');
	if ($('#id').val() != null)
		question.id = $('#id').val();
	question.content = $('#content').val();

	var subject = new Object();
	subject.id = $('#subject').combobox('getValue');
	subject.name = $('#subject').combobox('getText');
	question.subject = subject;

	var knowledge = new Object();
	knowledge.id =	$('#knowledge').combobox('getValue');
	knowledge.content = $('#knowledge').combobox('getText');
	question.knowledge = knowledge;

	var questionType = new Object();
	questionType.id = $('#type').combobox('getValue');
	questionType.name = $('#type').combobox('getText');
	question.questionType = questionType;

	switch (parseInt($('#type').combobox('getValue'))) {
		case 1 :
			var questionOptions = new Array();
			$('#choice_option_input input').each(function() {
				var questionOption = new Object();
				questionOption.content = $(this).val();
				questionOptions.push(questionOption);
			});
			question.questionOptions = questionOptions;

			var answers1 = new Array();
			var answer1 = new Object();
			answer1.content = $('#choice_answer_input input').val();
			answers1.push(answer1);
			question.answers = answers1;
			break;
		case 2 :
			var answers2 = new Array();
			var i = 0;
			$('#fill_answer_input input').each(function() {
				var answer = new Object();
				answer.content = $(this).val();
				answer.sequence = ++i;
				answers2.push(answer);
			});
			question.answers = answers2;
			question.answerQuantity = i;
			break;
		case 3 :
			var answers3 = new Array();
			var answer3 = new Object();
			if ($('#decide_right_answer:checked').val() != null)
				answer3.content = '1';
			else
				answer3.content = '0';
			answers3.push(answer3);
			question.answers = answers3;
			break;
		default :
			break;
	}
	question.categoryId = $('#category').combobox('getValue');
	if ($('#difficulty').val() == '')
		question.difficulty = 60;
	else
		question.difficulty = $('#difficulty').val();

	return JSON.stringify(question);
}
	//如果初始要显示第一个tr, 请在这里要加上：switchHide(1);
</script>
</head>
<body>
	<form id="invoice_add_form">

		<table>
			<tr>
				<td>票据类型</td>
				<td><select onchange="switchHide(this.value)" id="id" name="id"
					style="width:166px;">
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
				<td><input class="easyui-validatebox" id="auditorId1"
					name="auditorId1" type="text" placeholder="审核人"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审批人</td>
				<td><input class="easyui-validatebox" id="auditorId2"
					name="auditorId2" type="text" placeholder="审批人"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>清单附照片</td>
				<td><input class="easyui-validatebox" id="photoUrl"
					name="photoUrl" type="text" placeholder="清单附照片"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input class="easyui-validatebox" id="remark" name="remark"
					type="text" placeholder="备注" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;">
				<a href="#" class="easyui-linkbutton" onclick="reset()">重置</a>
				<a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a>
				</td>
				</tr>
		</table>
	</form>
</body>
</html>
