package studentManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
public class LookStudentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LookStudentServlet() {
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

		doPost(request,response);
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
			DBJavaBean db=new DBJavaBean();
			ResultSet rs=db.selectStudent();
			HttpSession session=request.getSession();
			ArrayList al=new ArrayList();
			while(rs.next())
			{
				Student st=new Student();
				st.setStudentNumber(rs.getString("Sno"));
				st.setStudentName(rs.getString("Sname"));
				st.setStudentSex(rs.getString("Ssex"));
				st.setStudentId(rs.getString("Sid"));
				st.setStudentPassword(rs.getString("Spassword"));
				al.add(st);
				session.setAttribute("al", al);
			}
			rs.close();
			response.sendRedirect("/CourseSelectSystem/Admin/studentManage/lookStudent.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
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
