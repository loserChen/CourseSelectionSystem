<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import="loginManage.LoginBean" %>
    <%@ page import="java.util.ArrayList" %>
     
<html>
  <head>
    <title>密码修改</title>
  </head>
  <body background="../images/rapeflower.jpg">
 
  <form action="/CourseSelectSystem/UpdatePassword" method="post">
  <%  String username=null;
      ArrayList login=(ArrayList)session.getAttribute("login");
      for(int i=login.size()-1;i>=0;i--)
      {
       LoginBean nn=(LoginBean)login.get(i);
       username=nn.getUserName();
      }
      %>
    <div class="container" style="margin:0 auto;width:100%;">
		<div class="header" align="center" style="height:100px;margin-bottom:5px;">
			<img src="zjut3.jpg">
		</div>
		<div class="topmenu" style="padding-left:550px;height:30px;">
			<p>您的位置：学生管理&lt;用户管理&lt;学生密码修改</p>
		</div>
		<div class="middle" align=center>
			
						<table align=center width:300px;">
  							<tr>
  								<font size=30px  color=black>密码修改</font>
  							</tr>
							<tr>
  								<td>
  									&nbsp;用户新密码:
  								</td>
  								<td>
  									<input type="password" name="Spassword1" id="Spassword1"/>
  								</td>
  							</tr>
							<tr>
  								<td>
  									&nbsp;确认新密码:
  								</td>
  								<td>
  									<p><input type="password" name="Spassword2" id="Spassword2"/></p>
  								</td>
  							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="submit" name="submit" value="提交"/>
								
									<input type="button" id="search" value="返回首页" onclick="document.fm.action='/CourseSelectSystem/Student/StudentMain.jsp';document.fm.submit();">
								</td>
							</tr>
  						</table>
  					
		</div>
		<div class="footer" style="	height:60px;">
			<table align=center>
				<tr>
					<td align="center">
						
					</td>
				</tr>
				<tr>
					<td><hr style="width:810px;" /></td>
				</tr>	
			</table>
		</div>
	</div>
	</form>
  </body>
</html>
