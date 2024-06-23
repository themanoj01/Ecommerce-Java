<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
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
      <h1>Dashboard Overview</h1>
      <div class="summary">
        <div class="statistics">
          <h3>Total Users</h3>
          <p>1000</p>
        </div>
        <div class="statistics">
          <h3>Total Orders</h3>
          <p>500</p>
        </div>
        <div class="statistics">
          <h3>Total Sales</h3>
          <p>$50,000</p>
        </div>
        <div class="statistics">
          <h3>Total Revenue</h3>
          <p>$45,000</p>
        </div>
      </div>
      
      <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
      
      <div class = "user">
      <!-- User table -->
      
		<c:catch var="sqlException">
		<sql:query var="users" dataSource="${dbConnection}">
		SELECT * FROM users limit 5;
		</sql:query>
      </c:catch>
      <c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
      
      <h1>User Management</h1>
      <table>
        <thead>
          <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Phone</th>
          </tr>
        </thead>
        
        <tbody>
        <c:forEach var="user" items="${ users.rows}">
          <tr>
            <td>${user.userID }</td>
            <td>${user.firstName } ${user.lastName }</td>
            <td>${user.email }</td>
            <td>${user.phone }</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      </c:otherwise>
      </c:choose>
      </div>
      
<c:catch var="sqlException">
	<sql:query var="products" dataSource="${dbConnection}">
		SELECT * FROM products order by price desc limit 5;
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
      <!-- Order Management -->
      
      <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
		<c:catch var="sqlException">
      <sql:query var="orders" dataSource="${dbConnection}">
		SELECT * FROM orders limit 5;
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