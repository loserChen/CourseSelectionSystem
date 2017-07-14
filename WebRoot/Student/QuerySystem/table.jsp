<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" 
		import="javax.naming.*"
		import="javax.sql.DataSource"%>
		<%@ page import="loginManage.LoginBean" %>
    <%@ page import="java.util.ArrayList" %>
<html>
  <head>
    <title>查询课表</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <link rel="stylesheet" type="text/css" href="style1.css">
  </head>
  
  <body  background="images/ZJUTstreet.jpg" style="background-size:cover">
  <form name="fm" id="fm" method="post">
   <div>
   <table align="center">
   <tr><td width="26px"></td>
   <td width="144px"><img src="logo-2.gif"></td>
   <td width="45px"></td>
   <td><img src="bar.gif"></td></tr>
   </table>
   </div>
  <div align="center">
  <table><tr>
  <td><input type="button" id="login" value="用户登录" onclick="document.fm.action='/CourseSelectSystem/login.jsp';document.fm.submit();"></td>
  <td width="45px"></td>
  <td><input type="button" id="search" value="返回首页" onclick="document.fm.action='/CourseSelectSystem/Student/StudentMain.jsp';document.fm.submit();"></td>
  <td width="45px"></td>
  <td><input type="button" id="teacherM" value="教师管理" onclick="document.fm.action='/CourseSelectSystem/login.jsp';document.fm.submit();"></td>
  <td width="45px"></td>
  <td><input type="button" id="studentM" value="学生管理" onclick="document.fm.action='/CourseSelectSystem/Student/StudentMain.jsp';document.fm.submit();"></td>
  <td width="45px"></td>
  <td><input type="button" id="leave" value="注销登录"></td></tr></table></div>
  <table id=top align="center"><tr><td>学生管理>查询系统>学生课表查询</td></tr></table>
  <table id=top1 align="center"><tr><td width="750px">打印时间：<span id="time"></span></td></tr></table>
  <script type="text/javascript">
document.getElementById('time').innerHTML=new Date().toLocaleString();     
     </script>
     <table id=top2 align="center"><tr><td width="750px">&nbsp学&nbsp期:&nbsp
     <select name="semester" id="semester">
	<option value="1999/2000(1)">1999/2000(1)</option>
	<option value="1999/2000(2)">1999/2000(2)</option>
	<option value="2000/2001(1)">2000/2001(1)</option>
	<option value="2000/2001(2)">2000/2001(2)</option>
	<option value="2001/2002(1)">2001/2002(1)</option>
	<option value="2001/2002(2)">2001/2002(2)</option>
	<option value="2002/2003(1)">2002/2003(1)</option>
	<option value="2002/2003(2)">2002/2003(2)</option>
	<option value="2003/2004(1)">2003/2004(1)</option>
	<option value="2003/2004(2)">2003/2004(2)</option>
	<option value="2004/2005(1)">2004/2005(1)</option>
	<option value="2004/2005(2)">2004/2005(2)</option>
	<option value="2005/2006(1)">2005/2006(1)</option>
	<option value="2005/2006(2)">2005/2006(2)</option>
	<option value="2006/2007(1)">2006/2007(1)</option>
	<option value="2006/2007(2)">2006/2007(2)</option>
	<option value="2007/2008(1)">2007/2008(1)</option>
	<option value="2007/2008(2)">2007/2008(2)</option>
	<option value="2008/2009(1)">2008/2009(1)</option>
	<option value="2008/2009(2)">2008/2009(2)</option>
	<option value="2009/2010(1)">2009/2010(1)</option>
	<option value="2009/2010(2)">2009/2010(2)</option>
	<option value="2010/2011(1)">2010/2011(1)</option>
	<option value="2010/2011(2)">2010/2011(2)</option>
	<option value="2011/2012(1)">2011/2012(1)</option>
	<option value="2011/2012(2)">2011/2012(2)</option>
	<option value="2012/2013(1)">2012/2013(1)</option>
	<option value="2012/2013(2)">2012/2013(2)</option>
	<option value="2013/2014(1)">2013/2014(1)</option>
	<option value="2013/2014(2)">2013/2014(2)</option>
	<option value="2014/2015(1)">2014/2015(1)</option>
	<option value="2014/2015(2)">2014/2015(2)</option>
	<option value="2015/2016(1)">2015/2016(1)</option>
	<option value="2015/2016(2)">2015/2016(2)</option>
	<option selected="selected" value="2016/2017(1)">2016/2017(1)</option>
	<option value="2016/2017(2)">2016/2017(2)</option>
	<option value="2017/2018(1)">2017/2018(1)</option>
	<option value="2017/2018(2)">2017/2018(2)</option>
	<option value="2018/2019(1)">2018/2019(1)</option>
	<option value="2018/2019(2)">2018/2019(2)</option>
	<option value="2098/2099(1)">2019/2020(1)</option>
