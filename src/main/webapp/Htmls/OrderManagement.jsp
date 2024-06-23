<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin DashBoard</title>
<link rel="stylesheet" href="/CourseWork/CSS/AdminDashboard.css" />
</head>
<body>
	<div class="sidenav">
      <h2>Dashboard</h2>
      <ul>
        <li><a href="/CourseWork/Htmls/AdminDashboard.jsp">Dashboard Overview</a></li>
        <li><a href="/CourseWork/Htmls/UserManagement.jsp">User Management</a></li>
        <li><a href="/CourseWork/Htmls/ProductManagement.jsp">Product Management</a></li>
        <li><a href="/CourseWork/Htmls/OrderManagement.jsp">Order Management</a></li>
        <li><a href="/CourseWork/AdminLogoutServlet">Logout</a></li>
      </ul>
    </div>
    <div class="main">
    <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
	<c:catch var="sqlException">
      <sql:query var="orders" dataSource="${dbConnection}">
		SELECT * FROM orders;
	</sql:query>
	</c:catch>
	<c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
	
      <div class = "order">
      <h1>Order Management</h1>
      <table>
        <thead>
          <th>Order Id</th>
        <!--   <th>user Id</th>
          <th>Product Id</th> -->
          <!-- <th>Quantity</th> -->
          <th>Order Total</th>
          <th>Order Date</th>
          <th>Order Status</th>
          <th>Operation</th>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders.rows}">
          <tr>
            <td><c:out value="${order.orderId}"/></td>
            <!-- <td></td>
            <td>2</td>
            <td>1</td> -->
            <td><c:out value="${order.orderTotal}"/></td>
            <td><c:out value="${order.orderDate}"/></td>
            <td><c:out value="${order.orderStatus}"/></td>
            <td> <a class="button" href="/CourseWork/Htmls/UpdateOrderStatus.jsp?orderId=${order.orderId}&orderStatus=${order.orderStatus}" >Update Status</a>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
       </div>
       </c:otherwise>
       </c:choose>
      </div>
	
</body>
</html>