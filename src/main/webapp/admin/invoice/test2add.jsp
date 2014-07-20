<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>发票信息添加</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<script type="text/javascript"src="${pageContext.request.contextPath}/jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if ($('#admin_class_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			$.ajax({
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
	function onclicked(){
	console.info("test");
	//console.info(data);
	alert("test");
	}
	function switchHide(n)
{
i=1;
if(n==1)
{
document.getElementById('tr'+i).style.display = '';
document.getElementById('tr2').style.display = 'none';
}
if(n==2)
{
document.getElementById('tr1').style.display = 'none';
document.getElementById('tr'+n).style.display = '';
}
}
//如果初始要显示第一个tr, 请在这里要加上：switchHide(1);
</script>
</head>
<body>
	<form id="admin_class_add_form">
	<input type="radio" name="s" onclick="switchHide(1)" />
	<input type="radio" name="s" onclick="switchHide(2)" />

		<table>
			<tr id="tr1" style="display:none">
<td>content1</td>
</tr>
<tr id="tr2" style="display:none">
<td>content2</td>
</tr>
		<tr><td>
		<select onchange="switchHide(this.value)">
  <option value=1>1</option>
  <option value=2>2</option>
  <option value=3>3</option>
</select> 
		</td></tr>
			<tr >
				<td>票据类型</td>
				<td><select onchange="switchHide(this.value)" id="cc"  name="dept"
					style="width:166px;" >
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
			<tr>
				<td>录入时间</td>
				<td><input class="easyui-validatebox" name='a'
					value="${csrqstart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					readonly="readonly" data-options="required:true" placeholder="请输入班级名称" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>票据发生日期</td>
				<td><input class="easyui-validatebox" name='a'
					value="${csrqstart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					readonly="readonly" data-options="required:true" placeholder="请输入班级名称" style="width:160px;" /></td>
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
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>费用说明</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>票据类型</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>所属工程</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>经办人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>证明人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审核人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>审批人</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>清单附照片</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input class="easyui-validatebox" id="name" name="name"
					type="text" placeholder="请输入班级名称" data-options="required:true" style="width:160px;" /></td>
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
