package Controller.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartItems;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    HttpSession session = request.getSession();
	    ArrayList<CartItems> cartItems = (ArrayList<CartItems>) session.getAttribute("cart_items");
	    if(cartItems == null) {
	        cartItems = new ArrayList<>();
	        session.setAttribute("cart_items", cartItems);
	    }
	    int id = Integer.parseInt(request.getParameter("id"));
	    boolean exist = false;
	    for(CartItems c : cartItems) {
	        if(c.getProductId() == id) {
	            exist = true;
	            break;
	        }
	    }
	    if(exist) {
	    	out.println("<div style='text-align:center;margin-top:80px;'>");
	        out.println("<h2 style='color:red';text-align:center'>Product is already in your cart.</h2>");
	        out.println("<a href='/CourseWork/Htmls/Cart.jsp'>Click here to Proceed to Cart Page</a>");
	        out.println("</div>");
	    } else {
	        CartItems cart = new CartItems();
	        cart.setProductId(id);
	        cart.setQuantity(1);
	        cartItems.add(cart);
	        response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
	    }
	    
	}

}