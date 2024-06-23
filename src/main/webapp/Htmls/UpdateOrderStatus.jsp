<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .order_container {
        width: 40%;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        margin-top: 50px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    form {
        text-align: center;
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"],
    select {
    	width: 50%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
    	display:block;
    	margin: 0 auto;
        background-color: #333;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #555;
    }
</style>
<meta charset="UTF-8">
<title>Update Order Status</title>
</head>
<body>
<%
	int orderId = Integer.parseInt(request.getParameter("orderId"));
	String orderStatus = request.getParameter("orderStatus");
%>
<sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
	
	<c:catch var="sqlException">
	<sql:query var="orders" dataSource="${dbConnection}">
		SELECT orderId, orderStatus FROM orders where orderId = <%=orderId %>;
	</sql:query>
	</c:catch>
	<c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
<div class="order_container">
    <h1>Update Order Status</h1>
    <form action="/CourseWork/UpdateOrderStatusServlet" method="post">
    <c:forEach var="order" items="${orders.rows}">
        <label for="orderId">Order ID:</label>
        <input type="text" id="orderId" name="orderId" value="${order.orderId}" readonly>
        <label for="orderStatus">Order Status:</label>
        <select id="orderStatus" name="orderStatus">
            <option value="Pending">Pending</option>
            <option value="Processing">Processing</option>
            <option value="Delivered">Delivered</option>
        </select>
        <input type="submit" value="Update Status">
        </c:forEach>
    </form>
    </div>
    </c:otherwise>
    </c:choose>
</body>
</html>