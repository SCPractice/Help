<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>受雇者登录页面</title>
<link href="Employee/css/EmployeeLoginStyle.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="login">
	<h2></h2>
	<div class="login-top">
		<h1>登录页面</h1>
		<div class="tip">
			<s:property value="#request.tip"/>
			<s:fielderror />
		</div>
		<s:form action="EmployeeLogin" method="post" theme="simple">
			<s:textfield name="employee.employeeID" placeholder="请输入您的学号" />
			<s:password name="employee.employeePassword" placeholder="请输入密码" />
	    <div class="forgot">
	    	<a href="#">忘记密码？</a>
	    	<s:submit value="登录" theme="simple"/>
	    </div>
	    </s:form>
	</div>
	<div class="login-bottom-employee">
		<h3>没有账号？&nbsp;<a href="EmployeeRegisterHome.jsp">点此注册</a></h3>
	</div>
</div>	
<div class="copyright">
	<p>Copyright &copy; 2016 Clouds Help项目开发小组</p>
</div>
</body>
</html>