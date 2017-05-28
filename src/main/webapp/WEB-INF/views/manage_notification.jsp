<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
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
				<font size="5" face="Comic Sans MS" color="white">Campus</font>
				<font size="5" face="Comic Sans MS" color="red">Life</font>
			</a>
			<!-- END LOGO -->
			<!-- BEGIN HORIZANTAL MENU -->
			<div class="hor-menu hidden-sm hidden-xs">
				<ul class="nav navbar-nav">
					<li>
						<a href="manage_user">用户管理</a>
					</li>
					<li>
						<a href="manage_blog">动态管理</a>                       
					</li>
					<li>
						<a href="manage_used">闲置管理</a>
					</li>
					<li class="active">
						<a href="manage_notification">通知管理</a>
					</li>
					<li>
						<a href="manage_advertisement">广告管理</a>
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
					<img alt="" src="assets/img/avatar1_small.jpg" width="29px" height="29px"/>
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
						Notification Management <small>Management Campus notification</small>
					</h3>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<hr>
			<!-- 显示页面bootstarp -->
			<!-- 按钮 -->
			<div class="row">
				<div class="col-md-4 col-md-offset-10">
					<button class="btn btn-primary" id="notification_add_model_btn">新增</button>
					<button class="btn btn-danger" id="notification_delete_all_btn">删除</button>
				</div>
			</div>
			<!-- 显示数据 -->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="notification_table">
						<thead>
							<tr>
								<th>
									<input type="checkbox" id="check_all"/>
								</th>
								<th>通知ID</th>
								<th>发布人ID</th>
								<th>标题</th>
								<th>内容</th>
								<th>审核状态</th>
								<th>优先级</th>
								<th>创建时间</th>
								<th>审核人ID</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- 分页 -->
			<div class="row">
				<!-- 分页文字信息 -->
				<div class="col-md-6" id="page_info_area">
					
				</div>
				<!-- 分页条信息 -->
				<div class="col-md-6" id="page_nav_area">
					
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
			2017 &copy; 版权归倪吉龙所有.
		</div>
		<div class="footer-tools">
			<span class="go-top">
			<i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div>
	
<!-- add notification model -->
<div class="modal fade" id="notificationAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Notification</h4>
      </div>
      <div class="modal-body">
      	<form class="form-horizontal">
      	  <span id="errorinfo"></span>
		  <div class="form-group">
		    <label for="title_add_input" class="col-sm-2 control-label">标题 :</label>
		    <div class="col-sm-10">
		      <input  type="text" class="form-control" id="title_add_input" placeholder="Title" name="title" size="100">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="content_add_input" class="col-sm-2 control-label">内容 :</label>
		    <div class="col-sm-10">
		      <textarea rows="4" class="form-control" maxlength="2000" id="content_add_input" name="content" placeholder="Content"></textarea>
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="conditionck_add_input" class="col-sm-2 control-label">审核状态 :</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="conditionck_add_input" name="conditionck">
				  <option value="0" selected="selected">未审核</option>
				  <option value="1">审核通过</option>
				  <option value="2">审核未通过</option>
				</select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="priority_add_input" class="col-sm-2 control-label">优先级 :</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="priority_add_input" name="priority">
				  <option value="0" selected="selected">低</option>
				  <option value="1">中</option>
				  <option value="2">高</option>
				</select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="notification_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
