package SelectCourses;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginManage.LoginBean;

public class AddCourses extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddCourses() {
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
		String username=null;
  	  HttpSession session=request.getSession();
	      ArrayList login=(ArrayList)session.getAttribute("login");
	      for(int i=login.size()-1;i>=0;i--)
	      {
	       LoginBean nn=(LoginBean)login.get(i);
	       username=nn.getUserName();
	      }
	      System.out.println(username+"select courses");
	      
		String[] courses=request.getParameterValues("courses");
		
		 Select db=new Select();
		 if(db.Add(courses,username)){
			 response.sendRedirect("/CourseSelectSystem/Student/CourseSelection/Check.jsp");
		 }else{
			 response.sendRedirect("/CourseSelectSystem/Student/CourseSelection/index.jsp");
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
