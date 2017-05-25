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
	<title>Campus Notification</title>
	<%
		pageContext.setAttribute("BASE_PATH",request.getContextPath());
	%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
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
					<li>
						<a href="index">首页</a>
					</li>
					<li>
						<a href="blog">校园动态</a>                       
					</li>
					<li>
						<a href="used">校园闲置</a>
					</li>
					<li class="active">
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
			<img src="assets/img/menu-toggler.png" alt="" />
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
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						Campus Notification <small>In here to see the activities of the campus in the near future</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							<a href="notification_issue" class="btn blue">
								<span>Issue</span><i class="fa fa-plus"></i>
							</a>
						</li>
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li><a href="notification">Notification</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<!-- notification -->
				<div class="col-md-6">
					<!-- BEGIN INLINE NOTIFICATIONS PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption"><i class="glyphicon glyphicon-flag"></i>Notifications</div>
						</div>
						<div class="portlet-body">
							<c:forEach items="${pageInfo.list }" var="notifications">
								<div class="alert alert-block alert-success fade in">
								<h4 class="alert-heading">${notifications.title }</h4>
								<p>${notifications.content }</p>
								<span>发布时间：<fmt:formatDate value="${notifications.createtime }" pattern="yyyy/MM/dd HH:mm"/></span><br>
								<span>发布人：${notifications.user.username }</span>
								</div>
							</c:forEach>
							<div class="alert alert-block alert-warning fade in">
								<!-- 分页文字信息 -->
								<div class="row">
									当前第  ${pageInfo.pageNum }  页,总  ${pageInfo.pages }  页,总  ${pageInfo.total }  条记录
								</div>
								<!-- 分页条信息 -->
								<div class="row">
									<nav aria-label="Page navigation">
									  <ul class="pagination">
									  	<li><a href="${BASE_PATH }/notification?pn=1&pna=${pageInfoAd.pageNum}">首页</a></li>
									  	<c:if test="${pageInfo.hasPreviousPage }">
										    <li>
										      <a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum-1 }&pna=${pageInfoAd.pageNum}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
									    </c:if>
									    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
									    	<c:if test="${page_num == pageInfo.pageNum }">
										    	<li class="active"><a href="#">${page_num }</a></li>
									    	</c:if>
									    	<c:if test="${page_num != pageInfo.pageNum }">
										    	<li><a href="${BASE_PATH }/notification?pn=${page_num }&pna=${pageInfoAd.pageNum}">${page_num }</a></li>
									    	</c:if>
									    </c:forEach>
									    <c:if test="${pageInfo.hasNextPage }">
										    <li>
										      <a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum+1 }&pna=${pageInfoAd.pageNum}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
									    </c:if>
									    <li><a href="${BASE_PATH }/notification?pn=${pageInfo.pages }&pna=${pageInfoAd.pageNum}">末页</a></li>
									  </ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<!-- END INLINE NOTIFICATIONS PORTLET-->
				</div>
				<!-- advertisement -->
				<div class="col-md-6">
					<!-- BEGIN ALERTS PORTLET-->
					<div class="portlet green box">
						<div class="portlet-title">
							<div class="caption"><i class="glyphicon glyphicon-bullhorn"></i>advertisement</div>
						</div>
						<div class="portlet-body">
							<c:forEach items="${pageInfoAd.list }" var="advertisements">
								<div class="note note-success">
									<div class="row margin-bottom-20">
										<div class="col-md-12 margin-bottom-20">
											<h2>${advertisements.title }</h2>
											<p>${advertisements.content }</p>
										</div>
									</div>
									<div class="row margin-bottom-20">
										<div class="col-md-12 margin-bottom-20">
											<img src="${advertisements.pictureurl }" alt="" class="img-responsive">
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="note note-warning">
								<!-- 分页文字信息 -->
								<div class="row">
									当前第  ${pageInfoAd.pageNum }  页,总  ${pageInfoAd.pages }  页,总  ${pageInfoAd.total }  条记录
								</div>
								<!-- 分页条信息 -->
								<div class="row">
									<nav aria-label="Page navigation">
									  <ul class="pagination">
									  	<li><a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum }&pna=1">首页</a></li>
									  	<c:if test="${pageInfoAd.hasPreviousPage }">
										    <li>
										      <a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum }&pna=${pageInfoAd.pageNum-1 }" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
									    </c:if>
									    <c:forEach items="${pageInfoAd.navigatepageNums }" var="page_num_a">
									    	<c:if test="${page_num_a == pageInfoAd.pageNum }">
										    	<li class="active"><a href="#">${page_num_a }</a></li>
									    	</c:if>
									    	<c:if test="${page_num_a != pageInfoAd.pageNum }">
										    	<li><a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum }&pna=${page_num_a }">${page_num_a }</a></li>
									    	</c:if>
									    </c:forEach>
									    <c:if test="${pageInfoAd.hasNextPage }">
										    <li>
										      <a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum }&pna=${pageInfoAd.pageNum+1 }" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
									    </c:if>
									    <li><a href="${BASE_PATH }/notification?pn=${pageInfo.pageNum }&pna=${pageInfoAd.pages }">末页</a></li>
									  </ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<!-- END ALERTS PORTLET-->
				</div>
			</div>
		</div>
		<!-- END PAGE CONTENT-->    
	</div>
	<!-- BEGIN PAGE -->     
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			2017 &copy; 版权归倪吉龙所有.
		</div>
		<div class="footer-tools">
			<span class="go-top">
			<i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="assets/plugins/respond.min.js"></script>
	<script src="assets/plugins/excanvas.min.js"></script> 
	<![endif]-->   
	<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>     
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>