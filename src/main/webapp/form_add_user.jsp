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
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- full calendar css-->
<link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet" />
<link href="assets/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<!-- easy pie chart-->
<link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- owl carousel -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet" href="css/fullcalendar.css">
<link href="css/widgets.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<link href="css/xcharts.min.css" rel=" stylesheet">
<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
	<!-- container section start -->
	<section id="container" class=""> <header
		class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips"
			data-original-title="Toggle Navigation" data-placement="bottom"></div>
	</div>

	<!--logo start--> <a href="index" class="logo">后台 <span
		class="lite">管理</span></a> <!--logo end-->

	<div class="top-nav notification-row">
		<!-- notificatoin dropdown start-->
		<ul class="nav pull-right top-menu">
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <span class="profile-ava">
						<img alt="" src="img/avatar1_small.jpg">
				</span> <span class="username">${sessionScope.session_user.userName}</span>
					<b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<div class="log-arrow-up"></div>
					<li><a href="adminInfo"><i class="icon_profile"></i> User
							Setting </a></li>
					<li><a href="logout"><i class="icon_key_alt"></i> Log Out</a></li>
				</ul></li>
			<!-- user login dropdown end -->
		</ul>
		<!-- notificatoin dropdown end-->
	</div>
	</header> <!--header end--> <!--sidebar start--> <aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li><a class="" href="index"> <i class="icon_house_alt"></i>
					<span>主页</span>
			</a></li>
			<li class="active"><a class="" href="form_user"> <i
					class="icon_document_alt"></i> <span>用户</span>
			</a></li>
			<li><a class="" href="form_product"> <i
					class="icon_desktop"></i> <span>商品</span>
			</a></li>
			<li><a class="" href="form_dictionary"> <i
					class="icon_adjust-horiz"></i> <span>商品类目</span>
			</a></li>
			<li><a class="" href="form_order"> <i class="icon_genius"></i>
					<span>订单</span>
			</a></li>
			<!-- <li><a class="" href="form_chart"> <i class="icon_piechart"></i>
					<span>数据中心</span>
			</a></li> -->
		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <!--main content start--> <section
		id="main-content"> <section class="wrapper"> <!--overview start-->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-laptop"></i> 用户中心
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index">Home</a></li>
				<li><i class="fa fa-laptop"></i>用户添加</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			用户信息 </header>
			<div class="panel-body">
				<form class="form-horizontal " id="userform">
					<div class="form-group">
						<label class="col-sm-2 control-label">Username</label>
						<div class="col-sm-3">
							<input class="form-control" id="userName" name="userName"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Password</label>
						<div class="col-sm-3">
							<input class="form-control" id="password" name="password"
								type="password">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Phone</label>
						<div class="col-sm-3">
							<input class="form-control" id="userTel" name="userTel"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Email</label>
						<div class="col-sm-3">
							<input class="form-control" id="userEmail" name="userEmail"
								type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">个人介绍（备注）</label>
						<div class="col-sm-3">
							<input class="form-control" id="userIntroduce"
								name="userIntroduce" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Role</label>
						<div class="col-sm-3">
							<select class="form-control m-bot15" id="userRole"
								name="userRole">
								<option value="1">管理员</option>
								<option value="2">普通会员</option>
							</select>
						</div>
					</div>
				</form>
				<br>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-1" align="center">
						<button class="btn btn-primary" type="button"
							onclick="submitinfo();">提交</button>
					</div>
					<div class="col-sm-1" align="center">
						<button class="btn btn-danger" type="button" onclick="goback();">取消</button>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>

	<!-- project team & activity end --> </section> </section> <!--main content end--> </section>
	<!-- container section start -->

	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- nice scroll -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!-- charts scripts -->
	<script src="assets/jquery-knob/js/jquery.knob.js"></script>
	<script src="js/jquery.sparkline.js" type="text/javascript"></script>
	<script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script src="js/owl.carousel.js"></script>
	<!-- jQuery full calendar -->
	<
	<script src="js/fullcalendar.min.js"></script>
	<!-- Full Google Calendar - Calendar -->
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
	<!--script for this page only-->
	<script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>
	<!-- custom select -->
	<script src="js/jquery.customSelect.min.js"></script>
	<script src="assets/chart-master/Chart.js"></script>

	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<!-- custom script for this page-->
	<script src="js/sparkline-chart.js"></script>
	<script src="js/easy-pie-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
	<script src="layer/layer.js"></script>
	<script>
		//正则表达式  验证邮箱
		var reg = new RegExp(
				"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
		//正则表达式 验证数字
		var patrn = /^[0-9]*$/;
		//校验用户名是否可用
		function submitinfo() {
			if ($("#userName").val().length < 2) {
				layer.msg("用戶名最少输入两个字符！");
				return;
			} else if ($("#userName").val().length > 10) {
				layer.msg("用戶名最多输入十个字符！");
				return;
			}
			if ($("#password").val().length < 6) {
				layer.msg("密碼最少输入六个字符！");
				return;
			} else if ($("#userName").val().length > 15) {
				layer.msg("密碼最多输入十五个字符！");
				return;
			}
			if ($("#userTel").val().length < 11
					|| $("#userTel").val().length > 11
					|| !patrn.test($("#userTel").val())) {
				layer.msg("手机号码格式错误！");
				return;
			}
			if ($("#userEmail").val().length <= 2) {
				layer.msg("邮箱不可为空！");
				return;
			} else if (!reg.test($("#userEmail").val())) {
				layer.msg("邮箱格式不对，请重新输入");
				return;
			}
			$.ajax({
				url : "postUser", //提交的地址  
				type : "POST", //提交的方法
				data : $('#userform').serialize(), // 序列化表单值  
				dataType : "json",
				error : function() { //失败的话
					layer.msg("操作异常！");
				},
				success : function(data) { //成功
					if (data.code == 0) {
						window.location.href = "form_user";
					} else {
						layer.msg(data.msg);
					}
				}
			});
		}
		function goback() {
			window.history.back(-1);
		}
	</script>

</body>
</html>
