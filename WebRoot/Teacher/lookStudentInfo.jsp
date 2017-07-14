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
			#Left-top{
				height:150px;
				width:140px;
				background:#FCFCFC;
				margin-top:20px;
				margin-left:5px;
				font-size:14px;
				padding-top:40px;
			}
			#Left-center{
				height:150px;
				width:140px;
				background:#FCFCFC;
				margin-top:20px;
				margin-left:5px;
				font-size:14px;
				padding-top:40px;
			}
			#Left-bottom{
				height:150px;
				width:140px;
				background:#FCFCFC;
				margin-top:20px;
				margin-left:5px;
				font-size:14px;
				padding-top:40px;
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
				height:400px;
				width:560px;
				margin:10px;
				background:#FCFCFC;
				padding-top:20px;
			}
			#Main_bottom{
				height:200px;
				width:560px;
				background:#BFEFFF;
				margin-top:10px;
				float:left;
			}
			#Main_bottom_left{
				height:100px;
				width:50px;
				padding-left:200px;
				float:left;
			}
			#Main_bottom_center{
				height:100px;
				width:65px;
				float:left;
			}
			#Main_bottom_right{
				height:100px;
				width:50px;
				float:left;
			}
			#Footer{
				height:40px;
				width:750px;
				background:#CFCFCF;
				margin-top:3px;
			}
			#menu 
			.clear{
				clear:both;
			}
		</style>
	</head>
	<body>
		<div id = "Container">
			<div id = "Header">
				<h2>学生信息管理系统（教师）</h2>
			</div>
			<div id = "Content">
				<div id = "Content-Left">
					<h4>导航栏</h4>
					<br>
					<br>
					<h1>查<br>询<br>学<br>生<br>信<br>息</h1>
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
					<h2>所有学生基本信息</h2>
						<%
							ArrayList al = (ArrayList)session.getAttribute("al");
							String page_number = session.getAttribute("page_number").toString();
						%>
						 <table border = "2" width = "500" align = "center">
						 	<tr>
						 		<th>学号</th>
						 		<th>姓名</th>
						 		<th>性别</th>
						 		<th>专业</th>
						 		<th>学院</th>
						 	</tr>
						 	<%
						 		for(int i=0;i<al.size();i++){
					 			Student stu=(Student)al.get(i);
						 	 %>
						 	 
						 	 <tr>
						 	 	<td align = "center"><%=stu.getStudentNumber() %></td>
						 	 	<td align = "center"><%=stu.getStudentName() %></td>
						 	 	<td align = "center"><%=stu.getStudentSex() %></td>
						 	 	<td align = "center"><%=stu.getStudentMajor() %></td>
						 	 	<td align = "center"><%=stu.getStudentCollege() %></td>
						 	 </tr>
						 	 <%
						 	 	}
						 	  %>
						</table>
					</div>
					<div id = "Main-bottom">
					
					<div id = "Main_bottom_left">
						<form action = "/CourseSelectSystem/PageBefore" method = "post">
						<input name = "before" type = "image" src = "image/before.png" alt = "submit"/>
						<input name = "page_number" type = "hidden" value = "<%=page_number %>"/>
					</form></div>
					<div id = "Main_bottom_center">
						<form action = "/CourseSelectSystem/spePage" method = "post">
						<input name = "page_number" type = "text" size = "5px" value = "<%=page_number %>"/>
						<input name = "go" type = "submit" value = "GO">
					</form></div>
					<div id = "Main_bottom_right">
					<form action = "/CourseSelectSystem/PageNext" method = "post">
						<input name = "next" type = "image" src = "image/next1.png" alt = "submit"/>
						<input name = "page_number" type = "hidden" value = "<%=page_number %>"/>
					</form></div>
					
					<form action = "/CourseSelectSystem/lookOneStudent" method = "post">
						<table border = "1" width = "400" align = "center">
							<tr>
								<td width = "20%">学号：</td>
								<td width = "80%"><input name = "studentNumber" type = "text"
								size = "20px" value = "请输入学生学号"></td>
							</tr>
						</table>
						<br>
						<input type = "submit" value = " 查看该学生信息">
					</form>
					</div>
				</div>
			</div>
			<div class = "Clear">
				++
				
				
			</div>
			<div id = "Footer">
			</div>
		</div>
	</body>
</html>
