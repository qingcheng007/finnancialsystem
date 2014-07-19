<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>角色管理</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('#admin_role_manage_dataGrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/roleController/admin/getByPage.do',
							fit : true,
							fitColumns : false,
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
								field : 'name',
								title : '角色名',
								width : 100,
								align : 'center',
								sortable : true
							} ] ],
							columns : [ [
									{
										field : 'code',
										title : '角色代号',
										width : 100,
										align : 'center',
									},
									{
										field : 'description',
										title : '描述',
										width : 200,
										align : 'center'
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 150,
										align : 'center',
									},
									{
										field : 'modifyTime',
										title : '修改时间',
										width : 150,
										align : 'center',
									},
									{
										field : 'isEnable',
										title : '角色是否可用',
										width : 80,
										align : 'center',
										formatter : function(value, row, index) {
											if (value == true)
												return '可用';
											else
												return '禁用';
										}
									},{
										field : 'action',
										title : '操作',
										width : 100,
										align : 'center',
										formatter : function(value, row, index) {
											var btn = '<a onclick="grant('
													+ row.id
													+ ')" href="javascript:void(0)">授权</a>';
											return btn;
										}
									} ] ],
							toolbar : '#admin_role_manage_toolbar',
							onLoadSuccess : function() {

							}
						});

	});

	function add() {
		parent.$.modalDialog({
			title : '添加角色',
			width : 400,
			height : 280,
			url : '${pageContext.request.contextPath}/admin/role/add.jsp'
		});
		parent.$.modalDialog.DataGrid = $('#admin_role_manage_dataGrid');
	}

	function deleteBatch() {
		var rows = $('#admin_role_manage_dataGrid').datagrid('getChecked');
		if (rows.length > 0) {
			parent.$.messager
					.confirm(
							'询问',
							'您确定要删除此记录？',
							function(r) {
								if (r) {
									var ids = [];
									for ( var i = 0; i < rows.length; i++)
										ids.push(rows[i].id);
									$.ajax({
												url : '${pageContext.request.contextPath}/roleController/admin/deleteRole.do',
												type : 'POST',
												data : {
													ids : ids.join(',')
												},
												dataType : 'json',
												success : function(data) {
													if(data.success){
														$('#admin_role_manage_dataGrid').datagrid('load');
													}
													parent.$.messager.show({
														title : '提示',
														msg : data.msg,
														timeout : 2000,
														showType : 'slide'
													});
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
		var rows = $('#admin_role_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog({
				title : '编辑用户',
				width : 450,
				height : 320,
				url : '${pageContext.request.contextPath}/admin/role/edit.jsp'
			});
			parent.$.modalDialog.DataGrid = $('#admin_role_manage_dataGrid');
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
		parent.$
				.modalDialog({
					title : '授权',
					width : 600,
					height : 500,
					url : '${pageContext.request.contextPath}/admin/role/grant.jsp',
				});
		parent.$.modalDialog.DataGrid = $('#admin_role_manage_dataGrid');
		parent.$.modalDialog.id = id;
	}

	function refresh() {
		$('#admin_role_manage_dataGrid').datagrid('reload');
	}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div id="admin_role_manage_toolbar">
			<table>
				<tr>
					<sec:authorize url="/roleController/admin/add.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">添加</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/roleController/admin/edit.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit();">编辑</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/roleController/admin/delete.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteBatch();">批量删除</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="refresh();">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false" style="overflow: hidden;">
			<table id="admin_role_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>
