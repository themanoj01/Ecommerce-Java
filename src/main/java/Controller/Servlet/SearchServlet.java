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

import DBController.DatabaseController;
import Model.product;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/SearchServlet" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchinput = request.getParameter("search");
		
		List<product> productList = new ArrayList<>();
		
		DatabaseController controller = new DatabaseController();
		
		if(searchinput == null || searchinput.trim().isEmpty()) {
			response.sendRedirect("/CourseWork/Htmls/Home.jsp");
		}
		else {
		try {
			ResultSet result =  controller.searchItem(searchinput);
			while (result.next()) { 
				product product = new product();
	            product.setProductName(result.getString("productName"));
	            product.setPrice(result.getDouble("price"));
	            product.setProductDescription(result.getString("productDescription"));
	            product.setProductImage(result.getString("product_image"));
	            productList.add(product);
	        }
			
			request.setAttribute("items", productList);
			request.getRequestDispatcher("/Htmls/SearchedItems.jsp").forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			String SearchError = "Server Error";
			request.setAttribute("SearchError", SearchError);
			request.getRequestDispatcher("/Htmls/SearchedItems.jsp").forward(request, response);
		}
	}
	
		
	}

}
