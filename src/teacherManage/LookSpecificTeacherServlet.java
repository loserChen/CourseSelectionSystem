package teacherManage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class LookSpecificTeacherServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LookSpecificTeacherServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
          
          try{
        	  String teacherNumber=request.getParameter("teacherNumber");
        	 
  			DBJavaBean db=new DBJavaBean();
  			ResultSet rs=db.selectSpecificTeacher(teacherNumber);
  			HttpSession session=request.getSession();
  			ArrayList al=new ArrayList();
  			while(rs.next())
  			{
  				Teacher te=new Teacher();
  				te.setStudentNumber(rs.getString(1));
  				
  				te.setStudentName(rs.getString("Sname"));
  				
  				te.setTeacherNumber(rs.getString(3));
  				te.setTeacherName(rs.getString("Tname"));
  		     
  		        te.setCourseNumber(rs.getString(5));
  		        te.setCourseName(rs.getString("Cname"));
  				al.add(te);
  				session.setAttribute("al", al);
  			}
  			rs.close();
  			response.sendRedirect("/CourseSelectSystem/Admin/teacherManage/lookSpecificTeacher.jsp");
  		}catch(Exception e)
  		{
  			e.printStackTrace();
  			 JOptionPane.showMessageDialog(null, "Çë¼ì²élookTeacherServlet·½·¨");
  		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
