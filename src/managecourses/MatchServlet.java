package managecourses;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MatchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			MCJavaBean mc=new MCJavaBean();
			ResultSet rs1=mc.selectTeachers();
			ResultSet rs2=mc.selectCourses();
			HttpSession session=request.getSession();
			ArrayList al1=new ArrayList();
			ArrayList al2=new ArrayList();
			while(rs1.next()){
				Teachers te=new Teachers();
				te.setTname(rs1.getString("Tname"));
				te.setTno(rs1.getString("Tno"));
				al1.add(te);
				session.setAttribute("al1", al1);
			}
			while(rs2.next()){
				Courses co=new Courses();
				co.setCname(rs2.getString("Cname"));
				co.setCno(rs2.getString("Cno"));
				al2.add(co);
				session.setAttribute("al2", al2);
			}
			rs1.close();
			rs2.close();
			response.sendRedirect("/CourseSelectSystem/Admin/availableCourseManage/ManageCourses.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}