package SelectCourses;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import loginManage.LoginBean;

public class Select{


	private String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
       private String url="jdbc:sqlserver://localhost:1433;databasename=CourseSelectionSystem;characterEncoding=UTF-8";
       private String user ="sa";
       private String password="root";
       private Connection con=null;
       private Statement st=null;
       private ResultSet rs=null;
       public String getDriverName(){
    	   return driverName;
       }
       public void setDriverName(String driverName)
       {
    	   this.driverName=driverName;
       }
       public String getUrl()
       {
    	   return url;
       }
       public void setUrl(String url)
       {
    	   this.url=url;
       }
       public String getUser()
       {
    	   return user;
    	}
       public void setUser(String user)
       {
    	   this.user=user;
        }
       public String getPassword()
       {
    	   return password;
       }
       public void setPassword(String password)
       {
    	   this.password=password;
       }
       public Connection getCon()
       {
    	   return con;
       }
       public void setcon(Connection con)
       {
    	   this.con=con;
       }
       public Statement getSt()
       {
    	   return st;
       }
       public void setSt(Statement st)
       {
    	   this.st=st;
       }
       public ResultSet getRs()
       {
    	   return rs;
       }
       public void setRs(ResultSet rs)
       {
    	   this.rs=rs;
       }
       public Statement getStatement(){
    	   try{
    		   Class.forName(getDriverName());
    		 con=DriverManager.getConnection(url, "sa","root");
    		 return con.createStatement();
    	   }catch(Exception e){
    		   e.printStackTrace();
               message("???");
    		   return null;
    	   }
       }
       public void message(String msg){
    	   int type=JOptionPane.YES_NO_OPTION;
    	   String title="信息提示";
    	   JOptionPane.showMessageDialog(null, msg,title,type);
       }
       public boolean Add(String []courses,String username){
      try{
    	  
    boolean a=true;
    Connection con=DriverManager.getConnection(url, "sa","root");
    Statement stmt=con.createStatement();
    		   for(int i=0;i<courses.length;i++){
    			   System.out.println(courses[i]);
    		  String sql="select * from Courses,AvailableCourses,Teachers where AvailableCourses.Cno='"+courses[i]+"' and AvailableCourses.Cno=Courses.Cno";
    		  ResultSet rs=stmt.executeQuery(sql);
    		 rs.next();
    		 String sql1="insert into Reports values('"+username +"','"+        courses[i]+"','"+ rs.getString("Tno")+"',null,null)";
    		 //PreparedStatement pstmt1=con.prepareStatement(sql1);
    		 //int row= pstmt1.executeUpdate();
    		 st=getStatement();
    		 int row=st.executeUpdate(sql1);
    		 System.out.println(row);
    		  if(row!=1){
    			  st.close();
    			  con.close();
    			  a=false;
    		  }
    		   }
    	  
    	  return a;
       }catch(Exception e){
    	   e.printStackTrace();
    	  message("?");
    	   return false;
       }
       }
}
