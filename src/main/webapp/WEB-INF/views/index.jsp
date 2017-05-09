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
			<img src="${BASE_PATH}/assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN HORIZANTAL MENU -->
			<div class="hor-menu hidden-sm hidden-xs">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="index">首页</a>
					</li>
					<li>
						<a href="blog">校园论坛</a>                       
					</li>
					<li>
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
										<button type="submit" class="btn"></button>
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
			<img src="${BASE_PATH}/assets/img/menu-toggler.png" alt="" />
			</a>          
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" src="${BASE_PATH}/assets/img/avatar1_small.jpg"/>
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
			<!-- BEGIN PAGE CONTAINER-->
			<div class="promo-page">
				<!-- BEGIN PAGE CONTENT-->
				<div class="block-carousel">
					<div id="promo_carousel" class="carousel slide">
						<div class="container">
							<div class="carousel-inner">
								<div class="active item">
									<div class="row">
										<div class="col-md-7 margin-bottom-20 margin-top-20 animated rotateInUpRight">
											<h3>Welcome to Shenyang University of Chemical Technology</h3>
											<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
											<p>Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
											<a href="blog" class="btn red btn-lg m-icon-big">
											Go surfing <i class="m-icon-big-swapright m-icon-white"></i>                                
											</a>
										</div>
										<div class="col-md-5 animated rotateInDownLeft">
											<a href="blog"><img src="${BASE_PATH}/assets/img/pages/img1.png" alt="" class="img-responsive"></a>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="row">
										<div class="col-md-5 animated rotateInUpRight">
											<a href="index"><img src="${BASE_PATH}/assets/img/pages/img1_2.png" alt="" class="img-responsive"></a>
										</div>
										<div class="col-md-7 margin-bottom-20 animated rotateInDownLeft">
											<h1>Buy Metronic Today..</h1>
											<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
											<p>Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
											<a href="blog" class="btn green btn-lg m-icon-big">
											But it today
											<i class="m-icon-big-swapright m-icon-white"></i>                                
											</a>
										</div>
									</div>
								</div>
							</div>
							<a class="carousel-control left" href="#promo_carousel" data-slide="prev">
							<i class="m-icon-big-swapleft"></i>
							</a>
							<a class="carousel-control right" href="#promo_carousel" data-slide="next">
							<i class="m-icon-big-swapright"></i>
							</a>
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#promo_carousel" data-slide-to="0" class="active"></li>
								<li data-target="#promo_carousel" data-slide-to="1"></li>
							</ol>
						</div>
					</div>
				</div>
				<div class="block-yellow">
					<div class="container">
						<div class="row">
							<div class="col-md-5 margin-bottom-20">
								<a href="index"><img src="${BASE_PATH}/assets/img/pages/img2.png" alt="" class="img-responsive"></a>
							</div>
							<div class="col-md-7">
								<h2>Metronic viverra vehicula sem ut volutpat</h2>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
								<p>Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
								<a href="used" class="btn blue btn-lg m-icon-big">
								Learn more
								<i class="m-icon-big-swapright m-icon-white"></i>                                
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="block-transparent">
					<div class="container">
						<div class="row margin-bottom-20">
							<div class="col-md-6 margin-bottom-20">
								<h2>Metronic Viverra</h2>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos <a href="#">ellentesque la vehi</a> dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
								<p>Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita <a href="#">distinctio lorem ipsum dolor</a> sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
							</div>
							<div class="col-md-6 margin-bottom-20">
								<a href="index"><img src="${BASE_PATH}/assets/img/pages/img3.png" alt="" class="img-responsive"></a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<a href="index"><img src="${BASE_PATH}/assets/img/pages/img4.png" alt="" class="img-responsive"></a>
							</div>
							<div class="col-md-6 margin-bottom-20">
								<h2>Vero eos iusto odio..</h2>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et <a href="#">quas molestias excepturi sint</a> occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
								<p>Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et <a href="#">quam lacus eusce condimentum </a> eleifend enim a feugiat.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="block-footer">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<h3>Photo Stream</h3>
								<ul class="list-unstyled blog-images">
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/1.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/2.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/3.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/4.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/5.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/6.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/8.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/10.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/11.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/1.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/2.jpg" alt=""></a></li>
									<li><a href="#"><img src="${BASE_PATH}/assets/img/blog/7.jpg" alt=""></a></li>
								</ul>
							</div>
							<div class="col-md-6">
								<h3>Subscribe</h3>
								<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet risus etiam.</p>
								<form class="form-inline" action="#">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Email Address">
										<span class="input-group-btn">
										<button class="btn blue" type="button">GO!</button>
										</span>      
									</div>
									<!-- /input-group -->
								</form>
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
				2013 &copy; Metronic by keenthemes.
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