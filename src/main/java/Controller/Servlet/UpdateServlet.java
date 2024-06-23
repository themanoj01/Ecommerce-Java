package Controller.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBController.DatabaseController;
import Model.Users;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateServlet" })
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String birthday = request.getParameter("birthday");
		LocalDate birthDate = LocalDate.parse(birthday);
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		DatabaseController controller = new DatabaseController();
		
		String searchEmail = null;
		String searchPhone = null;
		
		int specialCharacter = 0;
		int capitalCharacter = 0;
		int number = 0;
		int passwordLength = 0;
		
		int userNameCharacter = 0;
		int userNameNumber = 0;
		
		int firstNameCharacter = 0;
		int firstNameNumber = 0;
		
		int lastNameCharacter = 0;
		int lastNameNumber = 0;
		
		for(int i=0; i < userName.length(); i++) {
			char character = userName.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*') {
				userNameCharacter += 1;
			}
			if(Character.isDigit(character)) {
				userNameNumber +=1;
			}
		}
		
		for(int i=0; i < lastName.length(); i++) {
			char character = lastName.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*') {
				lastNameCharacter += 1;
			}
			if(Character.isDigit(character)) {
				lastNameNumber +=1;
			}
		}
		
		for(int i=0; i < firstName.length(); i++) {
			char character = firstName.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*') {
				firstNameCharacter += 1;
			}
			if(Character.isDigit(character)) {
				firstNameNumber +=1;
			}
		}
		

		if(firstNameCharacter < 1) {
			if(firstNameNumber < 1) {
				if(lastNameCharacter <1) {
					if(lastNameNumber <1) {

						if(userNameCharacter < 1) {
							if(userNameNumber < 1) {

								Users user = new Users(userName, firstName, lastName, birthDate, address, email, phone);
								int result = 0;
								try {
									result = controller.updateData(user);
									if(result > 0) {
										String errormessage = "Account updated";
										request.setAttribute("errorMessage", errormessage);
										request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
									}
									else {
										String errormessage = "Account Not updated";
										request.setAttribute("errorMessage", errormessage);
										request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);

									}
								} catch (ClassNotFoundException | SQLException e) {
									String errormessage = "Server Error";
									request.setAttribute("errorMessage", errormessage);
									request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
								}
							}


							else {
								String errormessage = "No Number Allowed";
								request.setAttribute("errorMessage2", errormessage);
								request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
							}
						}

						else {
							String errormessage = "No Special Character Allowed";
							request.setAttribute("errorMessage2", errormessage);
							request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
						}	
					}

					else {
						String errormessage = "Cannot contains Numbers";
						request.setAttribute("errorMessage4", errormessage);
						request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
					}
				}
				else {
					String errormessage = "Cannot contains Special Character";
					request.setAttribute("errorMessage4", errormessage);
					request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
				}
			}
			else {
				String errormessage = "Cannot contains Numbers";
				request.setAttribute("errorMessage3", errormessage);
				request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
			}
		}
		else {
			String errormessage = "Cannot contains Special character";
			request.setAttribute("errorMessage3", errormessage);
			request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
		}


	}
	

}
