package courseManage;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.*;
import javax.swing.JOptionPane;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddCourseServlet extends HttpServlet {
	
	public void wrong1(){
		String msg="不允许有空，添加失败";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public void wrong2(){
		String msg="课程已存在，添加失败";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public void right(){
		String msg="添加信息成功";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	/**
	 * Constructor of the object.
	 */
	public AddCourseServlet() {
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
    	String Cname=new String(request.getParameter("Cname"));
    	String Cperiod=new String(request.getParameter("Cperiod"));
    	String Ccredit=new String(request.getParameter("Ccredit"));
    	String Ctime=new String(request.getParameter("Ctime"));
    	String Cplace=new String(request.getParameter("Cplace"));
    	String Ctype=new String(request.getParameter("Ctype"));
    	if(Cno.length()==0||Cname.length()==0||Cperiod.length()==0||Ccredit.length()==0||Ctime.length()==0||Ctype.length()==0){
    		wrong1();
    		response.sendRedirect("/ManageCourses/addcourses.jsp");
    	}else{
    		try{
    			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    			String url="jdbc:sqlserver://localhost:1433;databasename=CoursesSelectionSystem";
    			String user="sa";
    			String password="root";
				Connection conn=DriverManager.getConnection(url, user,password);
				Statement stmt=conn.createStatement();
				String sql2="insert into Courses(Cno,Cname,Cperiod,Ccredit,Ctime,Cplace,Ctype)values('"+Cno+"'"+","+"'"+Cname+"'"+","+"'"+Cperiod+"'"+","+"'"+Ccredit+"'"+","+"'"+Ctime+"'"+","+"'"+Cplace+"'"+","+"'"+Ctype+"')";
				stmt.executeUpdate(sql2);
				stmt.close();
				conn.close();
				right();
				response.setCharacterEncoding("gbk2312");
				response.sendRedirect("/ManageCourses/CoursesLook.jsp");//添加课程信息的前面的主界面
    		}catch(Exception e){
    			e.printStackTrace();
    			wrong2();
    			response.sendRedirect("/ManageCourses/addcourses.jsp");
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
