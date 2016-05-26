<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="cn.edu.zjut.po.Employee"%>
<%@ page import="java.util.List"%>
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
<!-- send message -->
<script type="text/javascript">
  function createRequest(url){
    var xmlHttp = false;
    try {
    xmlHttp = new XMLHttpRequest();
    } catch (trymicrosoft) {
        try {
        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (othermicrosoft) {
            try {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (failed) {
                xmlHttp = false;
            }
        }
    }

    if (!xmlHttp || xmlHttp==false)
    alert("Error initializing XMLHttpRequest!");
    else {
    xmlHttp.open("GET", url, true);
    xmlHttp.onreadystatechange=processRequest;
    xmlHttp.send(null);
    }
  } 
   function processRequest() {
         if (http_request.readyState == 4) {
             if (http_request.status == 200) {
             } else {
                 alert("服务器繁忙，信息发送失败");
             }
         }
     }
  function callserver(){
      var content=document.getElementById("cid").value;
      if(content==""||content==null){
          alert("输入信息不能为空")
      }
      else {
      var groupID=document.getElementById("groupid").value;
      var url="chatsend?content="+content+"&groupID="+groupID;
      createRequest(url);
      document.getElementById("cid").value="";
      }
  }
  function dosend(e){
  if(e.keyCode==13){
  callserver();
  }
  }
</script>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<h4 class="widget-title" style="font-size: 25px;font-weight: 600;margin-bottom:30px">我的团队</h4>
		</div>
	</div>
	<div>
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
		<a href="employeeExitTeam"><font color="red">退出当前队伍</font></a>
	</div>
	<div>
	<hr/>
	    <p><input type="hidden"  id="groupid" name="chatgroup" value="${sessionScope.groupID}" /></p>
        <table border="1"><tr><td><iframe id="content" src="messageWindow.jsp" height="300px" width="80%"></iframe></td></tr></table>
    <hr/>
        <p><textarea name="content" onkeydown="dosend(event)" id="cid" rows="" cols="" style="width:100%"></textarea></p>
        <p><input type="button" name="call" value="发送" onClick="callserver()" style="align:right"/></p>
    </div>
<script src="Employee/js/jquery.min.js"></script>
</body>
</html>