<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>注册</title>
<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
  $(function (){
	  alert("dd");
	  $('#register_dialog').dialog({
		  modal : true,
		  buttons :[{
			  text : 'reg',
			  handler : function(){
				$.ajax({
					url:'${pageContext.request.contextPath}/userController/register.do',
					data:$('#register_form').serialize(),				
					cache:false,
					dataType:'json',
					success:function(ret){
						if(ret && ret.success==true){
							 $('#register_dialog').dialog('close');
						}else{
							$.messager.show({
								title:'ts',
								msg:ret.msg
							});
						}
					}
				});  
			  }
		  }]
	  });
  });
</script>
  
  <body>
    <div id="register_dialog" title="用户注册" style="width:500px;height:800px">
    <form id="register_form" method="post">
     <table>
      <tr>
        <th>用户名</th>
        <td><input type="text" name="username"></td>
      </tr>
      <tr>
        <th>密码：</th>
        <td><input type="password" name="password"></td>
      </tr>
            <tr>
        <th>重复密码：</th>
        <td><input type="password" name="rePassword"></td>
      </tr>
            <tr>
        <th>真实姓名：</th>
        <td><input type="text" name="realname"></td>
      </tr>
            <tr>
        <th>电话：</th>
        <td><input type="text" name="phone"></td>
      </tr>
         <tr>
        <th>email：</th>
        <td><input type="text" name="email" data-options="required:true,validType:'email'"></td>
      </tr>
     </table>
     </form>
    </div>
  </body>
</html>