</select>
	<input type="button" name="Button1" value="按课程查询" id="Button1" onclick="document.fm.action='search.jsp';document.fm.submit();"/>&nbsp;
	<%String username=null;
        String Sname=null;
      ArrayList login=(ArrayList)session.getAttribute("login");
      for(int i=login.size()-1;i>=0;i--)
      {
       LoginBean nn=(LoginBean)login.get(i);
       username=nn.getUserName();
       Sname=nn.getName();
      }
      System.out.println(username+"sdf"); %>
	<input type="button" name="Button2" value="按课表查询" id="Button2" onclick="document.fm.action='table.jsp';document.fm.submit();"/>
	<span ><font size="2">学生：<%=Sname %>的课表信息</font></span>
     </td></tr></table></form>
     <table cellspacing="0" cellpadding="1" rules="all" bordercolor="#2650A6" border="2"  bgcolor="#F1F3F9" height="100%" width="750px" align="center">
	<tr bgcolor="#C9D3E9">
		<td><font color="White" size="2"><b>节</b></font></td><td><font color="White" size="2"><b>星期一</b></font></td><td><font color="White" size="2"><b>星期二</b></font></td><td><font color="White" size="2"><b>星期三</b></font></td><td><font color="White" size="2"><b>星期四</b></font></td><td><font color="White" size="2"><b>星期五</b></font></td><td><font color="White" size="2"><b>星期六</b></font></td><td><font color="White" size="2"><b>星期日</b></font></td>
	</tr><%
InitialContext initCtx = new InitialContext();
       DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sampleDS");
       Connection conn = ds.getConnection();
        
String semester=request.getParameter("semester");


String sql5="select Courses.* from Courses,Reports where Reports.Cno=Courses.Cno and Reports.Sno= '"+username+"'"+" and Courses.Csemester= '"+semester+"'";

PreparedStatement stmt=conn.prepareStatement(sql5);
//stmt.setString(1,semester);
for(int i = 1; i <=12; i++){
 %><tr>
		<td><font size="2">
										<span id="DG_GXK__ctl1_LblXiaoQU">第<%=i%>节</span>
									</font></td>
									<%for(int p=1;p<=7;p++){
									 ResultSet rs=stmt.executeQuery();
									 int check=0;
									 while(rs.next()){
									String time=rs.getString("Ctime");
									String name=rs.getString("Cname");
									String place=rs.getString("Cplace");
									int period=rs.getInt("Cperiod");
									int week=rs.getInt("Cweek");
									int a=period/week;
									if(a>=4){
									a/=2;}
									String Sj="星期"+p+"("+i+"-"+(i+a-1)+")";%>
									<%if(time.indexOf(Sj)!=-1){
									check=1;
									%>
									<td rowspan="<%=a%>"><font size="2">
										<span id="DG_GXK__ctl<%=i%>_XQ<%=p%>"><%=name%> <%=time%> <%=place%></span>
									</font></td><%}%><%} %><%rs.close(); %>
									<%if(check==0){%>
									<td><font size="2">
										<span id="DG_GXK__ctl<%=i%>_XQ<%=p%>"></span>
									</font></td><%} %><%} %>
									
<%} %>
	</tr>
</table>
 <%
 stmt.close();
 conn.close();
  %>