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
			<li class="active"><a class="" href="form_product"> <i
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
				<i class="fa fa-laptop"></i> 商品中心
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index">Home</a></li>
				<li><i class="fa fa-laptop"></i>商品编辑</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			商品信息 </header>
			<div class="panel-body">
				<input type="hidden" id="data_info" name="data_info"
					value="${info }">
				<form class="form-horizontal" id="Productform" method="post"
					action="editProduct" onsubmit="return submitinfo();">
					<input class="form-control" id="proId" name="proId"
								type="hidden" value="${product.proId }">
					<div class="form-group">
						<label class="col-sm-2 control-label">商品名称</label>
						<div class="col-sm-3">
							<input class="form-control" id="proName" name="proName"
								type="text" value="${product.proName }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品类别</label>
						<div class="col-sm-3">
							<!-- <select class="form-control m-bot15" id="proDescription"
								name="proDescription">
							</select>  -->
							<input class="form-control" type="text"
								value="${product.proDescription}" id="proDescription"
								name="proDescription" readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品图片</label>
						<div class="col-sm-3">
							<input type="hidden" id="hidden_product_img" name="proImg"
								value="${product.proImg}" />
							<div id="product_img"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品价格</label>
						<div class="col-sm-3">
							<input class="form-control" id="proPrice" name="proPrice"
								type="text" value="${product.proPrice }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品数量</label>
						<div class="col-sm-3">
							<input class="form-control" id="proNum" name="proNum" type="text"
								value="${product.proNum }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品简介</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="proCategory"
								name="proCategory" rows="3"></textarea>
							<input type="hidden" value="${product.proCategory}"
								id="procategory" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品状态</label>
						<div class="col-sm-3">
							<select class="form-control m-bot15" id="proDel" name="proDel">
								<option id="up" name="proDel" value="1">上架</option>
								<option id="down" name="proDel" value="2">下架</option>
							</select> <input type="hidden" value="${product.proDel}" id="productDel" />
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-1" align="center">
							<button class="btn btn-primary" type="submit">提交</button>
						</div>
						<div class="col-sm-1" align="center">
							<button class="btn btn-danger" type="button" onclick="goback();">取消</button>
						</div>
					</div>
				</form>
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

	<script type="text/javascript">
		$(function() {
			var datainfo = document.getElementById("data_info");
			if (datainfo.value.length > 0) {
				layer.msg(datainfo.value);
			}

			var productDel = $('#productDel').val();
			if (productDel == 1) {
				$('#up').attr('selected', true);
			} else {
				$('#down').attr('selected', true);
			}
			var procategory = document.getElementById("procategory");
			var proCategory = document.getElementById("proCategory");
			proCategory.innerHTML = procategory.value;

			var logourl = document.getElementById("hidden_product_img").value;
			var imglogo = document.getElementById("product_img");
			imglogo.innerHTML = "<img src='upload/" + logourl + "' width='42' height='42'/>";
		});
		
		var reg = /^[0-9]+\.?[0-9]{0,9}$/;
		function submitinfo() {
			if (!reg.test($("#proPrice").val())) {
				layer.msg("价格格式不正确,输入正数！");
				return false;
			} else if ($("#proPrice").val() > 99999999) {
				layer.msg("价格最高不能超过99999999！");
				return false;
			}
			if (!reg.test($("#proNum").val())) {
				layer.msg("数量格式错误！");
				return false;
			} else if ($("#proNum").val() > 99999999 || $("#proNum").val() < 1) {
				layer.msg("数量最少为1，最多99999999！");
				return false;
			}
			if ($("#proCategory").val().length < 6) {
				layer.msg("简介最少输入六个字符！");
				return false;
			}
			return true;
		}

		function goback() {
			window.history.back(-1);
		}
	</script>
</body>
</html>
