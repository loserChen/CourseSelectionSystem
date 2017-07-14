<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
.h1 {
	height: 20px;
	border: 1px solid black;
	border-width: 1px;
	font-size: 12px;
	margin-left: auto;
	margin-right: auto;
	background: white
}

.h2 {
	float: left;
	height: 200px;
	border: 1px solid black;
	border-width: 1px;
	font-size: 12px;
	margin-left: auto;
	margin-right: auto;
	background: white
}
</style></head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="h2">
		<a href="../QuerySystem/search1.jsp">课表查询</a><br>
		<br> <a href="../ScoreInquiry/index.jsp">成绩查询</a><br>

		<br>
	</div>
	<div class="h1">
		<a href="CourseSelectSystem/Student/StudentMain.jsp" >首页</a>
			
		</select> 公选课类型：<select name="types" onchange="window.open(this.options[this.selectedIndex].value,target='_self')">
			<option>请选择课程类型</option>
			<option value="SocialResponsibility.jsp">社会责任</option>
			<option value="InternationalPerspective.jsp">国际视野</option>
			<option value="ScientificLiteracy.jsp">科学素养</option>
			<option value="HumanisticFeelings.jsp">人文情怀</option>
		</select> <a href="http://www.baidu.com">查看所选公选课</a>
	</div>
	
<table border="1">
<tr>

<th>课程编号</th>
<th>上课教师</th>
<th></th>

</tr>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem";
String user="sa";
String password="root";
Connection conn=DriverManager.getConnection(url, "sa","root");
Statement stmt=conn.createStatement();
String sql="select * from Reports ";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
 %>
 <tr>
        
        <td><%=rs.getString("Cno") %></td>
        
        <td><%=rs.getString("Tno") %></td>
    
    
 </tr>
 <%
 }
 rs.close();
 stmt.close();
 conn.close();
  %>
</table>
</body>
</html>
