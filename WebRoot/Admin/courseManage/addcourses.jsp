<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>课程添加</title>
  


   <link rel="stylesheet" type="text/css"  href="cssCourseManageShare.css">
      </head>
      <body >
      <div id="glass" class="glass" >
    <center>
    	<br>
    	<br>
    	<br>
    	<form action="AddCourseServlet" method="post">
    	<div class="header" align=center style="height:100px;margin-bottom:5px;">
				
			</div>
			<div class="topmenu" style="padding-left:550px;height:30px;">
				<p><a href="/CourseSelectSystem/Admin/courseManage/addcourses.jsp">增加课程</a>&nbsp;
				<a href="/CourseSelectSystem/Admin/courseManage/CoursesLook.jsp">查看课程</a>&nbsp;
				<a href="/CourseSelectSystem/Admin/courseManage/deletecourses.jsp">删除课程</a></p>
			</div>
    			<table border="0" style="width:750px;">
					<tr>
						<td>
							<table border="0" align=center width="400" >
    							<tr>
    								<td  style="font-weight:bold"><font face="圆体" color=black>&nbsp;课程号:</font></td>	
    								<td><input type="text" name="Cno" ></td>
    							</tr>
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black >&nbsp;课程名:</font></td>	
    								<td><input type="text" name="Cname" ></td>
    							</tr>
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black>&nbsp;学时:</font></td>	
    								<td><input type="text" name="Cperiod" ></td>
    							</tr>
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black>&nbsp;学分:</font></td>	
    								<td><input type="text" name="Ccredit" ></td>
    							</tr>
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black>&nbsp;上课时间:</font></td>	
    								<td><input type="text" name="Ctime" ></td>
    							</tr>
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black>&nbsp;上课地点:</font></td>	
    								<td><input type="text" name="Cplace" ></td>
    							</tr>
    							<tr>
    								<td style="font-weight:bold"><font face="宋体" color=black>&nbsp;课程类型:</font></td>	
    								<td><input type="text" name="Ctype" ></td>
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
