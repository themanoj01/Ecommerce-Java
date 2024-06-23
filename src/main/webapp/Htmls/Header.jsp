<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="/CourseWork/CSS/Home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

	<%
		String userSession = (String) session.getAttribute("userName");
		String Username  = null;
		String userEmail = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie: cookies){
				if(cookie.getName().equals("user")) Username = cookie.getValue();
				if(cookie.getName().equals("email")) userEmail = cookie.getValue();
			}
		}
		boolean isLoggedIn = userSession != null;
		
	%>

	<header>
        <nav>
            <div class="logo">
                <h2 style="color: white;">AppleHub</h2>
            </div>
            
            <%
				String SearchErrormessage = (String) request.getAttribute("SearcherrorMessage");
				if(SearchErrormessage != null && !SearchErrormessage.isEmpty()){
			%>
            <div class="search" style="border: 2px solid red;">
            	<form class="searchForm" action="/CourseWork/SearchServlet" method="post">
            	<input type="text" name="search" placeholder="<%= SearchErrormessage%>">
            	<button><img src="/CourseWork/icons/search.png" alt="error"></button>
             	</form>
            </div>
            <%
				}
				else{
            %>
            	<div class="search">
            		<form class="searchForm" action="/CourseWork/SearchServlet" method="post">
                	<input type="text" name="search" placeholder="Search">
                	<button><img src="/CourseWork/icons/search.png" alt="error"></button>
             		</form>
            	</div>
                <%
					}
                %>
                
            <div class="menu">
                <ul>
                    <li><a href="/CourseWork/Htmls/Cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
                    <%
                    	if(isLoggedIn){
                    %>
                    	
                    	<li><a href="/CourseWork/Htmls/profile.jsp" style="background-color: #ffffff1a; padding:3px 6px; border-radius: 20px"> Hi, <%=Username %></a></li>
                    	<li class = "profileName"><a href="/CourseWork/Htmls/profile.jsp"><i class="fa-solid fa-user"></i></a></li>
                    	<li><form action="/CourseWork/LogoutServlet" method="post">
                 			<button type="submit" style="padding: 4px 7px; border-radius: 6px;">Logout</button>
                 		</form></li>
                    <%
                    	}
                    	else{
                    %>
                    <li><a href="/CourseWork/Htmls/Register.jsp">Sign up</a></li>
                    <li>|</li>
                    <li><a href="/CourseWork/Htmls/Login.jsp">Sign in</a></li>
                    
                    <%
                    	}
                    %>
                    
                    
                </ul>
            </div>
        </nav>
    </header>
    <section class="sub-heading">
        <ul>
            <li><a href="/CourseWork/Htmls/Home.jsp">Home</a></li>
            <li style="position: relative;"><a href="/CourseWork/ProductServlet?productName=mac">Mac</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook Pro 16-inch">MacBook Pro 16-inch</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook air m2 13-inch">MacBook air m2 13-inch</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook Pro 14-inch">MacBook Pro 14-inch</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook Air M3 13-inch">MacBook Air M3 13-inch</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook Air M3 15-inch">MacBook Air M3 15-inch</a></li>
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Laptop/mac pro 14 inch.png" alt="error">
                </div>
            </li>
            <li style="position: relative;"><a href="/CourseWork/ProductServlet?productName=iphone">iphone</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 13">Iphone 13</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 13 Plus">Iphone 13 Plus</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 14 Plus">Iphone 14 Plus</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 15">Iphone 15</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 15 pro">Iphone 15 pro</a></li>
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Phone/Iphone 15 pro max.png" alt="error">
                </div></li>
            <li style="position: relative;"><a href="/CourseWork/ProductServlet?productName=watch">iWatch</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Apple Watch hermes">Apple Watch hermes</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Apple Watch SE">Apple Watch SE</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Apple Watch Series 9">Apple Watch Series 9</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Apple Watch Ultra 2">Apple Watch Ultra 2</a></li>
                            <!-- <li><a href="#">iphone 15</a></li> -->
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Watch/Apple watch series 9.png" alt="error">
                </div></li>
            <li style="position: relative;"><a href="/CourseWork/ProductServlet?productName=airpod">Earpods</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=AirPods 2nd Gen">AirPods 2nd Gen</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=AirPods 3rd Gen">AirPods 3rd Gen</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=AirPods pro 2nd Gen">AirPods pro 2nd Gen</a></li>
                            <li><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=AirPods Pro Max">AirPods Pro Max</a></li>
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Earpods/AirPods Pro (2nd generation).jfif" alt="error">
                </div></li>
            <li><a href="/CourseWork/Htmls/aboutUs.jsp">about us</a></li>
        </ul>
    </section>
    
    <%
		
		if(SearchErrormessage != null && !SearchErrormessage.isEmpty()){
	%>
		<p style="color: black; margin: 20px;">Please enter the product name</p>
	<%
		}
	%>
</body>
</html>