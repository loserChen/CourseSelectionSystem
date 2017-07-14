<%@ page language="java" import="java.util.*" import="java.sql.*"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="loginManage.LoginBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hgx.jsp' starting page</title>
    
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
	      
	      background-repeat:no-repeat;
	      background-size:cover;
	      background-attachment: fixed;
	     
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
	.middle{
	     font-family:"Arial","Microsoft YaHei","黑体","宋体",sans-serif;
	     font-size:16pt;
	     border-width:1px;
	     border-style:hidden;
	     width:750px;
	     height:27px;
	     text-shadow:0 0 10px;
	     border:1 px solid rgb(255,255,255);
	}
	.show
	{
	     text-align:center;
	     width:750px;
	     height:500px;
	     padding-top:30px;
	}
	.bottom
	{
	     text-align:center;
	     width:750px;
	     height:100px;
	    
    }
	</style>
  </head>
  <body  background="/CourseSelectSystem/Student/ScoreInquiry/login2.jpg">
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
       <form action="/CourseSelectSystem/Return" method="post">
       <div class="middle">
       <table>
       <tr><td width="120px">学生基本信息</td>
       <td width="180px">学号：<%=username %></td>
       <td width="150px">姓名：<%=name %></td>
       <td width="150px"><a href="/CourseSelectSystem/Student/StudentMain.jsp" ">首页</a></td>
       <%String semester = (String)request.getAttribute("semester"); %>
       <td width="150px">学期<select>
         <option value="1"><%=semester %></option>
         </select></td></tr>
      </table>
      </div>
    <div class="show">
     <table border="1"> 
    <tr><td width="120">课程</td><td width="120">成绩</td></tr>
     <%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String url = "jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem";
    String user="sa";
    String password="root";
    Connection conn = DriverManager.getConnection(url,user,password);
    Statement stmt = conn.createStatement();
    //String semester = (String)request.getAttribute("semester");
    //int s = Integer.parseInt(semester);
    String s = semester;
    String sql = null;
    if(s.equals("all"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno";
           
    if(s.equals("2012/2013(1)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2012/2013(1)'";
           
    if(s.equals("2012/2013(2)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2012/2013(2)'";
          
    if(s.equals("2013/2014(1)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2013/2014(1)'";
           
    if(s.equals("2013/2014(2)"))
            sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2013/2014(2)'";
           
    if(s.equals("2014/2015(1)"))
            sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2014/2015(1)'";
           
    if(s.equals("2014/2015(2)"))
            sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2014/2015(2)'";
           
    if(s.equals("2015/2016(1)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2015/2016(1)'";
           
    if(s.equals("2015/2016(2)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2015/2016(2)'";
           
    if(s.equals("2016/2017(1)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2016/2017(1)'";
          
    if(s.equals("2016/2017(2)"))
           sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2016/2017(2)'";
              
    if(s.equals("2017/2018(1)"))
            sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2017/2018(1)'";
           
    if(s.equals("2017/2018(2)"))
            sql = "select Reports.Score,Courses.Cname from Reports,Students,Courses where Students.Sno="+"'"+ username+"' and " +" Reports.Sno=Students.Sno and Reports.Cno=Courses.Cno and Courses.Csemester='2017/2018(2)'";
    ResultSet rs = stmt.executeQuery(sql);
    
    while(rs.next()){
     %>
     
    
     <tr><td ><%=rs.getString("Cname") %></td>
         <td ><%=rs.getString("Score") %></td></tr>
     
     
     <%
        }
        rs.close();
        stmt.close();
        conn.close();
     %>
     </table>
    </div>
    
    <div class="bottom">
        <p><input type="submit" name="button2" value="返回"></p>
      </div>
      </form>
      </div>
    </body>
</html>
