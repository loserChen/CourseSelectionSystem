<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
</style>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="h2">
	<a href="/CourseSelectSystem/Student/QuerySystem/search1.jsp">课表查询</a><br>
		<br> <a href="/CourseSelectSystem/Student/ScoreInquiry/index.jsp">成绩查询</a><br>
		
		<br>
	</div>
	<div class="h1">

		<a href="/CourseSelectSystem/Student/StudentMain.jsp" >首页</a>
		</select> 公选课类型：<select name="types" onchange="window.open(this.options[this.selectedIndex].value,target='_self')">
			<option>请选择课程类型</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/SocialResponsibility.jsp">社会责任</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/InternationalPerspective.jsp">国际视野</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/ScientificLiteracy.jsp">科学素养</option>
			<option value="/CourseSelectSystem/Student/CourseSelection/HumanisticFeelings.jsp">人文情怀</option>
		</select> <a href="http://www.baidu.com">查看所选公选课</a>
	</div>


</body>
</html>
