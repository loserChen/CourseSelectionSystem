package loginManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.*;
import javax.swing.JOptionPane;
import java.util.ArrayList;
public class LoginServlet extends HttpServlet {

	public void wrongNullUsername(){
		String msg="用户名不能为空";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="信息提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	public void wrongNullPassword(){
		String msg="密码不能为空";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="信息提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	public void wrongNoSuchUser(){
		String msg="未检测到有以下用户";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="信息提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	public void wrongPassword(){
		String msg="用户密码错误，请重新登录";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="信息提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
             String username=request.getParameter("username");
             String password=request.getParameter("password");
             String identity=request.getParameter("identity");
             System.out.println(identity);
		if(username.equals(""))
		{
			wrongNullUsername();
			response.sendRedirect("/CourseSelectSystem/login.jsp");
		}
		else if(password.equals(""))
		{
			wrongNullPassword();
			response.sendRedirect("/CourseSelectSystem/login.jsp");
		}
		else
		{
			try{
				Connection con=null;
				Statement stmt=null;
				ResultSet rs=null;
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String url="jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem";
				con=DriverManager.getConnection(url,"sa","root");
				stmt=con.createStatement();
				if(identity.equals("1"))
				{
					String sql="select * from Students where Sno="+"'"+username+"'";
					rs=stmt.executeQuery(sql);
					int N=0;
					int P=0;
					while(rs.next())
					{
						if(username.equals(rs.getString("Sno")))
						{
							N=10001;
							if(password.equals(rs.getString("Spassword")))
							{
								P=10001;
								LoginBean nn=new LoginBean();
								nn.setUserName(username);
								nn.setPassword(password);
								nn.setName(rs.getString("Sname"));
								HttpSession session=request.getSession();
								ArrayList login=new ArrayList();
								login.add(nn);
								session.setAttribute("login", login);
								response.sendRedirect("/CourseSelectSystem/Student/StudentMain.jsp");
							}else{
								
							}
						}else{
							N++;
						}
					}
					if(N<10001)
					{
						wrongNoSuchUser();
						response.sendRedirect("/CourseSelectSystem/login.jsp");
					}
					else if(P<10001)
					{
						wrongPassword();
					}
				}
				else if(identity.equals("2"))
				{
					String sql="select * from Teachers where Tno="+"'"+username+"'";
					rs=stmt.executeQuery(sql);
					int N=0;
					int P=0;
					while(rs.next())
					{
						if(username.equals(rs.getString("Tno")))
						{
							N=10001;
							if(password.equals(rs.getString("Tpassword")))
							{
								P=10001;
								/*LoginBean nn=new LoginBean();
								nn.setUserName(username);
								nn.setName(rs.getString("Tname"));
								nn.setPassword(password);
								HttpSession session=request.getSession();
								ArrayList login=new ArrayList();
								login.add(nn);
								session.setAttribute("login", login);
								*/
								String TeaNumber = rs.getString("Tno");
								String TeaPassword = rs.getString("Tpassword");
								String TeaName = rs.getString("Tname");
								request.getSession().setAttribute("Tno", TeaNumber);
								request.getSession().setAttribute("Tpassword", TeaPassword);
								request.getSession().setAttribute("Tname", TeaName);
								response.sendRedirect("/CourseSelectSystem/Teacher/Main.jsp");
							}else{
								
							}
						}else{
							N++;
						}
					}
					if(N<10001)
					{
						wrongNoSuchUser();
						response.sendRedirect("/CourseSelectSystem/login.jsp");
					}
					else if(P<10001)
					{
						wrongPassword();
					}
				}
				else if(identity.equals("3"))
				{
					if(username.equals("sa")&&password.equals("root"))
						response.sendRedirect("/CourseSelectSystem/Admin/Admin.jsp");
				}
			
			}catch(Exception e)
			{
				e.printStackTrace();
			}
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
