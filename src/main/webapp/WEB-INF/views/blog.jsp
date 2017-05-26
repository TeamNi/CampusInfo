<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>Campus Dynamic</title>
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
						Campus Dynamic <small>Let's focus on the campus dynamic together</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							<a href="blog_issue" class="btn blue">
								<span>Issue</span><i class="fa fa-plus"></i>
							</a>
						</li>
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li><a href="blog">Dynamic</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12 blog-page">
					<div class="row">
						<div class="col-md-9 col-sm-8 article-block">
							<h1>Latest Dynamic</h1>
							<c:forEach items="${pageInfo.list }" var="blog">
							<div class="row">
								<div class="col-md-4 blog-img blog-tag-data">
									<img src="${blog.pictureurl }" alt="" class="img-responsive">
									<ul class="list-inline">
										<li><i class="glyphicon glyphicon-user"></i> <a href="#" id="my_nickname" userid="${blog.user.userid }" nickname="${blog.user.nickname }">${blog.user.nickname }</a></li><br>
										<li><i class="glyphicon glyphicon-dashboard"></i> <a href="#">${blog.createtime }</a></li><br>
										<li><i class="fa fa-comments"></i> <a href="#">${blog.replytimes } Comments</a></li>
									</ul>
								</div>
								<div class="col-md-8 blog-article">
									<h3><a href="blog_details?blogid=${blog.blogid }" >${blog.title }</a></h3>
									<p>${blog.content }</p>
									<a class="btn blue" href="blog_details?blogid=${blog.blogid }">
									Read more 
									<i class="m-icon-swapright m-icon-white"></i>
									</a>
								</div>
							</div>
							<hr>
							</c:forEach>
						</div>
						<!--end col-md-9-->
						<div class="col-md-3 col-sm-4 blog-sidebar">
							<div class="top-news">
								<a href="#" class="btn red">
								<span>Notification</span>
								<i class="glyphicon glyphicon-flag top-news-icon"></i>
								</a>
							</div>
							<c:forEach items="${notificationlist }" var="notificationlist">
							<div class="news-blocks">
								<h3>${notificationlist.title }</h3>
								<p>${notificationlist.content }</p>
								<div class="news-block-tags">
									<em>发布时间：${notificationlist.createtime }</em>
									<em>发布人：${notificationlist.user.username }</em>
								</div>
							</div>
							<hr>
							</c:forEach>
							<div class="space20"></div>
							<div class="top-news">
								<a href="#" class="btn green">
								<span>Advertisement</span>
								<i class="glyphicon glyphicon-bullhorn top-news-icon"></i>                             
								</a>
							</div>
							<c:forEach items="${advertisementlist }" var="advertisementlist">
							<div class="news-blocks">
								<h3>${advertisementlist.title }</h3>
								<p>${advertisementlist.content }</p>
								<div class="news-block-tags">
									<em>${advertisementlist.createtime }</em>
								</div>
							</div>
							<hr>
							</c:forEach>
						</div>
						<!--end col-md-3-->
					</div>
					<div class="row">
						<!-- 分页文字信息 -->
						<div class="col-md-6">
							当前第  ${pageInfo.pageNum }  页,总  ${pageInfo.pages }  页,总  ${pageInfo.total }  条记录
						</div>
						<!-- 分页条信息 -->
						<div class="col-md-6">
							<nav aria-label="Page navigation">
							  <ul class="pagination">
							  	<li><a href="${BASE_PATH }/blog?pn=1">首页</a></li>
							  	<c:if test="${pageInfo.hasPreviousPage }">
								    <li>
								      <a href="${BASE_PATH }/blog?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
							    </c:if>
							    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
							    	<c:if test="${page_num == pageInfo.pageNum }">
								    	<li class="active"><a href="#">${page_num }</a></li>
							    	</c:if>
							    	<c:if test="${page_num != pageInfo.pageNum }">
								    	<li><a href="${BASE_PATH }/blog?pn=${page_num }">${page_num }</a></li>
							    	</c:if>
							    </c:forEach>
							    <c:if test="${pageInfo.hasNextPage }">
								    <li>
								      <a href="${BASE_PATH }/blog?pn=${pageInfo.pageNum+1 }" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
							    </c:if>
							    <li><a href="${BASE_PATH }/blog?pn=${pageInfo.pages }">末页</a></li>
							  </ul>
							</nav>
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
		
		//add attention
		$("#my_nickname").live("click",function(){
			var userid = $(this).attr("userid");
			var nickname = $(this).attr("nickname");
			if(confirm("确定将"+nickname+"添加为好友?") == false){
				return;
			}
			$.ajax({
				url : "${BASE_PATH}/addmyattention",
				async : false,
				type : "POST",
				data : "userid=" + userid,
				success : function(result){
					if(result.code == 1){
						alert("添加成功！");
					}
					if(result.code == 2){
						alert("好友已经存在！");
					}
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
		});
	</script>
<!-- END JAVASCRIPTS -->
</body>