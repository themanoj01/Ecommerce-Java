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
 * Servlet implementation class ProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns ={"/ProductServlet"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("productName");
		DatabaseController controller = new DatabaseController();
		try {
			List<product> productList = new ArrayList<>();
			ResultSet  result =  controller.getProduct(productName);
			while(result.next()) {
				product product = new product();
	            product.setProductName(result.getString("productName"));
	            product.setPrice(result.getDouble("price"));
	            product.setProductDescription(result.getString("productDescription"));
	            product.setProductImage(result.getString("product_image"));
	            productList.add(product);
			}
			
			request.setAttribute("items", productList);
			request.getRequestDispatcher("/Htmls/product1.jsp").forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			String ProductErrormessage = "Server Error";
			request.setAttribute("errorMessage", ProductErrormessage);
			request.getRequestDispatcher("/Htmls/product1.jsp").forward(request, response);
		}
		
	}

	

}
