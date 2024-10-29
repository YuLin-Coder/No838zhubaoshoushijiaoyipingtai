<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp"%>
	<!-- font-awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
</head>
<style>

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
						<h3 class="block-title" style="color: red;">剩余 xx 分钟 xx 秒</h3>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">

							<li class="breadcrumb-item"><a href="#">退出
								</a></li>
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
							<h3 class="widget-title">当前第 1 题，剩余 0 题，共 0 题</h3>
							<div class="table-responsive mb-3">
								<form>
									<div class="form-group">
										<label>题目</label>
										<textarea class="form-control" id="questionname" rows="3"></textarea>
									</div>
									<div id="optionsArea" class="form-group">
										<label>选项</label>
										<textarea class="form-control" rows="3" readonly></textarea>
									</div>
									<div id="answerArea" class="form-group">
										<label>答案</label>
									</div>
									<div id="yourAnswer" class="form-group" style="display: none;">
										<label>你的答案</label>
										<input readonly>
										<label style="color: red;">正确</label>
									</div>
									<div id="analysis" class="form-group" style="display: none;">
										<label>解析</label>
										<textarea class="form-control" rows="2" placeholder="解析" readonly></textarea>
									</div>
									<div id="result" class="form-group" style="display: none;">
										<label>考试成绩</label>
										<input readonly>
									</div>

									<button id="submitBtn" type="button" class="btn btn-warning">提交</button>
									<button id="nextBtn" type="button" class="btn btn-success">下一题</button>
								</form>

							</div>
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
	<a id="back-to-top" href="#" class="back-to-top"> <span class="ti-angle-up"></span>
	</a>
	<!-- /Back to Top -->
	<%@ include file="../../static/foot.jsp"%>
	<script language="javascript" type="text/javascript"
		src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>

	<script>

	<%@include file = "../../utils/menu.jsp" %>
		
	<%@include file = "../../static/setMenu.js" %>
		
	<%@include file = "../../utils/baseUrl.jsp" %>
		
	<%@include file = "../../static/getRoleButtons.js" %>
		
	<%@include file = "../../static/crossBtnControl.js" %>
		var tableName = "";
		var pageType = "add-or-update";

		var updateId = "";
		var ruleForm = {};
		var questions = [];
		var current = 1;
		var total = 0;
		var paperId;
		var userId;
		var time = 0;
		var score = 0;

		// 用户登出
		<%@include file = "../../static/logout.jsp" %>


			$(document).ready(function () {

				//隐藏原生搜索框
				$('#tableId_filter').hide()
				//设置右上角用户名
				$('.dropdown-menu h5').html(
					window.sessionStorage.getItem('username'))
				//设置项目名
				$('.sidebar-header h3 a').html(projectName)
				setMenu();
				$('#submitBtn').on('click', function (e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					submitAnswer();
				});
				$('#nextBtn').on('click', function (e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					next();
				});
				init();
			<%@include file = "../../static/myInfo.js" %>
		});

		//初始化准备
		function init() {
			//获取试卷id
			paperId = window.sessionStorage.getItem('paperid');
			window.sessionStorage.removeItem('paperid');
			//获取当前用户id
			getUserId();
			//获取当前试卷题目
			getQuestions();
		}

		//获取当前用户id
		function getUserId() {
			var accountTableName = window.sessionStorage.getItem('accountTableName')
			$.ajax({
				type: "GET",
				url: baseUrl + accountTableName + "/session",
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将用户id保存到全局变量中
						userId = res.data.id
						//删除旧考试记录
						reWrite();
					}
					else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else { alert(res.msg); }
				},
			});
		}

		//获取当前试卷题目
		function getQuestions() {
			$.ajax({
				type: "GET",
				url: baseUrl + "examquestion/page",
				data: {
					sort: "id",
					paperid: paperId,
				},
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将题目保存到全局变量						
						questions = res.data.list;
						total = questions.length;
						//获取时间
						getExamTime();
					} else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else { alert(res.msg); }
				},
			});
		}

		//渲染题目
		function showQuestion() {
			$('#nextBtn').hide();
			//更新考试进度信息
			setProgressMsg();
			//隐藏选项表单项
			$('#optionsArea').hide();
			var question = questions[current - 1];
			//将字符串转成json
			var answerOptions = $.parseJSON(question.options);
			//展示题目类型和分值
			var questionType = '';
			switch (question.type) {
				case 0:
					questionType = '(单选题';
					break;
				case 1:
					questionType = '(多选题';
					break;
				case 2:
					questionType = '(判断题';
					break;
				case 3:
					questionType = '(填空题';
					break;
				default:
					console.log('该题目类型未能识别');
			}
			$('#questionname').val(questionType + " " + question.score + " 分) " + question.questionname);
			//清空作答区域
			$('#answerArea').children().remove()
			if (question.type == 0 || question.type == 2) {
				//单选题和判断题
				$('#answerArea').append("<label>答案</label><select id=\"answerSelect\" class=\"form-control\"></select>");
				for (var i = 0; i < answerOptions.length; i++) {
					var option = document.createElement('option');
					option.setAttribute('class', 'answerOption');
					option.setAttribute('value', answerOptions[i].code);
					option.innerHTML = answerOptions[i].text;
					$('#answerSelect').append(option)
				}
			} else if (question.type == 1) {
				var str = ''
				for (var i = 0; i < answerOptions.length; i++) {
					str = str + answerOptions[i].code + '. ' + answerOptions[i].text + '  ';
				}
				$('#optionsArea textarea').val(str)
				//展示选项表单
				$('#optionsArea').show();
				//渲染答案输入框			
				$('#answerArea').append("<input id=\"answer\" class=\"form-control\" placeholder=\"多个答案用英文逗号隔开\">")
			} else if (question.type == 3) {
				//渲染答案输入框	
				$('#answerArea').append("<textarea id=\"answer\" class=\"form-control\" rows=\"2\" placeholder=\"请输入答案\"></textarea>");
			}
			$('#answerArea').show();
		}

		//设置题目进度文本
		function setProgressMsg() {
			var remain = total - current;
			var msg = "当前第 " + current + " 题,剩余 " + remain + " 题,共 " + total + "题."
			$('.widget-title').html(msg)
		}
		//获取考试时间
		function getExamTime() {
			$.ajax({
				type: "GET",
				url: baseUrl + "exampaper/info/" + paperId,
				contentType: "application/json",
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将考试时间保存到全局变量
						time = res.data.time;
						//每秒更新一次剩余时间
						self.setInterval("setTimeMsg()", 1000);
						console.log("time: " + time)
						//定时结束考试
						setTimeout(function () { examFinish() }, time * 1000);
						//渲染题目
						showQuestion();
					} else if (res.code == 401) {
						<%@include file = "../../static/toLogin.jsp" %>
					} else {
						alert(res.msg)
					}
				},
			});
		}
		//设置时间信息
		function setTimeMsg() {
			if (time > 0) {
				time--;
				var min = parseInt(time / 60);
				var second = time % 60;
				var str = "剩余 " + min + " 分钟, " + second + " 秒";
				$('.block-title').html(str);
			} else {
				$('.block-title').html('考试结束');
			}
		}
		//提交当前题目答案
		function submitAnswer() {
			var question = questions[current - 1];
			var answerStr = '';
			var myScore = 0;
			if (question.type == 0 || question.type == 2) {
				var index = document.getElementById("answerSelect").selectedIndex;
				var answerOptions = document.getElementById("answerSelect").options;
				answerStr = answerOptions[index].value
			} else {
				answerStr = $('#answer').val();
			}
			if (answerStr == question.answer) {
				myScore = question.score;
			}

			$.ajax({
				type: "POST",
				url: baseUrl + "examrecord/save",
				contentType: "application/json",
				data: JSON.stringify({
					analysis: question.analysis,
					answer: question.answer,
					myanswer: answerStr,
					myscore: myScore,
					options: question.options,
					paperid: paperId,
					papername: question.papername,
					questionid: question.id,
					questionname: question.questionname,
					score: question.score,
					userid: userId,
				}),
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						score += myScore;
						$('#yourAnswer input').val(answerStr);
						if (answerStr == question.answer) {
							$('#yourAnswer input').next().html("正确");
						} else {
							$('#yourAnswer input').next().html("错误");
						}
						showResult();
					} else if (res.code == 401) {
						<%@include file = "../../static/toLogin.jsp" %>
					} else {
						alert(res.msg)
					}
				},

			});
		}
		//提交答案后显示结果和解析
		function showResult() {
			//隐藏选项表单项
			$('#optionsArea').hide();
			//隐藏作答区域
			$('#answerArea').hide();
			$('#analysis textarea').html(questions[current - 1].analysis);
			$('#yourAnswer').show();
			$('#analysis').show();
			$('#nextBtn').show();
			$('#submitBtn').hide();
			if (current == total) {
				$('#nextBtn').html("查看考试成绩");
			}
		}
		//继续下一题
		function next() {
			if (current == total) {
				examFinish();
			} else {
				$('#nextBtn').hide();
				$('#submitBtn').show();
				//隐藏答案解析
				$('#yourAnswer').hide();
				$('#analysis').hide();
				current++;
				showQuestion();
			}
		}
		//考试结束，展示成绩
		function examFinish() {
			console.log("考试结束 ");
			$('form div').hide();
			$('#result input').val(score + '分');
			$('#result').show();
			$('#result input').show();
			$('form').append("<button type=\"button\" onclick=\"exit()\">退出</button>");
			$('#nextBtn').remove();
			time = 0;
		}
		//退出考试
		function exit() {
			var flag = confirm("真的要退出吗?");
			if (flag) {
				window.location.href = baseUrl + "jsp/modules/kaoshijilu/list.jsp";
			}

		}
		//重新考试，删除该份试卷之前的考试记录
		function reWrite() {
			$.ajax({
				type: "GET",
				url: baseUrl + "examrecord/deleteRecords",
				data: {
					userid: userId,
					paperid: paperId,
				},
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {

					} else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else {/*alert(res.msg)*/; }
				},
			});
		}	
	</script>
</body>

</html>