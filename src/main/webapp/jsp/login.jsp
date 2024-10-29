<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>珠宝首饰交易平台</title>
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
</head>

<body id="signin-page">
	<div class="page-form">
        <form id="loginForm" action="" method="post" class="form">
            <div class="header-content">
                <h1>珠宝首饰交易平台</h1>
            </div>
            <div class="body-content">
                <div class="form-group">
                    <div class="input-icon right">
                        <input type="text" placeholder="用户名" id="username" name="username" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon right">
                        <input type="password" placeholder="密码" name="password" class="form-control" required>
                    </div>
                </div>
                <div id="submitBtn" class="form-group"><button type="submit" class="btn btn-success" style="width: 100%;" onclick="login()">登 录</button>
                </div>
                <div class="clearfix"></div>
                <hr>
                <div class="row mbm text-center">
                    <div class="col-md-4"><a href="modules/yonghu/register.jsp" class="btn btn-sm btn-facebook btn-block">用户注册</a></div>
                </div>
            </div>
        </form>
    </div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	
	<script type="text/javascript">
		
		<%@ include file="utils/menu.jsp"%>
		
		<%@ include file="utils/baseUrl.jsp"%>

		var role = "";
		var accountTableName = "";
		//渲染角色选择
		function setRoleOption() {
			for (var i = 0; i < menus.length; i++) {
				var divRoot = document.createElement('div');
				divRoot.setAttribute('class', 'form-group');

				var divRootChild = document.createElement('div');
				divRootChild.setAttribute('class', 'checkbox-list');

				var label = document.createElement('label');

				var radio = document.createElement('input');
				radio.setAttribute('type', 'radio');
				radio.setAttribute('name', 'chk');
				radio.setAttribute('value', menus[i].roleName);
				var attr = "checkRole(" + "\'" + menus[i].roleName + "\',\'" + menus[i].tableName + "\')";
				radio.setAttribute('onclick', attr);

				label.appendChild(radio);
				label.innerHTML += '&nbsp;' + menus[i].roleName;

				divRootChild.appendChild(label);
				divRoot.appendChild(divRootChild);
				$('#submitBtn').before(divRoot);
			}
		}
		function checkRole(roleName, tableName) {			
			role = roleName;
			$('#loginForm').attr('action', baseUrl + tableName + '/login');
			accountTableName = tableName;
		}
		function login() {
			$("#loginForm").ajaxForm(function(res) {
				if (role == "" || role == null) {
					alert("请选择角色后再登录");
				} else {
					if (res.code == 0) {
						alert("登录成功");
						var username = $('#username').val();
						window.sessionStorage.setItem('accountTableName',accountTableName)
						window.sessionStorage.setItem('username',username);
						window.sessionStorage.setItem('token', res.token);
						window.sessionStorage.setItem('role', role);
						window.location.href = "${pageContext.request.contextPath}/index.jsp";
					} else {
						alert(res.msg);
					}
				}
			});
		}
		function ready() {
			setRoleOption();
		}
		document.addEventListener("DOMContentLoaded", ready);
	</script>
</body>

</html>
