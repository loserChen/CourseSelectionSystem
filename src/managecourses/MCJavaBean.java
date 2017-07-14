package managecourses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class MCJavaBean {
	private String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	private String url= "jdbc:sqlserver://localhost:1433; DatabaseName=CourseSelectionSystem";
	private String user="sa";
	private String password="root";
	private Connection con=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Connection getCon() {
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	public Statement getSt() {
		return st;
	}
	public void setSt(Statement st) {
		this.st = st;
	}
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	
	//完成连接数据库的操作，并生成容器返回
	public Statement getStatement(){
		try {
			Class.forName(getDriverName());
			con=DriverManager.getConnection(getUrl(), getUser(), getPassword());
			return con.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
			message("无法完成数据库的连接或无法返回容器，请检查getStatement()方法!");
			return null;
		}
	}
	
	//查询教师信息并返回
	public ResultSet selectTeachers(){
		try {
			String sql="select Tno,Tname  from Teachers";
			st=getStatement();
			return st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			message("无法查询教师信息，请检查selectTeachers()方法!");
			return null;
		}
	}
	
	//查询课程信息并返回
	public ResultSet selectCourses(){
		try {
			String sql="select Cno,Cname  from Courses";
			st=getStatement();
			return st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			message("无法查询课程信息，请检查selectCourses()方法!");
			return null;
			}
		}
	
	//插入到AvailableCourses表
	public boolean AddMCTable(String Cno,String Tno){
		try {
			String sql="insert into AvailableCourses  values ("+"'"+Cno+"'"+" , "+"'"+Tno+"'"+" )";
			st=getStatement(); 
			st.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			message("无法添加到availableCourses表中，请检查AddMCTable()方法！");
			return false;
		}
	}
	
	
	//一个带参数的信息提示框
	private void message(String msg) {
		int type=JOptionPane.YES_NO_OPTION;
		String title="信息提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
}
