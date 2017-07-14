package teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class DBJavaBean {
	private String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	private String url= "jdbc:sqlserver://localhost:1433;DatabaseName=CourseSelectionSystem;";
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
	
	public boolean insertScore(String studentNumber, String courseNumber, String studentScore, String Tno){
		try{
			String sql = "update Reports set Score = " + "'" + studentScore + "'" + "where Sno = " +
		"'" +studentNumber + "'" + "and Cno = " + "'" + courseNumber + "' and Tno = '" + Tno +"'";
			st = getStatement();
			int row = st.executeUpdate(sql);
			if(row == 1){
				st.close();
				con.close();
				return true;
			}else{
				st.close();
				con.close();
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
			message("无法添加学生成绩！");
			return false;
		}
	}
	
	public ResultSet selectStudents(){
		try {
			String sql = "select * from Students";
			st = getStatement();
			return st.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			message("无法查询学生信息，请检查selectStudents()方法!");
			return null;
		}
	}
	
	public ResultSet selectByPage(int page_number){
		try{
			int page_number_new = page_number - 1;
			String sql = "select top 8 * from Students where Sno not in (select top "+ page_number_new * 8 +" Sno from Students)";
			st = getStatement();
			return st.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
			message("无法按页查询学生信息！");
			return null;
		}
	}
	
	public ResultSet selectStudentScore(){
		try{
			String sql = "select Students.Sno,Sname,Reports.Cno,Cname,Tname,Score "
					+ "from Students,Courses,Teachers,Reports "
					+ "Where Students.Sno = Reports.Sno and Courses.Cno = Reports.Cno "
					+ "and Teachers.Tno = Reports.Tno";
			st = getStatement();
			return st.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
			message("无法查询学生成绩!");
			return null;
		}
	}
	public ResultSet selectStudentScoreByPage(int page_number,String teaNumber){
		try{
			int page_number_new = page_number - 1;
			String sql = "select top 8 * from stuScore Where id not in (select top "+ page_number_new * 8 +" id from stuScore) and Tno = '" + teaNumber + "'";
			st = getStatement();
			return st.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
			message("无法查询学生成绩!");
			return null;
		}
	}
	
	public ResultSet lookOneStudent(){
		try{
			String sql = "select Students.Sno,Sname,Ssex,Smajor,Scollege,Reports.Cno,Cname,Tname,Score "
					+ "from Students,Courses,Teachers,Reports "
					+ "Where Students.Sno = Reports.Sno and Courses.Cno = Reports.Cno "
					+ "and Teachers.Tno = Reports.Tno";
			st = getStatement();
			return st.executeQuery(sql);
		}catch(Exception e){
			e.printStackTrace();
			message("无法查询此学生信息！");
			return null;
		}
	}
	
	private void message(String msg) {
		int type=JOptionPane.YES_NO_OPTION;
		String title="信息提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
}
