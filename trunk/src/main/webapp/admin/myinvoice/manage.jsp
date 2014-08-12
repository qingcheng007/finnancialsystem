<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>发票信息管理</title>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<script type="text/javascript"
	src="../../jslib/My97DatePicker4.8b3/My97DatePicker/WdatePicker.js"
	charset="utf-8"></script>
<sec:authentication property="principal" var="authentication" />

<script type="text/javascript" charset="utf-8">
	$(function() {
		var passid = ${authentication.id};
		$('#admin_invoice_manage_dataGrid')
				.datagrid(
						{
							//url : '${pageContext.request.contextPath}/invoiceController/getByPage.do',
							//url : '${pageContext.request.contextPath}/invoiceController/getByPageByCurrentId.do?id='+ passid,
							
							url : '${pageContext.request.contextPath}/invoiceController/myInvoice/getMyInvoice.do',
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
									},
									{
										field : 'occurDate',
										title : '发生时间',
										width : 100,
										align : 'center',
										sortable : true
									},
									{
										field : 'money',
										title : '报销金额',
										width : 80,
										align : 'center',
										sortable : true
									},
									{
										field : 'description',
										title : '费用说明',
										width : 80,
										align : 'center',
										sortable : true
									},
									{
										field : 'content',
										title : '费用内容',
										width : 80,
										align : 'center',
										sortable : true
									},
									{
										field : 'invoicetype',
										title : '发票类型',
										width : 80,
										align : 'center',
										formatter : function(value, row, index) {
											var url = row.invoiceType.name;
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
										title : '图片',
										width : 80,
										align : 'center',
										formatter : function(value, row, index) {
											var url = "http://"+"${pageContext.request.serverName}"+"/"
													+ row.photoUrl;
											var btn = '<img src="'+ url +'"/>';
											var urlphoto = '<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" data-options=\"iconCls:\'icon-add\',plain:true\" onclick=\"showPhoto(\''
													+ url + '\');\">查看图片</a>';
											//console.info(urlphoto);
											return urlphoto;
										}
									},
									{
										field : 'operatorName',
										title : '经办人',
										width : 70,
										align : 'center',
										sortable : true
									},
									{
										field : 'proverName',
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
											var url = row.auditState.prover;
											var state = null;

											switch (url) {
											case 0:
												state = "未审核";
												break;
											case 1:
												state = "审核通过";
												break;
											case 2:
												state = "审核不通过";
												break;
											}
											return state;
										}
									},
									{
										field : 'auditor1Name',
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
											var url = row.auditState.auditor1;
											var state = null;
											switch (url) {
											case 0:
												state = "未审核";
												break;
											case 1:
												state = "审核通过";
												break;
											case 2:
												state = "审核不通过";
												break;
											}
											return state;
										}
									},
									{
										field : 'auditor2Name',
										title : '审批人',
										width : 70,
										align : 'center',
										sortable : true
									},
									{
										field : 'auditor2State',
										title : '审批人审核状态',
										width : 100,
										align : 'center',
										formatter : function(value, row, index) {
											var url = row.auditState.auditor2;
											var state = null;
											switch (url) {
											case 0:
												state = "未审核";
												break;
											case 1:
												state = "审核通过";
												break;
											case 2:
												state = "审核不通过";
												break;
											}
											return state;
										}
									},
									{
										field : 'dearerName',
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
											var url = row.auditState.dearer;
											var state = null;
											switch (url) {
											case 0:
												state = "未审核";
												break;
											case 1:
												state = "审核通过";
												break;
											case 2:
												state = "审核不通过";
												break;
											}
											return state;
										}
									}, {
										field : 'remark',
										title : '备注',
										width : 80,
										align : 'center',
										sortable : true
									} ] ],
							toolbar : '#admin_invoice_manage_toolbar',
							onLoadSuccess : function() {

							},
						});
	});

	function add() {
		parent.$.modalDialog({
			title : '添加报帐目发票信息',
			width : 430,
			height : 460,
			url : '${pageContext.request.contextPath}/admin/invoice/add.jsp'
		});
		parent.$.modalDialog.DataGrid = $('#admin_invoice_manage_dataGrid');
	}
	function showPhoto(url) {
		console.info(url);
		var urltest = "http://"+"${pageContext.request.serverName}"+"/";
		if (urltest == url) {
			$.messager.show({
				title : '提示',
				msg : '发票没有加入图片',
				timeout : 2000,
				showType : 'slide'
			});

		} else {
			parent.$
					.modalDialog({
						title : '图片详细信息',
						width : 1024,
						height : 460,
						url : '${pageContext.request.contextPath}/admin/invoice/showPhoto.jsp?url='
								+ url
					});
			parent.$.modalDialog.DataGrid = $('#admin_invoice_manage_dataGrid');
		}
	}
	function check(id) {
		console.info(id);
		parent.$
				.modalDialog({
					title : '查看详细信息',
					width : 800,
					height : 550,
					url : '${pageContext.request.contextPath}/admin/invoice/check.jsp?id='
							+ id
				});
		parent.$.modalDialog.DataGrid = $('#admin_question_manage_dataGrid');
	}
	function invoiceCheck() {
		var rows = $('#admin_invoice_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$
					.modalDialog({
						title : '发票详细信息',
						width : 600,
						height : 600,
						url : '${pageContext.request.contextPath}/admin/invoice/check.jsp'
					});
			parent.$.modalDialog.DataGrid = $('#admin_invoice_manage_dataGrid');
			parent.$.modalDialog.row = rows[0];
		} else {
			if (rows.length == 0) {
				parent.$.messager.show({
					title : '提示',
					msg : '请勾选要查看的发票记录！',
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
	function addStudent() {

	}

	function edit() {
		var rows = $('#admin_invoice_manage_dataGrid').datagrid('getChecked');
		if (rows.length == 1) {
			parent.$
					.modalDialog({
						title : '编辑发票',
						width : 380,
						height : 260,
						url : '${pageContext.request.contextPath}/admin/invoice/edit.jsp'
					});
			parent.$.modalDialog.DataGrid = $('#admin_invoice_manage_dataGrid');
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

	function deleteBatch() {
		var rows = $('#admin_invoice_manage_dataGrid').datagrid('getChecked');
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

									$
											.ajax({
												url : '${pageContext.request.contextPath}/invoiceController/delete.do',
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
															'#admin_invoice_manage_dataGrid')
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

	function refresh() {
		$('#admin_invoice_manage_dataGrid').datagrid('reload');
	}
	function searchFun() {
		$('#admin_invoice_manage_dataGrid').datagrid('load',
				$('#admin_invoice_manage_searchForm').serializeObject());
	}

	function resetSearch() {
		$(':input', '#admin_invoice_manage_searchForm').val('');
		$('#admin_invoice_manage_dataGrid').datagrid('load', {});
	}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="admin_invoice_manage_toolbar">
			<table>
				<tr>
					<td>
						<form id="admin_invoice_manage_searchForm">
							<table>
								<tr>
									<td>发票类型</td><td>
										<!-- <input name="keyword" placeholder="输入关键词" /> --> <select
										id="invoiceType" name="invoiceType" style="width:140px;">
											<option></option>
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
									</select>
									</td>

									<td>时间</td>
									<td><input class="Wdate" name="startTime"
										placeholder="点击选择时间"
										onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										style="width:133px;"readonly="readonly" />-<input class="Wdate" name="endTime"
										placeholder="点击选择时间"
										onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										style="width:133px;" readonly="readonly" /></td>
								
									<td>费用内容</td>	<td><input name="content" placeholder="输入费用内容" style="width:133px;" /></td>
								
									<td>工程名字</td>	<td><input name="projectName" placeholder="输入工程名字" style="width:133px;" /></td>
								
									
									<td rowspan="2"><a href="javascript:void(0);"
										class="easyui-linkbutton"
										data-options="iconCls:'icon-undo',plain:true"
										onclick="resetSearch();">重置</a></td>
								</tr>
								<tr>
									
								</tr>
								<tr>
									<td>证明人审核状态</td>
										<td><select id="proverState" name="proverState"
										style="width:140px;">
											<option></option>
											<option value="0">未审核</option>
											<option value="1">审核通过</option>
											<option value="2">审核不通过</option>
									</select></td>
										
									
									<td>审核人审核状态</td><td><select id="auditor1State" name="auditor1State"
										style="width:140px;">
											<option></option>
											<option value="0">未审核</option>
											<option value="1">审核通过</option>
											<option value="2">审核不通过</option>
									</select></td>
									
									<td>审批人审核状态</td><td><select id="auditor2State" name="auditor2State"
										style="width:140px;">
											<option></option>
											<option value="0">未审核</option>
											<option value="1">审核通过</option>
											<option value="2">审核不通过</option>
									</select></td>
									<td>审票人审核状态</td><td><select id="dearerState" name="dearerState"
										style="width:140px;">
											<option></option>
											<option value="0">未审核</option>
											<option value="1">审核通过</option>
											<option value="2">审核不通过</option>
									</select></td><td rowspan="2"><a href="javascript:void(0);"
										class="easyui-linkbutton"
										data-options="iconCls:'icon-search',plain:true"
										onclick="searchFun();">查找</a></td></tr>
							</table>
						</form>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<sec:authorize url="/invoiceController/add.do">
									<td><a href="javascript:void(0);"
										class="easyui-linkbutton"
										data-options="iconCls:'icon-add',plain:true" onclick="add();">添加</a></td>
									<td><div class="datagrid-btn-separator"></div></td>
								</sec:authorize>

								<sec:authorize url="/invoiceController/add.do">
									<td><a href="javascript:void(0);"
										class="easyui-linkbutton"
										data-options="iconCls:'icon-edit',plain:true"
										onclick="invoiceCheck();">查看发票详情</a></td>
									<td><div class="datagrid-btn-separator"></div></td>
								</sec:authorize>
							
								<td><a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'icon-reload',plain:true"
									onclick="refresh();">刷新</a></td>
							</tr>

						</table>
				</tr>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="admin_invoice_manage_dataGrid"></table>
		</div>
	</div>
</body>
</html>
