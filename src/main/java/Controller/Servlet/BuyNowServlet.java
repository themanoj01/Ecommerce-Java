package Controller.Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBController.DatabaseController;

/**
 * Servlet implementation class BuyNowServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/BuyNowServlet" })
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyNowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = null;
		HttpSession userSession = request.getSession();
		Cookie[] cookies = request.getCookies();
		
  	  	if (cookies != null) {
  	  		for (Cookie cookie : cookies) {
  	  			if (cookie.getName().equals("userID")) id = cookie.getValue();	
  	  		}
  	  	}
		String productId = request.getParameter("id");
		int quantity = 1;
		double lineTotal = 0;
		double orderTotal = 0;
		LocalDate today = LocalDate.now();
		String orderStatus = "Pending";
		DatabaseController controller = new DatabaseController();
		try {
			ResultSet result = controller.buyProduct(productId);
			if(result.next()) {
				lineTotal = result.getDouble("price");
				orderTotal = result.getDouble("price");
			}
			
			int mainResult = controller.storeBuyProduct(id, productId, quantity, lineTotal, orderTotal, today, orderStatus);
			if(mainResult > 0) {
				response.sendRedirect("/CourseWork/Htmls/BuyNow.jsp");
			}
			else {
				String errormessage = "Order cannot be Placed:  <a href='/CourseWork/Htmls/Home.jsp'>Try Again</a>";
				request.setAttribute("BuyErrorMessage", errormessage);
				request.getRequestDispatcher("/Htmls/ProductDetail.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
