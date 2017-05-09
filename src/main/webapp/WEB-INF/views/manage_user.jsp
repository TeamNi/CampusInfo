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
	<title>Admin</title>
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
	<link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css" />
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
			<a class="navbar-brand" href="manage_user">
			<img src="assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN HORIZANTAL MENU -->
			<div class="hor-menu hidden-sm hidden-xs">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="manage_user">用户管理</a>
					</li>
					<li>
						<a href="manage_blog">论坛管理</a>                       
					</li>
					<li>
						<a href="manage_used">闲置管理</a>
					</li>
					<li>
						<a href="manage_comment_blog">论坛评论管理</a>                      
					</li>
					<li>
						<a href="manage_comment_used">闲置评论管理</a>                      
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
						User Management <small>Management Campus User</small>
					</h3>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<hr>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-edit"></i>Editable User Table</div>
							<div class="tools">
								<a href="javascript:;" class="reload"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="btn-group">
									<button id="sample_editable_1_new" class="btn green">
									Add New <i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
							<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
								<thead>
									<tr>
										<th>姓名</th>
										<th>昵称</th>
										<th>性别</th>
										<th>学号</th>
										<th>密码</th>
										<th>安全问题</th>
										<th>安全答案</th>
										<th>头像</th>
										<th>联系方式</th>
										<th>注册时间</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${userlist}" var="user">
									<tr >
										<td>${user.username }</td>
										<td>${user.nickname }</td>
										<td>${user.sex }</td>
										<td>${user.studentid }</td>
										<td>${user.password }</td>
										<td>${user.safequestion }</td>
										<td>${user.safeanswer }</td>
										<td>${user.headurl }</td>
										<td>${user.contact }</td>
										<td>${user.createtime }</td>
										<td><a edit-id="${user.userid }" class="edit" href="">Edit</a></td>
										<!-- 为删除添加一个自定义的属性表示当前删除的用户id -->
										<td><a del-id="${user.userid }" class="delete" href="">Delete</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END PAGE CONTENT -->
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
	<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="assets/plugins/data-tables/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js"></script>
	<script src="assets/scripts/manage_user.js"></script>    
	<script type="text/javascript">
		jQuery(document).ready(function() {       
		   App.init();
		   TableEditable.init();
 		   
		   //删除
		   $('#sample_editable_1 a.delete').live('click', function (e) {
               e.preventDefault();
               //弹出确认删除对话框
               var username = $(this).parents("tr").find("td:eq(0)").text();
               var userid = $(this).attr("del-id");

               if (confirm("确认删除【"+username+"】吗？")) {
                   $.ajax({
                   	url : "${BASE_PATH}/user/" + userid,
                   	async : false,
                   	type : "DELETE",
                   	success : function(result){
                   		alert(result.msg);
                   	}
                   });
                 //刷新页面
           		location.reload();
               }
           });
		   
		   //修改
		   $("#sample_editable_1 a.update").live("click", function(){
			   //先对要提交给服务器的数据进行校验
               if(!validate_updateData()){
            	   return false;
               }
               //判断之前的ajax昵称重复是否有效
               if($(this).attr("ajax_validata") == "error"){
                   alert("昵称或学号已经存在，无法保存！");
            	   return false;
               }
			   var userid = $(this).attr("update-id");
			   //将修改的数据提交给服务器进行保存,发送ajax请求 更新用户
			   var username = $("#update0").val();
		       var nickname = $("#update1").val();
		       var sex = $("#update2").val();
		       var studentid = $("#update3").val();
		       var password = $("#update4").val();
		       var safequestion = $("#update5").val();
		       var safeanswer = $("#update6").val();
		       var headurl = $("#update7").val();
		       var contact = $("#update8").val();
		       var createtime = $("#update9").val();
			   $.ajax({
				   url : "${BASE_PATH}/user/"+userid,
				   async : false,
				   type : "PUT",
				   data : {
            		   "username" : username,
            		   "nickname" : nickname,
            		   "sex" : sex,
            		   "studentid" : studentid,
            		   "password" : password,
            		   "safequestion" : safequestion,
            		   "safeanswer" : safeanswer,
            		   "headurl" : headurl,
            		   "contact" : contact
            	   },
            	   dataType : "json",
            	   success : function(result){
            		   alert(result.msg);
            		   console.log(result.msg);
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
 		   
		   //增加
		   $('#sample_editable_1 a.save').live('click', function (e) {
               e.preventDefault();
               //先对要提交给服务器的数据进行校验
               if(!validate_data()){
            	   return false;
               }
               //判断之前的ajax昵称重复是否有效
               if($(this).attr("ajax_validata") == "error"){
                   alert("昵称或学号已经存在，无法保存！");
            	   return false;
               }
               //将填写的数据提交给服务器进行保存,发送ajax请求 保存用户
               var username = $("#save0").val();
		       var nickname = $("#save1").val();
		       var sex = $("#save2").val();
		       var studentid = $("#save3").val();
		       var password = $("#save4").val();
		       var safequestion = $("#save5").val();
		       var safeanswer = $("#save6").val();
		       var headurl = $("#save7").val();
		       var contact = $("#save8").val();
		       var createtime = $("#save9").val();
               $.ajax({
            	   url : "${BASE_PATH}/user",
            	   async : false,
            	   type : "POST",
            	   data : {
            		   "username" : username,
            		   "nickname" : nickname,
            		   "sex" : sex,
            		   "studentid" : studentid,
            		   "password" : password,
            		   "safequestion" : safequestion,
            		   "safeanswer" : safeanswer,
            		   "headurl" : headurl,
            		   "contact" : contact
            	   },
            	   dataType : "json",
            	   success : function(result){
            		   alert(result.msg);
            		   console.log(result.msg);
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
		});
 		
	 	//校验表格数据-增加
		   function validate_data(){
			   var username = $("#save0").val();
		       var sex = $("#save2").val();
		       var studentid = $("#save3").val();
		       var password = $("#save4").val();
		       
		       //校验姓名
		       var regName = /(^[a-zA-Z_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,4})/;
		       var regsex = /^(男|女)$/;
		       var regstudentid = /^[0-9]{6,15}$/;
		       var regPassword = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
		       if (!regName.test(username)){
		    	   alert("姓名只能是2-4位中文 或者 4-16位英文！");
		    	   return false;
		       }else if (!regsex.test(sex)){
		    	   alert("性别只能是男或女！");
		    	   return false;
		       }else if (!regstudentid.test(studentid)){
		    	   alert("学号只能是6-15位数字！");
		    	   return false;
		       }else if (!regPassword.test(password)){
		    	   alert("密码必须6-16位且含有小写字母、大写字母、数字、特殊符号的两种及以上！");
		    	   return false;
		       }
		       return true;
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
						   $("#sample_editable_1 a.save").attr("ajax_validata","error");
						   alert("无效的昵称，昵称已经存在，请重新输入！");
						   $("#save1").focus();
					   }else if(result.code == 1){
						   $("#sample_editable_1 a.save").attr("ajax_validata","success");
					   }
				   }
			   });
		   };
		   //发送ajax请求校验学号是否重复
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
						  $("#sample_editable_1 a.save").attr("ajax_validata","error");
						  alert("无效的学号，学号已经存在，请重新输入！");
						  $("#save3").focus();
					  }else if(result.code == 1){
						  $("#sample_editable_1 a.save").attr("ajax_validata","success");
					  }
				  }
			   });
		   }
		   
		 //校验表格数据-更新
		   function validate_updateData(){
			   var username = $("#update0").val();
		       var sex = $("#update2").val();
		       var studentid = $("#update3").val();
		       var password = $("#update4").val();
		       
		       //校验姓名
		       var regName = /(^[a-zA-Z_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,4})/;
		       var regsex = /^(男|女)$/;
		       var regstudentid = /^[0-9]{6,15}$/;
		       var regPassword = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
		       if (!regName.test(username)){
		    	   alert("姓名只能是2-4位中文 或者 4-16位英文！");
		    	   return false;
		       }else if (!regsex.test(sex)){
		    	   alert("性别只能是男或女！");
		    	   return false;
		       }else if (!regstudentid.test(studentid)){
		    	   alert("学号只能是6-15位数字！");
		    	   return false;
		       }else if (!regPassword.test(password)){
		    	   alert("密码必须6-16位且含有小写字母、大写字母、数字、特殊符号的两种及以上！");
		    	   return false;
		       }
		       return true;
		   }
		   
	</script>
</body>
<!-- END BODY -->
</html>