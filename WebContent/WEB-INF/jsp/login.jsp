﻿<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<html>
<head>
<title>投票表决系统-管理员登陆</title>
<style type="text/css">
*{margin:0;padding:0}

.logindiv {
	background-image: url(images/login.jpg);
	repeat: none;
	position: absolute;
	width: 1022px;
	height: 509px;
	left: 514px;
	top: 50%;
	margin-left: -400px;
	margin-top: -267px;
}

 .username {
	position:absolute;
	left:50%;
  	top:50%; 
	margin-left:95px;
  	margin-top:35px;
}
.pw {
	position:absolute; 
	left:50%;
  	top:50%; 
	margin-left:95px;
  	margin-top:70px;
}
.login {
	position:absolute; 
	left:50%;
  	top:50%; 
	margin-left:230px;
  	margin-top:70px;
} 
</style>
</head>

<body  bgcolor="#C0C0C0">

<form id="login" action="${root}/login!login.do" method="post">
    <div class="logindiv">
    </div>
    	<div class="username">
    		<input id="username" name="username" type="text" size="16">  
  	</div>
		<div class="pw">
    		<input id="password" name="password" type="password"  size="16">    
    	</div>
    	
   		<div class="login">
        	<input type="submit" id="submit" value="  登录   ">
        </div>
</form>

</body>
</html>
