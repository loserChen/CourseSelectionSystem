<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" 
		import="javax.naming.*"
		import="javax.sql.DataSource"%>
			<%@ page import="loginManage.LoginBean" %>
    <%@ page import="java.util.ArrayList" %>
<html>
  <head>
    <title>学生评教</title>
    <link rel="stylesheet" type="text/css" href="style1.css">
    <script type="text/javascript" language="JavaScript">
    function Check(){
     var checkArry = document.getElementsByName("credit");
            for (var i = 0; i < checkArry.length; i++) { 
                if(checkArry[i].value=="请选择"){
                    alert("选项不能为空!");
    				return false;
                }
            }
    }
    </script>
  </head>
  <body  background="images/ZJUTflower.jpg" style="background-size:cover">
  <form  method="post" name="fm" id="fm" onclick="document.fm.action='/CourseSelectSystem/login.jsp';document.fm.submit();">
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
  <form action="update.jsp" method="post"  onSubmit="return Check()">
  <%String username=null;
  String Sname=null;
      ArrayList login=(ArrayList)session.getAttribute("login");
      for(int i=login.size()-1;i>=0;i--)
      {
       LoginBean nn=(LoginBean)login.get(i);
       username=nn.getUserName();
       Sname=nn.getName();
      } %>
  <table id=top2 align="center" width="750px"><tr><td>学生管理>学生评教>评教课程一览</td><td>用户:<%=Sname %></td><td>&nbsp学&nbsp期:&nbsp
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
</select><input type="button" name="Button1" value="查询" onclick="document.fm.action='MyJsp.jsp';document.fm.submit();"/></td></tr>
<TR>
								<TD style="FONT-SIZE: 12px; COLOR: white; HEIGHT: 21px" colspan="3"><FONT color="green">温馨评教提示： 
										感谢同学们积极参与和支持评教工作！学评教是我校教学质量监控的重要环节，提高教学质量的重要依据，对全校的教学工作起到有益的促进作用。为保证评教结果的准确与公正，请同学们在评教工作中注意以下几点： 
										1、主动了解各课程、各任课教师的基本情况，包括教学内容、教学效果、教学方法、教学态度、教书育人等方面。 2、请同学们认真、客观、公正地对每一门课程作出评价。 
										3、你们的所有个人信息在评教结果上是不显示的，我们为每一位同学保密。 
										学评教的最终受益者是广大同学。让我们携起手来，积极参与到评教工作中，为进一步提高我校的教学质量作出自己的贡献。</FONT></TD>
							</TR>
							<TR>
								<TD style="FONT-SIZE: 15px; COLOR: white; HEIGHT: 21px"><FONT color="red"> &nbsp;&nbsp;
										<a id="LinkButton1" href="search1.jsp">返回选课界面</a></FONT></TD>
							</TR>
</table>
<table cellspacing="0" rules="all" border="1" align="center" bgcolor="#F1F3F9" height="30" width="750px">
	<tr bgcolor="LightSteelBlue">
		<td><font color="Navy" size="2">课程号 </font></td><td><font color="Navy" size="2">课程名称</font></td><td><font color="Navy" size="2">课程类型</font></td><td><font color="Navy" size="2">学时</font></td><td><font color="Navy" size="2">学分</font></td><td><font color="Navy" size="2">评教</font></td>
	</tr>
	<%
	InitialContext initCtx = new InitialContext();
       DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sampleDS");
       Connection conn = ds.getConnection();
String semester=(String)request.getAttribute("semester");

//String sql="select * from Courses where Csemester= ?";
String sql="select Courses.* from Reports,Courses where Courses.Cno=Reports.Cno and Courses.Csemester='"+semester+"'"+"and Reports.Sno='"+username+"'";
PreparedStatement stmt=conn.prepareStatement(sql);
//stmt.setString(1,semester);
ResultSet rs=stmt.executeQuery();
while(rs.next()){
 %><tr>
		<td>
														<span ><%=rs.getString("Cno") %></span>
													</td><td>
														<span ><%=rs.getString("Cname") %></span>
													</td><td>
														<span ><%=rs.getString("Ctype") %></span>
													</td><td>
														<span ><%=rs.getString("Cperiod") %></span>
													</td><td>
														<span ><%=rs.getString("Ccredit")%></span>
													</td><td> <select name="credit">
													<option value="请选择">请选择</option>
													<option value="10">10</option>
													<option value="9">9</option>
													<option value="8">8</option>
													<option value="7">7</option>
													<option value="6">6</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option></select></td>
	</tr>
<%} %>
</table>

<table align="center" width="750px">
				<tr height="50px"><td align="right"><input type="submit"value="提交"/></td></tr>
	<tr>
					<td height="20">
						<div  align="left">
							<div align="center"><font size="1px" color="#333333">系统问题请联系我们</font></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center"><span id="span1">地址:浙工大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							电话:123456 </span>
					</td>
				</tr>
</table>
<hr width="750px" align="center">
</form>
  </body>
</html>
 <%
 rs.close();
 stmt.close();
 conn.close();
  %>