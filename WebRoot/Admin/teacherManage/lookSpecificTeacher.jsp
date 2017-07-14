<%@page import ="teacherManage.Teacher" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
    <head><title>学生信息查询</title>
    <link rel="stylesheet" type="text/css"  href="cssTeacherManageShare.css">
      </head>
      <body>
      <div id="glass" class="glass" >
     
     <br><br><br><br><br>
     <%
     ArrayList al=(ArrayList)session.getAttribute("al");
      %>
      <p align="center">你要查询的教师数据表中共有
      <font size="5" color="red">
      <%=al.size() %>
      </font>
      人
      </p>
       
        <table border="2" width="600" align="center">
            <tr>
            <th>学生学号</th>
            <th>学生姓名</th>
            <th>教师工号</th>
            <th>教师姓名</th>
            <th>课程号</th>
            <th>课程名</th>
            </tr>
            <%
            for(int i=0;i<al.size();i++){
                 Teacher te=(Teacher)al.get(i);
             %>
             <tr>
                <td><%=te.getStudentNumber() %></td>
                <td><%=te.getStudentName() %></td>
                <td><%=te.getTeacherNumber() %></td>
                <td><%=te.getTeacherName() %></td>
                <td><%=te.getCourseNumber() %></td>
                <td><%=te.getCourseName() %></td>
               
             </tr>
             <%
             }
             
              %>
              
        </table>
        </div>
    </body>
    </html>