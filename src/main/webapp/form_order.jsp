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
<style>
* {
	padding: 0;
	margin: 0;
}
/*
			  * 外面盒子样式---自己定义
			  */
.page_div {
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 15px;
	font-family: "microsoft yahei";
	color: #666666;
	margin-right: 10px;
	padding-left: 20px;
	box-sizing: border-box;
}
/*
			 * 页数按钮样式
			 */
.page_div a {
	min-width: 30px;
	height: 28px;
	border: 1px solid #dce0e0 !important;
	text-align: center;
	margin: 0 4px;
	cursor: pointer;
	line-height: 28px;
	color: #666666;
	font-size: 13px;
	display: inline-block;
}

#firstPage, #lastPage {
	width: 50px;
	color: #0073A9;
	border: 1px solid #0073A9 !important;
}

#prePage, #nextPage {
	width: 70px;
	color: #0073A9;
	border: 1px solid #0073A9 !important;
}

.page_div .current {
	background-color: #0073A9;
	border-color: #0073A9;
	color: #FFFFFF;
}

.totalPages {
	margin: 0 10px;
}

.totalPages span, .totalSize span {
	color: #0073A9;
	margin: 0 5px;
}
</style>

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
			<li class="active"><a class="" href="form_order"> <i
					class="icon_genius"></i> <span>订单</span>
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
				<i class="fa fa-laptop"></i> 订单中心
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index">Home</a></li>
				<li><i class="fa fa-laptop"></i>订单列表</li>
			</ol>
		</div>
	</div>

	<div align="left">
		<input class="form-inline col-lg-2" id="searchOrderStr"
			name="searchOrderStr" placeholder="订单号搜索" type="text"> <a
			class="btn btn-danger btn-sm" href="javascript:void(0)"
			onclick="searchOrder();">搜索</a> <a class="btn btn-danger btn-sm"
			href="javascript:void(0)" onclick="editOrder();">订单受理</a>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<input type="hidden" id="data_info" name="data_info"
				value="${data.msg }">
			<section class="panel"> <header class="panel-heading">
			订单——列表 </header>
			<table id="OrderTable"
				class="table table-striped table-advance table-hover">
				<thead>
					<tr>
						<th><label> <input type="checkbox" id="ifAll"
								onclick="checkAll()" /> <span class="lbl"></span>
						</label></th>
						<th><i class="icon_bag"></i> 订单编号</th>
						<th><i class="icon_profile"></i> 用户名称</th>
						<th><i class="icon_archive"></i> 订单详情</th>
						<th><i class="icon_calendar"></i> 下单时间</th>
						<th><i class="icon_building"></i> 状态</th>
						<th><i class="icon_briefcase"></i> 订单进度</th>
					</tr>
				</thead>
				<tbody id="OrderTableData">

				</tbody>
			</table>
			<div value="1 0"></div>
			<div id="page" class="page_div"></div>
			</section>
		</div>
	</div>

	<!-- project team & activity end --> </section> </section> <!--main content end--> </section>
	<!-- container section start -->

	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/paging.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
		ajaxTest(1, '');

		function ajaxTest(num, str) {
			var datainfo = document.getElementById("data_info");
			if (datainfo.value.length > 0) {
				layer.msg(datainfo.value);
			}
			str = $("#searchOrderStr").val();
			$
					.ajax({
						url : "OrderData?searchOrderStr=" + str + "&page="
								+ num,
						type : "get",
						dataType : "json",
						success : function(data) {
							var tablehtml = "";
							for (var i = 0; i < data.data.data.length; i++) {
								var orders = data.data.data[i];
								tablehtml += "<tr><td><label><input type='checkbox' name='selectFlag' id='checkbox' value='"+orders.orderId+"'/>"
										+ "<span class='lbl'></span></label></td><td>"
										+ orders.orderId
										+ "</td><td>"
										+ orders.userName
										+ "</td>"
										+ "<td>"
										+ "<a href=javascript:void(0); onclick='findorderInfo("
										+ orders.orderId
										+ ");'>查看</a>"
										+ "</td><td>"
										+ timeStamp2String(orders.createDate)
										+ "</td>"
										+ "<td>"
										+ checkStatus(orders.isAccept)
										+ "</td>"
										+ "<td>"
										+ checkType(orders.orderType)
										+ "</td></tr>";
							}
							document.getElementById("OrderTableData").innerHTML = tablehtml;
							//分页
							$("#page").paging({
								pageNo : num, //当前页
								totalPage : data.data.totalPage, //共多少页
								totalSize : data.data.totalSize, //共多少条记录
								callback : function(num) {
									ajaxTest(num);
								}
							})
						},
						error : function() {
							layer.msg("操作异常！");
						}
					})
		}

		function checkType(del) {
			if (del == 0) {
				return "未完成";
			} else if (del == 1) {
				return "已完成";
			} else {
				return "已取消";
			}
		}
		function checkStatus(isAccept) {
			if (isAccept == 0) {
				return "未受理";
			} else {
				return "已受理";
			}
		}
		function timeStamp2String(time) {
			var datetime = new Date();
			datetime.setTime(time);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1;
			var date = datetime.getDate();
			var hour = datetime.getHours();
			var minute = datetime.getMinutes();
			var second = datetime.getSeconds();
			return year + "-" + month + "-" + date + " " + hour + ":" + minute
					+ ":" + second;
		};
		//全选
		function checkAll() {
			var selectFlags = document.getElementsByName("selectFlag");
			for (var i = 0; i < selectFlags.length; i++) {
				selectFlags[i].checked = document.getElementById("ifAll").checked;
			}
		};

		$(function() {
			$("#searchOrderStr").keydown(function(e) {
				if (e.keyCode === 13) {
					searchOrder();
				}
			});
		});
		//搜索
		function searchOrder() {
			var searchOrderStr = $("#searchOrderStr").val();
			ajaxTest(1, searchOrderStr);
		}

		//订单处理
		function editOrder() {
			var selectFlags = document.getElementsByName("selectFlag");
			//计数器
			var count = 0;
			//记录选中的checkbox索引号
			var index = [];
			for (var i = 0; i < selectFlags.length; i++) {
				if (selectFlags[i].checked) {
					//记录选中的checkbox
					count++;
					index.push(selectFlags[i].getAttribute("value"));
				}
			}
			if (count === 0) {
				layer.msg("请选择要处理的数据！");
				return;
			}
			//删除
			$.ajax({
				url : "editOrder?selectFlags=" + index,
				type : "get",
				dataType : "json",
				success : function(data) {
					if (data.code == 0) {
						layer.msg(data.data_info);
						window.location.href = "form_order";
					} else {
						layer.msg(data.data_info);
					}
				},
				error : function() {
					layer.msg("操作异常");
				}
			});
		}
		//查看订单详情
		function findorderInfo(num) {
			window.location.href = "findOrderInfo?orderid=" + num;
		}
	</script>

</body>
</html>
