<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iphones</title>
<link rel="stylesheet" href="/CourseWork/CSS/iphonePage.css">
</head>
<body>'

	<jsp:include page="../Header.jsp"></jsp:include>
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<sql:query var="product" dataSource="${connection }">
		select * from products where productName like '%Iphone%';
	</sql:query>
	<div class="containers">
	<c:forEach var="product" items="${product.rows}">
  <div class="product">
    <img src="/CourseWork/devices/Phone/${product.product_image }" alt="Iphone 13">
    <div class="product-info">
    	<div class="detail">
      <h2>${product.productName }</h2>
      <h3>Price: ${ product.price }</h3>
      <p>${product.productDescription }</p>
      </div>
      <button class="buy-btn"><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=${product.productName}">Buy Now</a></button>
    </div>
  </div>
  </c:forEach>
  
</div>

	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>