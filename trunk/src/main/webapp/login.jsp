<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>登陆</title>
<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
  $(function (){
	  $('#login_dialog').dialog({
		  modal : true,
		  buttons :[{
			  text : '登陆',
			  handler : function(){
				$.ajax({
					url:'${pageContext.request.contextPath}/login.do',
					type : 'POST',
					data:$('#login_form').serialize(),				
					cache:false,
					dataType:'json',
					success:function(data){
					     data = $.parseJSON(data);
						if(ret && ret.success==true){
							window.location.href = data.obj;
						}
						else{
							
							$('#login_error').text(data.msg);
							};
						}
				  
				});  
			  }
		  }]
	  });
  });
</script>
  
  <body>
    <div id="login_dialog" title="用户登陆" style="width:500px;height:400px">
    <form id="login_form"  >
     <table>
      <tr>
        <th>用户名</th>
        <td><input type="text" name="username"></td>
      </tr>
      <tr>
        <th>密码：</th>
        <td><input type="password" name="password"></td>
      </tr>
     </table>
     </form>
    </div>
  </body>
</html>
