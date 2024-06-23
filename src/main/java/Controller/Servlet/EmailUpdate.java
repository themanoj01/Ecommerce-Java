package Controller.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Utils.Hashing;
import DBController.DatabaseController;

/**
 * Servlet implementation class EmailUpdate
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/EmailUpdate" })
public class EmailUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailUpdate() {
        super();
        }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String oldPassword = request.getParameter("oldPassword");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		Hashing hashed = new Hashing();
		String hashedPassword = hashed.hashingPassword(password);
		
		
		DatabaseController controller = new DatabaseController();
		try {
			int count = controller.checkPassword(email, oldPassword);
			int result = 0;
			if(count > 0) {
				if(password.equals(confirmPassword)) {
					result = controller.updatePassword(hashedPassword, email);
					if(result > 0) {
						String errormessage = "Account updated";
						request.setAttribute("errorMessage", errormessage);
						request.getRequestDispatcher("/Htmls/Email.jsp").forward(request, response);
					}
					else {
						String errormessage = "Account Not updated";
						request.setAttribute("errorMessage", errormessage);
						request.getRequestDispatcher("/Htmls/Email.jsp").forward(request, response);
					}
				}
				else {
					String errormessage = "Password and Confirm password must be Same";
					request.setAttribute("errorMessage", errormessage);
					request.getRequestDispatcher("/Htmls/Email.jsp").forward(request, response);
				}
				
			}
			else {
				String errormessage = "Password Wrong";
				request.setAttribute("errorMessage", errormessage);
				request.getRequestDispatcher("/Htmls/Email.jsp").forward(request, response);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			String errormessage = "Server Error";
			request.setAttribute("errorMessage", errormessage);
			request.getRequestDispatcher("/Htmls/Email.jsp").forward(request, response);
		}
	}

}
