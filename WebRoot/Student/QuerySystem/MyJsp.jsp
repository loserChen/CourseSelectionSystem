<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" 
		import="javax.naming.*"
		import="javax.sql.DataSource"
		import="javax.swing.JOptionPane"%>
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
//String sql="select * from Courses where Csemester='"+semester+"'"
String sql="select Reports.* from Reports,Courses where Courses.Cno=Reports.Cno and Courses.Csemester='"+semester+"'"+"and Reports.Sno='"+username+"'";
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			Statement st=conn.createStatement();
			if(rs.next()){
				String Cno=rs.getString("Cno");
				System.out.println(Cno);
				String sql2="select Credit from Reports where Cno='"+Cno+"'";
				ResultSet rs1=st.executeQuery(sql2);
				rs1.next();
				request.setAttribute("semester", semester);
				if(rs1.getInt("Credit")==0){
					RequestDispatcher rd=request.getRequestDispatcher("assess.jsp");
					rd.forward(request,response);
				}
				else{
					RequestDispatcher rd=request.getRequestDispatcher("assess1.jsp");
					rd.forward(request,response);
				}
				}
			else{
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request,response);
			}
			%>

	<%
 rs.close();
 stmt.close();
 st.close();
 conn.close();
  %>			
				
				