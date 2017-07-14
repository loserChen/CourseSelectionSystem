<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>删除课程</title>
    
	
 <link rel="stylesheet" type="text/css"  href="cssCourseManageShare.css">
      </head>
      <body >
      <div id="glass" class="glass" >
    <center>
    	<br>
    	<br>
    	<br>
    	<form action="DeleteCourseServlet" method="post">
    		<div class="header" align=center style="height:100px;margin-bottom:5px;">
				<img src="zjut3.jpg">
			</div>
			<div class="topmenu" style="padding-left:550px;height:30px;">
				<p><a href="addcourses.jsp">增加课程</a>&nbsp;<a href="CoursesLook.jsp">查看课程</a>&nbsp;<a href="deletecourses.jsp">删除课程</a></p>
			</div>
    			<table border="0" style="width:750px;">
					<tr>
						<td>
							<table border="0" align=center width="400">
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black>&nbsp;请输入要删除的课程号:</font>
    								<input type="text" name="Cno" ></td>
    							</tr>
    						</table>
						</td>
					</tr>
					<tr align=center>
						<td colspan="2"><input type="submit" name="submit" value="提交"/> <input type="reset" name="clear" value="取消"/></td>
					</tr>
    			</table>
    	</form>
    </center>
    </div>
  </body>
</html>
