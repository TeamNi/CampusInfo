<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>Campus life</title>
	<%
		pageContext.setAttribute("BASE_PATH",request.getContextPath());
	%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->        
	<link href="${BASE_PATH}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="${BASE_PATH}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${BASE_PATH}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<!-- BEGIN THEME STYLES -->
	<link href="${BASE_PATH}/assets/css/pages/promo.css" rel="stylesheet" type="text/css"/>
	<link href="${BASE_PATH}/assets/css/animate.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-boxed page-full-width">
	<!-- BEGIN HEADER -->   
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner container">
			<!-- BEGIN LOGO -->
			<a class="navbar-brand" href="index">
			<font size="5" face="Comic Sans MS" color="white">Campus</font>
			<font size="5" face="Comic Sans MS" color="red">Life</font>
			</a>
			<!-- END LOGO -->
			<!-- BEGIN HORIZANTAL MENU -->
			<div class="hor-menu hidden-sm hidden-xs">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="index">首页</a>
					</li>
					<li>
						<a href="blog">校园动态</a>                       
					</li>
					<li>
						<a href="used">校园闲置</a>
					</li>
					<li>
						<a href="notification">通知与广告</a>                      
					</li>
					<c:if test="${myself.permission == 1 }">
					<li>
						<a href="notification_check">审核</a>                      
					</li>
					</c:if>
				</ul>
			</div>
			<!-- END HORIZANTAL MENU -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="${BASE_PATH}/assets/img/menu-toggler.png" alt="" />
			</a>          
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" src="${myself.headurl }" width="29px" height="29px"/>
					<span class="username"><c:out value="${myself.username }"></c:out></span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="my_info"><i class="fa fa-user"></i> My Profile</a></li>
						<li><a href="my_blog"><i class="fa fa-envelope"></i> My Dynamic </a></li>
						<li><a href="my_used"><i class="fa fa-tasks"></i> My Used </a></li>
						<li><a href="my_notification"><i class="glyphicon glyphicon-bullhorn"></i> My Notification </a></li>
						<li class="divider"></li>
						<li><a href="logout"><i class="fa fa-key"></i> Log Out</a></li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->   
	<div class="page-container">
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="promo-page">
				<!-- BEGIN PAGE CONTENT-->
				<div class="block-carousel">
					<div id="promo_carousel" class="carousel slide">
						<div class="container">
						 <h3><font face="Comic Sans MS">Welcome to Shenyang University of Chemical Technology</font></h3>
							<div class="carousel-inner">
								<c:forEach items="${advertisementlist }" var="advertisementlist">
								<div class="active item">
									<div class="row">
										<div class="col-md-7 margin-bottom-20 margin-top-20 animated rotateInUpRight">
											<h3>${advertisementlist.title }</h3>
											<p>${advertisementlist.content }</p>
											<span>发布时间：<fmt:formatDate value="${advertisementlist.createtime }" pattern="yyyy/MM/dd HH:mm"/></span><br>
										</div>
										<div class="col-md-5 animated rotateInDownLeft">
											<a href="blog"><img src="${advertisementlist.pictureurl }" alt="" class="img-responsive"></a>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="block-yellow">
				<font size="6" face="Comic Sans MS" color="green">注意啦：</font>
					<div class="container">
						<div class="row">
						<c:forEach items="${notification }" var="notification">
							<div class="col-md-4">
								<h3>${notification.title }</h3>
								<p>${notification.content }</p>
								<span>发布时间：<fmt:formatDate value="${notification.createtime }" pattern="yyyy/MM/dd HH:mm"/></span><br>
								<span>发布人：${notification.user.username }</span>
							</div>
						</c:forEach>
						</div>
					</div>
				</div>
				<div class="block-footer">
					<div class="container">
						<div class="row">
							<div class="col-md-9">
								<h3>About me</h3>
								<p>If you want to know me or any cooperation!</p><p> Please contact with E-mail : 1009409510@qq.com</p>
							</div>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- BEGIN PAGE CONTAINER-->
		</div>
	</div>
	<!-- END PAGE --> 
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="container">
			<div class="footer-inner">
				2017 &copy; 版权归倪吉龙所有.
			</div>
			<div class="footer-tools">
				<span class="go-top">
				<i class="fa fa-angle-up"></i>
				</span>
			</div>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="${BASE_PATH}/assets/plugins/excanvas.min.js"></script>
	<script src="${BASE_PATH}/assets/plugins/respond.min.js"></script>  
	<![endif]--> 
	<script src="${BASE_PATH}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="${BASE_PATH}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="${BASE_PATH}/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>      
	<script src="${BASE_PATH}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${BASE_PATH}/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="${BASE_PATH}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${BASE_PATH}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="${BASE_PATH}/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="${BASE_PATH}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<script src="${BASE_PATH}/assets/scripts/app.js"></script>      
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>