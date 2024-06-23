package Controller.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import Model.CartItems;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QuantityServlet
 */
@WebServlet("/QuantityServlet")
public class QuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuantityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		ArrayList<CartItems> cart_items = (ArrayList<CartItems>) request.getSession().getAttribute("cart_items");
		
		if(action != null && id>=1)
		{
			if(action.equals("increase"))
			{
				for(CartItems c:cart_items)
				{
					if(c.getProductId() == id)
					{
						int quantity = c.getQuantity();
						quantity++;
						c.setQuantity(quantity);
						response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
						}
				}
			}
			if(action.equals("decrease"))
			{
				for(CartItems c:cart_items)
				{
					if(c.getProductId() == id && c.getQuantity() > 1)
					{
						int quantity = c.getQuantity();
						quantity--;
						c.setQuantity(quantity);
						break;
						}
				}
				response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
			}
		}
		else
		{
			response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
		}
		
	}

	

}