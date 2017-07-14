package student;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import loginManage.LoginBean;
//need package search id and password

public class UpdatePassword extends HttpServlet {
	public void wrong1(){
		String msg="不允许有空，修改失败";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public void wrong2(){
		String msg="两次密码不一致，修改失败";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public void right(){
		String msg="修改成功";
		int type =JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示信息";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	
	public UpdatePassword() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String password1=new String(request.getParameter("Spassword1"));
		String password2=new String(request.getParameter("Spassword2"));
		if(password2.length()==0||password1.length()==0){
			wrong1();
			response.sendRedirect("/CourseSelectSystem/Student/UpdatePassword/change.jsp");
		}else if(!(password2.equals(password1))){
			wrong2();
			response.sendRedirect("/CourseSelectSystem/Student/UpdatePassword/change.jsp");
		}else{
			try{
				Connection con=null;
				Statement stmt=null;
				ResultSet rs=null;
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String url="jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem";
				String user="sa";
				String password="root";
				
				 con=DriverManager.getConnection(url, user,password);
				stmt=con.createStatement();
				HttpSession session=request.getSession();
				String username=null;
			      ArrayList login=(ArrayList)session.getAttribute("login");
			      for(int i=login.size()-1;i>=0;i--)
			      {
			       LoginBean nn=(LoginBean)login.get(i);
			       username=nn.getUserName();
			      }
			      System.out.println(username+"update");
				
				String sql1="Update Students set Spassword ='"+password1+"' where Sno='"+username+"'";
				stmt.executeUpdate(sql1);
//				LoginBean nn=new LoginBean();
//				nn.setPassword(password1);
//				ArrayList wordlist=null;  
//				wordlist=new ArrayList();
//				wordlist.add(nn);
//				session.setAttribute("login",login);
				
				stmt.close();
				con.close();
				right();
				response.sendRedirect("/CourseSelectSystem/Student/StudentMain.jsp");
			}catch(Exception e){
				e.printStackTrace();
				JOptionPane.showMessageDialog(null, "数据库连接有误");
			}
		}
	}
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
