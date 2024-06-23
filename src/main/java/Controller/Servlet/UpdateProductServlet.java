package Controller.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBController.DatabaseController;
import Model.product;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	DatabaseController dbController = new DatabaseController();
	product product;
	int productId = Integer.parseInt(req.getParameter("productId"));
	String name = req.getParameter("productName");
    double price = Double.parseDouble(req.getParameter("price"));
    int quantity = Integer.parseInt(req.getParameter("quantity"));
    product = new product(productId, name, price, quantity);
	int result = dbController.updateProduct(product);

	if (result == 1) {
        req.setAttribute("successMessage", "Product updated successfully");
        req.getRequestDispatcher("/Htmls/AdminDashboard.jsp").forward(req, resp);
        return;
    } else if (result == 0) {
        req.setAttribute("errorMessage", "Operation unsuccessful.");
        req.getRequestDispatcher("/Htmls/UpdateProduct.jsp").forward(req, resp);
        return;
    } else {
        req.setAttribute("serverError", "An unexpected server error occurred.");
        req.getRequestDispatcher("/Htmls/UpdateProduct.jsp").forward(req, resp);
        return;
    }
}
}