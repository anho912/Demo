<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>Book 后台管理</title>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<script src="js/jquery.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-img3-body">

	<div class="container">

		<form class="login-form" id="loginform">
			<div class="login-wrap">
				<p class="login-img">
					<i class="icon_lock_alt"></i>
				</p>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_profile"></i></span>
					<input type="text" name="username" id="username"
						class="form-control" placeholder="Username" autofocus>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_key_alt"></i></span>
					<input type="password" id="password" name="password"
						class="form-control" placeholder="Password">
				</div>
				<!-- <label class="checkbox"><span class="pull-right"> <a
						href="#"> 忘记密码?</a></span> </label> -->
				<button class="btn btn-primary btn-lg btn-block" type="button"
					onclick="userlogin();">登录</button>
				<!-- <button class="btn btn-info btn-lg btn-block" type="button"
					onclick="adminregister();">注册</button> -->
			</div>
		</form>

	</div>

</body>
<script src="layer/layer.js"></script>
<script type="text/javascript">
	function userlogin() {
		var username = $("#username").val().trim();
		var password = $("#password").val().trim();
		$.ajax({
			url : "userlogin",
			type : "post",
			data : {
				username : username,
				password : password
			},
			dataType : "json",
			success : function(data) {
				if (data.code == 0) {
					window.location.href = "index";
				} else {
					layer.msg(data.msg);
				}
			},
			error : function() {
				layer.msg("操作异常!");
			}
		});
	}
</script>
</html>
