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
				padding-left:0px;
				padding-top:0px;
				background:#F0F0F0;
			}
			#MaintextCenterText{
				height:50px;
				width:150px;
				padding-left:5px;
				padding-top:5px;
				background:#F0F0F0;
				float:left;
			}
			#MaintextCenterForm{
				height:50px;
				width:260px;
				padding-left:5px;
				padding-top:5px;
				background:#F0F0F0;
				float:left;
				text-align:left;
				vertical-align:middle;
			}
			#Maintext-bottom{
				height:500px;
				width:560px;
				background:#FDF5E6;
				padding-top:5px;
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
						<%
							String Sno = request.getParameter("studentNumber");
							String Cno = request.getParameter("courseNumber");
						%>
						<form action = "/CourseSelectSystem/InsertScore" method = "get">
								<table border = "1" bordercolor = "#D1EEEE" width = "500">
									<tr>
										<td width = "20%">学号：</td>
										<td width = "80%"><input name = "studentNumber" type = "text"
										size = "20px" value = "<%=Sno %>"></td>
									</tr>
									<tr>
										<td width = "20%">课程号：</td>
										<td width = "80%"><input name = "courseNumber" type = "text"
										size = "20px" value = "<%=Cno %>"></td>
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
							</form>
						</div>
						<div id = "Maintext-center">
							<div id = "MaintextCenterText">
								<h4 align = "left">当前学生成绩列表</h4>
							</div>
							<div id = "MaintextCenterForm">
							<br>
							</div>
							
							
						</div>
						<div id = "Maintext-bottom">
	 						
	 						<%
								ArrayList al1 = (ArrayList)session.getAttribute("al1");
								ArrayList al2 = (ArrayList)session.getAttribute("al2");
								ArrayList al3 = (ArrayList)session.getAttribute("al3");
								ArrayList al4 = (ArrayList)session.getAttribute("al4");
							 %>
								 <table border = "2" width = "500" align = "center">
								 	<tr>
								 		<th>学号</th>
								 		<th>姓名</th>
								 		<th>教师名</th>
								 		<th>课程号</th>
								 		<th>课程名</th>
								 		<th>成绩</th>
								 	</tr>
								 	 
								 	 <tr>
								 	 <%
								 		for(int i=0;i<al1.size();i++){
							 			Student stu=(Student)al1.get(i);
							 			Teacher tea =(Teacher)al2.get(i);
							 			Course cou =(Course)al3.get(i);
							 			report rep =(report)al4.get(i);
								 	 %>
								 	 	<td align = "center"><%=stu.getStudentNumber() %></td>
								 	 	<td align = "center"><%=stu.getStudentName() %></td>
								 	 	<td align = "center"><%=tea.getTeacherName() %></td>
								 	 	<td align = "center"><%=cou.getCno() %></td>
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
								 	 	 <td align = "center"><%=rep.getStudentScore() %></td>
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
			</div>
			<div class = "Clear">
				
			</div>
			<div id = "Footer">
			</div>
		</div>
	</body>
</html>