package Controller.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Controller.Utils.Hashing;
import DBController.DatabaseController;
import Model.Users;
import Controller.Utils.StringUtils;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet(asyncSupported = true, urlPatterns ={"/RegistrationServlet"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024* 3,
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1014*50)

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String birthDay = request.getParameter("birthday");
		LocalDate birthDate = LocalDate.parse(birthDay);
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String userType = "user";
		Part profilePic = request.getPart("profilePic");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		Hashing hashed = new Hashing();
		String hashedPassword = hashed.hashingPassword(password);
		DatabaseController controller = new DatabaseController();

		String searchEmail = null;
		String searchPhone = null;
		String searchUser = null;

		int specialCharacter = 0;
		int capitalCharacter = 0;
		int number = 0;
		int passwordLength = 0;

		int userDob = 0;
		int userNameChatarcter = 0;

		int firstNameCharacter = 0;
		int firstNameNumber = 0;

		int lastNameCharacter = 0;
		int lastNameNumber = 0;
		
		if(birthDate.isAfter(LocalDate.now())) {
			userDob = 1;
		}

		for(int i=0; i < userName.length(); i++) {
			char character = userName.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*' || character == '^' || character == '(' || character == ')' || character == '_' || character == '-' || character == '+' || character == '='
					|| character == '{' || character == '}' || character == '[' || character == ']' || character == ':' || character == ';' || character == '"' || character == '/' || character == '?' || character == '>' || character == '<' || character == '.' || character == ',' || character == '|') {
				userNameChatarcter +=1;
			}
		}

		for(int i=0; i < lastName.length(); i++) {
			char character = lastName.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*' || character == '^' || character == '(' || character == ')' || character == '_' || character == '-' || character == '+' || character == '='
					|| character == '{' || character == '}' || character == '[' || character == ']' || character == ':' || character == ';' || character == '"' || character == '/' || character == '?' || character == '>' || character == '<' || character == '.' || character == ',' || character == '|') {
				lastNameCharacter += 1;
			}
			if(Character.isDigit(character)) {
				lastNameNumber +=1;
			}
		}

		for(int i=0; i < firstName.length(); i++) {
			char character = firstName.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*' || character == '^' || character == '(' || character == ')' || character == '_' || character == '-' || character == '+' || character == '='
					|| character == '{' || character == '}' || character == '[' || character == ']' || character == ':' || character == ';' || character == '"' || character == '/' || character == '?' || character == '>' || character == '<' || character == '.' || character == ',' || character == '|') {
				firstNameCharacter += 1;
			}
			if(Character.isDigit(character)) {
				firstNameNumber +=1;
			}
		}

		if(password.length() > 16 || password.length() < 8) {
			passwordLength += 1;
		}

		for(int i=0; i < password.length(); i++) {
			char character = password.charAt(i);
			if(character == '!' || character == '@' || character == '#'|| character == '$' || character == '%' || character == '&' || character == '*') {
				specialCharacter += 1;

			}
			if(Character.isUpperCase(character)) {
				capitalCharacter +=1;
			}

			if(Character.isDigit(character)) {
				number += 1;
			}
		}

		if(firstNameCharacter < 1) {
			if(firstNameNumber < 1) {
				if(lastNameCharacter <1) {
					if(lastNameNumber <1) {
						if(userDob < 1) {
						if(passwordLength < 1) {
							
								if(userNameChatarcter < 1) {
									if(specialCharacter >0) {
										if(capitalCharacter > 0) {
											if(number > 0) {

												if(password.equals(confirmPassword)) {
													Users user = new Users(userName, firstName, lastName, birthDate, address, gender, email, phone, userType, hashedPassword, profilePic);

													try {
														ResultSet result = controller.checkEmail(email);
														if(result.next()) {
															searchEmail = result.getString("email");
														}

													} catch (ClassNotFoundException | SQLException e) {
														//						request.setAttribute(StringUtils.errorMessage, StringUtils.server_Error);
														//						request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
														e.printStackTrace();
													}

													try {
														ResultSet phoneResult = controller.checkPhone(phone);
														if(phoneResult.next()) {
															searchPhone = phoneResult.getString("phone");
														}
													} catch (ClassNotFoundException | SQLException e) {
														// TODO Auto-generated catch block
														e.printStackTrace();
													}
													
													try {
														ResultSet userResult = controller.checkUser(userName);
														if(userResult.next()) {
															searchUser = userResult.getString("userName");
														}
													} catch (ClassNotFoundException | SQLException e) {
														// TODO Auto-generated catch block
														e.printStackTrace();
													}

													if(email.equals(searchEmail)) {
														request.setAttribute(StringUtils.errorMessage, StringUtils.user_Already_Exist);
														request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
													}
													
													else if(userName.equals(searchUser)) {
														request.setAttribute(StringUtils.errorMessage, StringUtils.user_Already_Exist);
														request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
													}
													
													else if(phone.equals(searchPhone)) {
														request.setAttribute(StringUtils.errorMessage, StringUtils.user_Already_Exist);
														request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
													}
													else {
														int count = controller.addUser(user);

														if(count>0) {
															//							response.sendRedirect("pages/login.jsp");
															request.getRequestDispatcher("/Htmls/Login.jsp").forward(request, response);

														}

														else if(count == 0) {
															request.setAttribute(StringUtils.errorMessage, StringUtils.registration_Error);
															request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
														}

														else {
															//								response.getWriter().println("Register Failed!!");
															request.setAttribute(StringUtils.errorMessage, StringUtils.server_Error);
															request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
														}
													}
												}
												else {
													//					response.getWriter().println("check password!!");
													String errormessage = "password must be Same!!";
													request.setAttribute("errorMessage", errormessage);
													request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
												}
											}
											else {
												String errormessage = "Atleast one Number";
												request.setAttribute("errorMessage", errormessage);
												request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
											}
										}
										else {

											String errormessage = "Atleast one capital letter";
											request.setAttribute("errorMessage", errormessage);
											request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
										}
									}
									else {
										//			response.getWriter().println("Must contain one special character!");
										String errormessage = "Atleast one Special character";
										request.setAttribute("errorMessage", errormessage);
										request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
									}
								}

								else {
									String errormessage = "No Special Character Allowed";
									request.setAttribute("errorMessage2", errormessage);
									request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
								}
								
						}
						else {
							String errormessage = "Password must be 8 character long and less than 16 character";
							request.setAttribute("errorMessage", errormessage);
							request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
						}
					}
						else {
							String errormessage = "BirthDay cannot be today or Tomorrow";
							request.setAttribute("BirthDayErrorMessage", errormessage);
							request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
						}
						}
					else {
						String errormessage = "Cannot contains Numbers";
						request.setAttribute("errorMessage4", errormessage);
						request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
					}
				}
				else {
					String errormessage = "Cannot contains Special Character";
					request.setAttribute("errorMessage4", errormessage);
					request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
				}
			}
			else {
				String errormessage = "Cannot contains Numbers";
				request.setAttribute("errorMessage3", errormessage);
				request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
			}
		}
		else {
			String errormessage = "Cannot contains Special character";
			request.setAttribute("errorMessage3", errormessage);
			request.getRequestDispatcher("/Htmls/Register.jsp").forward(request, response);
		}
	}



}
