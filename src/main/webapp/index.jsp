<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>入口页</title>

	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/lightbox.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/animate.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/pace.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/all.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/jquery.news-ticker.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/yellow-green.css" id="theme-change" class="style-change color-change">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/xznstatic/css/style-responsive.css">
</head>
<style>

</style>

<body class="sidebar-icons">
	<div id="header-topbar-option-demo" class="page-header-topbar">
		<nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3"
			data-intro="&lt;b&gt;Topbar&lt;/b&gt; has other styles with live demo. Go to &lt;b&gt;Layouts-&gt;Header&amp;Topbar&lt;/b&gt; and check it out."
			class="navbar navbar-default navbar-static-top">
			<div class="navbar-header"><span class="logo-text-icon">µ</span></a></div>
			<div class="topbar-main">
				<ul class="nav navbar navbar-top-links navbar-right mbn">
					<li class="dropdown topbar-user">
						<a data-hover="dropdown" href="#" class="dropdown-toggle">
							<span class="hidden-xs">admin</span>&nbsp;<span class="caret"></span>
						</a>
						<ul class="dropdown-menu dropdown-user pull-right">
							<li><a href="#" onclick="toFront()"><i class="fa fa-tasks"></i>跳到前台</a></li>
							<li><a href="#" onclick="logout()"><i class="fa fa-key"></i>退出</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</div>

	<div id="wrapper">
        <nav id="sidebar" role="navigation" data-step="2"
            data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;" data-position="right"
            class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    <li>
                        <a href="index.jsp">
                            <i class="fa fa-tachometer fa-fw"><div class="icon-bg bg-orange"></div></i>
                            <span class="menu-title">主页</span>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </nav>
        <div id="page-wrapper">
            <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                <div class="page-header pull-left">
                    <div id="pageTitle" class="page-title">主页</div>
                </div>
                <ol id="breadcrumb" class="breadcrumb page-breadcrumb pull-right">
                    <li>
						<i class="fa fa-home"></i>&nbsp;<a href="#">主页</a>
					</li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-lg-12">
						<iframe id="mainIframe" src="${pageContext.request.contextPath}/jsp/modules/home/home.jsp" width="100%" frameborder="0" scrolling="auto" ></iframe>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div class="copyright" style="text-align: center;"></div>
            </div>
        </div>
    </div>

	<script src="${pageContext.request.contextPath}/resources/xznstatic/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/xznstatic/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/xznstatic/js/bootstrap-hover-dropdown.js"></script>

	<script>
		<%@ include file = "jsp/utils/menu.jsp" %>
		<%@ include file = "jsp/static/setMenu.js" %>
		<%@ include file = "jsp/utils/baseUrl.jsp" %>
		// 用户登出
		<%@ include file = "jsp/static/logout.jsp" %>

		$(document).ready(function () {
			//我的后台,session信息转移
			if (window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null') {
				if (window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") ==
					'null') {
					window.sessionStorage.setItem("token", window.localStorage.getItem("Token"));
					window.sessionStorage.setItem("role", window.localStorage.getItem("role"));
					window.sessionStorage.setItem("accountTableName", window.localStorage.getItem("sessionTable"));
					window.sessionStorage.setItem("username", window.localStorage.getItem("adminName"));
				}
			}

			$('.dropdown-toggle .hidden-xs').html(window.sessionStorage.getItem('username'))
			$('.copyright').html('欢迎使用' + projectName)
			var token = window.sessionStorage.getItem("token");
			if (token == "null" || token == null) {
				alert("请登录后再操作");
				window.location.href = ("jsp/login.jsp");
			}
			setMenu();

			if(window.sessionStorage.getItem('role') != '管理员'){
				var accountTableName = window.sessionStorage.getItem('accountTableName');
				$('#myinfo').attr('href', baseUrl + 'jsp/modules/' + accountTableName + '/add-or-update.jsp');
				http(accountTableName+'/session','GET',{},(res)=>{
					if(res.code == 0){
						window.sessionStorage.setItem('id',res.data.id);
						window.sessionStorage.setItem('onlyme',true);
					}					
				});			
			}
		});
	</script>
</body>

</html>