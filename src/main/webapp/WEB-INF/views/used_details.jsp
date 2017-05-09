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
	<title>Used Details</title>
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
	<link href="assets/css/pages/blog.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/pages/news.css" rel="stylesheet" type="text/css"/>
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
						Used Details <small>used details samples</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="used">Used</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li><a href="used_details">Used Details</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12 news-page blog-page">
					<div class="row">
						<div class="col-md-9 blog-tag-data">
							<h3>Recent News</h3>
							<img src="assets/img/gallery/item_img1.jpg" class="img-responsive" alt="">
							<div class="row">
								<div class="col-md-6">
									<ul class="list-inline blog-tags">
										<li>
											<i class="fa fa-tags"></i> 
											<a href="#">Technology</a> 
											<a href="#">Education</a>
											<a href="#">Internet</a>
										</li>
									</ul>
								</div>
								<div class="col-md-6 blog-tag-data-inner">
									<ul class="list-inline">
										<li><i class="fa fa-calendar"></i> <a href="#">April 16, 2013</a></li>
										<li><i class="fa fa-comments"></i> <a href="#">38 Comments</a></li>
									</ul>
								</div>
							</div>
							<div class="news-item-page">
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culp orem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus.</p>
								<blockquote class="hero">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit posuere erat a ante.</p>
									<small>Someone famous <cite title="Source Title">Source Title</cite></small>
								</blockquote>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique dimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus.</p>
							</div>
							<hr>
							<h3>Comments</h3>
							<div class="media">
								<a href="#" class="pull-left">
								<img alt="" src="assets/img/blog/9.jpg" class="media-object">
								</a>
								<div class="media-body">
									<h4 class="media-heading">Media heading <span>5 hours ago / <a href="#">Reply</a></span></h4>
									<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
								</div>
							</div>
							<hr>
							<!-- Nested media object -->
							<div class="media">
								<a href="#" class="pull-left">
								<img alt="" src="assets/img/blog/5.jpg" class="media-object">
								</a>
								<div class="media-body">
									<h4 class="media-heading">Media heading <span>17 hours ago / <a href="#">Reply</a></span></h4>
									<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
								</div>
							</div>
							<hr>
							<!--end media-->
							<div class="media">
								<a href="#" class="pull-left">
								<img alt="" src="assets/img/blog/7.jpg" class="media-object">
								</a>
								<div class="media-body">
									<h4 class="media-heading">Media heading <span>2 days ago / <a href="#">Reply</a></span></h4>
									<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
								</div>
							</div>
							<hr>
							<!--end media-->
							<div class="media">
								<a href="#" class="pull-left">
								<img alt="" src="assets/img/blog/6.jpg" class="media-object">
								</a>
								<div class="media-body">
									<h4 class="media-heading">Media heading <span>July 5,2013 / <a href="#">Reply</a></span></h4>
									<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
								</div>
							</div>
							<!--end media-->
							<hr>
							<div class="post-comment">
								<h3>Leave a Comment</h3>
								<form role="form" action="#">
									<div class="form-group">
										<label class="control-label">Message<span class="required">*</span></label>
										<textarea class="col-md-10 form-control" rows="8"></textarea>
									</div>
									<button class="margin-top-20 btn blue" type="submit">Post a Comment</button>
								</form>
							</div>
						</div>
						<div class="col-md-3">
							<h3>News Feeds</h3>
							<div class="top-news">
								<a href="#" class="btn green">
								<span>Top Week</span>
								<em>Posted on: April 15, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Internet, Music, People
								</em>
								<i class="fa fa-music top-news-icon"></i>                             
								</a>
								<a href="#" class="btn yellow">
								<span>Study Abroad</span>
								<em>Posted on: April 13, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Education, Students, Canada
								</em>
								<i class="fa fa-book top-news-icon"></i>                              
								</a>
								<a href="#" class="btn red">
								<span>Metronic News</span>
								<em>Posted on: April 16, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Money, Business, Google
								</em>
								<i class="fa fa-briefcase top-news-icon"></i>
								</a>
								<a href="#" class="btn blue">
								<span>Gold Price Falls</span>
								<em>Posted on: April 14, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								USA, Business, Apple
								</em>
								<i class="fa fa-globe top-news-icon"></i>                             
								</a>
							</div>
							<div class="space20"></div>
							<h3>News Tags</h3>
							<ul class="list-inline sidebar-tags">
								<li><a href="#"><i class="fa fa-tags"></i> Business</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Music</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Internet</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Money</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Google</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> TV Shows</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Education</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> People</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> People</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Math</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Photos</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Electronics</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Apple</a></li>
								<li><a href="#"><i class="fa fa-tags"></i> Canada</a></li>
							</ul>
							<div class="space20"></div>
							<h3>Tabs</h3>
							<div class="tabbable tabbable-custom">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#tab_1_1">Section 1</a></li>
									<li ><a data-toggle="tab" href="#tab_1_2">Section 2</a></li>
								</ul>
								<div class="tab-content">
									<div id="tab_1_1" class="tab-pane active">
										<p>I'm in Section 1.</p>
										<p>
											Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
										</p>
									</div>
									<div id="tab_1_2" class="tab-pane">
										<p>Howdy, I'm in Section 2.</p>
										<p>
											Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.
										</p>
									</div>
								</div>
							</div>
							<div class="space20"></div>
							<h3>Recent Twitts</h3>
							<div class="blog-twitter">
								<div class="blog-twitter-block">
									<a href="">@keenthemes</a> 
									<p>At vero eos et accusamus et iusto odio.</p>
									<a href="#"><em>http://t.co/sBav7dm</em></a> 
									<span>5 hours ago</span>
									<i class="fa fa-twitter blog-twiiter-icon"></i>
								</div>
								<div class="blog-twitter-block">
									<a href="">@keenthemes</a> 
									<p>At vero eos et accusamus et iusto odio.</p>
									<a href="#"><em>http://t.co/sBav7dm</em></a> 
									<span>8 hours ago</span>
									<i class="fa fa-twitter blog-twiiter-icon"></i>
								</div>
								<div class="blog-twitter-block">
									<a href="">@keenthemes</a> 
									<p>At vero eos et accusamus et iusto odio.</p>
									<a href="#"><em>http://t.co/sBav7dm</em></a> 
									<span>12 hours ago</span>
									<i class="fa fa-twitter blog-twiiter-icon"></i>
								</div>
							</div>
							<div class="space20"></div>
							<h3>Flickr</h3>
							<ul class="list-inline blog-images">
								<li>
									<a class="fancybox-button" data-rel="fancybox-button" title="390 x 220 - keenthemes.com" href="assets/img/blog/1.jpg">
									<img alt="" src="assets/img/blog/1.jpg">
									</a>
								</li>
								<li><a href="#"><img alt="" src="assets/img/blog/2.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/3.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/4.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/5.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/6.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/8.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/10.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/11.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/1.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/2.jpg"></a></li>
								<li><a href="#"><img alt="" src="assets/img/blog/7.jpg"></a></li>
							</ul>
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
	<script src="assets/scripts/app.js"></script>      
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>