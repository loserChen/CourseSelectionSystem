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
 * Servlet implementation class PageBeforeScore
 */
@WebServlet("/PageBeforeScore")
public class PageBeforeScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageBeforeScore() {
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
		int page_number = Integer.parseInt(request.getParameter("page_number")) - 1;
		request.getSession().setAttribute("page_number", page_number);
		String Tno = request.getParameter("Tno");
		String Tname = request.getParameter("Tname");
		request.getSession().setAttribute("Tno",Tno);
		request.getSession().setAttribute("Tname",Tname);
		try {
			DBJavaBean db=new DBJavaBean();
			ResultSet rs=db.selectStudentScoreByPage(page_number,Tno);
			HttpSession session=request.getSession();
			ArrayList al1=new ArrayList();
			ArrayList al2=new ArrayList();
			ArrayList al3=new ArrayList();
			ArrayList al4=new ArrayList();
			while(rs.next()){
				Student stu = new Student();
				Teacher tea = new Teacher();
				Course cou = new Course();
				report rep = new report();
				stu.setStudentNumber(rs.getString("Sno"));
				stu.setStudentName(rs.getString("Sname"));
				tea.setTeacherName(rs.getString("Tname"));
				cou.setCno(rs.getString("Cno"));
				cou.setCname(rs.getString("Cname"));
				rep.setStudentScore(rs.getInt("Score"));
				
				al1.add(stu);
				al2.add(tea);
				al3.add(cou);
				al4.add(rep);
				
				session.setAttribute("al1", al1);
				session.setAttribute("al2", al2);
				session.setAttribute("al3", al3);
				session.setAttribute("al4", al4);
			}
			rs.close();
			response.sendRedirect("/CourseSelectSystem/Teacher/insertScoreShow.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
