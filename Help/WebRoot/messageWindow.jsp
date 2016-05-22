<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>聊天窗口</title>

  </head>
  <script type="text/javascript">
    
    var xmlHttp = false;
    
    setInterval(create,1000);
    function create(){
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
    
        try{
        var groupID=window.parent.document.getElementById("groupid").value;
        var url="chatreceive?groupID="+groupID;
        xmlHttp.onreadystatechange=put;
        xmlHttp.open("GET",url,true);
        xmlHttp.send();
        }catch(failed){
        alert("服务器繁忙");
        }
    }
    function put(){
    if(xmlHttp.readyState==4){
        var xmlDoc=xmlHttp.responseText;
        var data=eval(xmlDoc);
        var i=0
        if(data!=null){
        var insertText="<table>";
        for (i=0;i<data.length;i++){
        insertText=insertText+"<tr><td><font size=\"3\" color=\"#000079\">"+data[i].messageSender+":</font></td><td><font color=\"#2828FF\">"+data[i].messageContent+"</font></td></tr>";
        }
        insertText=insertText+"</table>";
        document.getElementById("insert").innerHTML = insertText;
        scrollTo(0,document.body.scrollHeight);
        }
    }
    }
  </script>
  <body>
  <div id="insert"></div>
  </body>
</html>
