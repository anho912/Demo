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
			<li><a class="" href="form_user"> <i
					class="icon_document_alt"></i> <span>用户</span>
			</a></li>
			<li><a class="" href="form_product"> <i class="icon_desktop"></i>
					<span>商品</span>
			</a></li>
			<li><a class="" href="form_dictionary"> <i
					class="icon_adjust-horiz"></i> <span>商品类目</span>
			</a></li>
			<li><a class="" href="form_order"> <i class="icon_genius"></i>
					<span>订单</span>
			</a></li>
			<li class="active"><a class="" href="form_chart"> <i
					class="icon_piechart"></i> <span>数据中心</span>
			</a></li>
		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <!--main content start--> <section
		id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="icon_piechart"></i> 数据中心
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
				<li><i class="icon_piechart"></i>数据图表</li>

			</ol>
		</div>
	</div>
	<div class="row">
		<!-- chart morris start -->
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			<h3>
				数据展示
				</Char>
			</header>
			<div class="panel-body">
				<div class="tab-pane" id="chartjs">
					<div class="row">
						<!-- Line -->
						<div class="col-lg-6">
							<section class="panel"> <header class="panel-heading">
							Line </header>
							<div class="panel-body text-center">
								<canvas id="line" height="300" width="450"></canvas>
							</div>
							</section>
						</div>
						<!-- Bar -->
						<div class="col-lg-6">
							<section class="panel"> <header class="panel-heading">
							Bar </header>
							<div class="panel-body text-center">
								<canvas id="bar" height="300" width="500"></canvas>
							</div>
							</section>
						</div>
					</div>
					<div class="row">
						<!-- Radar -->
						<div class="col-lg-6">
							<section class="panel"> <header class="panel-heading">
							Radar </header>
							<div class="panel-body text-center">
								<canvas id="radar" height="300" width="400"></canvas>
							</div>
							</section>
						</div>
						<!-- Polar Area -->
						<div class="col-lg-6">
							<section class="panel"> <header class="panel-heading">
							Polar Area </header>
							<div class="panel-body text-center">
								<canvas id="polarArea" height="300" width="400"></canvas>
							</div>
							</section>
						</div>
					</div>
					<div class="row">

						<!-- Pie -->
						<div class="col-lg-6">
							<section class="panel"> <header class="panel-heading">
							Pie </header>
							<div class="panel-body text-center">
								<canvas id="pie" height="300" width="400"></canvas>
							</div>
							</section>
						</div>
						<!-- Doughnut -->
						<div class="col-lg-6">
							<section class="panel"> <header class="panel-heading">
							Doughnut </header>
							<div class="panel-body text-center">
								<canvas id="doughnut" height="300" width="400"></canvas>
							</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	<!-- chart morris start -->
	</div>
	</section> <!--main content end--> </section>
	<!-- container section end -->
	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- nice scroll -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!-- chartjs -->
	<script src="assets/chart-master/Chart.js"></script>
	<!-- custom chart script for this page only-->
	<script src="js/chartjs-custom.js"></script>
	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
	
	</script>

</body>
</html>
