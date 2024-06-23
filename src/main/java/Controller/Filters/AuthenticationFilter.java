package Controller.Filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter{
	public void init(FilterConfig filterConfig) throws ServletException{
		// TODO Auto-generated method stub

	}
	
	public void doFilter(ServletRequest request, ServletResponse responce, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) responce;
		String uri = req.getRequestURI();
		
		if(uri.endsWith(".css") || uri.endsWith("/") || uri.endsWith("/RegistrationServlet") || uri.endsWith("/aboutUs.jsp") || uri.endsWith("/ProductDetail.jsp") || uri.endsWith("/ProductServlet") || uri.endsWith("/SearchServlet")){
			chain.doFilter(request, responce);
			return;
		}
		
		boolean isLogin = uri.endsWith("Htmls/Login.jsp");
		boolean isLoginServlet = uri.endsWith("/LoginServlet");
		boolean isLogoutServlet = uri.endsWith("/Logout");
		boolean isAdminLogoutServlet = uri.endsWith("/AdminLogoutServlet");
		boolean isRegister = uri.endsWith("Htmls/Register.jsp");
		boolean isRegisterServlet = uri.endsWith("/RegistrationServlet");
		boolean isHome = uri.endsWith("/Home.jsp");
		boolean isDashboard = uri.endsWith("/AdminDashboard.jsp");
		boolean isUserManagement = uri.endsWith("/UserManagement.jsp");
		boolean isOrderManagement = uri.endsWith("/OrderManagement.jsp");
		boolean isProductManagement = uri.endsWith("/ProductManagement.jsp");
		boolean isAddProduct = uri.endsWith("/AddProduct.jsp");
		boolean isUpdateOrderStatus = uri.endsWith("/UpdateOrderStatus.jsp");
		boolean isUpdateProduct = uri.endsWith("/UpdateProduct.jsp");
		boolean isDeleteProduct = uri.endsWith("/DeleteProduct.jsp");
		boolean isAddProductServlet = uri.endsWith("/AddProductServlet");
		boolean isUpdateOrderStatusServlet = uri.endsWith("/UpdateOrderStatusServlet");
		boolean isDeleteServlet = uri.endsWith("/DeleteServlet");
		boolean isUpdateProductServlet = uri.endsWith("/UpdateProductServlet");
		HttpSession session = req.getSession(false);
		String userRole = "user";
		Cookie[] cookies = req.getCookies();
		
		if(cookies != null){ for(Cookie cookie : cookies){
			if(cookie.getName().equals("userRole")) {userRole = cookie.getValue();}
			
			} }
		else { res.sendRedirect("/CourseWork/Htmls/AdminDashboard.jsp"); }

		boolean isLoggedIn = session != null && session.getAttribute("userName") !=null;
		boolean isAdmin = userRole.equals("admin");
				
		if(!isLoggedIn && !(isLogin || isLoginServlet || isRegister || isRegisterServlet || isHome)) {
			res.sendRedirect("/CourseWork/Htmls/Login.jsp");
		}
		
		else if(isLoggedIn && !(!isLogin || isLogoutServlet)) {
			res.sendRedirect("/CourseWork/Htmls/Home.jsp");
		}
		
		else if(isLoggedIn && !(!isRegister || isLogoutServlet)) {
			res.sendRedirect("/CourseWork/Htmls/Home.jsp");
		}
		
		 else if(isAdmin && !isDashboard && !isUserManagement && !isProductManagement && !isOrderManagement && !isAdminLogoutServlet && !isAddProduct && !isUpdateOrderStatus
				 && !isUpdateProduct && !isDeleteProduct && !isAddProductServlet && !isUpdateOrderStatusServlet && !isDeleteServlet && !isUpdateProductServlet){
		 res.sendRedirect("/CourseWork/Htmls/AdminDashboard.jsp"); }
		
		 else if(!isAdmin && !(!isDashboard && !isUserManagement && !isProductManagement && !isOrderManagement)) {
			 res.sendRedirect("/CourseWork/Htmls/Home.jsp");
		 }
		
		else {
			chain.doFilter(request, responce);
		}
	}
	
	public void destroy() {
		
	}

}
