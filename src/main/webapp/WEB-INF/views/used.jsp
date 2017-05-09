<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>Campus Used</title>
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
	<!-- BEGIN PAGE LEVEL STYLES --> 
	<link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->   
	<!-- BEGIN THEME STYLES --> 
	<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/pages/portfolio.css" rel="stylesheet" type="text/css"/>
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
			<img src="assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN HORIZANTAL MENU -->
			<div class="hor-menu hidden-sm hidden-xs">
				<ul class="nav navbar-nav">
					<li>
						<a href="index">首页</a>
					</li>
					<li>
						<a href="blog">校园论坛</a>                       
					</li>
					<li class="active">
						<a href="used">校园闲置</a>
					</li>
					<li>
						<a href="#">教材征订</a>                      
					</li>
					<li>
						<span class="hor-menu-search-form-toggler">&nbsp;</span>
						<div class="search-form">
							<form class="form-search" action="search" method="get">
								<div class="input-group">
									<input type="text" placeholder="Search..." class="form-control">
									<div class="input-group-btn">
										<button type="button" class="btn"></button>
									</div>
								</div>
							</form>
						</div>
					</li>
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
					<img alt="" src="assets/img/avatar1_small.jpg"/>
					<span class="username"><c:out value="${username }"></c:out></span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="my_info"><i class="fa fa-user"></i> My Profile</a></li>
						<li><a href="my_blog"><i class="fa fa-envelope"></i> My Blog <span class="badge badge-danger">3</span></a></li>
						<li><a href="my_used"><i class="fa fa-tasks"></i> My Used <span class="badge badge-success">7</span></a></li>
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
						Campus Used <small>Share you goods here</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							<a href="used_issue" class="btn blue">
								<span>Issue</span><i class="fa fa-plus"></i>
							</a>
						</li>
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li><a href="used">Used</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable tabbable-custom boxless">
						<div class="tab-content">
							<div class="tab-pane active">
								<!-- BEGIN FILTER -->           
								<div class="filter-v1 margin-top-10">
									<div class="row mix-grid thumbnails">
										<div class="col-md-4 col-sm-6 mix category_1">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img1.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis prae sentium.</p>
													<a class="mix-link" href="used_details"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img1.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 mix category_2">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img2.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis prae sentium.</p>
													<a class="mix-link" href="used_details"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img2.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 mix category_3">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img3.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis.</p>
													<a class="mix-link" href="used_details"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img3.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 mix category_1 category_2">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img4.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis prae sentium.</p>
													<a class="mix-link" href="used_details"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img4.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>                            
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 mix category_2 category_1">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img5.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis prae.</p>
													<a class="mix-link"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img5.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>                            
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 mix category_1 category_2">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img6.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis prae sentium.</p>
													<a class="mix-link"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img6.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>                            
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-6 mix category_2 category_3">
											<div class="mix-inner">
												<img class="img-responsive" src="assets/img/works/img1.jpg" alt="">
												<div class="mix-details">
													<h3>Cascusamus et iusto odio</h3>
													<p>At vero eos et accusamus et iusto odio digniss imos duc sasdimus qui sint blanditiis.</p>
													<a class="mix-link"><i class="fa fa-link"></i></a>
													<a class="mix-preview fancybox-button" href="assets/img/works/img1.jpg" title="Project Name" data-rel="fancybox-button"><i class="fa fa-heart"></i></a>                            
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- END FILTER --> 
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
		<!-- END PAGE -->    
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			2013 &copy; Metronic by keenthemes.
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
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="assets/plugins/jquery-mixitup/jquery.mixitup.min.js"></script>
	<script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>  
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="assets/scripts/app.js"></script>
	<script src="assets/scripts/portfolio.js"></script>      
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		   Portfolio.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>