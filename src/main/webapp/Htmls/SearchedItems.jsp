<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="stylesheet" href="/CourseWork/CSS/iphonePage.css">
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>
	
	<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String SearchError = (String) request.getAttribute("SearchError");
			if(SearchError != null && !SearchError.isEmpty()){
		%>

			<p class="error-message" style="color:red; font-weigth: 100; font-size:1.5rem;"><%=SearchError%></p>
		<%
				
			}
		%>
	</div>

	<div class="containers">
	<%
	List<product> productList = (List<product>) request.getAttribute("items");
	if(productList != null && !productList.isEmpty()){
    for (product products : productList) {
		
	%>

	
		<div class="product">
            <img src="/CourseWork/photos/products/<%=products.getProductImage() %>" alt="Airpods 2nd Gen">
    		<div class="product-info">
    		<div class = 'detail'>
      		<h2> <%=products.getProductName() %> </h2>
       		<h3>Price: <%=products.getPrice() %></h3>
      		<p><%=products.getProductDescription() %></p>
      		</div>
     		 <button class="buy-btn"> <a href="/CourseWork/Htmls/ProductDetail.jsp?productName=<%= products.getProductName()%>"> Buy Now</a></button>
    		</div>
        </div>
    <% }}
	else{
	%>
		<p style="font-size: 24px;">No product Found</p>
		<%} %>
        
  </div>
  
  <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>