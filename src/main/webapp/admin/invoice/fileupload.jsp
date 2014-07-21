<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>jQuery Upload Image</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<!--<script type="text/javascript" src="jquery-1.6.2.min.js"></script>--> <!-- 本地jquery库-->
<script type="text/javascript" src="http://files.cnblogs.com/Zjmainstay/jquery-1.6.2.min.js"></script>
</head>
<body>
<style>
#exec_target{display:none;width:0;height:0;}
#feedback{width:1200px;margin:0 auto;}
#feedback img{float:left;width:300px;height:300px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
//选择文件成功则提交表单
$("#upload_file").change(function(){
if($("#upload_file").val() != '') $("#submit_form").submit();
});
//iframe加载响应，初始页面时也有一次，此时data为null。
$("#exec_target").load(function(){
var data = $(window.frames['exec_target'].document.body).find("textarea").html();
//若iframe携带返回数据，则显示在feedback中
if(data != null){
$("#feedback").append(data.replace(/</g,'<').replace(/>/g,'>'));
$("#upload_file").val('');
}
});
});
</script>
<form id="submit_form" method="post" action="submit_form_process.php" target="exec_target" enctype="multipart/form-data">
<input type="file" name="upload_file" id="upload_file"> <!-- 添加上传文件 -->
</form>
<iframe id="exec_target" name="exec_target"></iframe> <!-- 提交表单处理iframe框架 -->
<div id="feedback"></div> <!-- 响应返回数据容器 -->
</body>
</html>