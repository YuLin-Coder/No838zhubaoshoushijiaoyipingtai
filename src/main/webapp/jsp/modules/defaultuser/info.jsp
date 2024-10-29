<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="../../static/head.jsp"%>
<link
	href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript" charset="utf-8">
	window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
</script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
	.container {
		max-width: 1800px;
	}
</style>
<body>
	<!-- Pre Loader -->
	<div class="loading">
		<div class="spinner">
			<div class="double-bounce1"></div>
			<div class="double-bounce2"></div>
		</div>
	</div>
	<!--/Pre Loader -->
	<div class="wrapper">
		<!-- Page Content -->
		<div id="content">
			<!-- Top Navigation -->
			<%@ include file="../../static/topNav.jsp"%>
			<!-- Menu -->
			<div class="container menu-nav">
				<nav class="navbar navbar-expand-lg lochana-bg text-white">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="ti-menu text-white"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto" id="navUl">

						</ul>
					</div>
				</nav>
			</div>
			<!-- /Menu -->
			<!-- Breadcrumb -->
			<!-- Page Title -->
			<div class="container mt-0">
				<div class="row breadcrumb-bar">
					<div class="col-md-6">
						<h3 class="block-title">编辑注册用户信息</h3>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/index.jsp"> <span
									class="ti-home"></span>
							</a></li>
							<li class="breadcrumb-item">注册用户信息管理</li>
							<li class="breadcrumb-item active">编辑注册用户信息</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /Page Title -->

			<!-- /Breadcrumb -->
			<!-- Main Content -->
			<div class="container">

				<div class="row">
					<!-- Widget Item -->
					<div class="col-md-12">
						<div class="widget-area-2 lochana-box-shadow">
							<h3 class="widget-title">注册用户信息信息</h3>
							<form id="addOrUpdateForm">
								<div class="form-row">
									<input id="updateId" name="id" type="hidden">
									<div class="form-group col-md-6">
										<label>用户名</label> <input id="username" name="username"
											class="form-control" v-model="ruleForm.username" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>密码</label> <input id="mima" name="mima"
											class="form-control" v-model="ruleForm.mima" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>姓名</label> <input id="name" name="name"
											class="form-control" v-model="ruleForm.name" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>性别</label> <input id="sex" name="sex"
											class="form-control" v-model="ruleForm.sex" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>手机</label> <input id="phone" name="phone"
											class="form-control" v-model="ruleForm.phone" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>邮箱</label> <input id="email" name="email"
											class="form-control" v-model="ruleForm.email" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>照片</label> <img id="pictureImg" src="" width="100"
											height="100">
									</div>

									<div class="form-group col-md-6">
										<label>年龄</label> <input id="age"
											name="age" class="form-control"
											v-model="ruleForm.age" readonly>
									</div>

									<div class="form-group col-md-6">
										<label>创建时间</label> <input id="addtime" name="addtime"
											class="form-control" v-model="ruleForm.addtime" readonly>
									</div>

									<div class="form-group col-md-6 mb-3">
										<button id="exitBtn" type="button"
											class="btn btn-primary btn-lg">返回</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /Widget Item -->
				</div>
			</div>
			<!-- /Main Content -->
		</div>
		<!-- /Page Content -->
	</div>
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top"> <span
		class="ti-angle-up"></span>
	</a>
	<!-- /Back to Top -->
	<%@ include file="../../static/foot.jsp"%>
	<script
		src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>

	<script>
		
	<%@ include file="../../utils/menu.jsp"%>
		
	<%@ include file="../../static/setMenu.js"%>
		
	<%@ include file="../../utils/baseUrl.jsp"%>
		var tableName = "defaultuser";
		var pageType = "add-or-update";
		var updateId = "";

		var ruleForm = {};
		var vm = new Vue({
			el : '#addOrUpdateForm',
			data : {
				ruleForm : {},
			},
			beforeCreate : function() {
				var id = window.sessionStorage.getItem("id");
				if (id != null && id != "" && id != "null") {
					$.ajax({
						type : "GET",
						url : baseUrl + "defaultuser/info/" + id,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("token", window.sessionStorage
									.getItem('token'));
						},
						success : function(res) {
							if (res.code == 0) {
								vm.ruleForm = res.data;
							} else if (res.code == 401) {
								<%@ include file="../../static/toLogin.jsp"%>
							} else {
								alert(res.msg)
							}
						},
					});
				}
			},
			methods : {}
		});


		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				$("#submitBtn").addClass("修改");
				updateId = id;
				window.sessionStorage.removeItem('id');
				$.ajax({
					type : "GET",
					url : baseUrl + "defaultuser/info/" + id,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							ruleForm = res.data
							showImg();
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg);
						}
					},
				});
			} else {
				$("#submitBtn").addClass("新增");
			}
		}

		//图片显示
		function showImg() {
			var pictureFileName = "\"" + ruleForm.picture + "\"";
			$("#pictureImg").attr("src",
					baseUrl + "upload/" + ruleForm.picture);
		}
		function exit() {
			window.sessionStorage.removeItem("id");
			window.location.href = "list.jsp";
		}
		// 下载
		function download(fileName) {
			var url = baseUrl + 'file/download?fileName=' + fileName;
			window.open(url);
		}

		$(document).ready(function() {
			setMenu();
			$('#exitBtn').on('click', function(e) {
				e.preventDefault();
				exit();
			});
			getDetails();
		});
		// 用户登出
	<%@ include file="../../static/logout.jsp"%>
		
	</script>
</body>

</html>