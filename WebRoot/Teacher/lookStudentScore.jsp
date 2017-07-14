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
				height:700px;
				width:560px;
				margin:10px;
				background:#FCFCFC;
				padding-top:20px;
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
					<h2>学生成绩信息</h2>
						<%
							ArrayList al1 = (ArrayList)session.getAttribute("al1");
							ArrayList al3 = (ArrayList)session.getAttribute("al3");
							ArrayList al4 = (ArrayList)session.getAttribute("al4");
						 %>
						 <table border = "2" width = "500" align = "center">
						 	<tr>
						 		 <th>学号</th>
								 <th>姓名</th>
								 <th>课程号</th>
								 <th>课程名</th>
								 <th>成绩</th>
						 	</tr>
						 	<%
						 		for(int i=0;i<al1.size();i++){
					 			Student stu=(Student)al1.get(i);
							 	Course cou =(Course)al3.get(i);
							 	report rep =(report)al4.get(i);
						 	 %>
						 	 
						 	 <tr>
						 	 	<td align = "center"><font color="blue"><%=stu.getStudentNumber() %></font></td>
								<td align = "center"><%=stu.getStudentName() %></td>
								<td align = "center"><font color="blue"><%=cou.getCno() %></font></td>
								<td align = "center"><%=cou.getCname() %></td>
								<% 
								 	 int failedScore = rep.getStudentScore();
								 	 if(failedScore < 60){
								 %>
								 	 <td align = "center"><font color="red"><%=rep.getStudentScore() %>
								 	 </font></td>
								 <%
								 	 }else{
								 %>
								 	 <td align = "center"><font color="green"><%=rep.getStudentScore() %></font></td>
								 <%
								 	 }
								 %>
						 	 </tr>
						 	 <%
						 	 	}
						 	  %>
						</table>
					</div>
				</div>
			</div>
			<div class = "Clear">
				
			</div>
			<div id = "Footer">
			</div>
		</div>
	</body>
</html>