<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	var user = parent.$.modalDialog.row;
	$(function() {
		$('#class').combobox({
		    url:'${pageContext.request.contextPath}/classController/admin/getAll.do',
		    valueField:'id',
		    textField:'name',
		    mode:'remote',
		    method:'get', 
		    panelHeight:'auto',
		    editable:false,
		    formatter: function(row){
	            row.name = row.college
				+ ' '
				+ row.year
				+ ' '
				+ row.specialty
				+ ' '
				+ row.name;
	    		return row.name;
			},
			onSelect:function(row){
				$(this).combobox('textbox').tooltip({
					position:'top',
				    content: '<span style="color:#fff">'+row.name+'</span>',
				    onShow: function(){
				        $(this).tooltip('tip').css({
				            backgroundColor: '#666',
				            borderColor: '#666'
				        });
				    }
				});
			},
			onLoadSuccess:function(){
				if(user.classId>0)
		    		$('#class').combobox('select', user.classId);
		    }
		});
		
		$('#id').attr('value', user.id);
		$('#password').attr('value', user.password);
		$('#username').attr('value', user.username);
		$('#realname').attr('value', user.realname);
		$('#phone').attr('value', user.phone);
		$('#email').attr('value', user.email);
	});

	function submit() {
		if($('#admin_user_add_form').form('validate')){
			$('#submit').linkbutton('disable');
			$.ajax({
					url : '${pageContext.request.contextPath}/userController/admin/edit.do',
					type : 'POST',
					data : $('#admin_user_edit_form').serializeObject(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							parent.$.modalDialog.DataGrid.datagrid('updateRow',
									{
										index : parent.$.modalDialog.DataGrid
												.datagrid('getRowIndex', user),
										row : {
											realname : data.obj.realname,
											phone : data.obj.phone,
											email : data.obj.email,
											classId : data.obj.classId,
										}
									});
							parent.$.modalDialog.handler.dialog('close');
							parent.$('#admin_user_addUser_form').form('clear');
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
	function closeDialog() {
		parent.$.modalDialog.handler.dialog('close');
	}
</script>
</head>
<body>
	<form id="admin_user_edit_form">
		<table>
			<tr>
				<td><input id="id" name="id" type="hidden"></input></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input id="username" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox" id="password" name="password" type="password" placeholder="请输入密码" data-options="required:true"></input></td>
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
				<td>所属班级（选填）</td>
				<td><select id="class" name="classId" class="easyui-combobox" data-options="required:true" style="width:150px;">
				</select></td>
			<tr>
				<td colspan='2' style="text-align: center;"><a id="submit" href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a href="#" class="easyui-linkbutton" onclick="submit()">保存修改</a></td>
			</tr>
		</table>
	</form>
</body>
</html>