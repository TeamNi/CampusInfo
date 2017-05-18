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
	<title>Blog Details</title>
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
	<link href="assets/css/pages/blog.css" rel="stylesheet" type="text/css"/>
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
					<li class="active">
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
					<img alt="" src="${myself.headurl }" width="29px" height="29px"/>
					<span class="username"><c:out value="${myself.username }"></c:out></span>
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
						Blog Details <small>blog details samples</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="blog">Blog</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li><a href="blog_details?blogid=${blogdetails.blogid }">Blog Details</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12 blog-page">
					<div class="row">
						<div class="col-md-9 article-block">
							<h3>${blogdetails.title }</h3>
							<div class="blog-tag-data">
								<img src="assets/img/gallery/item_img.jpg" class="img-responsive" alt="">
								<div class="row">
									<div class="col-md-9">
										<ul class="list-inline">
											<li><i class="glyphicon glyphicon-user"></i> <a href="#">${blogdetails.user.nickname }</a></li>
											<li><i class="fa fa-calendar"></i> <a href="#">${blogdetails.createtime }</a></li>
											<li><i class="fa fa-comments"></i> <a href="#">${blogdetails.replytimes } Comments</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!--end news-tag-data-->
							<div>
								<p>${blogdetails.content }</p>
								<hr>
								<blockquote class="hero">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit posuere erat a ante.</p>
									<small>Someone famous <cite title="Source Title">Source Title</cite></small>
								</blockquote>
							</div>
							<hr>
							<h3>Comments</h3>
							<!-- Nested media object -->
							<c:forEach items="${replylist }" var="replylist">
								<div class="media">
									<a href="#" class="pull-left">
									<img alt="" src="assets/img/blog/5.jpg" class="media-object">
									</a>
									<div class="media-body">
									<c:if test="${studentid == replylist.user.studentid }">
										<h4 class="media-heading">${replylist.user.nickname } <span>${replylist.createtime } / <a href="#" id="remove_rid" remove_rid="${replylist.replyid }" blogid="${blogdetails.blogid }">Remove</a></span></h4>
									</c:if>
									<c:if test="${studentid != replylist.user.studentid }">
										<h4 class="media-heading">${replylist.user.nickname } <span> ${replylist.createtime } </span></h4>
									</c:if>
										<p>${replylist.content }</p>
									</div>
								</div>
								<hr>
							</c:forEach>
							<div class="post-comment">
								<h3>Leave a Comment</h3>
								<form id="from_post_reply" role="form" action="#">
									<div class="form-group">
										<label class="control-label">Message<span class="required">*</span></label>
										<input type="hidden" name="blogid" value="${blogdetails.blogid }"/>
										<textarea id="reply_content" class="col-md-10 form-control" rows="8" name="content"></textarea>
									</div>
									<button id="btn_post_reply" class="margin-top-20 btn blue" type="button">Post a Comment</button>
								</form>
							</div>
						</div>
						<!--end col-md-9-->
						<div class="col-md-3 blog-sidebar">
							<h3>Flickr</h3>
							<ul class="list-inline blog-images">
								<li>
									<a  class="fancybox-button" data-rel="fancybox-button" title="390 x 220 - keenthemes.com" href="assets/img/blog/1.jpg">
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
							<div class="space20"></div>
							<h3>Top Entiries</h3>
							<div class="top-news">
								<a href="#" class="btn red">
								<span>Metronic News</span>
								<em>Posted on: April 16, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Money, Business, Google
								</em>
								<i class="fa fa-briefcase top-news-icon"></i>
								</a>
								<a href="#" class="btn green">
								<span>Top Week</span>
								<em>Posted on: April 15, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Internet, Music, People
								</em>
								<i class="fa fa-music top-news-icon"></i>                             
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
								<a href="#" class="btn yellow">
								<span>Study Abroad</span>
								<em>Posted on: April 13, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Education, Students, Canada
								</em>
								<i class="fa fa-book top-news-icon"></i>                              
								</a>
								<a href="#" class="btn purple">
								<span>Top Destinations</span>
								<em>Posted on: April 12, 2013</em>
								<em>
								<i class="fa fa-tags"></i>
								Places, Internet, Google Map
								</em>
								<i class="fa fa-bolt top-news-icon"></i>                              
								</a>
							</div>
							<div class="space20"></div>
							<h3>Blog Tags</h3>
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
									<span>7 hours ago</span>
									<i class="fa fa-twitter blog-twiiter-icon"></i>
								</div>
								<div class="blog-twitter-block">
									<a href="">@keenthemes</a> 
									<p>At vero eos et accusamus et iusto odio.</p>
									<a href="#"><em>http://t.co/sBav7dm</em></a> 
									<span>8 hours ago</span>
									<i class="fa fa-twitter blog-twiiter-icon"></i>
								</div>
							</div>
						</div>
						<!--end col-md-3-->
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
		
		//remove myself reply 
		$("#remove_rid").live("click",function(){
			var replyid = $(this).attr("remove_rid");
			var blogid = $(this).attr("blogid");
			if(confirm("Are you sure?") == false){
				return;
			}
			$.ajax({
				url : "${BASE_PATH}/removeblogreply/" + replyid,
				async : false,
				type : "DELETE",
				success : function(result){
					alert(result.msg);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown){
         		   console.log("readyState===========" + XMLHttpRequest.readyState);
         		   console.log("status===========" + XMLHttpRequest.status);
         		   console.log("statusText===========" + XMLHttpRequest.statusText);
         		   console.log("responseText===========" + XMLHttpRequest.responseText);
         		   if(XMLHttpRequest.status == 500) {
         			   alert("失败！服务器内部错误：500，请检查你输入的数据");
         		   }else if(XMLHttpRequest.status == 404){
         			   alert("失败！未找到页面：404");
         		   }else if(XMLHttpRequest.status == 200){
         			   alert("成功！请刷新页面");
         		   }
         	   }
			});
			//刷新页面
			location.reload();
		});
		
		//add blog reply
		$("#btn_post_reply").live("click",function(){
			var reply_content = $("#reply_content").val();
			if(reply_content == ""){
				alert("请输入评论！")
				return false;
			}
			if(confirm("Are you sure?") == false){
				return;
			}
			$.ajax({
				url : "${BASE_PATH}/addblogreply",
				async : false,
				type : "POST",
				data : $("#from_post_reply").serialize(),
				success : function(result){
					alert(result.msg)
				}
			});
			//刷新页面
			location.reload();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>