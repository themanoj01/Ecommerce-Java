<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title> 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .update_container {
            max-width: 500px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-top: 10px;
            font-size:20px;
        }
        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
        	width:40%;
        	height:30px;
            background-color: #333;
            margin-top:20px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

	<%
		String productId = request.getParameter("productId");
	%>
<sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
		
		<c:catch var="sqlException">
	<sql:query var="products" dataSource="${dbConnection}">
		
		SELECT * FROM products where product_Id = "<%=productId %>";
	</sql:query>
	</c:catch>
	
	 <c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
    <div class="update_container">
        <h1>Update Product</h1>
        <c:forEach var="product" items="${products.rows}">
        <form action="/CourseWork/UpdateProductServlet" method="post">
        	<label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" value="${product.product_Id}" readonly> 
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" value="${product.productName}" >
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" value ="${product.price}" >
            <label for="quantity">Quantity:</label>
            <input type="text" id="quantity" name="quantity" value = "${product.stock_Quantity}">
            <input type="submit" value="Update Product">         
        </form>
        </c:forEach>
    </div>
    </c:otherwise>
    </c:choose>
</body>
</html>