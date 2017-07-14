package teacher;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class InsertScore
 */
@WebServlet("/InsertScore")
public class InsertScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String studentNumber = request.getParameter("studentNumber");
		String courseNumber = request.getParameter("courseNumber");
		String studentScore = request.getParameter("studentScore");
		String Tno = request.getParameter("Tno");
		String Tname = request.getParameter("Tname");
		request.getSession().setAttribute("Tno",Tno);
		request.getSession().setAttribute("Tname",Tname);
		DBJavaBean db = new DBJavaBean();
		if(db.insertScore(studentNumber, courseNumber, studentScore, Tno)){;
			request.getSession().setAttribute("judge","1");
			response.sendRedirect("/CourseSelectSystem/Teacher/InsertScore.jsp");
		}else{
			request.getSession().setAttribute("judge","2");
			response.sendRedirect("/CourseSelectSystem/Teacher/InsertScore.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
