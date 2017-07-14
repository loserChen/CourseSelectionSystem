<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>查看课程信息</title>
    
	
	

 <link rel="stylesheet" type="text/css"  href="cssCourseManageShare.css">
      </head>
      <body >
      <div id="glass" class="glass" >
    <hr>
    <div class="header" align=center style="height:100px;margin-bottom:5px;">
				
			</div>
			<div class="topmenu" style="padding-left:550px;height:30px;">
				<p><a href="addcourses.jsp">增加课程</a>&nbsp;<a href="CoursesLook.jsp">查看课程</a>&nbsp;<a href="deletecourses.jsp">删除课程</a></p>
			</div>
    <table border=2 bgcolor="ccceee" align="center">
    	<tr>
    		<th>课程编号</th>
    		<th>课程姓名</th>
    		<th>课程学时</th>
    		<th>课程学分</th>
    		<th>课程时间</th>
    		<th>课程地点</th>
    		<th>课程类型</th>
    	</tr>
    	<%
    		Statement stmt=null;
    		Connection conn=null;
    		ResultSet rs=null;
    		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url="jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem";
			String user="sa";
			String password="root";
			conn=DriverManager.getConnection(url, user,password);
			stmt=conn.createStatement();
			String sql="select * from Courses";
			rs =stmt.executeQuery(sql);
			while(rs.next()){
    	 %>
    	 <tr>
    	 	<td><%=rs.getString("Cno") %></td>
    	 	<td><%=rs.getString("Cname") %></td>
    	 	<td><%=rs.getString("Cperiod") %></td>
    	 	<td><%=rs.getString("Ccredit") %></td>
    	 	<td><%=rs.getString("Ctime") %></td>
    	 	<td><%=rs.getString("Cplace") %></td>
    	 	<td><%=rs.getString("Ctype") %></td>
    	 </tr>
    	 <%
    	 	}
    	 	rs.close();
    	 	stmt.close();
    	 	conn.close();
    	  %>
    </table>
    </div>
  </body>
</html>