<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>$projectName</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets2/js/jquery.min.js"></script>

<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets2/css/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets2/css/loader-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets2/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets2/css/signin.css">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets2/ico/minus.png">
</head>

<style>
	.error{
		color:red;
	}
</style>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<div class="container">

		<div class="" id="login-wrapper">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div id="logo-login">
						<h1>$projectName</h1>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="account-box">
						<form id="registerForm" action="" method="post">
																																		<div class="form-group">
										<label>工号</label> 
										<input type="text" name="gonghao" placeholder="工号" class="form-control">
										</div>
																																				<div class="form-group">
										<label>密码</label> 
										<input type="text" name="mima" placeholder="密码" class="form-control">
										</div>
																																				<div class="form-group">
										<label>姓名</label> 
										<input type="text" name="xingming" placeholder="姓名" class="form-control">
										</div>
																																																					<div class="form-group">
										<label>手机</label> 
										<input type="text" name="shouji" placeholder="手机" class="form-control">
										</div>
																																				<div class="form-group">
										<label>邮箱</label> 
										<input type="text" name="youxiang" placeholder="邮箱" class="form-control">
										</div>
																																																																																																			<button id="submitBtn" class="btn btn btn-primary pull-right" type="button">注 册</button>
						</form>

						<div class="row-block">
							<div class="row"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<p>&nbsp;</p>


	</div>

	<!--  END OF PAPER WRAP -->

	<!-- MAIN EFFECT -->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/preloader.js"></script>-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap.js"></script>
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/app.js"></script>-->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/load.js"></script>-->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/main.js"></script>-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>

	<!--<script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script> -->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/map/gmap3.js"></script> -->
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<script type="text/javascript">
		
	<%@ include file="../../utils/menu.jsp"%>
		
	<%@ include file="../../utils/baseUrl.jsp"%>

		// 表单校验
		function validform() {
			return $("#registerForm").validate({ 
				rules: {
																													mima: {
															required: true,
														},
																								xingming: {
															required: true,
														},
																								xingbie: {
														},
																								shouji: {
															isPhone: true,
														},
																								youxiang: {
															email: true,
														},
																								zhaopian: {
														},
																								shenfenzheng: {
															isIdCardNo:true,
														},
																								beizhu: {
														},
																								money: {
															number: true,
														},
															},
				messages: {
																													mima: {
															required: "密码不能为空",
														},
																								xingming: {
															required: "姓名不能为空",
														},
																								xingbie: {
														},
																								shouji: {
															isPhone: "请输入正确格式的手机号码",	
														},
																								youxiang: {
															email: "请输入正确格式的邮箱",
														},
																								zhaopian: {
														},
																								shenfenzheng: {
															isIdCardNo:"请输入正确的身份证号",
														},
																								beizhu: {
														},
																								money: {
															number: "请输入数字",
														},
															}
			}).form();
		}
		// 添加表单校验方法
		function addValidation(){
			jQuery.validator.addMethod("isPhone", function(value, element) {
					var length = value.length;
					var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}

		// 表单提交
		function submit() {
			if(validform() ==true){
				let data = {};
				let value = $('#registerForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				$.ajax({ 
					type: "POST",
					url: baseUrl + "yuangongxinxi/register",
					contentType: "application/json",
					data:json,
					beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
					success: function(res){    
						if(res.code == 0){
						alert("注册成功!");
						window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
						}else if(res.code == 401){
							<%@ include file="../../static/toLogin.jsp"%> 	
						}else{
							alert(res.msg)
						}
					},
				});      
			}else{
				alert("表单未填完整或有错误");
			}
		}    

		function ready() {
			addValidation();
			//注册表单验证
		    $(validform());
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
		}
		document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>

</html>
