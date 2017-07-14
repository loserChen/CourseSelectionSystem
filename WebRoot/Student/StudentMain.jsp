<%@ page contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="loginManage.LoginBean" %>
<%@ page import="java.util.ArrayList" %>
    <html>
  <head>
    <title>StudentMain.html</title>
	
   

  </head>

  
 <frameset rows="200,*" cols="730"  frameborder="no">
       <frame src="top.jsp" scrolling="no" name="top" noresize="noresize" bordercolor="#000000">
       <frameset cols="220,*" >
           <frame src="left.jsp? " scrolling="no" noresize="noresize" >
           <frame src="right.jsp? " name="main" scrolling="yes" noresize="noresize" >
       </frameset>
 </frameset>
</html>