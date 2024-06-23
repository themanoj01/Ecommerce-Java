<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mac</title>
<link rel="stylesheet" href="/CourseWork/CSS/iphonePage.css">
</head>
<body>

	<jsp:include page="../Header.jsp"></jsp:include>
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<sql:query var="product" dataSource="${connection }">
		select * from products where productName like '%MacBook%';
	</sql:query>
	<div class="containers">
	<c:forEach var="product" items="${product.rows}">
  <div class="product">
    <img src="/CourseWork/devices/Laptop/${product.product_image }" alt="MacBook Pro 16-inch">
    <div class="product-info">
    <div class="detail">
      <input type="text" name="productName" value="${product.productName }" readonly>
      <h3>Price: ${ product.price }</h3>
      <p>${product.productDescription }</p>
      </div>
      <button class="buy-btn"> <a href="/CourseWork/Htmls/ProductDetail.jsp?productName=${product.productName}"> Buy Now</a></button>
    </div>
  </div>
  </c:forEach>
</div>
	
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>