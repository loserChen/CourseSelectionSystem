package managecourses;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ManageCoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManageCoursesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		MCJavaBean mc=new MCJavaBean();
		String MCTno=request.getParameter("MCTno");
		String MCCno=request.getParameter("MCCno");
		
		if(mc.AddMCTable(MCCno, MCTno)){
			response.sendRedirect("/CourseSelectSystem/Admin/availableCourseManage/AddSuccess.jsp");
		}
		
		
	}
	

}
