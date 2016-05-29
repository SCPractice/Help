<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="cn.edu.zjut.po.Employee"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
     <title></title>
     <meta charset="utf-8"/>
     <meta name="description" content=""/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        
        <link rel="stylesheet" href="commonCSS/bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="commonCSS/app.css" type="text/css" />
        
        <link rel="stylesheet" href="Employee/css/normalize.css"/>
        <link rel="stylesheet" href="Employee/css/font-awesome.css"/>
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
      content=window.encodeURI(content);
      content=window.encodeURI(content);
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
			<h4 class="widget-title" style="font-size: 25px;margin-top:30px;font-weight: 600;margin-bottom:30px">我的团队
			</h4>
		</div>
	</div>
	<div><a href="employeeExitTeam" class="pull-right btn btn-s-md btn-danger btn-rounded">退出团队</a>
		<h5 class="widget-title" style="font-size: 16px">队伍名：<s:property value="#session.igroup.groupName"/></h5>
		<table>
		<tr><td class="widget-title" style="font-size: 15px;font-weight: 600;padding-top:10px;padding-bottom:10px">成员<br></td></tr>
		<tr>
			<s:iterator value="teamMemberList">
				<td>&nbsp;&nbsp;<a class="pull-left thumb-sm avatar" ><img src='<s:property value="employeeIMG"/>' class="img-circle" alt="..."></a><br><br><s:property value="employeeName"/>&nbsp;&nbsp;</td>
			</s:iterator>
		</tr>
		</table>
	</div>
	<br>
	<div>
	    <p><input type="hidden"  id="groupid" name="chatgroup" value="${sessionScope.groupID}" /></p>
	    <iframe id="content" src="messageWindow.jsp" height="500px" width="100%"></iframe>
	    <footer class="panel-footer">
		<!-- chat form -->
		<article class="chat-item" id="chat-form">
			<a class="pull-left thumb-sm avatar"><img src='<s:property value="#session.employee.employeeIMG"/>' class="img-circle" alt="..."></a>
			<section class="chat-body">
			<form class="m-b-none">
				<div class="input-group">
					<input type="text" name="content" onkeydown="dosend(event)" id="cid" class="form-control" placeholder="Say something">
					<span class="input-group-btn">
						<input class="btn btn-default" type="button" name="call" value="发送" onClick="callserver()" />
					</span>
				</div>
			</form>
			</section>
		</article>
		</footer>
    </div>
<script src="Employee/js/jquery.min.js"></script>
</body>
</html>