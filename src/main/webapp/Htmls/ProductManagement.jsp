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
	<sql:query var="products" dataSource="${dbConnection}">
		SELECT * FROM products order by price desc;
	</sql:query>
	</c:catch>
	<c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
	
	<div class="product">
      <!-- Product Management -->
      <h1>Product Management</h1>
      <table>
   
        <thead>
          <th>Product Id</th>
          <th>Product Name</th>
          <th>Price</th>
          <th>Stock Quantity</th>  
          <th>Operations</th>
        </thead>
        <tbody>
          <c:forEach var="product" items="${products.rows}">
              <tr>
                  <td><c:out value="${product.product_Id}"/></td>
                  <td><c:out value="${product.productName}"/></td>
                  <td><c:out value="${product.price}"/></td>
                  <td><c:out value="${product.stock_Quantity}"/></td>
                  <td>
                  	<a class="button" href="/CourseWork/Htmls/UpdateProduct.jsp?productId=${product.product_Id}">Edit</a>
       				<a class="button" href="/CourseWork/Htmls/DeleteProduct.jsp?productId=${product.product_Id}">Delete</a>
                  </td>
              </tr>
              </c:forEach>
        </tbody>
      </table>
		<a class = "button" href="/CourseWork/Htmls/AddProduct.jsp">Add Product</a>
		</div>
		</c:otherwise>
		</c:choose>
		</div>
	
</body>
</html>