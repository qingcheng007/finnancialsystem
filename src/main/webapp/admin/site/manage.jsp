<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>站点管理</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('#admin_site_manage_dataGrid')
		.datagrid(
				{
					url : '${pageContext.request.contextPath}/siteController/admin/getByPage.do',
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
						width : 220,
						align : 'center',
						sortable : true
					},{
						field : 'name',
						title : '站点名称',
						width : 220,
						align : 'center',
						sortable : true
					}, {
						field : 'createDate',
						title : '建站时间',
						width : 220,
						align : 'center',
						sortable : true
					}, {
						field : 'userId',
						title : '建站人用户ID',
						width : 220,
						align : 'center',
						sortable : true
					},{
						field : 'information',
						title : '查看',
						width : 100,
						align : 'center',
						formatter : function(value, row, index) {
							var btn = '<a onclick="siteCheck()" href="javascript:void(0)">查看站点详情</a>';
							return btn;
						} 
					},{
						field : 'managerUserOfSite',
						title : '管理站点用户',
						width : 100,
						align : 'center',
						formatter : function(value, row, index) {
							var btn = '<a onclick="siteUserManange()" href="javascript:void(0)">管理站点用户</a>';
							return btn;
						} 
					}] ],
					toolbar : '#admin_site_manage_toolbar',
					onLoadSuccess : function() {
						
					},
				});
	});
	function siteCheck(){
		var rows = $('#admin_site_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog({
				title : '站点详细信息',
				width : 600,
				height : 600,
				url : '${pageContext.request.contextPath}/admin/site/check.jsp'
			});
			parent.$.modalDialog.DataGrid = $('#admin_site_manage_dataGrid');
			parent.$.modalDialog.row = rows[0];
		} else {
			if (rows.length == 0) {
				parent.$.messager.show({
					title : '提示',
					msg : '请勾选要查看的站点记录！',
					timeout : 2000,
					showType : 'slide'
				});
			} else {
				parent.$.messager.show({
					title : '提示',
					msg : '每次只能查看一个记录，请勾选一个记录！',
					timeout : 2000,
					showType : 'slide'
				});
			}
		}
	}
	function siteUserManange(){
		var rows = $('#admin_site_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog.row = rows[0];
			parent.$.modalDialog({
				title : ' 站点用户管理',
				width : 600,
				height : 400,	
				maximizable : true,
				resizable : true,
				url:'${pageContext.request.contextPath}/admin/site/siteUserManage.jsp'
			});
		} else {
			if (rows.length == 0) {
				parent.$.messager.show({
					title : '提示',
					msg : '请勾选要管理的站点！',
					timeout : 2000,
					showType : 'slide'
				});
			} else {
				parent.$.messager.show({
					title : '提示',
					msg : '每次只能管理一个站点，请勾选一个站点！',
					timeout : 2000,
					showType : 'slide'
				});
			}
		}
	}
	function add() {
		parent.$.modalDialog({
			title : '添加站点',
			width : 600,
			height : 400,
			url:'${pageContext.request.contextPath}/admin/site/add.jsp'
		});
		parent.$.modalDialog.DataGrid = $('#admin_site_manage_dataGrid');
	}
	function edit() {
		var rows = $('#admin_site_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog({
				title : '编辑站点',
				width : 380,
				height : 260,
				url : '${pageContext.request.contextPath}/admin/site/edit.jsp'
			});
			parent.$.modalDialog.DataGrid = $('#admin_site_manage_dataGrid');
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
	
	function deleteBatch(){
		var rows = $('#admin_site_manage_dataGrid').datagrid('getChecked');
		if(rows.length > 0){
			parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
				if (r) {
					var ids = [];
					for(var i=0; i<rows.length; i++)
						ids.push(rows[i].id);
					$.ajax({ 
						url: '${pageContext.request.contextPath}/siteController/admin/delete.do', 
						type: 'POST',
						data: {
							ids: ids.join(',')
						}, 
						dataType : 'json',
						success: function(data){
							parent.$.messager.show({
						           title:'提示',
						           msg: data.msg,
						           timeout:2000,
						           showType:'slide'
						    });
							$('#admin_site_manage_dataGrid').datagrid('load');
				      	},
				      	error: function(){
							parent.$.messager.show({
						           title:'提示',
						           msg:data.msg,
						           timeout:2000,
						           showType:'slide'
						    });
				      	}
					});
				}
			});
		}else{
			parent.$.messager.show({
		           title:'提示',
		           msg:'请勾选要删除的记录！',
		           timeout:2000,
		           showType:'slide'
		        });
		}
	}
	
	function refresh() {
		$('#admin_site_manage_dataGrid').datagrid('reload');
	}
</script>

</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="admin_site_manage_toolbar">
			<table>
				<tr>
					<sec:authorize url="/siteController/admin/add.do">
						<td><a href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'icon-add',plain:true" onclick="add();">添加站点</a></td>
						<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/siteController/admin/update.do">
						<td><a href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'icon-edit',plain:true" onclick="edit();">编辑站点</a></td>
						<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/siteController/admin/deleteBatch.do">
						<td><a href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'icon-remove',plain:true"
							onclick="deleteBatch();">批量删除站点</a></td>
						<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<td><a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-reload',plain:true"
						onclick="refresh();">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="admin_site_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>
