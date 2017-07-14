package teacher;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class lookOneStudent
 */
@WebServlet("/lookOneStudent")
public class lookOneStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lookOneStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String studentNumber = request.getParameter("studentNumber");
		//String studentName = request.getParameter("studentName");
		request.getSession().setAttribute("stuNum", studentNumber);
		//request.getSession().setAttribute("stuName", studentName);
		try {
			DBJavaBean db=new DBJavaBean();
			ResultSet rs=db.lookOneStudent();
			ResultSet rs1=db.selectStudents();
			HttpSession session=request.getSession();
			ArrayList al=new ArrayList();
			ArrayList al1 = new ArrayList();
			ArrayList al2 = new ArrayList();
			ArrayList al3 = new ArrayList();
			while(rs.next()){
				Student stu = new Student();
				Course cou = new Course();
				report rep = new report();
				
				stu.setStudentNumber(rs.getString("Sno"));
				stu.setStudentName(rs.getString("Sname"));
				stu.setStudentSex(rs.getString("Ssex"));
				stu.setStudentMajor(rs.getString("Smajor"));
				stu.setStudentCollege(rs.getString("Scollege"));
				cou.setCno(rs.getString("Cno"));
				cou.setCname(rs.getString("Cname"));
				rep.setStudentScore(rs.getInt("Score"));
				
				al.add(stu);
				al1.add(cou);
				al2.add(rep);
				
				session.setAttribute("al", al);
				session.setAttribute("al1", al1);
				session.setAttribute("al2", al2);
			}
			while(rs1.next()){
				Student stu1 = new Student();
				
				stu1.setStudentNumber(rs1.getString("Sno"));
				stu1.setStudentName(rs1.getString("Sname"));
				stu1.setStudentSex(rs1.getString("Ssex"));
				stu1.setStudentMajor(rs1.getString("Smajor"));
				stu1.setStudentCollege(rs1.getString("Scollege"));
				
				al3.add(stu1);
				
				session.setAttribute("al3", al3);
			}
			rs1.close();
			rs.close();
			response.sendRedirect("/CourseSelectSystem/Teacher/lookOneStudent.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
