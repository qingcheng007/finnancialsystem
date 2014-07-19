<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/include/easyui.jsps"></jsp:include>
<script type="text/javascript" charset="utf-8">
	var id = parent.$.modalDialog.id;
	$(function() {
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		$('#admin_user_grant_tree')
				.tree({
							url : '${pageContext.request.contextPath}/roleController/admin/getAllRoleTree.do',
							parentField : 'parentId',
							checkbox : true,
							onLoadSuccess : function(node, data) {
								$.ajax({
									url : '${pageContext.request.contextPath}/roleController/admin/getByUserId.do?userId='+ id,
											type : 'GET',
											success : function(data) {
												data = $.parseJSON(data);
												if (data.success) {
													for ( var i = 0; i < data.obj.length; i++) {
														var node = $('#admin_user_grant_tree').tree('find',data.obj[i].id);
														if (node) {
															var isLeaf = $('#admin_user_grant_tree').tree('isLeaf',node.target);
															if (isLeaf) {
																$('#admin_user_grant_tree').tree('check',node.target);
															}
														}
													}
												}else{
													parent.$.messager.show({
														title : '提示',
														msg : data.msg,
														timeout : 2000,
														showType : 'slide'
													});
												}
												parent.$.messager.progress('close');
											},
											error : function() {
												parent.$.messager.progress('close');
												parent.$.modalDialog.handler.dialog('close');
												parent.$.messager.show({
													title : '提示',
													msg : '获取失败！',
													timeout : 2000,
													showType : 'slide'
												});
											}
										});
							}
						});
	});

	function submit() {
		var nodes = $('#admin_user_grant_tree').tree('getChecked',
				[ 'checked', 'indeterminate' ]);
		var ids = [];
		for ( var i = 0; i < nodes.length; i++) {
			ids.push(nodes[i].id);
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/userController/admin/grant.do',
			type : 'POST',
			data :  {
				ids: ids.join(','),
				userId : id
			},
			dataType : 'json',
			success : function(data) {
				if(data.success){
					parent.$.modalDialog.handler.dialog('close');
				}
				parent.$.messager.show({
			          title:'提示',
			          msg:data.msg,
			          timeout:2000,
			          showType:'slide'
			    });
			},
			error : function() {
				parent.$.messager.show({
					title : '提示',
					msg : '提交失败！',
					timeout : 2000,
					showType : 'slide'
				});
			}
		});
	};
</script>
</head>
<body>
	<div>
		<fieldset>
			<legend>角色列表</legend>
			<ul id="admin_user_grant_tree"></ul>
		</fieldset>
	</div>
	<div>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="submit();">保存</a>
	</div>
</body>
</html>


