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
	<title>Login</title>
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
	<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME STYLES --> 
	<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="assets/img/logo-big.png" alt="" /> 
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" action="login" method="POST">
			<h3 class="form-title">Login to your account</h3>
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>Enter any username and password.</span>
			</div>
			<div class="bg-danger">
				<h4><span>${failInfo }</span></h4>
				<%session.removeAttribute("failInfo"); %>
				${SPRING_SECURITY_LAST_EXCEPTION.message}
                <%session.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");%>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<div class="input-icon">
					<i class="fa fa-user"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox">
					<input type="radio" value="user" name="role" checked="checked"/>user
				</label>
				<label class="checkbox">
					<input type="radio" value="admin" name="role"/>admin
				</label>
				<button type="submit" id="loginbtn" class="btn blue pull-right">
				Login <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
			<div class="forget-password">
				<h4>Forgot your password ?</h4>
				<p>
					no worries, click <a href="javascript:;"  id="forget-password">here</a>
					to reset your password.
				</p>
			</div>
			<div class="create-account">
				<p>
					Don't have an account yet ?&nbsp; 
					<a href="javascript:;" id="register-btn" >Create an account</a>
				</p>
			</div>
		</form>
		<!-- END LOGIN FORM -->        
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="forget-form" action="reset" method="post">
			<h3 >Forget Password ?</h3>
			<p>Enter your Safe Question and Safe Answer below to reset your password.</p>
			<div class="bg-danger">
				<h4><span>${failInfo }</span></h4>
				<%session.removeAttribute("failInfo"); %>
				${SPRING_SECURITY_LAST_EXCEPTION.message}
                <%session.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");%>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Student Id</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-tint"></i>
					<input class="form-control placeholder-no-fix" type="text" placeholder="Student Id" name="studentid"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Safe Question</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-question-sign"></i>
					<input class="form-control placeholder-no-fix" type="text" placeholder="Safe Question" name="safequestion"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Safe Answer</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-info-sign"></i>
					<input class="form-control placeholder-no-fix" type="text" placeholder="Safe Answer" name="safeanswer"/>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
				<i class="m-icon-swapleft"></i> Back
				</button>
				<button type="submit" class="btn blue pull-right">
				Submit <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
		</form>
		<!-- END FORGOT PASSWORD FORM -->
		<!-- BEGIN REGISTRATION FORM -->
		<form class="register-form" action="register" method="post">
			<h3 >Sign Up</h3>
			<p>Enter your personal details below:</p>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Nickname</label>
				<div class="input-icon">
					<i class="fa fa-font"></i>
					<input id="register_nickname" class="form-control placeholder-no-fix" type="text" placeholder="Nickname" name="nickname" onblur="checkNickname(this)"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Contact</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-earphone"></i>
					<input class="form-control placeholder-no-fix" type="text" placeholder="Contact" name="contact"/>
				</div>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Student Id</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-tint"></i>
					<input id="register_studentid" class="form-control placeholder-no-fix" type="text" placeholder="Student Id" name="studentid" onblur="checkStudentid(this)"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Safe Question</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-question-sign"></i>
					<input class="form-control placeholder-no-fix" type="text" placeholder="Safe Question" name="safequestion"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Safe Answer</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-info-sign"></i>
					<input class="form-control placeholder-no-fix" type="text" placeholder="Safe Answer" name="safeanswer"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Gender</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-heart"></i>
					<input id="register_gender" class="form-control placeholder-no-fix" type="text" placeholder="Gender" name="sex" onblur="validate_sex()"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Head Portrait</label>
				<div class="input-icon">
					<i class="glyphicon glyphicon-user"></i>
					<input id="lefile" type="file" style="display:none" />
					<div class="input-append"> 
						<input id="photoCover" class="form-control" type="text" placeholder="Head Portrait" name="headurl"/>
						<span class="input-group-addon" onclick="$('input[id=lefile]').click();">Click Here Browse Picture</span>
					</div> 
				</div>
			</div>
			<p>Enter your account details below:</p>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<div class="input-icon">
					<i class="fa fa-user"></i>
					<input id="register_username" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username" onblur="validate_username()"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input id="register_password" class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="Password" name="password" onblur="validate_password()"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>
				<div class="controls">
					<div class="input-icon">
						<i class="fa fa-check"></i>
						<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Re-type Your Password" name="rpassword"/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button id="register-back-btn" type="button" class="btn">
				<i class="m-icon-swapleft"></i>  Back
				</button>
				<button type="submit" id="register-submit-btn" class="btn blue pull-right">
				Sign Up <i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
		</form>
		<!-- END REGISTRATION FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">
		2013 &copy; Metronic - Admin Dashboard Template.
	</div>
	<!-- END COPYRIGHT -->
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
	<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
	<script src="assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js" type="text/javascript"></script>
	<script src="assets/scripts/login.js" type="text/javascript"></script>      
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script type="text/javascript">
		jQuery(document).ready(function() {     
		  App.init();
		  Login.init();
		});
		
		$('input[id=lefile]').change(function() { 
			$('#photoCover').val($(this).val()); 
		});
	   
	   //校验性别
	   function validate_sex(){
		   var sex = $("#register_gender").val();
		   var regsex = /^(男|女)$/;
		   if(!regsex.test(sex)){
			   alert("性别只能是男或女！");
	    	   return false;
		   }
	   }
	   
	   //校验用户名
	   function validate_username(){
		   var username = $("#register_username").val();
		   var regName = /(^[a-zA-Z_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,4})/;
		   if(!regName.test(username)){
			   alert("用户名只能是2-4位中文 或者 4-16位英文！");
	    	   return false;
		   }
	   }
	   
	   //校验密码
	   function validate_password(){
		   var password = $("#register_password").val();
		   var regPassword = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
		   if (!regPassword.test(password)){
	    	   alert("密码必须6-16位且含有小写字母、大写字母、数字、特殊符号的两种及以上！");
	    	   return false;
	       }
	   }
 	
 	   //发送ajax请求校验昵称是否重复
	   function checkNickname(str){
		   //发送ajax请求校验昵称是否重复
		   var nickname = str.value;
		   //alert(nickname);
		   $.ajax({
			   url : "${BASE_PATH}/checknick",
			   data : "nickname="+nickname,
			   type : "POST",
			   success : function(result){
				   if(result.code == 2){
					   $("#register-submit-btn").attr("ajax_validata","error");
					   alert("无效的昵称，昵称已经存在，请重新输入！");
					   $("#register_nickname").focus();
				   }else if(result.code == 1){
					   $("#register-submit-btn").attr("ajax_validata","success");
				   }
			   }
		   });
	   };
	   
	   //校验学号格式并发送ajax请求校验学号是否重复
	   function checkStudentid(str){
		   var studentid = str.value;
		   var regstudentid = /^[0-9]{6,15}$/;
		   if (!regstudentid.test(studentid)){
			   alert("学号只能是6-15位数字！");
	    	   return false;
		   }
		   $.ajax({
			  url : "${BASE_PATH}/checkstudentid",
			  data : "studentid="+studentid,
			  type : "POST",
			  success : function(result){
				  if(result.code == 2){
					  $("#register-submit-btn").attr("ajax_validata","error");
					  alert("无效的学号，学号已经存在，请重新输入！");
					  $("#register_studentid").focus();
				  }else if(result.code == 1){
					  $("#register-submit-btn").attr("ajax_validata","success");
				  }
			  }
		   });
	   }
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>