<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>用户注册</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/animate.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/all.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/pink-violet.css" id="theme-change" class="style-change color-change">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/style-responsive.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/jquery.min.js"></script>

	<style type="text/css">
		.error{ color: red; }
	</style>
</head>

<body id="signup-page">
	<div class="page-form">
        <form id="registerForm" action="" method="post" class="form">
            <div class="header-content">
                <h1>用户注册</h1>
            </div>
            <div class="body-content">
				<div class="form-group">
                    <div class="input-icon right">
                        <input type="text" placeholder="请输入用户账号" name="yonghuzhanghao" class="form-control">
                    </div>
                </div>
				<div class="form-group">
                    <div class="input-icon right">
                        <input type="text" placeholder="请输入用户姓名" name="yonghuxingming" class="form-control">
                    </div>
                </div>
				<div class="form-group">
                    <div class="input-icon right">
                        <input type="password" placeholder="请输入密码" name="mima" class="form-control">
                    </div>
                </div>
				<div class="form-group">
                    <div class="input-icon right">
                        <input type="text" placeholder="请输入联系电话" name="lianxidianhua" class="form-control">
                    </div>
                </div>
				<div class="form-group">
                    <div class="input-icon right">
                        <input type="text" placeholder="请输入电子邮箱" name="dianziyouxiang" class="form-control">
                    </div>
                </div>
                <hr>
                <div class="form-group mbn">
                    <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="btn btn-warning">返 回</a>
                    <button id="submitBtn" type="button" class="btn btn-info pull-right">注 册</button>
                </div>
            </div>
        </form>
    </div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
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
							yonghuxingming: {
					required: true,
				},
										mima: {
					required: true,
				},
										xingbie: {
				},
										lianxidianhua: {
				},
										dianziyouxiang: {
					email: true,
				},
										money: {
					number: true,
				},
									},
				messages: {
					yonghuxingming: {
						required: "用户姓名不能为空",
					},
					mima: {
						required: "密码不能为空",
					},
					xingbie: {
					},
					lianxidianhua: {
					},
					dianziyouxiang: {
						email: "请输入正确格式的邮箱",
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
			if(validform()) {
				let data = {};
				let value = $('#registerForm').serializeArray();
				$.each(value, function (index, item) { 
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				$.ajax({ 
					type: "POST",
					url: baseUrl + "yonghu/register",
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
			}else {
				alert("表单未填完整或有错误");
			}
		}    

		function ready() {
			addValidation();
			//注册表单验证
		    $(validform());
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				submit();
			});
		}
		document.addEventListener("DOMContentLoaded", ready);
	</script>
</body>

</html>
