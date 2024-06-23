package Controller.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DBController.DatabaseController;
import Model.product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024* 3,
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1014*50)
public class AddProductServlet extends HttpServlet {
	DatabaseController dbController = new DatabaseController();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("productName");
		double price = Double.parseDouble(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String description = request.getParameter("description");
		String productImage = request.getParameter("productImage");

		product product = new product(name, price, quantity, description, productImage);
		int result = dbController.addProduct(product);		
		
		if (result == 1)
		{
			request.setAttribute("successMessage", "Product added successfully");
			request.getRequestDispatcher("/Htmls/AdminDashboard.jsp").forward(request, response);
		}
		else if (result == 0)
		{
			request.setAttribute("errorMessage", "Operation unsuccessfull.");
			request.getRequestDispatcher("/Htmls/AddProduct.jsp").forward(request, response);
			
		}
		else
		{
			request.setAttribute("serverError", "An unexpected server error occurred.");
			request.getRequestDispatcher("/Htmls/AddProduct.jsp").forward(request, response);
		}
	}


}