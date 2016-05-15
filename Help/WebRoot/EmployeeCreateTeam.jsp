<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="cn.edu.zjut.po.Employee"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%	int curPage = 1;
	int pageCount=1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>招募信息</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet" href="Employee/css/normalize.css" />
<link rel="stylesheet" href="Employee/css/font-awesome.css" />
<link rel="stylesheet" href="Employee/css/bootstrap.min.css" />
<link rel="stylesheet" href="Employee/css/templatemo-style.css" />
<link rel="stylesheet" href="Employee/css/menuList.css" />
<link rel="stylesheet" href="Employee/css/chinaz.css" />
<script src="Employee/js/jquery-latest.min.js" type="text/javascript"></script>
<script src="Employee/js/chinaz.js"></script>
<script src="Employee/js/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>
	<div class="page-section" id="about">
		
		<div class="tip">
		<font color="red">
			<s:property value="#request.tip"/>
			<s:fielderror />
		</font>
		</div>
		
		<div class="row">
			<form action="employeeCreateTeam" method="post">
				<fieldset class="col-md-4 col-sm-6">
					<p>队伍名：</p>
					<input type="text" name="igroup.groupName" />
				</fieldset>
				<fieldset class="col-md-12 col-sm-12">
					<p>队伍宣言：</p>
					<textarea name="igroup.groupDescribe" cols="30" rows="6"></textarea>
				</fieldset>
				<fieldset class="col-md-12 col-sm-12">
					<input type="submit" class="button big default" value="创建队伍" />
				</fieldset>
			</form>
		</div>
	</div>

	<script src="Employee/js/jquery.min.js"></script>
</body>
</html>