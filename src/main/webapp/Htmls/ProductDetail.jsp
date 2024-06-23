<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link rel="stylesheet" href="/CourseWork/CSS/ProductDetail.css">
</head>
<body>
	<%
		String productName = request.getParameter("productName");
	%>
	
	

	<jsp:include page="Header.jsp"></jsp:include>
	
	<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String errormessage = (String) request.getAttribute("BuyErrorMessage");
			if(errormessage != null && !errormessage.isEmpty()){
		%>

			<p class="error-message" style="color:red; font-weigth: 100; font-size:1.5rem;"><%=errormessage%></p>
		<%
				
			}
		%>
	</div>
	
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<c:catch var="sqlException">
	<sql:query var="product" dataSource="${connection }">
		select * from products where productName = "<%=productName %>";
	</sql:query>
	</c:catch>
	<c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
	
	<c:forEach var="product" items="${product.rows}">
	
	<div class="body">
	<section class="section">
        <div class="img-column">
            <div class="big-image-wrapper">
                <img src="/CourseWork/photos/products/${product.product_image }" alt="error">
            </div>
        </div>
        <div class="buy-column">
            <h1>${product.productName }</h1>
            <div class="txt-wrapper">
                <p>${product.productDescription }
                </p>
            </div>
            <h2>RS. ${product.price }</h2>
            <div class="qty">

            </div>
            <div class="buttons">
                <a href="/CourseWork/BuyNowServlet?id=${product.product_Id}">Buy</a>
                <a href="/CourseWork/CartServlet?id=${product.product_Id }">Add to Cart</a>
            </div>
        </div>
    </section>
    </div>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>