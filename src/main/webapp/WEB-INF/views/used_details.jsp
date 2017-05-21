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
	<title>Used Details</title>
	<%
		pageContext.setAttribute("BASE_PATH", request.getContextPath());
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
						<div class="col-md-12 blog-tag-data">
							<h3>${useddetails.title }</h3>
							<div class="tab-pane">
								<!-- BEGIN FILTER -->           
								<div class="filter-v1 margin-top-10">
									<div class="row mix-grid thumbnails">
										<c:forEach items="${usedPics }" var="usedPics">
											<div class="col-md-6 col-sm-6 mix">
												<div class="mix-inner">
													<img src="${usedPics.pictureurl }" class="img-responsive" alt="">
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- END FILTER --> 
							</div>
							<div class="row">
								<div class="col-md-12">
									<ul class="list-inline">
										<li><i class="glyphicon glyphicon-user"></i> <a href="#">${useddetails.user.nickname }</a></li>
										<li><i class="fa fa-calendar"></i> <a href="#">${useddetails.createtime }</a></li>
										<li><i class="fa fa-comments"></i> <a href="#">${useddetails.replytimes } Comments</a></li>
										<li><i class="glyphicon glyphicon-heart"></i> <a href="#" id="add_attention" usedid="${useddetails.usedid }">${useddetails.attentiontimes } Attention</a></li>
									</ul>
								</div>
							</div>
							<div class="row col-md-9">
								<div class="news-item-page">
									<hr>
									<blockquote class="hero">
										<div class="panel panel-success">
										  <div class="panel-heading">
										    <h3 class="panel-title">
										    title : ${useddetails.title }
										    </h3>
										  </div>
										  <div class="panel-body">
										    content : ${useddetails.content }
										  </div>
										  <div class="panel-body">
										    price : ${useddetails.price }
										  </div>
										  <div class="panel-body">
										    contact : ${useddetails.contact }
										  </div>
										</div>
									</blockquote>
								</div>
								<hr>
								<h3>Comments</h3>
								<c:forEach items="${replylist }" var="replylist">
								<div class="media">
									<a href="#" class="pull-left">
									<img alt="" src="${replylist.user.headurl }" class="media-object">
									</a>
									<div class="media-body">
										<c:if test="${myself.studentid == replylist.user.studentid }">
										<h4 class="media-heading">${replylist.user.nickname } <span>${replylist.createtime } / <a href="#" remove_rid="${replylist.replyid }" id="remove_rid">Remove</a></span></h4>
										</c:if>
										<c:if test="${myself.studentid != replylist.user.studentid }">
										<h4 class="media-heading">${replylist.user.nickname } <span>${replylist.createtime } / </span></h4>
										</c:if>
										<p>${replylist.content }</p>
									</div>
								</div>
								<hr>
								</c:forEach>
								<!-- Nested media object -->
								<div class="post-comment">
									<h3>Leave a Comment</h3>
									<form role="form" action="#" id="form_post_reply">
										<div class="form-group">
											<label class="control-label">Message<span class="required">*</span></label>
											<input type="hidden" name="usedid" value="${useddetails.usedid }">
											<textarea id="reply_content" class="col-md-10 form-control" rows="8" name="content"></textarea>
										</div>
										<button id="btn_post_reply" class="margin-top-20 btn blue" type="button">Post a Comment</button>
									</form>
								</div>
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
	<script src="assets/scripts/app.js"></script>      
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		});
		
		//post used reply
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
				url : "${BASE_PATH}/addusedreply",
				async : false,
				type : "POST",
				data : $("#form_post_reply").serialize(),
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
			location.reload();
		});
		
		//remove myself reply
		$("#remove_rid").live("click",function(){
			var replyid = $(this).attr("remove_rid");
			if(confirm("Are you sure?") == false){
				return;
			}
			$.ajax({
				url : "${BASE_PATH}/removeusedreply/" + replyid,
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
		
		//add my attention
		$("#add_attention").live("click",function(){
			var usedid = $(this).attr("usedid");
			if(confirm("将此件物品添加为我关心的物品?") == false){
				return;
			}
			$.ajax({
				url : "${BASE_PATH}/addattention",
				async : false,
				type : "POST",
				data : "usedid=" + usedid,
				success : function(result){
					if(result.code == 1){
						alert(result.msg);
					}
					if(result.code ==2 ){
						alert(result.extend.info);
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
			location.reload();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>