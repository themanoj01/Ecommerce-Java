<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .delete_container {
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
        	height:40px;
            background-color: #333;
            margin-top:20px;
            color: #fff;
            font-size: 18px;
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
	int productId = Integer.parseInt(request.getParameter("productId"));
%>
	<sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
	<c:catch var="sqlException">
	<sql:query var="products" dataSource="${dbConnection}">
		SELECT * FROM products where product_Id = <%=productId %>;
	</sql:query>
	</c:catch>
	<c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
	
    <div class="delete_container">
    <% 
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null && !errorMessage.isEmpty())
	{
	%>
	<p class = "error-message"><%=errorMessage %></p>
	<%
	}
	String successMessage = (String) request.getAttribute("successMessage");
	if (successMessage != null && !successMessage.isEmpty())
	{
	%>
	<p class = "success-message"><%=successMessage %></p>
	<%
	}
	%> 
        <h1>Delete Product</h1>
        <form action="/CourseWork/DeleteServlet" method="post">
            <c:forEach var="product" items="${products.rows}">
        	<label for="productId">Product Id:</label>
            <input type="text" id="productId" name="productId"  value="${product.product_Id}" readonly>
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" value="${product.productName}" readonly>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" value="${product.price}"  readonly>
            <label for="quantity">Quantity:</label>
            <input type="text" id="quantity" name="quantity"  value="${product.stock_Quantity}" readonly>
            <p style= "color:red; font-size:20px;">Are you sure you want to delete this product?</p>
            <input type="submit" value="Delete">
            </c:forEach>
        </form>
    </div>
    </c:otherwise>
    </c:choose>
</body>
</html>