 <%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
 <%@ page contentType="text/html;charset=UTF-8" %>
 <%request.setCharacterEncoding("UTF-8");%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="loginManage.LoginBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询成绩</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	
	body
	{
	      
	      background-position:center;
	      background-size:cover;
	      background-attachment: fixed;
	      height:700px;
	     
	}
	.total
	{
	      
	      margin-top:100px;
	      margin-left:600px;
	      width:750px;
	      height:627px;
	      border-width:1px;
	      border-radius:5px;
	      border-style:solid;
	      background-color: rgba(0,0,0,0.2);
	}
	.total p
	{
	      color: #FFFFFF;
	}
	.middle
	{
	     font-family:Arial,Helvetica,sans-serif;
	     font-size:100%;
	     font-style:sans-serif;
	     font-size:16pt;
	     width:750px;
	     height:27px;
	     border-width:1px;
	     border-style:hidden;
	     text-shadow:0 0 10px;
	     border:1 px dashed rgb(255,255,255);
	}
	.show
	{
	     width:750px;
	     height:500px;    
	}
	.bottom
	{
	      text-align:center;
	      width:750px;
	      height:100px;
	}
	</style>
  </head>
  <body background="/CourseSelectSystem/Student/ScoreInquiry/login2.jpg" >
    <% String username=null;
      String name=null;
      ArrayList login=(ArrayList)session.getAttribute("login");
      for(int i=login.size()-1;i>=0;i--)
      {
       LoginBean nn=(LoginBean)login.get(i);
       username=nn.getUserName();
       name=nn.getName();
      }
      %>
    <div class="total">
    <form action="/CourseSelectSystem/Login" method="post">
     <div class="middle">
    <table>
    <tr><td width="120px">学生基本信息</td>
    <td width="180px">学号：<%=username %></td>
    <td width="150px">姓名：<%=name %></td>
    <td width="150px"><a href="/CourseSelectSystem/Student/StudentMain.jsp" ">首页</a></td>
    <td width="150px">学期
         <select name="semester">
         <option value="all">all</option>
         <option value="2012/2013(1)">2012/2013(1)</option>
         <option value="2012/2013(2)">2012/2013(2)</option>
         <option value="2013/2014(1)">2013/2014(1)</option>
         <option value="2013/2014(2)">2013/2014(2)</option>
         <option value="2014/2015(1)">2014/2015(1)</option>
         <option value="2014/2015(2)">2014/2015(2)</option>
         <option value="2015/2016(1)">2015/2016(1)</option>
         <option value="2015/2016(2)">2015/2016(2)</option>
         <option value="2016/2017(1)">2016/2017(1)</option>
         <option value="2016/2017(2)">2016/2017(2)</option>
         <option value="2017/2018(1)">2017/2018(1)</option>
         <option value="2017/2018(2)">2017/2018(2)</option>
         </select></td></tr>
      </table>
      </div>
      <div class="show">
      </div>
      <div class="bottom">
         <p><input type="submit" name="button1" value="普通考试成绩查询">
      </div>
      </form>
      </div>
    </body>
</html>
