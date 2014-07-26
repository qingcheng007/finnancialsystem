<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
<jsp:include page="/include/easyui.jsp"></jsp:include>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
    <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="../favicon.ico"> 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style3.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/animate-custom.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
    </head>
<script type="text/javascript" charset="utf-8">
	function submit1() {
		$.ajax({
			url : '${pageContext.request.contextPath}/login.do',
			type : 'POST',
			data : $('#login_form').serialize(),
			dataType : 'json',
			success : function(data) {   
				if (data.success) {
				window.location.href = data.obj;
				}

			},
			error : function() {
				alert("登陆失敗");
			}
		});
	}

	function reset1() {
		$('#login_form').form('clear');
	}
</script>

<script type="text/javascript" charset="utf-8">
function submit2() {

			$.ajax({
					url : '${pageContext.request.contextPath}/userController/register.do',
					type : 'POST',
					data : $('#register_form').serialize(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
								alert("添加成功");	
						}
					
					},
					error : function() {
					alert("添加失敗");
									}
				});
		}
	
	function reset2() {
		$('#register_form').form('clear');
	}
</script>
</head>
<body>
	<div class="logotop">
  <ul>
  <li><marquee direction=left><strong>欢迎登录中国通信建设第一工程局电子报账系统！</strong></marquee></li>
  </ul>
</div>  
<div class="logotit">
  <ul>
  <center><li>中国通信建设第一工程局电子报账系统</li></center>
  </ul>
</div>      
    <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                    
                        <div id="login" class="animate form">
                            <form id="login_form"  autocomplete="on"> 
                                <h1>登&nbsp;录</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > 用户名 </label>
                                    <input class="easyui-validatebox" id="username" name="username" type="text" placeholder="请输入登录名" data-options="required:true" />
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> 密&nbsp;&nbsp;&nbsp;码 </label>
                                    <input class="easyui-validatebox" id="password" name="password" type="password" maxlength="16" placeholder="请输入密码"
data-options="required:true,validType:'length[3,16]'"> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">保持帐号登录</label>
								</p>
                                <p class="loginsys"> 
                                    <a href="#" class="sty" onclick="reset1()"> 重&nbsp;&nbsp;&nbsp;置 </a> 
                                    <a id="submit" href="#" class="easyui-linkbutton" onclick="submit1()"> 登&nbsp;&nbsp;&nbsp;录 </a>
                                    
								</p>
                                <p class="change_link">
							
									<a href="#toregister" >注&nbsp;&nbsp;册</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="#" autocomplete="on"> 
                                <h1> 注&nbsp;册 </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u"> 用户名 </label>
                                    <input class="easyui-validatebox" id="username" name="username" type="text" placeholder="请输入登录名" data-options="required:true" />
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youmail" data-icon="p" > 密&nbsp;&nbsp;&nbsp;码 </label>
                                    <input class="easyui-validatebox" id="password" name="password" type="password" maxlength="16" placeholder="请输入密码" data-options="required:true,validType:'length[3,16]'"> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p"> 重复密码 </label>
                                    <input class="easyui-validatebox" id="rePassword" type="password" maxlength="16" placeholder="请再次输入密码" data-options="required:true,validType:'eqPwd[\'#register_form input[id=password]\']'" />
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="✪"> 真实姓名 </label>
                                    <input class="easyui-validatebox" id="realname" name="realname" type="text" placeholder="请输入真实姓名" data-options="required:true" />
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="T"> 电&nbsp;&nbsp;&nbsp;话 </label>
                                    <input class="easyui-validatebox" id="phone" name="phone" type="text" placeholder="请输入手机号码（选填）" />
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="e"> Email </label>
                                    <input class="easyui-validatebox" id="email" name="email" type="text" placeholder="请输入电子邮箱（选填）" data-options="validType:'email'" />
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="ID"> 上级ID </label>
                                    <input class="easyui-validatebox" id="parentId" name="parentId" type="text" placeholder="请输上级ID" />
                                </p>
                                 <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="ID"> 余额ID </label>
                                    <input class="easyui-validatebox" id="balanceId" name="balanceId" type="text" placeholder="请输余額ID" />
                                </p>
                                <p class="loginsys"> 
                                    <a href="#" class="sty" onclick="reset2()"> 重&nbsp;&nbsp;&nbsp;置 </a> 
                                    <a id="submit" href="#" class="easyui-linkbutton" onclick="submit2()"> 提&nbsp;&nbsp;&nbsp;交 </a>
                                    
								</p>
                                <p class="change_link">  
									<a href="#tologin" > 返回登录 </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div> 
</body>
</html>
