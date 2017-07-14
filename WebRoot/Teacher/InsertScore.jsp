<%@page contentType = "text/html" pageEncoding = "UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="teacher.*" %>
<html xmlns = "http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8"/>
		<title>学生信息管理系统（教师）</title>
		<style type="text/css">
			body{
				font-family:Verdana, Arial,Helvetica,sans-serif; font-size:16px; line-height:1.5;}
			}
			img{ border:0;}
			#Container{
				width:750px;
				margin:5 auto;
				background:#BBFFFF;
			}
			#Header{
				Height:80px;
				width:750px;
				background:#B0E2FF;
				text-align:center;
				color:#191970;
				padding-top:10px;
			}
			#Logo{
				padding-left:5px;
				padding-top:5px;
				padding-bottom:5px;
			}
			#Content{
				height:800px;
				width:750px;
				margin-top:5px;
				background:#EAEAEA;
			}
			#Content-Left{
				height:790px;
				width:150px;
				margin:5px;
				float:left;
				background:#FFEC8B;
				text-align:center;
			}
			#Content-Main{
				height:790px;
				width:580px;
				margin:5px;
				float:left;
				background:#FDF5E6;
				text-align:center;
			}
			#Main-text{
				height:700px;
				width:560px;
				margin:10px;
				background:#FCFCFC;
			}
			#Maintext-top{
				height:150px;
				width:560px;
				padding-top:20px;
				padding-left:30px;
			}
			#Maintext-center{
				height:50px;
				width:560px;
				padding-left:30px;
			}
			#Maintext-bottom{
				height:500px;
				width:560px;
				background:#FDF5E6;
			}
			#Footer{
				height:40px;
				width:750px;
				background:#CFCFCF;
				margin-top:5px;
			}
			#menu 
			.clear{
				clear:both;
			}
		</style>
	</head>
	<body>
		<div id = "Container">
		<%
			String Tno = session.getAttribute("Tno").toString();
			String Tname = session.getAttribute("Tname").toString();
		 %>
			<div id = "Header">
				<h2>学生信息管理系统（教师）</h2>
				<h5>欢迎您! <%=Tno %></h5>
			</div>
			<div id = "Content">
				<div id = "Content-Left">
					<h4>导航栏</h4>
					<br>
					<br>
					<h1>录<br>入<br>学<br>生<br>成<br>绩</h1>
					<br>
					<br>
					<br>
					<br>
					<a align = "center">返回首页</a>
					<form action = "/CourseSelectSystem/Teacher/Main.jsp">
						<input type = "image" src = "image/back.png" alt = "submit" align = "center"/>
					</form>
					<br>
					<a href="javascript :;" onClick="javascript :history.back(-1);"><img src="image/before1.png" border="0" title="返回上一页"></a>
					<br>
					<a align = "center">返回上页</a>
				</div>
				<div id = "Content-Main">
					<h4>主内容</h4>
					<div id = "Main-text">
						<div id = "Maintext-top">
						<form action = "/CourseSelectSystem/InsertScore" method = "get">
								<table border = "1" bordercolor = "#D1EEEE" width = "500">
									<tr>
										<td width = "20%">学号：</td>
										<td width = "80%"><input type = "text" name = "studentNumber"/></td>
									</tr>
									<tr>
										<td width = "20%">课程号：</td>
										<td width = "80%"><input type = "text" name = "courseNumber"/></td>
									</tr>
									<tr>
										<td width = "20%">成绩：</td>
										<td width = "80%"><input type = "text" name = "studentScore"/></td>
									</tr>
									<tr align = "center">
										<td colspan = "2">
											<input name = "sure" type = "submit" value = "提交"/>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input name = "clear" type = "reset" value = "取消"/>
											<input type = "hidden" name = "Tno" value = "<%=Tno %>"/>
											<input type = "hidden" name = "Tname" value = "<%=Tname %>"/>
										</td>
									</tr>
								</table>
								<br>
							</form>
						</div>
						<div id = "Maintext-center">
						<%
							if(session.getAttribute("judge") == "1" ){
						 %>
						<h5 align = "left"><font color = "green">学生成绩修改成功</font></h5>						
						<%
						}else if(session.getAttribute("judge") == "2"){
						 %>
						 <h5 align = "left"><font color = "red">学生成绩修改失败，请查看学号，课程号是否填写正确</font></h5>
						 <%
						 }else{
						 %>
						 <h5 align = "left"><font color = "black">欢迎录入修改成绩，点击下方按钮可以查看当前学生成绩列表</font></h5>
						 <%
						 }
						  %>
						 </div>
						<div id = "Maintext-bottom">
						<br>
						<form action  = "/CourseSelectSystem/lookStudentScore" method = "post" >
								<input name = "sure" type = "submit" value = "查看当前学生成绩列表"/>
								<input type = "hidden" name = "Tno" value = "<%=Tno %>"/>
								<input type = "hidden" name = "Tname" value = "<%=Tname %>"/>
						</form>
						</div>
					</div>
				</div>
			</div>
			<div class = "Clear">
				
			</div>
			<div id = "Footer">
			<h5><%=Tno %></h5>
			</div>
		</div>
	</body>
</html>