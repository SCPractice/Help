<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <meta charset="utf-8"/>
        <title>招募信息</title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        
        <link rel="stylesheet" href="Employee/css/normalize.css"/>
        <link rel="stylesheet" href="Employee/css/font-awesome.css"/>
        <link rel="stylesheet" href="Employee/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="Employee/css/templatemo-style.css"/>
        <link rel="stylesheet" href="Employee/css/menuList.css"/>
        <link rel="stylesheet" href="Employee/css/chinaz.css"/>
  		<script src="Employee/js/jquery-latest.min.js" type="text/javascript"></script>
		<script src="Employee/js/chinaz.js"></script>
        <script src="Employee/js/vendor/modernizr-2.6.2.min.js"></script>
        <script>
		$(function(){
			<%if(session.getAttribute("teamMemberList")==null){%>
				showDiv("no-team");
			<%}else{%>
				showDiv("have-team");
			<%}%>
    	})
    	
  		function showDiv(name){//只显示特定block的内容
      		if("no-team"==name){
    			document.getElementById(name).style.display="block";
    			document.getElementById("have-team").style.display="none";
    			
   			}
   			if("have-team"==name){
   				document.getElementById(name).style.display="block";
    			document.getElementById("no-team").style.display="none";
    			
   			}
   			
  		}
  		</script>
</head>
<body>

	
<div class="page-section" id="about" >
	<div class="row">
		<div class="col-md-12">
			<h4 class="widget-title" style="font-size: 25px;font-weight: 600;margin-bottom:30px">我的团队</h4>
		</div>
	</div>
	<div id="no-team">
		<p>您当前没有队伍，您可以选择<a href="EmployeeCreateTeam.jsp"><font color="red">创建队伍</font></a>or
			<a href="SearchGroup.jsp"><font color="blue">加入其他队伍</font></a>
		</p>
	</div>
	<div id="have-team">
		<p>队伍名:<s:property value="#session.igroup.groupName"/></p>
		<table>
		<tr align="center"><th>成员名&nbsp;&nbsp;</th><th>成员用户名</th></tr>
		<s:iterator value="teamMemberList">
			<tr align="center">
				<td><s:property value="employeeName"/></td>
				<td><s:property value="employeeUserName"/></td>
			</tr>
		</s:iterator>
		</table>
		<a href="employeeExitTeam"><font color="red"></>退出当前队伍</font></a>
	</div>
</div>

<script src="Employee/js/jquery.min.js"></script>
</body>
</html>