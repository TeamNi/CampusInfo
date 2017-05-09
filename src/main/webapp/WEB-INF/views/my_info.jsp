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
	<title>My Info</title>
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
	<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.css" />
	<!-- END PAGE LEVEL STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="assets/css/pages/profile.css" rel="stylesheet" type="text/css" />
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
						My Profile <small>my profile sample</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index">Home</a> 
							<i class="fa fa-angle-right"></i>
						</li>
						<li><a href="my_info">My Profile</a></li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row profile">
				<div class="col-md-12">
					<!--BEGIN TABS-->
					<div class="tabbable tabbable-custom tabbable-full-width">
						<div class="tab-content">
							<!--tab_1_2-->
							<div class="tab-pane active" id="tab_1_3">
								<div class="row profile-account">
									<div class="col-md-3">
										<ul class="ver-inline-menu tabbable margin-bottom-10">
											<li class="active">
												<a data-toggle="tab" href="#tab_1-1">
												<i class="fa fa-cog"></i> 
												My info
												</a> 
												<span class="after"></span>                                    
											</li>
											<li ><a data-toggle="tab" href="#tab_2-2"><i class="fa fa-picture-o"></i> Change Photo</a></li>
											<li ><a data-toggle="tab" href="#tab_3-3"><i class="fa fa-lock"></i> Change Password</a></li>
											<li ><a data-toggle="tab" href="#tab_4-4"><i class="fa fa-eye"></i> My Attention</a></li>
										</ul>
									</div>
									<div class="col-md-9">
										<div class="tab-content">
											<div id="tab_1-1" class="tab-pane active">
												<form id="forminfo" role="form" action="#">
													<div class="form-group">
														<label class="control-label">Student Id</label>
														<input class="form-control" type="text" placeholder="Student Id" name="studentid" value="${user.studentid }" readonly="readonly"/>
													</div>
													<div class="form-group">
														<label class="control-label">Registration Time</label>
														<input class="form-control" type="text" placeholder="Registration Time" name="createtime" value="${user.createtime }" readonly="readonly"/>
													</div>
													<div class="form-group">
														<label class="control-label">Username</label>
														<input id="reset_username" type="text" placeholder="Username" class="form-control" name="username" value="${user.username }" onblur="validate_username()" />
													</div>
													<div class="form-group">
														<label class="control-label">Nickname</label>
														<input id="reset_nickname" type="text" placeholder="Nickname" class="form-control" name="nickname" value="${user.nickname }" onblur="checkNickname()"/>
													</div>
													<div class="form-group">
														<label class="control-label">Contact</label>
														<input type="text" placeholder="Contact" class="form-control" name="contact" value="${user.contact }" />
													</div>
													<div class="form-group">
														<label class="control-label">Safe Question</label>
														<input type="text" placeholder="Safe Question" class="form-control" name="safequestion" value="${user.safequestion }"/>
													</div>
													<div class="form-group">
														<label class="control-label">Safe Answer</label>
														<input type="text" placeholder="Safe Answer" class="form-control" name="safeanswer" value="${user.safeanswer }"/>
													</div>
													<div class="form-group">
														<label class="control-label">Gender</label>
														<input id="reset_gender" type="text" placeholder="Gender" class="form-control" name="sex" value="${user.sex }" onblur="validate_sex()"/>
													</div>
													<div class="margiv-top-10">
														<a href="#" id="save_changes" ajax_validata="success" class="btn green">Save Changes</a>
														<a href="#" class="btn default">Cancel</a>
													</div>
												</form>
											</div>
											<div id="tab_2-2" class="tab-pane">
												<p>change you head portrait</p>
												<form action="#" role="form">
													<div class="form-group">
														<div class="thumbnail" style="width: 310px;">
															<img src="http://www.placehold.it/310x170/EFEFEF/AAAAAA&amp;text=no+image" alt="">
														</div>
														<div class="margin-top-10 fileupload fileupload-new" data-provides="fileupload">
															<div class="input-group input-group-fixed">
																<span class="input-group-btn">
																<span class="uneditable-input">
																<i class="fa fa-file fileupload-exists"></i> 
																<span class="fileupload-preview"></span>
																</span>
																</span>
																<span class="btn default btn-file">
																<span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
																<span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
																<input type="file" class="default" />
																</span>
																<a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
															</div>
														</div>
														<span class="label label-danger">NOTE!</span>
														<span>
														Attached image thumbnail is
														supported in Latest Firefox, Chrome, Opera, 
														Safari and Internet Explorer 10 only
														</span>
													</div>
													<div class="margin-top-10">
														<a href="#" ajax_validata="success" class="btn green">Submit</a>
														<a href="#" class="btn default">Cancel</a>
													</div>
												</form>
											</div>
											<div id="tab_3-3" class="tab-pane">
												<form action="#" id="formpwd">
													<div class="form-group">
														<label class="control-label">New Password</label>
														<input id="reset_password" type="password" class="form-control" name="password" value="" onblur="validate_password()" />
													</div>
													<div class="form-group">
														<label class="control-label">Re-type New Password</label>
														<input id="re_reset_password" type="password" class="form-control" value="" onblur="re_password()"/>
													</div>
													<div class="margin-top-10">
														<a href="#" id="change_pwd" ajax_validata="success" class="btn green">Change Password</a>
														<a href="#" class="btn default">Cancel</a>
													</div>
												</form>
											</div>
											<div id="tab_4-4" class="tab-pane">
												<form action="" class="">
													<table class="table table-bordered table-striped">
														<tr>
															<td>
																Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus..${user.userid }
															</td>
															<td>
																<button type="submit" class="btn blue pull-left">
																Remove 
																</button>  
															</td>
														</tr>
														<tr>
															<td>
																Enim eiusmod high life accusamus terry richardson ad squid wolf moon
															</td>
															<td>
																<button type="submit" class="btn blue pull-left">
																Remove 
																</button>  
															</td>
														</tr>
														<tr>
															<td>
																Enim eiusmod high life accusamus terry richardson ad squid wolf moon
															</td>
															<td>
																<button type="submit" class="btn blue pull-left">
																Remove 
																</button>  
															</td>
														</tr>
														<tr>
															<td>
																Enim eiusmod high life accusamus terry richardson ad squid wolf moon
															</td>
															<td>
																<button type="submit" class="btn blue pull-left">
																Remove 
																</button>  
															</td>
														</tr>
													</table>
													<!--end profile-settings-->
												</form>
											</div>
										</div>
									</div>
									<!--end col-md-9-->                                   
								</div>
							</div>
							<!--end tab-pane-->
						</div>
					</div>
					<!--END TABS-->
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
	<script type="text/javascript" src="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js"></script>      
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		});
		
		//发送ajax请求校验昵称是否重复
		   function checkNickname(){
			   //发送ajax请求校验昵称是否重复
			   var nickname = $("#reset_nickname").val();
			   if(nickname == ""){
				   $("#save_changes").attr("ajax_validata","error");
				   alert("昵称不能为空！")
				   return false;
			   }
			   //alert(nickname);
			   $.ajax({
				   url : "${BASE_PATH}/checknickname",
				   data : "nickname="+nickname,
				   type : "POST",
				   success : function(result){
					   if(result.code == 2){
						   $("#save_changes").attr("ajax_validata","error");
						   alert("无效的昵称，昵称已经存在，请重新输入！");
						   $("#reset_nickname").focus();
					   }else if(result.code == 1){
						   $("#save_changes").attr("ajax_validata","success");
					   }
				   }
			   });
		   };
		
		   //校验性别
		   function validate_sex(){
			   var sex = $("#reset_gender").val();
			   var regsex = /^(男|女)$/;
			   if(!regsex.test(sex)){
				   alert("性别只能是男或女！");
		    	   return false;
			   }
			   return true;
		   }
		   
		   //校验用户名
		   function validate_username(){
			   var username = $("#reset_username").val();
			   var regName = /(^[a-zA-Z_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,4})/;
			   if(!regName.test(username)){
				   alert("用户名只能是2-4位中文 或者 4-16位英文！");
		    	   return false;
			   }
			   return true;
		   }
		   
		   //校验密码
		   function validate_password(){
			   var password = $("#reset_password").val();
			   var regPassword = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
			   if (!regPassword.test(password)){
		    	   alert("密码必须6-16位且含有小写字母、大写字母、数字、特殊符号的两种及以上！");
		    	   return false;
		       }
			   return true;
		   }
		   
		   //重复密码
		   function re_password(){
			   var pwd = document.getElementById("reset_password").value;
			   var re_pwd = document.getElementById("re_reset_password").value;
			   if(pwd != re_pwd){
				   alert("密码必须一致 ！")
				   return false;
			   }
			   return true;
		   }
		   
		   //change user info
		   $("#save_changes").live("click",function(){
			   //对提交给服务器的数据进行格式校验
			   if(!validate_sex()){
				   alert("性别只能是男或女！");
				   return false;
			   }
			   if(!validate_username()){
				   alert("用户名只能是2-4位中文 或者 4-16位英文！");
				   return false;
			   }
			   //校验昵称是否重复
			   if($(this).attr("ajax_validata") == "error"){
				   alert("请再次检查昵称！");
				   return false;
			   }
			   //发送ajax修改信息
			   $.ajax({
				  url : "${BASE_PATH}/updateuserinfo",
				  async : false,
				  type : "PUT",
				  data : $("#forminfo").serialize(),
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
		   });
		   
		 //change password info
		   $("#change_pwd").live("click",function(){
			   //对提交给服务器的数据进行格式校验
			   if(!validate_password()){
				   alert("密码必须6-16位且含有小写字母、大写字母、数字、特殊符号的两种及以上！");
				   return false;
			   }
			   if(!re_password()){
				   alert("密码必须一致 ！");
				   return false;
			   }
			   //发送ajax修改信息
			   $.ajax({
				  url : "${BASE_PATH}/updateuserpwd",
				  async : false,
				  type : "PUT",
				  data : $("#formpwd").serialize(),
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
		   });
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>