<%@page import ="studentManage.Student" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <html>
       <head>
         <title>学生信息删除</title>
       </head>
       <body>
          <br><br><br>
          <h2>删除学生</h2><br>
          <%
            ArrayList al=(ArrayList)session.getAttribute("al");
           %>
           <form action="/CourseSelectSystem/DeleteStudentServlet" method="post">
               <p>请选择要删除学生的学号：</p>
               <select name="NO">
               <%
               for(int i=0;i<al.size();i++){
                   Student st=(Student)al.get(i);
                %>
                <option value="<%=st.getStudentNumber() %>">
                   <%=st.getStudentNumber() %>
                 </option>
                   <%} %>
                   </select>
                   <input type="submit" value="确定">&nbsp;
                   <input type="button" value="返回"
                       onClick="javascript:history.go(-1)">
           </form>
       </body>
    </html>