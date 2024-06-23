package Controller.Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.Utils.Hashing;
import Controller.Utils.StringUtils;
import DBController.DatabaseController;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int loginResult = 0;
		String databasePassword = null;
		String userName = null;
		String phone = null;
		int id = 0;
		String userRole = null;
		String user = "user";
		Hashing hashed = new Hashing();


		DatabaseController controller = new DatabaseController();
		try {

			boolean exist = controller.userExist(email);

			if(exist) {
				ResultSet Result = controller.getUser(email);

				if(Result.next()) {
					databasePassword = Result.getString("password");
					userName = Result.getString("userName");
					phone = Result.getString("phone");
					user = Result.getString("userType");
					id = Result.getInt("userID");
				}

				if(databasePassword != null && hashed.matchedPassword(password, databasePassword)) {
					loginResult = 1;
				}

				if(loginResult > 0) {
					HttpSession userSession = request.getSession();
					userSession.setAttribute("userName", userName);
					userSession.setMaxInactiveInterval(30*60);

					Cookie userCookie = new Cookie("user", userName);
					userCookie.setMaxAge(30*60);
					response.addCookie(userCookie);

					Cookie userEmail = new Cookie("email", email);
					userEmail.setMaxAge(30*60);
					response.addCookie(userEmail);

					Cookie userPhone = new Cookie("phone", phone);
					userPhone.setMaxAge(30*60);
					response.addCookie(userPhone);
					
					Cookie userID = new Cookie("userID", String.valueOf(id));
					userID.setMaxAge(30*60);
					response.addCookie(userID);
					
					Cookie userType = new Cookie("userRole", user);
					userType.setMaxAge(30*60);
					response.addCookie(userType);

					if(user.equals("admin")) {
						response.sendRedirect("/CourseWork/Htmls/AdminDashboard.jsp");
					}
					else {
						response.sendRedirect("/CourseWork/Htmls/Home.jsp");
					}
				}
				else if(loginResult < 1) {

					String errormessage = "Incorrect Email and Password!";
					request.setAttribute("errorMessage5", errormessage);
					request.getRequestDispatcher("/Htmls/Login.jsp").forward(request, response);
				}
			}
			else {
				String errormessage = "Please create an Account";
				request.setAttribute(StringUtils.errorMessage, errormessage);
				request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			String errormessage = "Server Error. Try again";
			request.setAttribute("errorMessage5", errormessage);
			request.getRequestDispatcher("/Htmls/Login.jsp").forward(request, response);
		}
	}

}
