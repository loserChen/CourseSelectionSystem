package courseManage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class DeleteCourseServlet extends HttpServlet {

	
	public void wrong1(){
		String msg="请输入要删除的课程编号";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public void wrong2(){
		String msg="此联系人不存在";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public void right(){
		String msg="课程成功删除";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	/**
	 * Constructor of the object.
	 */
	public DeleteCourseServlet() {
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

		request.setCharacterEncoding("gb2312");
		String Cno=new String(request.getParameter("Cno"));
		
		if(Cno.length()==0){
			wrong1();
			response.sendRedirect("/ManageCourses/deletecourses.jsp");
		}else{
			try{
				
    			Statement stmt=null;
    			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    			String url="jdbc:sqlserver://localhost:1433;databasename=CoursesSelectionSystem";
    			String user="sa";
				String password="root";
				Connection conn=DriverManager.getConnection(url, user,password);
				String sql="delete from Courses where Cno='"+Cno+"'";
				stmt=conn.createStatement();
				stmt.executeUpdate(sql);
				right();
				response.sendRedirect("/ManageCourses/CoursesLook.jsp");//添加课程信息的前面的主界面
				
			}catch(Exception e){
				e.printStackTrace();
				wrong2();
				response.sendRedirect("/ManageCourses/deletecourses.jsp");
			}
		}
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

		doGet(request,response);
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
