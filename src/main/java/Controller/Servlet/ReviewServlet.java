package Controller.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBController.DatabaseController;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ReviewServlet" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		DatabaseController controller = new DatabaseController();
		try {
			int result = controller.reviewStore(userName, email, phone, message);
			if(result > 0) {
				String errormessage = "Review Sent";
				request.setAttribute("ReviewMessage", errormessage);
				request.getRequestDispatcher("/Htmls/aboutUs.jsp").forward(request, response);
			}
			else {
				String errormessage = "Review cannot be sent";
				request.setAttribute("ReviewMessage", errormessage);
				request.getRequestDispatcher("/Htmls/aboutUs.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			String errormessage = "Server Error";
			request.setAttribute("ReviewMessage", errormessage);
			request.getRequestDispatcher("/Htmls/aboutUs.jsp").forward(request, response);
		}
	}

}
