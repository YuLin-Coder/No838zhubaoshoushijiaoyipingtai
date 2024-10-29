<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

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
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
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
											class="form-control" placeholder="用户名">
									</div>

									<div class="form-group col-md-6">
										<label>密码</label> <input id="mima" name="mima"
											class="form-control" placeholder="密码">
									</div>

									<div class="form-group col-md-6">
										<label>姓名</label> <input id="name" name="name"
											class="form-control" placeholder="姓名">
									</div>

									<div class="form-group col-md-6">
										<label>性别</label> <select id="sexSelect" name="sex"
											class="form-control">
											<option value=" "></option>
											<option class="sexOption" value="男">男</option>
											<option class="sexOption" value="女">女</option>
										</select>

									</div>

									<div class="form-group col-md-6">
										<label>手机</label> <input id="phone" name="phone"
											class="form-control" placeholder="手机">
									</div>

									<div class="form-group col-md-6">
										<label>邮箱</label> <input id="email" name="email"
											class="form-control" placeholder="邮箱">
									</div>

									<div class="form-group col-md-6">
										<label>照片</label> <img id="pictureImg" src="" width="100"
											height="100"> <input name="file" type="file"
											id="pictureupload" class="form-control-file"> <label
											id="pictureFileName">{{ruleForm.picture}}</label> <input
											name="picture" id="picture-input" type="hidden">
									</div>

									<div class="form-group col-md-6">
										<label>年龄</label> <input id="age"
											name="age" type="number" class="form-control" placeholder="年龄">
									</div>

									<div class="form-group col-md-6">
										<label>创建时间</label> <input id="addtime" name="addtime"
											class="form-control" readonly="readonly">
									</div>

									<div class="form-group col-md-6 mb-3">
										<button id="submitBtn" type="button"
											class="btn btn-primary btn-lg">提交</button>
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
		src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>

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

		// 文件上传
		function upload() {
			$('#pictureupload')
					.fileupload(
							{
								url : baseUrl + 'file/upload',
								headers : {
									token : window.sessionStorage
											.getItem("token")
								},
								dataType : 'json',
								done : function(e, data) {
									document.getElementById('picture-input')
											.setAttribute('value',
													data.result.file);
									document.getElementById('pictureFileName').innerHTML = data.result.file
											+ "";
									$("#pictureImg").attr(
											"src",
											baseUrl + "upload/"
													+ data.result.file);
								}
							});
		}

		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function(index, item) {
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '修改成功';
				} else {

					urlParam = 'save';
					successMes = '添加成功';
				}
				$.ajax({
					type : "POST",
					url : baseUrl + "defaultuser/" + urlParam,
					contentType : "application/json",
					data : json,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							window.sessionStorage.removeItem('id');
							alert(successMes);
							window.location.href = "list.jsp";
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg)
						}
					},
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					mima : {
						required : true,
					},
					name : {},
					sex : {},
					phone : {
						isPhone : true,
					},
					email : {
						email : true,
					},
					picture : {},
					age : {},
					addtime : {},
				},
				messages : {
					mima : {
						required : "密码不能为空",
					},
					name : {
						required : "姓名不能为空",
					},
					sex : {},
					phone : {
						isPhone : "请输入正确格式的手机号码",
					},
					email : {
						email : "请输入正确格式的邮箱",
					},
					picture : {},
					age : {},			
					addtime : {},
				}
			}).form();
		}

		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
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
							// 设置图片src
							showImg();
							// 数据填充
							dataBind();					
							//注册表单验证
							$(validform());
						} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
							alert(res.msg);
						}
					},
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}

		// 清除可能会重复渲染的selection
		function clear(className) {
			var elements = document.getElementsByClassName(className);
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}

		function calculation() {
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;
		}
		function calculationSE(colName) {
			//单列求和接口
			$.ajax({
				type : "GET",
				url : baseUrl + "defaultuser" + colName,
				data : {
					tableName : "defaultuser",
					columnName : colName
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("token", window.sessionStorage
							.getItem('token'));
				},
				success : function(res) {
					if (res.code == 0) {
						$("#" + colName).attr("value", res.data);
					} else if (res.code == 401) {
						<%@ include file="../../static/toLogin.jsp"%>
					} else {
						alert(res.msg);
					}
				},
			});
		}

		function dataBind() {
			$("#updateId").val(ruleForm.id);
			$("#username").val(ruleForm.username);
			$("#mima").val(ruleForm.mima);
			$("#name").val(ruleForm.name);
			var sexOptions = document
					.getElementsByClassName("sexOption");
			for (var sexCount = 0; sexCount < sexOptions.length; sexCount++) {
				if (sexOptions[sexCount].getAttribute('value') == ruleForm.sex) {
					sexOptions[sexCount].setAttribute('selected',
							'selected');
				}
			}
			$("#phone").val(ruleForm.phone);
			$("#email").val(ruleForm.email);
			$("#picture-input").val(ruleForm.picture);
			$("#age").val(ruleForm.age);
			$("#addtime").val(ruleForm.addtime);
		}
		//图片显示
		function showImg() {
			var pictureFileName = "\"" + ruleForm.picture + "\"";
			$("#pictureImg").attr("src",
					baseUrl + "upload/" + ruleForm.picture);
		}

		$(document).ready(function() {
			//设置导航栏菜单
			setMenu();
			getDetails();
			//初始化上传按钮
			upload();
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
		});
		// 用户登出
	<%@ include file="../../static/logout.jsp"%>
		
	</script>
</body>

</html>