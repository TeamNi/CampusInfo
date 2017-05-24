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
	<title>Dynamic Details</title>
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
						Dynamic Details <small>dynamic details samples</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="blog">Dynamic</a>
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
							<c:forEach items="${blogPics }" var="blogPics">
								<img src="${blogPics.pictureurl }" class="img-responsive" alt="">
							</c:forEach>
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
								<hr>
								<blockquote class="hero">
									<p>${blogdetails.content }</p>
								</blockquote>
							</div>
							<hr>
							<h3>Comments</h3>
							<!-- Nested media object -->
							<c:forEach items="${replylist }" var="replylist">
								<div class="media">
									<a href="#" class="pull-left">
									<img alt="" src="${replylist.user.headurl }" class="media-object">
									</a>
									<div class="media-body">
									<c:if test="${myself.studentid == replylist.user.studentid }">
										<h4 class="media-heading">${replylist.user.nickname } <span>${replylist.createtime } / <a href="#" id="remove_rid" remove_rid="${replylist.replyid }" blogid="${blogdetails.blogid }">Remove</a></span></h4>
									</c:if>
									<c:if test="${myself.studentid != replylist.user.studentid }">
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
						<div class="col-md-3 col-sm-4 blog-sidebar">
							<div class="top-news">
								<a href="#" class="btn red">
								<span>Notification</span>
								<i class="glyphicon glyphicon-flag top-news-icon"></i>
								</a>
							</div>
							<div class="news-blocks">
								<h3>Odio dignissimos ducimus</h3>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
								<div class="news-block-tags">
									<em>2 hours ago</em>
								</div>
							</div>
							<div class="space20"></div>
							<div class="top-news">
								<a href="#" class="btn green">
								<span>Advertisement</span>
								<i class="glyphicon glyphicon-bullhorn top-news-icon"></i>                             
								</a>
							</div>
							<div class="news-blocks">
								<h3>Odio dignissimos ducimus</h3>
								<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
								<div class="news-block-tags">
									<em>2 hours ago</em>
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