<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="cn.edu.zjut.po.Employee"%>
<%@ page import="cn.edu.zjut.po.Merchant"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%	int curPage = 1;
	int pageCount=1;
%>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <title>招募信息</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="Employee/css/normalize.css">
        <link rel="stylesheet" href="Employee/css/font-awesome.css">
        <link rel="stylesheet" href="Employee/css/bootstrap.min.css">
        <link rel="stylesheet" href="Employee/css/templatemo-style.css">
        <link rel="stylesheet" href="Employee/css/menuList.css">
        <link rel="stylesheet" href="Employee/css/chinaz.css">
        <link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="Employee/windowcss/default.css" />
		<link rel="stylesheet" type="text/css" href="Employee/windowcss/component.css" />
		<script src="Employee/windowjs/modernizr.custom.js"></script>
  		<script src="Employee/js/jquery-latest.min.js" type="text/javascript"></script>
		<script src="Employee/js/chinaz.js"></script>
        <script src="Employee/js/vendor/modernizr-2.6.2.min.js"></script>
        <script>
        $(function(){
        	<%if(session.getAttribute("merchantinfo")!=null){%>
				document.getElementById("seeInfo").click();
        	<%}%>
    	})
        </script>
</head>
<body>
<div class="page-section" id="about" >
	<div class="row">
		<div class="col-md-12">
			<h4 class="widget-title" style="font-size: 25px;font-weight: 600;">招募信息</h4>
		</div>
	</div>
	<div id='cssmenu'>
	<ul>
		<li><a href='OrderByDefault'>默认排序</a></li>
		<li><a href='OrderBySalary'>薪&nbsp;酬&nbsp;&nbsp;<i class="fa fa-long-arrow-down"></i></a></li>
		<li><a href='OrderByRank'>好&nbsp;评&nbsp;&nbsp;<i class="fa fa-long-arrow-down"></i></a></li>
		<li><a href='OrderByNeed'>招募人数&nbsp;&nbsp;<i class="fa fa-long-arrow-down"></i></a></li>
	</ul>
	</div>
	<div> <s:property value="#request.tip"/></div>
					
	<div class="row projects-holder">
	<%
	List list = (List) session.getAttribute("orderinfos");
	int size = list.size();
	if (list != null && size!=0) {
		try{
			int PAGESIZE = 9;
			pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
			String tmp = request.getParameter("curPage");
		if(tmp==null){
			tmp="1";
		}
		curPage = Integer.parseInt(tmp);
		if(curPage>=pageCount) curPage = pageCount;
		if(curPage<=0) curPage =1;
		int start=(curPage-1)*PAGESIZE;
		int count = 0;
		do{
			if(count>=PAGESIZE)break;
			Object[] object = (Object[])list.get(start);
			start++;
			count++;			
	%>
	<div class="col-md-4 col-sm-6">
	<div class="project-item">
	<img src="Employee/img/1.jpg" alt="">
	<div class="project-hover">
	<div class="inside">
		<s:form action="CheckDetail" method="post" target="_balnk">
			<input type="hidden" name="merchant.merchantID" value="<%=object[6]%>" />
			<input type="submit" class="checkButton" value="点我查看店铺详细资料"/>
	    </s:form>
    	<s:form action="AcceptOrder" method="post" target="_blank">
	    <p>招   募   人  数：<%=object[0]%>
    	<p>招募发布时间：<%=object[1]%>
    	<p>工作开始时间：<%=object[2]%>
    	<p>招   募   薪  资：<%=object[3]%>
    	<p>商   家   等  级：<%=object[4]%>
    	<p>商   家   店  名：<%=object[5]%>
    	<p>联   系   方  式：<%=object[6]%>
    	<input type="hidden" name="order.merchant.merchantID" value="<%=object[6]%>" />
        <input type="hidden" name="order.releaseTime" value="<%=object[1]%>" />
    	<p><input type="submit" class="button" value="接受招募" /></p>
        </s:form>
	</div>
	</div>
	</div>
	</div>
	<%  
        }while(start<list.size());    
    }
    catch(Exception e){e.printStackTrace();}  
    }
	%>
	<p>
	</div>
</div>
<div class="dividePage">
	<a href="findMission.jsp?curPage=1">首页</a>
	<a href="findMission.jsp?curPage=<%=curPage-1%>">上一页</a>
	<a href="findMission.jsp?curPage=<%=curPage+1%>">下一页</a>
	<a href="findMission.jsp?curPage=<%=pageCount%>">尾页</a> 
				第<%=curPage%>页/共<%=pageCount%>页
</div>

<div class="md-modal md-effect-17" id="modal-17">
	<div class="md-content">
		<h3>店铺信息</h3>
		<%Merchant m=(Merchant)session.getAttribute("merchantinfo");
		if(m!=null){%>
		<div>
			<ul>
			<li><strong>店名:</strong><%=m.getShopName()%></li>
			<li><strong>联系方式:</strong><%=m.getMerchantID()%></li>
			<li><strong>商家宣言:</strong><%=m.getMerchantSignature()%></li>
			<li><strong>营业执照：</strong><img src="<%=m.getMerchantBusinessLicence()%>" /></li>
			<li><strong>卫生许可证：</strong><img src="<%=m.getMerchantSecurityLicence()%>" /></li>
			</ul>
			<button class="md-close">关闭</button>
		</div>
		<%}%>
	</div>
</div>
<div class="container" style="display:none">
	<div class="main clearfix">
		<div class="column">
			<button class="md-trigger md-setperspective" id="seeInfo" data-modal="modal-17" style="display:none">店铺详细资料</button>
		</div>
	</div>
</div><!-- /container -->
<div class="md-overlay"></div><!-- the overlay element -->

		<script src="Employee/windowjs/classie.js"></script>
		<script src="Employee/windowjs/modalEffects.js"></script>

		<script>
			// this is important for IEs
			var polyfilter_scriptpath = '/js/';
		</script>
		<script src="Employee/windowjs/cssParser.js"></script>
		<script src="Employee/windowjs/css-filters-polyfill.js"></script>

</body>
</html>