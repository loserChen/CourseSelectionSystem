<%@ page contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
    <head>
      <title>学生信息添加</title>
     
      </head>
      <body>
      <h3 align=center>添加学生信息</h3>
      
      <form action="/CourseSelectSystem/AddTeacherServlet" method="post">
      
      <table border="1" width="500" align="center">
      <tr>
        <td>工号</td>
        <td><input type="text" name="teacherNumber" size="60"/></td>
      </tr>
      <tr>
         <td>姓名</td>
         <td><input type="text" name="teacherName"size="60"/></td>
      </tr>
      <tr>
         <td>性别</td>
         <td><input type="text" name="teacherSex"size="60"/></td>
      </tr>
      <tr>
         <td>密码</td>
         <td><input type="text" name="teacherPassword"size="60"/></td>
      </tr>
      <tr align="center">
           <td colspan="2" >
           <input type="submit" value="提交"/>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <input type="reset" value="取消"/>
           </td>
      </tr>
      </table>
      </form>
    </body>
    </html>