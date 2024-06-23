<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.*" %>
<%@ page import="Model.CartItems" %>
<%@ page import="DBController.DatabaseController" %>
    <%
    ArrayList<CartItems> cart_items = (ArrayList<CartItems>) session.getAttribute("cart_items");
    ArrayList<CartItems> cartProduct = null;
    if(cart_items != null)
    {
    	DatabaseController dbController = new DatabaseController();
    	cartProduct = dbController.getCartProducts(cart_items);
    	double total = dbController.getTotalPrice(cart_items);
    	request.setAttribute("cart_items", cart_items);
    	request.setAttribute("total", total);
    	session.setAttribute("orderItemList",cartProduct);
   }
    %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-Commerce Cart</title>
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
  	
  	<%
  	  	String userSession = (String) session.getAttribute("userName");
  	  	String UserID = null;
  	  	Cookie[] cookies = request.getCookies();
  	  	if (cookies != null) {
  	  		for (Cookie cookie : cookies) {
  	  			if (cookie.getName().equals("userID")) UserID = cookie.getValue();	
  	  		}
  	  	}
  	  	
  	  	request.setAttribute("userID", UserID);
  	  	boolean isLoggedIn = userSession != null;
  	  	%>
  	
  	<jsp:include page="Header.jsp"></jsp:include>
  
  	<%
  		if(isLoggedIn){
  	%>
  <form action="/CourseWork/OrderServlet" method="post">
    <div class="items">
      <h1>Cart Items</h1>
      
      <table>
        <thead>
          <tr>
            <th>Product Id</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <%
        if(cartProduct != null && !cartProduct.isEmpty()){
        		for(CartItems c:cartProduct)
        		{ %>
        			<tr>
        			<td><input name="productId" type="text" value="<%= c.getProductId() %>"  Readonly style="border: none; outline: none; text-align: center;"></td>
        			<td><input name="productName" type="text" value="<%= c.getProductName() %>"  Readonly style="border: none; outline: none; text-align: center;"></td>
        			<td><input name="productPrice" type="text" value="<%= c.getPrice() %>"  Readonly style="border: none; outline: none; text-align: center;"></td>
                    <td>
                      <div class="quantity">
                        <a  href = "/CourseWork/QuantityServlet?action=decrease&id=<%= c.getProductId()%>">-</a>
                        <input type="text" name="quantity" value= <%= c.getQuantity() %> readonly/>
                        <a  href = "/CourseWork/QuantityServlet?action=increase&id=<%= c.getProductId()%>">+</a>
                      </div>
                    </td>
                    <td>
                      <a
                        class="button"
                        href="/CourseWork/RemoveFromCartServlet?id=<%= c.getProductId()%>"
                        >Remove</a
                      >
                    </td>
                  </tr>
                  <%
        		}
       		 }
        else{
        %>
        <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    </tr>
                  <%
        }
                  %>
        
        
        </tbody>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td>Total:</td>
            <td><input name="cartTotal" value="${(total>0)?total:0}" Readonly style="border: none; outline: none; text-align: center;"></td>
            
          </tr>
        </tfoot>
      </table>
       <div style="text-align: center; margin-top:50px;">
       <button class="button" type="submit">Check Out</button>
    
</div>
    </div>
    </form>
    
    <%
  		}
  		else{
    %>
    	<div style="display: flex; justify-content: center; flex-direction: column; align-items: center; margin-top: 30px;">
    		<h1 style="font-size: 26px">You should Login First</h1>
    		<a href="/CourseWork/Htmls/Login.jsp" style="color: green; font-size: 20px">Login here</a>
    	</div>
    <%
  		}
    %>
    
    <jsp:include page="Footer.jsp"></jsp:include>
    
  </body>
</html>