<!-- update notification model -->
<div class="modal fade" id="notificationUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Update Notification</h4>
      </div>
      <div class="modal-body">
      	<form class="form-horizontal">
      	  <span id="errorinfo"></span>
		  <div class="form-group">
		    <label for="title_update_input" class="col-sm-2 control-label">标题 :</label>
		    <div class="col-sm-10">
		      <input  type="text" class="form-control" id="title_update_input" placeholder="Title" name="title" size="100">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="content_update_input" class="col-sm-2 control-label">内容 :</label>
		    <div class="col-sm-10">
		      <textarea rows="4" class="form-control" maxlength="2000" id="content_update_input" name="content" placeholder="Content"></textarea>
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="conditionck_update_input" class="col-sm-2 control-label">审核状态 :</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="conditionck_update_input" name="conditionck">
				  <option value="0" selected="selected">未审核</option>
				  <option value="1">审核通过</option>
				  <option value="2">审核未通过</option>
				</select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="priority_update_input" class="col-sm-2 control-label">优先级 :</label>
		    <div class="col-sm-4">
		      <select class="form-control" id="priority_update_input" name="priority">
				  <option value="0" selected="selected">低</option>
				  <option value="1">中</option>
				  <option value="2">高</option>
				</select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="notification_update_btn">更新</button>
      </div>
    </div>
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
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/scripts/app.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   App.init();
		});
		
		var totalRecord,currentPage;
		//页面加载完成以后 直接发送ajax请求，要到数据
		$(function(){
			//去首页
			to_page(1);
		});
		
		//get all notification data
		function to_page(pn){
			$.ajax({
				url:"${BASE_PATH}/getallnotification",
				data:"pn=" +pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					//1、解析并显示notification数据
					build_notification_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		//1、解析并显示notification数据
		function build_notification_table(result){
			$("#notification_table tbody").empty();
			var notification = result.extend.pageInfo.list;
			$.each(notification,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var noid = $("<td></td>").append(item.noid);
				var userid = $("<td></td>").append(item.userid);
				var title = $("<td></td>").append(item.title);
				var content = $("<td></td>").append(item.content);
				var conditionck = $("<td></td>").append(item.conditionck);
				var priority = $("<td></td>").append(item.priority);
				var date = new Date(item.createtime);
				var createtime = $("<td></td>").append(formatDateTime(date));
				var checkuser = $("<td></td>").append(item.checkuser);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前notification id
				editBtn.attr("edit-id",item.noid);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的notification id
				delBtn.attr("del-id",item.noid);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
				  .append(noid)
				  .append(userid)
				  .append(title)
				  .append(content)
				  .append(conditionck)
				  .append(priority)
				  .append(createtime)
				  .append(checkuser)
				  .append(btnTd)
				  .appendTo("#notification_table tbody");
			})
		}
		
		//2、解析并显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页,总"+
					result.extend.pageInfo.pages+"页,总"+
					result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		};
		
		//3、解析显示分页条数据
		function build_page_nav(result){
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			//构建首页、前一页元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum -1);
				});
			}
			//构建末页、后一页元素
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			//添加首页和前一页 
			ul.append(firstPageLi).append(prePageLi);
			//1,2,3,4,5遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 
			ul.append(nextPageLi).append(lastPageLi);
			
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		};
		 
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		} 
		
		//点击新增按钮弹出模态框。
		$("#notification_add_model_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#notificationAddModel form");
			//弹出模态框
			$("#notificationAddModel").modal({
				backdrop:"static"
			});
		});
		
		//保存
		$("#notification_save_btn").click(function(){
			if(validate_data("#title_add_input","#content_add_input") == false){
				return false;
			}
			$.ajax({
				url : "${BASE_PATH}/manageraddnotification",
				type : "POST",
				data : $("#notificationAddModel form").serialize(),
				success : function(result){
					if(result.code == 1){
						//员工保存成功；
						//1、关闭模态框
						$("#notificationAddModel").modal('hide');
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
					}
				}
			});
		});
		
		//validate data
		function validate_data(tit,con){
			var title = $(tit).val();
			var content = $(con).val();
			if(title == "" || content == ""){
				if(title == ""){
					show_validate_msg(tit, "error", "标题必须填写！");
				}else{
					$(tit).parent().removeClass("has-success has-error");
					$(tit).next("span").text("");
				}
				if(content == ""){
					show_validate_msg(con, "error", "内容必须填写！");
				}else{
					$(con).parent().removeClass("has-success has-error");
					$(con).next("span").text("");
				}
				return false;
			}else{
				return true;
			}
		}
		
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//uppdate notification
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click",".edit_btn",function(){
			//1、查出notification信息
			getNotification($(this).attr("edit-id"));
			
			$("#notificationUpdateModel").modal({
				backdrop:"static"
			});
			//2、把notification的id传递给模态框的更新按钮
			$("#notification_update_btn").attr("edit-id",$(this).attr("edit-id"));
		});
		
		//get notification
		function getNotification(noid){
			$.ajax({
				url : "${BASE_PATH}/onenotification/"+noid,
				type : "get",
				success : function(result){
					var notificationData = result.extend.notification;
					$("#title_update_input").val(notificationData.title);
					$("#content_update_input").val(notificationData.content);
					$("#conditionck_update_input").val([notificationData.conditionck]);
					$("#priority_update_input").val([notificationData.priority]);
				}
			});
		}
		
		//update notification
		$("#notification_update_btn").click(function(){
			if(validate_data("#title_update_input","#content_update_input") == false){
				return false;
			}
			$.ajax({
				url : "${BASE_PATH}/managerupdatenotification/" + $(this).attr("edit-id"),
				type : "PUT",
				data : $("#notificationUpdateModel form").serialize(),
				success : function(result){
					if(result.code == 1){
						//员工保存成功；
						//1、关闭模态框
						$("#notificationUpdateModel").modal('hide');
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(currentPage);
					}
				}
			});
		})
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var title = $(this).parents("tr").find("td:eq(3)").text();
			var noids = $(this).attr("del-id");
			if(confirm("确认删除【"+title+"】吗？")){
				//确认，发送ajax请求删除即可
				$.ajax({
					url:"${BASE_PATH}/managerdeletenotification/"+noids,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页
						to_page(currentPage);
					}
				});
			}
		});
		
		//完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked",$(this).prop("checked"))
		});
		
		//check_item
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked",flag);
		})
		
		//批量删除
		$("#notification_delete_all_btn").click(function(){
			var titles = "";
			var noids = "";
			$.each($(".check_item:checked"),function(){
				titles += $(this).parents("tr").find("td:eq(3)").text() + ",";
				noids += $(this).parents("tr").find("td:eq(1)").text() + "-";
			})
			titles = titles.substring(0, titles.length-1 );
			noids = noids.substring(0, noids.length-1 );
			if(confirm("确认删除【"+titles+"】吗")){
				//确认，发送ajax请求删除即可
				$.ajax({
					url:"${BASE_PATH}/managerdeletenotification/"+noids,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页
						to_page(currentPage);
					}
				});
			}
		});
		
		var formatDateTime = function (date) {  
		    var y = date.getFullYear();  
		    var m = date.getMonth() + 1;  
		    m = m < 10 ? ('0' + m) : m;  
		    var d = date.getDate();  
		    d = d < 10 ? ('0' + d) : d;  
		    var h = date.getHours();  
		    var minute = date.getMinutes();  
		    minute = minute < 10 ? ('0' + minute) : minute;  
		    return y + '-' + m + '-' + d+' '+h+':'+minute;  
		}; 
	</script>
</body>
<!-- END BODY -->
</html>