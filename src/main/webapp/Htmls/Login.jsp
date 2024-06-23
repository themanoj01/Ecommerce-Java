<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel='stylesheet' href="/CourseWork/CSS/Register.css">
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

	<div class="start">
	<form action="/CourseWork/LoginServlet" method="post">
	
	<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String errormessage = (String) request.getAttribute("errorMessage5");
			if(errormessage != null && !errormessage.isEmpty()){
		%>

			<p class="error-message" style="color:white; font-weigth: 100; font-size:1.5rem; background-color: red"><%=errormessage%></p>
		<%
				
			}
		%>
	</div>
	
	<div style="display:flex; justify-content: center; margin-top: 10px;">
	</div>
	<h1>Login Form</h1>
	<div class="logindiv">
		<div class='userInput'>
			<label>Email</label>
			<input name = 'email' type="email" placeholder="Enter your email">
		</div>
		
		<div class='userInput'>
			<label>Password</label>
			<input name = 'password' type="text" placeholder="Enter your Password">
		</div>
		
		
		</div>
		<p style="padding:5px 35px; font-size: 16px">Don't have any account? <a href="/CourseWork/Htmls/Register.jsp" style="font-size: 14px">Sign up</a></p>
		<div class='submit'>
			<button type="submit">Login</button>
		</div>
		
		
	</form>
	</div>
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>