<%@page import ="studentManage.Student" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
    <head><title>学生信息查询</title>
    <link rel="stylesheet" type="text/css"  href="cssStudentManageShare.css">
    </head>
    <body>
    <div id="glass" class="glass">
  <%Calendar calendar=Calendar.getInstance();
  int a=calendar.get(Calendar.YEAR); %>
     <br><br><br><br><br>
   学期查询
      <form action="/CourseSelectSystem/LookStudentServlet" method="post">
        <select name="term">
        <option value="0">学期不限</option>
        <option ><%=a %></option>
        <option ><%=a-1 %></option>
        <option ><%=a-2 %></option>
        <option><%=a-3 %></option>
        <option ><%=a-4 %></option>
        
        </select>
        <input type="submit" name="submit" value="确定"/>
      </form>
     </div>
    </body>
    </html>