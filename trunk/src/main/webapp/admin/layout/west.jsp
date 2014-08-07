<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" charset="utf-8">
	$(function() {
	   $('#admin_layout_west_tree')
				.tree(
						{
							url : '${pageContext.request.contextPath}/resourceController/admin/getMenuTree.do',
							lines : true,
							onClick : function(node) {
								if (node.attributes.url.indexOf('.')>0) {
									url = '${pageContext.request.contextPath}'+node.attributes.url;
									addTab({
										url : url,
										title : node.text,
										iconCls : node.iconCls
									});
								}
								if(node.state=='closed')
								{$(this).tree('expand',node.target);}
								else{  
                    $(this).tree('collapse',node.target);//点击文字关闭菜单  
                }  
							},
						});
	});
	var mainTab = $('#admin_index_center_tabs');
	function addTab(params) {
		if (mainTab.tabs('exists', params.title)) {
			mainTab.tabs('select', params.title);
		} else {
			var iframe = '<iframe src="'
					+ params.url
					+ '" frameborder="0" style="border:0;width:100%;height:98%;"></iframe>';
			var opts = {
				title : params.title,
				closable : true,
				content : iframe,
				border : false,
				fit : true,
				tools : [ {
					iconCls : 'icon-mini-refresh',
					handler : function() {
						refreshTab(params.title);
					}
				} ]
			};
			mainTab.tabs('add', opts);
		}
	}
	function refreshTab(title) {
		var tab = mainTab.tabs('getTab', title);
		mainTab.tabs('update', {
			tab : tab,
			options : tab.panel('options')
		});
	}
</script>
<div>
	<ul id="admin_layout_west_tree">

	</ul>
</div>
