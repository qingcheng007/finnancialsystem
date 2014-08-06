<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>发票信息管理</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<sec:authentication property="principal" var="authentication" />
<script type="text/javascript" charset="utf-8">
	$(function() {
	//var test= $(authentication.id);
	//console.info(test);
	var passid=${authentication.id};
//	var passid=1;
	
		$('#admin_site_manage_dataGrid')
		.datagrid(
				{
					url : '${pageContext.request.contextPath}/invoiceController/geTPageById.do?id='+passid,
					//url : '${pageContext.request.contextPath}/invoiceController/getByPage.do',
					fit : true,
					autoRowHeight : true,
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
						title : '发票系统id',
						width : 100,
						align : 'center',
						sortable : true,
					},
					{
						field : 'createDate',
						title : '录入时间',
						width : 100,
						align : 'center',
						sortable : true
					}, {
						field : 'occurDate',
						title : '发生时间',
						width : 100,
						align : 'center',
						sortable : true
					}, {
						field : 'money',
						title : '报销金额',
						width : 80,
						align : 'center',
						sortable : true
					}, {
						field : 'description',
						title : '费用说明',
						width : 80,
						align : 'center',
						sortable : true
					}, {
						field : 'conent',
						title : '费用内容',
						width : 80,
						align : 'center',
						sortable : true
					}
					,{
						field : 'invoicetype',
						title : '发票类型',
						width : 80,
						align : 'center',
						formatter : function(value, row, index) {
							var url=row.invoiceType.name;
							return url;
						} 
					},
					{
						field : 'projectName',
						title : '工程名字',
						width : 80,
						align : 'center',
						sortable : true
					},
					{
						field : 'photourl',
						title : '图片URL',
						width : 180,
						align : 'center',
						formatter : function(value, row, index) {
							var url="${pageContext.request.contextPath}/"+row.photoUrl;
							var btn = '<img src="'+ url +'"/>';
							return btn;
						} 
					},
					{
						field : 'operatorId',
						title : '经办人',
						width : 70,
						align : 'center',
						sortable : true
					},
					{
						field : 'proverId',
						title : '证明人',
						width : 70,
						align : 'center',
						sortable : true
					},
					{
						field : 'proverState',
						title : '证明人审核状态',
						width : 100,
						align : 'center',
						formatter : function(value, row, index) {
							var url=row.auditState.prover;
									var state = null;
							
							switch(url){
							case 0: state="未审核";break;
							case 1: state="审核通过";break;
							case 2: state="审核不通过";break;
							}
							return state;
						} 
					},
					{
						field : 'auditor1Id',
						title : '审核人',
						width : 70,
						align : 'center',
						sortable : true
					},
					{
						field : 'auditor1State',
						title : '审核人审核状态',
						width : 100,
						align : 'center',
						formatter : function(value, row, index) {
							var url=row.auditState.auditor1;
									var state = null;
							
							switch(url){
							case 0: state="未审核";break;
							case 1: state="审核通过";break;
							case 2: state="审核不通过";break;
							}
							return state;
						} 
					},{
						field : 'auditor2Id',
						title : '审批人',
						width : 70,
						align : 'center',
						sortable : true
					},
					{
						field : 'auditor1State',
						title : '审批人审核状态',
						width : 100,
						align : 'center',
						formatter : function(value, row, index) {
							var url=row.auditState.auditor2;
								var state = null;
							
							switch(url){
							case 0: state="未审核";break;
							case 1: state="审核通过";break;
							case 2: state="审核不通过";break;
							}
							return state;
						}
					},
					{
						field : 'dearerId',
						title : '审票人',
						width : 70,
						align : 'center',
						sortable : true
					},
					{
						field : 'dearerState',
						title : '审票人审核状态',
						width : 100,
						align : 'center',
						formatter : function(value, row, index) {
							var url=row.auditState.dearer;
								var state = null;
							
							switch(url){
							case 0: state="未审核";break;
							case 1: state="审核通过";break;
							case 2: state="审核不通过";break;
							}
							return state;
						} 
					},
					{
						field : 'remark',
						title : '备注',
						width : 80,
						align : 'center',
						sortable : true
					}] ],
					toolbar : '#admin_site_manage_toolbar',
					onLoadSuccess : function() {
						
					},
				});
	});
	
	function add() {
		
		parent.$.modalDialog({
			title : '添加报帐目发票信息',
			width : 380,
			height : 260,
			url:'${pageContext.request.contextPath}/admin/invoice/add.jsp?'
		});
		parent.$.modalDialog.DataGrid = $('#admin_site_manage_dataGrid');
	}
		function check(id){
		console.info(id);
		parent.$.modalDialog({
			title : '查看详细信息',
			width : 800,
			height : 550,
			url:'${pageContext.request.contextPath}/admin/invoice/check.jsp?id='+id
		});
		parent.$.modalDialog.DataGrid = $('#admin_question_manage_dataGrid');
	}
	function addStudent(){
		
	}
	
	function audit() {
		var passid=2;
		var rows = $('#admin_site_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$.modalDialog({
				title : '审批发票',
				width : 380,
				//height : 260,
				url : '${pageContext.request.contextPath}/admin/invoice/audit.jsp?id='+passid
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
						url: '${pageContext.request.contextPath}/invoiceController/delete.do', 
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
				<%-- 	<sec:authorize url="/invoiceController/add.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">添加</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize> --%>
					<sec:authorize url="/invoiceController/edit.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="audit();">审批</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<sec:authorize url="/invoiceController/delete.do">
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteBatch();">批量删除</a></td>
					<td><div class="datagrid-btn-separator"></div></td>
					</sec:authorize>
					<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="refresh();">刷新</a></td>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="admin_site_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>
