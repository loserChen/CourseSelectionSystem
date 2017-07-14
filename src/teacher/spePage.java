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
 * Servlet implementation class spePage
 */
@WebServlet("/spePage")
public class spePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public spePage() {
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
		int page_number = Integer.parseInt(request.getParameter("page_number"));
		request.getSession().setAttribute("page_number", page_number);
		try {
			DBJavaBean db=new DBJavaBean();
			ResultSet rs=db.selectByPage(page_number);
			HttpSession session=request.getSession();
			ArrayList al=new ArrayList();
			while(rs.next()){
				Student stu=new Student();
				stu.setStudentNumber(rs.getString("Sno"));
				stu.setStudentName(rs.getString("Sname"));
				stu.setStudentSex(rs.getString("Ssex"));
				stu.setStudentMajor(rs.getString("Smajor"));
				stu.setStudentCollege(rs.getString("Scollege"));
				al.add(stu);
				session.setAttribute("al", al);
			}
			rs.close();
			response.sendRedirect("/CourseSelectSystem/Teacher/lookStudentInfo.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
