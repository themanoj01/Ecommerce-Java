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
	<div class = "user">
      <!-- User table -->
      <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root"
		password="" />
		<c:catch var="sqlException">
		
		<sql:query var="users" dataSource="${dbConnection}">
		SELECT * FROM users;
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
      </div>
</body>
</html>