<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>作业管理</title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('#admin_homework_manage_dataGrid')
		.datagrid(
				{
					url : '${pageContext.request.contextPath}/homeworkController/admin/getByPage.do',
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
						field : 'title',
						title : '标题',
						width : 170,
						align : 'center'
					}, {
						field : 'content',
						title : '内容',
						width : 260,
						align : 'center'
					}, {
						field : 'deadline',
						title : '截止日期',
						width : 200,
						align : 'center',
						sortable : true
					},{
						field : 'hasAttachment',
						title : '上传附件',
						width : 90,
						align : 'center'
					},{
						field : 'description',
						title : '备注',
						width : 200,
						align : 'center'
					} ,{
						field : 'class',
						title : '关联班级',
						width : 100,
						align : 'center'
					}] ],
					toolbar : '#admin_homework_manage_toolbar'
				});
	});
	
	function add() {
		parent.$.modalDialog({
			title : '添加作业',
			width : 520,
			height : 370,
			url:'${pageContext.request.contextPath}/admin/homework/add.jsp'
		});
		parent.$.modalDialog.DataGrid = $('#admin_homework_manage_dataGrid');
	}
	
	function addStudent(){
		
	}
	
	function edit() {
		var rows = $('#admin_homework_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog({
				title : '编辑班级',
				width : 380,
				height : 260,
				url : '${pageContext.request.contextPath}/admin/homework/edit.jsp'
			});
			parent.$.modalDialog.DataGrid = $('#admin_homework_manage_dataGrid');
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
		var rows = $('#admin_homework_manage_dataGrid').datagrid('getChecked');
		if(rows.length > 0){
			parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
				if (r) {
					var ids = [];
					for(var i=0; i<rows.length; i++)
						ids.push(rows[i].id);
					$.ajax({ 
						url: '${pageContext.request.contextPath}/homeworkController/admin/delete.do', 
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
							$('#admin_homework_manage_dataGrid').datagrid('load');
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
		$('#admin_homework_manage_dataGrid').datagrid('reload');
	}
</script>

</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="admin_homework_manage_toolbar">
			<table>
				<tr>
					<sec:authorize url="/homeworkController/admin/add.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">添加</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/homeworkController/admin/edit.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit();">编辑</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/homeworkController/admin/delete.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteBatch();">批量删除</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="refresh();">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="admin_homework_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>

</html>
