<%@page contentType = "text/html" pageEncoding = "UTF-8" %>
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
				background:#FCFCFC;
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
			<div id = "Header">
				<h2>学生信息管理系统（教师）</h2>
			</div>
			<%
				String Tno = session.getAttribute("Tno").toString();
				String Tname = session.getAttribute("Tname").toString();
				String Tpassword = session.getAttribute("Tpassword").toString();
				request.getSession().setAttribute("Tno",Tno);
				request.getSession().setAttribute("Tname",Tname);
			%>
			<div id = "Content">
				<div id = "Content-Left">
					<h4>导航栏</h4>
					<br>
					<br>
					<div id = "Left-top">
					<br>
						<form action = "/CourseSelectSystem/Teacher/InsertScore.jsp">
							<input type = "image" src = "image/insert.jpg" alt = "submit" align = "center"/>
							<input type = "hidden" name = "Tno" value = "<%=Tno %>"/>
							<input type = "hidden" name = "Tname" value = "<%=Tname %>"/>
						</form>
					</div>
					<br>
					<br>
					<div id = "Left-center">
					<br>					
						<form action = "/CourseSelectSystem/lookStudentInfo" method = "post">
							<input type = "image" src = "image/look.jpg" alt = "submit" align = "center"/>
							<input type = "hidden" name = "Tno" value = "<%=Tno %>"/>
							<input type = "hidden" name = "Tname" value = "<%=Tname %>"/>
						</form>
					</div>
				</div>
				<div id = "Content-Main">
					<h4>主内容</h4>
					<div id = "Main-text">
					<br>
					<br>
						<h3>欢迎您！ <%=Tno %></h3>
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