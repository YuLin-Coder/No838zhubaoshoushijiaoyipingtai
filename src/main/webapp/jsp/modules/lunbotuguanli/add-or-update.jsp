<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp"%>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
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
	.error {
		color: red;
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
						data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="ti-menu text-white"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul id="navUl" class="navbar-nav mr-auto">

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
						<h3 class="block-title">编辑区域</h3>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="${pageContext.request.contextPath}/index.jsp">
									<span class="ti-home"></span>
								</a>
							</li>
							<li class="breadcrumb-item">轮播图信息管理</li>
							<li class="breadcrumb-item active">编辑区域</li>
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
							<h3 class="widget-title">轮播图信息</h3>
							<form id="addOrUpdateForm">
								<div class="form-row">
									<input id="updateId" name="id" type="hidden">


									<div class="form-group col-md-6">
										<label>value</label>
										<img id="valueImg" src="" width="100" height="100">
										<input name="file" type="file" id="valueupload" class="form-control-file">
										<input name="value" id="value-input" type="hidden">
									</div>

									<div class="form-group col-md-6 mb-3">
										<button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
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
	<a id="back-to-top" href="#" class="back-to-top">
		<span class="ti-angle-up"></span>
	</a>
	<!-- /Back to Top -->
	<%@ include file="../../static/foot.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		<%@include file = "../../utils/menu.jsp" %>
		<%@include file = "../../static/setMenu.js" %>
		<%@include file = "../../utils/baseUrl.jsp" %>   	

		var tableName = "config";
		var pageType = "add-or-update";
		var updateId = "";

		var ruleForm = {};

		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) {
					data[item.name] = item.value;
				});
                data["name"] = "picture2";
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '修改成功';
				} else {
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("config/" + urlParam, "POST", data, (res) => {
					if (res.code == 0) {
						window.sessionStorage.removeItem('id');
						window.location.href = "list.jsp";
						alert(successMes);
					}
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}
		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules: {},
				messages: {}
			}).form();
		}

		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				$("#submitBtn").addClass("修改");
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("config/info/" + id, "GET", {}, (res) => {
					if (res.code == 0) {
						ruleForm = res.data;
						showImg();
						dataBind();
						//注册表单验证
						$(validform());
					}
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}
		function upload() {
			$('#valueupload').fileupload({
				url: baseUrl + 'file/upload',
				headers: { token: window.sessionStorage.getItem("token") },
				dataType: 'json',
				done: function (e, data) {
					document.getElementById('value-input').setAttribute('value', baseUrl + "upload/" + data.result.file);
					$("#valueImg").attr("src", baseUrl + "upload/" + data.result.file);
				}
			});
		}
		//图片显示
		function showImg() {
			var valueFileName = "\"" + ruleForm.value + "\"";
			$("#valueImg").attr("src", ruleForm.value);
		}
		function dataBind() {
			$('#updateId').val(ruleForm.id);
			// $('#name').val(ruleForm.name);
			$('#value-input').val(ruleForm.value);
		}
		$(document).ready(function () {
			setMenu();
			upload();
			getDetails();
			$('#submitBtn').on('click', function (e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
		});
		// 用户登出
        <%@include file = "../../static/logout.jsp" %>		
	</script>
</body>

</html>