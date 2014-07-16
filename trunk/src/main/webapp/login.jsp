<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>登陆</title>
<jsp:include page="bootstrapInc.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/bootstrapvalidator-dist-0.4.4/dist/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/bootstrapvalidator-dist-0.4.4/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('#login_form').bootstrapValidator({
			message : '不能为空！',
			submitHandler : function(validator, form, submitButton) {
				$.ajax({
					url : '${pageContext.request.contextPath}/login.jsp',
					type : 'POST',
					data : {
						username : $('#login_username').val(),
						password : $('#login_password').val()
					},
					success : function(data) {
						data = $.parseJSON(data);
						if (data.success)
							window.location.href = data.obj;
						else
							$('#login_error').text(data.msg);
					},
					error : function() {
						$('#login_error').text('登录失败！');
					}
				});
			},
			fields : {
				account : {
					validators : {
						notEmpty : {
							message : '账号不能为空！'
						}
					}
				},
				password : {
					validators : {
						notEmpty : {
							message : '密码不能为空！'
						}
					}
				},
			}
		}).find('button[data-toggle]').on(
				'click',
				function() {
					var $target = $($(this).attr('data-toggle'));
					// Show or hide the additional fields
					// They will or will not be validated based on their visibilities
					$target.toggle();
					if (!$target.is(':visible')) {
						// Enable the submit buttons in case additional fields are not valid
						$('#togglingForm').data('bootstrapValidator')
								.disableSubmitButtons(false);
					}
				});
	});
</script>
</head>
<body>
	<div style="margin:50px auto 0;">
		<form id="login_form" class="form-horizontal">
			<div class="form-group">
				<label class="col-lg-3 control-label">账号</label>
				<div class="col-lg-3">
					<input id="login_username" type="text" class="form-control" name="account" placeholder="用户名" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label">密码 </label>
				<div class="col-lg-3">
					<input id="login_password" type="password" class="form-control" name="password" placeholder="输入密码" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-9 col-lg-offset-3">
					<button type="submit" class="btn btn-primary">登录</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-9 col-lg-offset-3">
					<span id="login_error" style="color: #FF0000;"></span>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
