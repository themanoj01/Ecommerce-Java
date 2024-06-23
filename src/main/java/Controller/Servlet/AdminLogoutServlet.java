package Controller.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminLogoutServlet" })
public class AdminLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		
		HttpSession userSession = request.getSession(false);
		if(userSession != null) {
			userSession.invalidate();
		}
		
		response.sendRedirect("/CourseWork/Htmls/Login.jsp");
	}

}
