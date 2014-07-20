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
						data : $('#admin_class_add_form').serializeObject(),
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
		$('#admin_role_add_form').form('clear');
	}
	function onclicked() {
		console.info("test");
		//console.info(data);
		alert("test");
	}
	function switchHide(n) {

		j = 1;
		alert(n);
		i = 1;
		for (; j < 12; j++) {
			alert(j);
			i = 1;
			for (; i <= 3; i++) {
				alert("tr" + j + i);
				document.getElementById("tr" + j + i).style.diaplay = 'none';
			}
		}
		for (; i <= 3; i++)
			document.getElementById("tr" + n + i).style.display = '';

		//if (n == 1) {
		//	document.getElementById('tr1').style.display = '';
		//	document.getElementById('tr2').style.display = 'none';
		//}
		//if (n == 2) {
		//	document.getElementById('tr1').style.display = 'none';
		//	document.getElementById('tr2').style.display = '';
		//}
	}
	//如果初始要显示第一个tr, 请在这里要加上：switchHide(1);
</script>
</head>
<body>
	<form id="admin_class_add_form">

		<table>
			<tr>
				<td>票据类型</td>
				<td><select onchange="switchHide(this.value)" id="cc"
					name="dept" style="width:166px;">
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
<td>content1</td>
</tr>
<tr id="tr2" style="display:none">
<td>content2</td>
</tr>
			<tr id="tr11">
				<td>1content1</td>
			</tr>
			<tr id="tr12">
				<td>content2</td>
			</tr>
			<tr id="tr13">
				<td>content2</td>
			</tr>
			<tr id="tr21" style="display:none">
				<td>2content2</td>
			</tr>
			<tr id="tr22" style="display:none">
				<td>content2</td>
			</tr>
			<tr id="tr23" style="display:none">
				<td>content2</td>
			</tr>

			<tr id="tr31" style="display:none">
				<td>3content2</td>
			</tr>
			<tr id="tr32" style="display:none">
				<td>content2</td>
			</tr>
			<tr id="tr33" style="display:none">
				<td>content2</td>
			</tr>

			<tr id="tr41" style="display:none">
				<td>4content2</td>
			</tr>
			<tr id="tr42" style="display:none">
				<td>content2</td>
			</tr>
			<tr id="tr43" style="display:none">
				<td>content2</td>
			</tr>

			<tr id="tr51" style="display:none">
				<td>5content2</td>
			</tr>
			<tr id="tr52" style="display:none">
				<td>content2</td>
			</tr>

			<tr id="tr61" style="display:none">
				<td>6content2</td>
			</tr>
			<tr id="tr62" style="display:none">
				<td>content2</td>
			</tr>


			<tr id="tr81" style="display:none">
				<td>8content2</td>
			</tr>
			<tr id="tr82" style="display:none">
				<td>content2</td>
			</tr>


			<tr id="tr91" style="display:none">
				<td>9content2</td>
			</tr>
			<tr id="tr92" style="display:none">
				<td>content2</td>
			</tr>
			<tr id="tr93" style="display:none">
				<td>content2</td>
			</tr>

			<tr id="tr101" style="display:none">
				<td>10content2</td>
			</tr>
			<tr id="tr102" style="display:none">
				<td>content2</td>
			</tr>
			<tr id="tr103" style="display:none">
				<td>content2</td>
			</tr>

			<tr id="tr111" style="display:none">
				<td>11content2</td>
			</tr>
			<tr id="tr112" style="display:none">
				<td>content2</td>
			</tr>
			<tr id="tr113" style="display:none">
				<td>content2</td>
			</tr>


			<tr>
				<td>录入时间</td>
				<td><input class="easyui-validatebox" name='a'
					value="${csrqstart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					readonly="readonly" data-options="required:true"
					placeholder="请输入班级名称" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>票据发生日期</td>
				<td><input class="easyui-validatebox" name='a'
					value="${csrqstart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					readonly="readonly" data-options="required:true"
					placeholder="请输入班级名称" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>费用内容</td>
				<td><input class="easyui-validatebox" id="specialty"
					name="specialty" type="text" placeholder="请输入专业"
					data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>金额</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>费用说明</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>票据类型</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>所属工程</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>经办人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>证明人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审核人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审批人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>清单附照片</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
					style="width:160px;" /></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true"
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
