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
	<title>Dynamic Issue</title>
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
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="assets/plugins/dropzone/css/dropzone.css" rel="stylesheet"/>
	<!-- END PAGE LEVEL STYLES -->
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
						Dynamic Issue <small>Issue your own dynamic</small>
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
						<li><a href="blog_issue">Blog Issue</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-8">
					<div id="tab_3-3" class="tab-pane">
						<form id="from_issue_blog" method="post">
							<div class="form-group">
								<label class="control-label">Title:</label>
								<input type="text" maxlength="25" class="form-control" id="issue_title" name="title" value="" />
							</div>
							<div class="form-group">
								<label class="control-label">Content:</label>
								<textarea rows="6" cols="135" class="form-control" maxlength="800" id="issue_content" name="content"></textarea>
							</div>
							<label class="control-label">Picture:</label>
							<div class="form-group dropzone" id="my-dropzone"></div>
							<div class="margin-top-10">
								<a href="#" id="btn_issue_blog" class="btn green">发布</a>
								<input type="reset" id="btn_issue_cancel" class="btn default" value="取消">
							</div>
						</form>
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
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="assets/plugins/dropzone/dropzone.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js"></script>
	<script src="assets/scripts/form-dropzone.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
		   // initiate layout and plugins
		   App.init();
		         FormDropzone.init();
		});
		
		//issue blog
		$("#btn_issue_blog").live("click",function(){
			var title = $("#issue_title").val();
			var content = $("#issue_content").val();
			if(title == "" || content == ""){
				alert("标题和内容必须填写！")
				return false;
			}
			$.ajax({
				url : "${BASE_PATH}/issue_blog",
				async : false,
				type : "POST",
				data : {
					"title" : title,
					"content" : content
				},
				success : function(result){
					alert(result.msg)
					window.location.href="${BASE_PATH}/blog"
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
		
		//upload file
 		Dropzone.autoDiscover = false;
		var myDropzone = new Dropzone("#my-dropzone", {
			url: "${BASE_PATH}/uploadblogpicture",
			addRemoveLinks: true,
			method: 'post',
			maxFiles:3,//一次性上传的文件数量上限
			filesizeBase: 1024,
			parallelUploads: 100,
	        acceptedFiles: ".jpg,.gif,.png",
			autoProcessQueue: false,
			init:function(){
	        	var submitButton = document.querySelector("#btn_issue_blog")
	            myDropzone = this; // closure

		        submitButton.addEventListener("click", function() {
		          myDropzone.processQueue(); // Tell Dropzone to process all queued files.
		        });
	            
	            this.on("addedfile", function(file) {
	                console.log("File: " + file.name + ">>added");
	            });
	            this.on("success", function(file) {
	                console.log("File: " + file.name + ">>uploaded");
	            });
	            this.on("removedfile", function(file) {
	                console.log("File: " + file.name + ">>removed");
	            });
	            this.on("queuecomplete",function(file) {
	            	alert("SUCCESS!");
	                console.log("File: " + file.getAcceptedFiles().length + ">>queuecomplete");
	                //上传完成后触发的方法
	            })
	        },
			sending: function(file, xhr, formData) {
				formData.append("filesize", file.size);
			}
		}); 
		
/* 		var myDropzone = new Dropzone("#my-dropzone", {
			url: "${BASE_PATH}/uploadblogpicture", //必须填写
	        method:"post",  //也可用put
	        paramName:"pictureurl", //默认为file
	        maxFiles:10,//一次性上传的文件数量上限
	        maxFilesize: 20, //MB
	        acceptedFiles: ".jpg,.gif,.png", //上传的类型
	        previewsContainer:"#adds", //显示的容器
	        parallelUploads: 3,
	        dictMaxFilesExceeded: "您最多只能上传10个文件！",
	        dictResponseError: '文件上传失败!',
	        dictInvalidFileType: "你不能上传该类型文件,文件类型只能是*.jpg,*.gif,*.png。",
	        dictFallbackMessage:"浏览器不受支持",
	        dictFileTooBig:"文件过大上传文件最大支持.",
	        previewTemplate: document.querySelector('#preview-template').innerHTML,//设置显示模板
	        init:function(){
	            this.on("addedfile", function(file) { 
	            //上传文件时触发的事件
	            });
	            this.on("queuecomplete",function(file) {
	            	alert("SUCCESS!");
	                //上传完成后触发的方法
	            });
	            this.on("removedfile",function(file){
	            	alert("REMOVE!");
	                //删除文件时触发的方法
	            });
	        }
	    }); */
	</script>
	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>