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

import teacherManage.DBJavaBean;
import teacherManage.Teacher;

public class LookDeleteTeacherServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LookDeleteTeacherServlet() {
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
			ResultSet rs=db.lookDeleteTeacher();
			HttpSession session=request.getSession();
			ArrayList al=new ArrayList();
			while(rs.next()){
				Teacher te=new Teacher();
				te.setTeacherNumber(rs.getString("Tno"));
				al.add(te);
				session.setAttribute("al", al);
			}
			rs.close();
			response.sendRedirect("/CourseSelectSystem/Admin/teachertManage/lookDeleteTeacher.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
			 JOptionPane.showMessageDialog(null, "Çë¼ì²élookDeleteTeacherServlet·½·¨");
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
