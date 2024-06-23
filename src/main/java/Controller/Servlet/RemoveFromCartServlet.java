package Controller.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CartItems;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        
        if(id != null) {
            ArrayList<CartItems> cart_items = (ArrayList<CartItems>) request.getSession().getAttribute("cart_items");
            if (cart_items != null) {
                // Display confirmation message
            	out.println("<html><body style='text-align: center;'>");
            	out.println("<h2 style='color: #534952; margin-top:50px;'>Are you sure you want to remove this item from your cart?</h2>");
            	out.println("<form action='/CourseWork/RemoveFromCartServlet' method='post'>");
            	out.println("<input type='hidden' name='id' value='" + id + "'/>");
            	out.println("<input type='submit' value='Yes' style='background-color: #3D3A4B; color: white; padding: 5px 10px; border: none; border-radius: 3px; cursor: pointer;width:100px;height:50px;font-size:20px;'/>");
            	out.println("</form>");
            	out.println("<form action='/CourseWork/Htmls/Cart.jsp'>");
            	out.println("<input type='submit' value='No' style='background-color: #3D3A4B; color: white; padding: 5px 10px; border: none; border-radius: 3px; cursor: pointer;width:100px;height:50px;font-size:20px;'/>");
            	out.println("</form>");
            	out.println("</body></html>");

            } else {
                response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
            }
        } else {
            response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id != null) {
            ArrayList<CartItems> cart_items = (ArrayList<CartItems>) request.getSession().getAttribute("cart_items");
            if (cart_items != null) {
                // Remove the item from the cart
                for(CartItems c:cart_items) {
                    if(c.getProductId() == Integer.parseInt(id)) {
                        cart_items.remove(c);
                        break;
                    }
                }
                response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
            } else {
                response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
            }
        } else {
            response.sendRedirect("/CourseWork/Htmls/Cart.jsp");
        }
    }
}