<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
<style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
      }
      .items {
        margin-top: 20px;
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 8px;
      }

      .items h1 {
        margin-bottom: 20px;
        text-align: center;
      }

      table {
        width: 80%;
        border-collapse: collapse;
        margin: 0 auto;
      }

      th,
      td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ccc;
      }

      tfoot td {
        text-align: right;
      }

      .quantity {
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .quantity input {
        width: 50px;
        text-align: center;
      }

      .quantity a{
        background-color: #626262;
        color: #fff;
        border: none;
        padding: 5px 10px;
        margin: 8px;
        cursor: pointer;
        font-size: 20px;
        text-decoration:none;
      }

      .button {
        background-color: #232323;
        color: #fff;
        padding: 5px 10px;
        text-decoration: none;
        border-radius: 5px;
      }
    </style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<%
		String userSession = (String) session.getAttribute("userName");
		String userId = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("userID")) userId = cookie.getValue();
			}
		}
	%>
	
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<sql:query var="orderProduct" dataSource="${connection }">
		select * from cart_items c join products p on c.productId = p.product_Id join orders o on c.orderId = o.orderId join users u on o.userId = u.userID where u.userID = <%=userId %>;
	</sql:query>
	
  
    <div class="items">
      <h1>Order Items</h1>
      
      <table>
        <thead>
          <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Order Date</th>
            <th>Line Total</th>
            <th>Quantity</th>
           
          </tr>
        </thead>
        <tbody>
        	<c:forEach var="product" items="${orderProduct.rows}">
        			<tr>
        			<td><input name="productId" type="text" value="${product.product_Id }"  Readonly style="border: none; outline: none; text-align: center;"></td>
        			<td><input name="productName" type="text" value="${product.productName }"  Readonly style="border: none; outline: none; text-align: center;"></td>
        			<td><input name="productDate" type="text" value="${product.orderDate }"  Readonly style="border: none; outline: none; text-align: center;"></td>
        			<td><input name="productPrice" type="text" value="${product.lineTotal }"  Readonly style="border: none; outline: none; text-align: center;"></td>
                    <td>
                      <div class="quantity">
                        
                        <input type="text" style="border: none; outline: none; text-align: center;" name="quantity" value="${ product.quantity}" readonly/>
                       
                      </div>
                    </td>
                    
                  </tr>
        
        </c:forEach>
        </tbody>
        
      </table>
       
    </div>
    
    <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>