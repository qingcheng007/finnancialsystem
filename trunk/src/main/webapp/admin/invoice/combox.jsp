<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'combox.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript">  
function change(){       
    var departmentCode =$("#department").val();    
        
    var params = {    
        'departmentCode':departmentCode    
    };    
    $.ajax({  
        type: 'get',  
      	url:'${pageContext.request.contextPath}/userController/admin/getAll.do',  
        cache: false,  
        data: params,  
        dataType: 'json',  
        success: function(row){  
         var sel2 = $("#workorderOperator");    
         sel2.empty();    
         if(data==null)  
             {  
             sel2.append("<option value = '-1'>"+"部门人员为空"+"</option>");  
             }  
         var items=row.list;  
         if(items!=null)  
            {  
              for(var i =0;i<items.length;i++)  
              {  
               var item=items[i];  
               sel2.append("<option value = '"+item.id+"'>"+item.username+"</option>");  
              };  
             }       
         else  
             {  
             sel2.empty();    
             }  
        },  
        error: function(){  
            return;  
        }  
    });  
    //$.post(url, params, callback);    
}    

</script> 
  </head>
  
  <body>
<div class="forntName">部门</div>  
    <div class="inpBox">  
    <select  name="department" id="department"  onchange="change();" style="width:200px;" >  
    <option value='-1'>请选择</option>  
    <s:iterator value="departmentList">  
        <option value='<s:property value="departmentCode"/>'><s:property value="departmentName"/></option>  
    </s:iterator>  
    <select>    
    </div>  
<span style="white-space:pre">  </span><div class="forntName">人员</div>  
    <div class="inpBox">  
    <select name="workorderOperator" id = "workorderOperator" style="width:200px;">  
                              
    <s:iterator value="userList">  
        <option value='<s:property value="userName"/>'><s:property value="userName"/></option>  
    </s:iterator>  
    </select>  
    </div>  
</body>
  </body>
</html>
