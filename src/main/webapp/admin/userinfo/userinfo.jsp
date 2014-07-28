<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>用户管理</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<sec:authentication property="principal" var="authentication" />
<script type="text/javascript"
	src="../../jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"
	charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
	var canGrant = false;
</script>
<sec:authentication property="principal.id" var="currentUserId" />
<sec:authorize url="/userController/admin/grant.do">
	<script type="text/javascript" charset="utf-8">
		canGrant = true;
	</script>
</sec:authorize>
<script type="text/javascript" charset="utf-8">
		var u_id=${authentication.id};
	
	$(function() {
		$('#admin_user_manage_dataGrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/userController/admin/geetById.do?id='+u_id,
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
							}, {
								field : 'username',
								title : '账号',
								width : 100,
								align : 'center',
								sortable : true
							} ] ],
							columns : [ [
									{
										field : 'id',
										title : 'id',
										width : 0,
										align : 'center',
										hidden : true,
									},
									{
										field : 'realname',
										title : '真实姓名',
										width : 100,
										align : 'center',
										sortable : true
									},
									{
										field : 'phone',
										title : '电话',
										width : 130,
										align : 'center'
									},
									{
										field : 'email',
										title : '电子邮箱',
										width : 130,
										align : 'center'
									},
									{
										field : 'lastLoginDate',
										title : '上次登录时间',
										width : 150,
										align : 'center',
										sortable : true
									},
									{
										field : 'lastLoginIp',
										title : '上次登录IP',
										width : 100,
										align : 'center'
									},
									{
										field : 'createDate',
										title : '创建时间',
										width : 150,
										align : 'center',
										sortable : true
									},
									{
										field : 'createIp',
										title : '创建IP',
										width : 100,
										align : 'center'
									},
									{
										field : 'available',
										title : '可用余额',
										width : 70,
										align : 'center',
										formatter : function(value, row, index) {
											var str = '';
											for ( var i = 0; i < row.balance.length; i++) {
                                            
												str += row.balance[i].available+ '<br/>';
											}
											return str;
										}
									},
									{
										field : 'frozen',
										title : '冻结余额',
										width : 70,
										align : 'center',
										formatter : function(value, row, index) {
											var str = '';
											for ( var i = 0; i < row.balance.length; i++) {
                                            
												str += row.balance[i].frozen+ '<br/>';
											}
											return str;
										}
									},
									{
										field : 'isEnable',
										title : '账号是否可用',
										width : 80,
										align : 'center',
										formatter : function(value, row, index) {
											if (value)
												return '可用';
											else
												return '禁用';
										}
									},
							 ] ],
							toolbar : '#admin_user_manage_toolbar',
							onLoadSuccess : function() {

							},
						});
	});

	function add() {
		parent.$.modalDialog({
			title : '添加用户',
			width : 500,
			height : 340,
			url : '${pageContext.request.contextPath}/admin/user/add.jsp'
		});
		parent.$.modalDialog.DataGrid = $('#admin_user_manage_dataGrid');
	}

	function deleteBatch() {
		var rows = $('#admin_user_manage_dataGrid').datagrid('getChecked');
		if (rows.length > 0) {
			parent.$.messager
					.confirm(
							'询问',
							'您确定要删除此记录？',
							function(r) {
								if (r) {
									var ids = [];
									var currentUserId = $
									{
										currentUserId
									}
									;
									for ( var i = 0; i < rows.length; i++) {
										if (rows[i].id == currentUserId) {
											parent.$.messager.show({
												title : '提示',
												msg : '不可以删除自己！',
												timeout : 2000,
												showType : 'slide'
											});
											return;
										}
										ids.push(rows[i].id);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/userController/admin/delete.do',
												type : 'POST',
												data : {
													ids : ids.join(',')
												},
												dataType : 'json',
												success : function(data) {
													parent.$.messager.show({
														title : '提示',
														msg : data.msg,
														timeout : 2000,
														showType : 'slide'
													});
													$(
															'#admin_user_manage_dataGrid')
															.datagrid('load');
												},
												error : function() {
													parent.$.messager.show({
														title : '提示',
														msg : data.msg,
														timeout : 2000,
														showType : 'slide'
													});
												}
											});
								}
							});
		} else {
			parent.$.messager.show({
				title : '提示',
				msg : '请勾选要删除的记录！',
				timeout : 2000,
				showType : 'slide'
			});
		}
	}

	function edit() {
		var rows = $('#admin_user_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog({
				title : '编辑用户',
				width : 470,
				height : 330,
				url : '${pageContext.request.contextPath}/admin/userinfo/edit.jsp'
			});
			parent.$.modalDialog.DataGrid = $('#admin_user_manage_dataGrid');
			parent.$.modalDialog.row = rows[0];
		} else {
			if (rows.length == 0) {
				parent.$.messager.show({
					title : '提示',
					msg : '请勾选要编辑的记录！',
					timeout : 2000,
					showType : 'slide'
				});
			} else {
				parent.$.messager.show({
					title : '提示',
					msg : '每次只能编辑一个记录，请勾选一个记录！',
					timeout : 2000,
					showType : 'slide'
				});
			}
		}
	}

	function grant(id) {
		parent.$.modalDialog({
			title : '授权',
			width : 400,
			height : 300,
			url : '${pageContext.request.contextPath}/admin/user/grant.jsp',
		});
		parent.$.modalDialog.DataGrid = $('#admin_user_manage_dataGrid');
		parent.$.modalDialog.id = id;
	}

	function refresh() {
		$('#admin_user_manage_dataGrid').datagrid('reload');
	}

	function searchFun() {
		$('#admin_user_manage_dataGrid').datagrid('load',
				$('#admin_user_manage_searchForm').serializeObject());
	}

	function resetSearch() {
		$(':input', '#admin_user_manage_searchForm').val('');
		$('#admin_user_manage_dataGrid').datagrid('load', {});
	}
</script>

</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="admin_user_manage_toolbar">
			<table>
				<tr>
					
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								
									<td><a href="javascript:void(0);"
										class="easyui-linkbutton"
										data-options="iconCls:'icon-edit',plain:true"
										onclick="edit();">编辑</a></td>
									<td><div class="datagrid-btn-separator"></div></td>
							
								
								<td><a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'icon-reload',plain:true"
									onclick="refresh();">刷新</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="admin_user_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>
