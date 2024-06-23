package Controller.Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DBController.DatabaseController;
import Model.Users;
import Model.product;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProfileServlet" })
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("userEmail");
		DatabaseController controller = new DatabaseController();
		try {
			
			List<Users> UserList = new ArrayList<>();
			
			ResultSet result =  controller.getUser(userEmail);
			while(result.next()) {
				Users user = new Users();
				user.setFirstName(result.getString("firstName"));
				user.setLastName(result.getString("lastName"));
				user.setEmail(result.getString("email"));
				user.setBirthday(result.getDate("birthday").toLocalDate());
				user.setAddress(result.getString("address"));
				user.setPhone(result.getString("phone"));
				UserList.add(user);
			}
			
			request.setAttribute("users", UserList);
			request.getRequestDispatcher("/Htmls/profile.jsp").forward(request, response);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
