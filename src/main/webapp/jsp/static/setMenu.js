function setMenu(){
	$('#side-menu').append('<li><a href="#"><i class="fa fa-desktop fa-fw"><div class="icon-bg bg-pink"></div></i><span class="menu-title">个人中心</span><span class="fa arrow"></span></a><ul class="nav nav-second-level"><li><a href="' + baseUrl + 'jsp/modules/center/updatePassword.jsp" onclick="navClick(this, \'个人中心\', \'修改密码\');return false;"><i class="fa fa-align-left"></i><span class="submenu-title">修改密码</span></a></li><li><a id="myinfo" href="' + baseUrl + 'jsp/modules/center/info.jsp" onclick="navClick(this, \'个人中心\', \'个人信息\');return false;"><i class="fa fa-align-left"></i><span class="submenu-title">个人信息</span></a></li></ul></li>');
	var role = window.sessionStorage.getItem('role');
	var menusHtml = '';
	for(var i=0;i<menus.length;i++){
		// 找到当前登录角色的菜单
		if(menus[i].roleName == role){
			var menuHtml = '';
			var menu = menus[i].backMenu;
			for(var j=0;j<menu.length;j++){ 
				// 一级菜单
				menuHtml += '<li><a href="#"><i class="fa fa-desktop fa-fw"><div class="icon-bg bg-pink"></div></i><span class="menu-title">' + menu[j].menu + '</span></a><ul class="nav nav-second-level">';
				
				var menuSubHtml = '';
				var secondMenuName = "";
				var menuChild = menu[j].child;
				for(var k=0;k<menuChild.length;k++){  
					// 二级菜单
					if(secondMenuName == menuChild[k].tableName && secondMenuName != ""){
						menuSubHtml += '<li><a href="${pageContext.request.contextPath}/jsp/modules/' + menuChild[k].tableName + '/graph.jsp" onclick="navClick(this, \'' + menu[j].menu + '\', \'' + menuChild[k].menu + '\');return false;"><i class="fa fa-align-left"></i><span class="submenu-title">' + menuChild[k].menu + '</span></a></li>';
					}else{
						menuSubHtml += '<li><a href="${pageContext.request.contextPath}/jsp/modules/' + menuChild[k].tableName + '/list.jsp" onclick="navClick(this, \'' + menu[j].menu + '\', \'' + menuChild[k].menu + '\');return false;"><i class="fa fa-align-left"></i><span class="submenu-title">' + menuChild[k].menu + '</span></a></li>';
						secondMenuName = menuChild[k].tableName;
					}
				}
				menuHtml += menuSubHtml + '</ul></li>';
			}
			menusHtml += menuHtml;
		}
	}
	$('#side-menu').append(menusHtml);
	if(hasMessage != null && hasMessage == '是' && role == '管理员'){
		$('#side-menu').append('<li><a href="#"><i class="fa fa-desktop fa-fw"><div class="icon-bg bg-pink"></div></i><span class="menu-title">留言管理</span><span class="fa arrow"></span></a><ul class="nav nav-second-level"><li><a href="' + baseUrl + 'jsp/modules/messages/list.jsp" onclick="navClick(this, \'留言管理\', \'留言列表\');return false;"><i class="fa fa-align-left"></i><span class="submenu-title">留言列表</span></a></li></ul></li>');
	}
}

window.navClick = function(obj, rootNavName, subNavName) {
	$('iframe').attr('src', obj.href);
	$('#pageTitle').text(rootNavName);
	$('#breadcrumb').html('<li><i class="fa fa-home"></i>&nbsp;<a href="#">主页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li><li><a href="#">' + rootNavName + '</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li><li class="active">' + subNavName + '</li>');
}