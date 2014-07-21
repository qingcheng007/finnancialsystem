<%@ page language="java"  pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
  <head>
   
    
    <title>SSHE DEMO</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="../../jslib/jquery-easyui-1.3.1/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../../jslib/jquery-easyui-1.3.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../jslib/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" href="../../jslib/jquery-easyui-1.3.1/themes/metro/easyui.css" type="text/css">
	<link rel="stylesheet" href="../../jslib/jquery-easyui-1.3.1/themes/icon.css" type="text/css">
	<script type="text/javascript" src="../../jslib/syUtil.js"></script>
	<script type="text/javascript">
	$(function(){

	});
	function regUser(){
	$('#index_regForm').form('submint',{
	url:'',
	success:function(data){
	console.info(data);
	}
	});
	}
	</script>
  </head>
  
  <body class="easyui-layout">
  	<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'east',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>
  <div class="easyui-dialog" data-options="title:'登录',modal:true,closable:false,buttons:[{
				text:'注册',
				iconCls:'icon-edit',
				handler:function(){
				$('#invoice_testIndex_regDialog').dialog('open');
				}
			},{
				text:'登录',
				iconCls:'icon-help',
				handler:function(){}
			}]">
  <table>
  <tr>
  <th>登录名：</th>
  <td><input/></td>
  <tr>
  <th>密码:</th>
  <td><input/></td>
  </tr>
  </table>
  
  </div>
    <div id="invoice_testIndex_regDialog" style="width:250px" class="easyui-dialog" data-options="title:'注册',closed:true, modal:true,buttons:[{
				text:'注册',
				iconCls:'icon-edit',
				handler:function(){
					regUser();
						
				}
			}]">
			<form id="index_regForm" method="post">
  <table>
  <tr>
  <th>登录名：</th>
  <td><input name="name" class="easyui-validatebox" data-options="required:true"/></td>
  <tr>
  <th>密码:</th>
  <td><input name="pwd"type="password" class="easyui-validatebox" data-options="required:true"/></td>
  </tr>
  <tr>
  <th>重复密码:</th>
  <td><input name="repwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'eqPassword[\'#index_regForm input[name=pwd]\']'"/></td>
  </tr>
  </table>
  </form>
  </div>
  
  </body>
</html>
