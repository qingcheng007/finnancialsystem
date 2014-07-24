<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>站点用户管理</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
    var cls = parent.$.modalDialog.row;
    var siteId = cls.id;
	$(function(){
		$('#admin_siteUser_manage_dataGrid')
		.datagrid(
				{
					url : '${pageContext.request.contextPath}/siteController/admin/getUserInformationOfOneSiteByPage.do?siteId='+siteId,
					fit : true,
					autoRowHeight : false,
					striped : true,
					border : false,
					pagination : true,
					pageSize : 10,
					pageList : [ 10, 20, 30, 40, 50 ],
					sortName : 'id',
					sortOrder : 'asc',
					singleSelect : false,
					checkOnSelect : false,
					selectOnCheck : true,
					nowrap : false,
					rownumbers : true,
					loadMsg : '正在加载，请稍后...',
					frozenColumns : [ [ {
						field : 'ck',
						checkbox : true
					} ] ], 
					columns : [ [ 	             
					{
						field : 'id',
						title : '站点编号',
						width : 260,
						align : 'center',
						sortable : true
					},{
						field : 'userID',
						title : '用户ID',
						width : 260,
						align : 'center',
						sortable : true,
						formatter : function(value,row,index){
							var str = '';
							for(var i=0;i<row.users.length;i++){
								var temp = i+ 1;
								str += '<front color="#FF0000"> ID'
								+ temp
								+': </front>'
								+row.users[i].id
								+'<br/>';
							}
							return str;
						}
					},{
						field : 'userName',
						title : '用户名',
						width : 260,
						align : 'center',
						formatter : function(value,row,index){
							var str = '';
							for(var i=0;i<row.users.length;i++){
								var temp = i+ 1;
								str += '<front color="#FF0000"> 用户名'
								+ temp
								+': </front>'
								+row.users[i].username
								+'<br/>';
							}
							return str;
						}
					},{
						field : 'realName',
						title : '真实姓名',
						width : 260,
						align : 'center',
						formatter : function(value,row,index){
							var str = '';
							for(var i=0;i<row.users.length;i++){
								var temp = i+ 1;
								str += '<front color="#FF0000"> 姓名'
								+ temp
								+': </front>'
								+row.users[i].realname
								+'<br/>';
							}
							return str;
						}
					},{
						field : 'phone',
						title : '联系电话',
						width : 260,
						align : 'center',
						formatter : function(value,row,index){
							var str = '';
							for(var i=0;i<row.users.length;i++){
								var temp = i+ 1;
								str += '<front color="#FF0000"> 电话'
								+ temp
								+': </front>'
								+row.users[i].phone
								+'<br/>';
							}
							return str;
						}
					},{
						field : 'email',
						title : '邮箱',
						width : 260,
						align : 'center',
						formatter : function(value,row,index){
							var str = '';
							for(var i=0;i<row.users.length;i++){
								var temp = i+ 1;
								str += '<front color="#FF0000"> Email'
								+ temp
								+': </front>'
								+row.users[i].email
								+'<br/>';
							}
							return str;
						}
					},{
						field : 'postName',
						title : '职务',
						width : 260,
						align : 'center',
						formatter : function(value,row,index){
							var str = '';
							for(var i=0;i<row.posts.length;i++){
								var temp = i+ 1;
								str += '<front color="#FF0000"> 职务'
								+ temp
								+': </front>'
								+row.posts[i].name
								+'<br/>';
							}
							return str;
						}
					}] ],
					toolbar : '#admin_siteUser_manage_toolbar'
				});
	});
	
	function add() {
		window.showModalDialog('${pageContext.request.contextPath}/admin/site/addUser.jsp',window,"dialogWidth:400px;dialogHeight:300px;location:no;center:yes;status:no;menubar:no");
	}

	function deleteBatch(){
		//window.open('${pageContext.request.contextPath}/admin/site/deleteUser.jsp','location=no');
		window.showModalDialog('${pageContext.request.contextPath}/admin/site/deleteUser.jsp',window,"dialogWidth:400px;dialogHeight:300px;location:no;center:yes;status:no;menubar:no");
	}
	
	function refresh() {
		$('#admin_siteUser_manage_dataGrid').datagrid('reload');
	}
</script>

</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="admin_siteUser_manage_toolbar">
			<table>
				<tr>
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">向站点添加用户</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteBatch();">从站点中删除用户</a></td>					
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="refresh();">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="admin_siteUser_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>
