<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="managecourses.Teachers" %>
<%@ page import="managecourses.Courses" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>Courses Management</title>
	
	<link rel="stylesheet" type="text/css"  href="ManageCourses.css">
	
  </head>
  
  <body >
	<div id="glass" class="glass" >
	<table border="1"  align="center"  width= 1000px  height= 600px  style="text-align: center; vertical-align: middle;">
			<tr height="100px"><td width="200px"></td>
					<td width="auto">学生</td>
					<td width="auto">教师</td>
					<td width="auto">管理员</td>
			</tr>
			<tr height="auto"><td></td>
					<td colspan="3" rowspan="3" >
					
					<%
						ArrayList al1=(ArrayList)session.getAttribute("al1");
					%>
					<%
						ArrayList al2=(ArrayList)session.getAttribute("al2");
					%>
					
					<form  action="/CourseSelectSystem/ManageCoursesServlet"  method="post">
					<p>教师课程匹配:</p>
					
					<p>请选择教师名称：</p>
					<select name="MCTno" style="width:100px">
					<%
						for(int i=0;i<al1.size();i++){
							Teachers te=(Teachers)al1.get(i);
					%>
					 <option value="<%=te.getTno() %>">
								<%=te.getTname() %>
					 </option>
					<% 
						}
					%>
					</select>
					
					<p>请选择相应的课程名称：</p>
					<select name="MCCno" style="width:100px">
					<%
					 	for(int i=0;i<al2.size();i++){
					 		Courses co=(Courses)al2.get(i);
					 	
					 %>
					 <option value="<%=co.getCno() %>">
								<%=co.getCname() %>
					 </option>
					<% 
						}
					%>
					</select>
					
					<p><input type="submit" name="MCSubmit" value="提交" />
					<input type="submit" name="MCReset" value="重置" /></p>
					
					</form>
					</td>
			</tr>
			<tr height="auto"><td></td>				
			</tr>
			<tr height="auto" ><td></td>
			</tr>
	</table>
	</div>
  </body>
</html>
