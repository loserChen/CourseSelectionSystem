<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" 
		import="javax.naming.*"
		import="javax.sql.DataSource"
		import="javax.swing.JOptionPane"
		import="java.io.*"%>
		<%@ page import="loginManage.LoginBean" %>
    <%@ page import="java.util.ArrayList" %>
		<%
	InitialContext initCtx = new InitialContext();
       DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/sampleDS");
       Connection conn = ds.getConnection();
       String semester=request.getParameter("semester");
       String username=null;
      ArrayList login=(ArrayList)session.getAttribute("login");
      for(int i=login.size()-1;i>=0;i--)
      {
       LoginBean nn=(LoginBean)login.get(i);
       username=nn.getUserName();
      }
String sql=" select * from Reports where Sno='"+username+"'";
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			Statement st=conn.createStatement();
			String cre[]=request.getParameterValues("credit");
			int i=0; 
			while(rs.next()){
				String Cno=rs.getString("Cno");
				int credit=Integer.parseInt(cre[i]);
				i++;
				String sql2="update Reports set Credit='"+credit+"'where Cno='"+Cno+"'";
				st.executeUpdate(sql2);}
				request.setAttribute("semester", semester);
				RequestDispatcher rd=request.getRequestDispatcher("assess1.jsp");
					rd.forward(request,response);%>
	<%
 rs.close();
 stmt.close();
 st.close();
 conn.close();
  %>			
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				