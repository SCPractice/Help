<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"%>
<html>
<body>

	<%
	    String gname = request.getParameter("gname");//获取输入框的值
	    //System.out.println(gname+"------------------");
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (ClassNotFoundException e) {
			System.out.println("驱动类未找到，注意：驱动包是否导入了" + e.getMessage());
		}
		Connection con = java.sql.DriverManager.getConnection(
				"jdbc:mysql://localhost/helpdb", "root", "root");
		Statement stmt = con.createStatement();
		ResultSet rst = stmt.executeQuery("select * from igroup where groupName like '"+gname+"%'");//模糊搜索
		while (rst.next()) {
			out.println("<li>"+rst.getString("groupName")+"</li>");
			//System.out.println(rst.getString("groupID"));
		}
		//关闭连接、释放资源
		rst.close();
		stmt.close();
		con.close();
	%>

</body>
</html>