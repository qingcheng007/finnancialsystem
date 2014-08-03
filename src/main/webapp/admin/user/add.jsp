<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	function submit() {
		if($('#admin_user_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/userController/admin/add.do',
					type : 'POST',
					data : $('#admin_user_add_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('insertRow',
									{
										index : 0,
										row : data.obj
									});
						parent.$.modalDialog.handler.dialog('close');
						parent.$('#admin_user_add_form').form(
										'clear');
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
					}
				});
		}
	}
	
		$(function() {
		$('#parentId').combobox({
		    url:'${pageContext.request.contextPath}/userController/admin/getAll.do',
		    valueField:'parentId',
		    textField:'realname',
		    mode:'remote',
		    method:'get', 
		    panelHeight:'auto',
		    editable:false,
		    formatter: function(row){
	            row.realname = row.id
				+ ' '
				+ row.realname;
	    		return row.realname;
			},
		});
			});
	
	function reset() {
		$('#admin_user_add_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_user_add_form">
		<table>
			<tr>
				<td>用户名</td>
				<td><input class="easyui-validatebox" id="username" name="username" type="text" placeholder="请输入登录名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox" id="password" name="password" type="password" maxlength="16" placeholder="请输入密码" data-options="required:true,validType:'length[3,16]'"></td>
			</tr>
			<tr>
				<td>重复密码</td>
				<td><input class="easyui-validatebox" id="rePassword" type="password" maxlength="16" placeholder="请再次输入密码" data-options="required:true,validType:'eqPwd[\'#admin_user_add_form input[id=password]\']'" /></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input class="easyui-validatebox" id="realname" name="realname" type="text" placeholder="请输入真实姓名" data-options="required:true" /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input class="easyui-validatebox" id="phone" name="phone" type="text" placeholder="请输入手机号码（选填）" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input class="easyui-validatebox" id="email" name="email" type="text" placeholder="请输入电子邮箱（选填）" data-options="validType:'email'" /></td>
			</tr>
			<tr>
				<td>可用余额</td>
				<td><input class="easyui-validatebox" id="available" name="available" type="text" placeholder="请输入可用余額" /></td>
			</tr>
			<tr>
				<td>冻结余额</td>
				<td><input class="easyui-validatebox" id="frozen" name="frozen" type="text" placeholder="请输入冻结余額" /></td>
			</tr>
				<tr>
				<td>上级ID</td>
				<td><select id="parentId" name="parentId" class="easyui-combobox" data-options="required:true" style="width:160px;">
				</select></td>
			</tr>
             <tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
