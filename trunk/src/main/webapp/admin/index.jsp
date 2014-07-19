<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>管理</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	
</script>

</head>
<body class="easyui-layout">
	<div data-options="region:'north',collapsible:false,href:'layout/north.jsp'" style="height:80px;"></div>
	<div data-options="region:'south',collapsible:false,href:'../common/bottom.jsp'" style="height:30px;"></div>
	<div data-options="region:'west',title:'系统菜单',collapsible:false,href:'layout/west.jsp'" style="width:180px;"></div>
	<div data-options="region:'center',collapsible:false" style="border:0px;">
		<div id="admin_index_center_tabs" class="easyui-tabs" data-options="fit:true">
			<div title="首页" data-options="border:false" style="overflow: hidden;">这是首页</div>
		</div>
	</div>
</body>
</html>
