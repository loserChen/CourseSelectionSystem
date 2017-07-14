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
	        <option value="/CourseSelectSystem/Student/CourseSelection/SocialResponsibility.jsp">社会责任</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/InternationalPerspective.jsp">国际视野</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/ScientificLiteracy.jsp">科学素养</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/HumanisticFeelings.jsp">人文情怀</option>
		</select> <a href="http://www.baidu.com">查看所选公选课</a>
	</div>
	
<form action="/CourseSelectSystem/AddCourses" method="get">
<table border="1">
<tr>
<th>课程类型</th>
<th>课程名称</th>
<th>上课时间</th>
<th>任课教师</th>

</tr>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem";
String user="sa";
String password="root";
Connection conn=DriverManager.getConnection(url, "sa","root");
Statement stmt=conn.createStatement();
String sql="select * from Courses,Teachers,AvailableCourses where AvailableCourses.Cno like 'CHF%' and AvailableCourses.Cno=Courses.Cno and AvailableCourses.Tno=Teachers.Tno";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
 %>	
 <tr>
        <td><%=rs.getString("Ctype") %></td>
        <td><%=rs.getString("Cname") %></td>
        <td><%=rs.getString("Ctime") %></td>
        <td><%=rs.getString("Tname") %></td>
    
        <td><input type="checkbox" name="courses" value=<%=rs.getString("Cno") %>></td>
       
 </tr>

 <%
    }                                           
 rs.close();
 stmt.close();
 conn.close();
  %>
  </table>
 <input type="submit" value="确认">   
  </form>
</body>
</html>

