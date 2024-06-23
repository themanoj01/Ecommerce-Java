<%@page import="Controller.Utils.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel='stylesheet' href="/CourseWork/CSS/Register.css">
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

	<div class="start">
	
	<form action="/CourseWork/RegistrationServlet" class="registerForm" method="post" enctype="multipart/form-data">
	<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String errormessage = (String) request.getAttribute(StringUtils.errorMessage);
			if(errormessage != null && !errormessage.isEmpty()){
		%>

			<p class="error-message" style="color:white; font-weigth: 100; font-size:1.5rem; background-color: red"><%=errormessage%></p>
		<%
				
			}
		%>
	</div>
	<div style="display:flex; justify-content: center; margin-top: 10px; flex-direction: column;">
		
	</div>
	
	<h1>Registration Form</h1>
	<div class="formdiv">
		<div class='userInput'>
			<label>User Name</label>
			
			<%
			String UserNameErrormessage = (String) request.getAttribute("errorMessage2");
			if(UserNameErrormessage != null && !UserNameErrormessage.isEmpty()){
			%>
			<input name = 'userName' placeholder="<%=UserNameErrormessage %>" style="border: 2px solid red;" required>
			<%
			}
			else{
			%>
			<input name = 'userName' placeholder="Enter your first name" required>
			
			<%
			}
			%>
		</div>
		<div class='userInput'>
			<label>First Name</label>
			<%
				String firstNameErrormessage = (String) request.getAttribute("errorMessage3");
				if(firstNameErrormessage != null && !firstNameErrormessage.isEmpty()){
			%>
			<input name = 'firstName' placeholder="<%=firstNameErrormessage %>" style="border:2px solid red;" required>
			<%
				}
				else{
			%>
			<input name = 'firstName' placeholder="Enter your first name" required>
			<%
			
			}%>
		</div>
		<div class='userInput'>
			<label>Last Name</label>
			<%
				String lastNameErrormessage = (String) request.getAttribute("errorMessage4");
				if(lastNameErrormessage != null && !lastNameErrormessage.isEmpty()){
			%>
			<input name = 'lastName' placeholder="<%=lastNameErrormessage %>" style="border: 2px solid red;" required>
			<%
				}
				else{
			%>
			<input name = 'lastName' placeholder="Enter your last name" >
			<%
				}
			%>
		</div>
		<div class='userInput'>
			<label>Birth date</label>
			<%
				String BirthDayErrorMessage = (String) request.getAttribute("BirthDayErrorMessage");
				if(BirthDayErrorMessage != null && !BirthDayErrorMessage.isEmpty()){
			%>
			<input name = 'birthday' type="date" placeholder="<%=BirthDayErrorMessage %>" style="border: 2px solid red;" required>
			<%
				}
				else{
			%>
			<input name = 'birthday' type="date" placeholder="Enter your birthdate" required>
			<%
				}
			%>
		</div>
		<div class='userInput'>
			<label>Gender</label>
			<div class="gender">
			<input type="radio" name="gender" value="Male" required>
			<label for="male">Male</label>
			<input type="radio" name="gender" value="female" required>
			<label for="male">Female</label>
			</div>
		</div>
		<div class='userInput'>
			<label>Email</label>
			<input name = 'email' type="email" placeholder="Enter your email" required>
		</div>
		<div class='userInput'>
			<label>Address</label>
			<input name = 'address' type="text" placeholder="Enter your Address" required>
		</div>
		<div class='userInput'>
			<label>Phone Number</label>
			<input name = 'phone' type="text" placeholder="Enter your Phone number" required>
		</div>
		
		<div class='userInput'>
			<label>Profile Picture</label>
			<input name = 'profilePic' type="file" placeholder="Choose Profile Pic" required>
		</div>
		
		<div class='userInput'>
			<label>Password</label>
			
			<%
			String errormessage1 = (String) request.getAttribute("errorMessage");
			if(errormessage1 != null && !errormessage1.isEmpty()){
			%>
				<input name = 'password' type="text" placeholder="<%=errormessage1 %>" style="border: 2px solid red" required>
			<%
				}else{
			%>
				<input name = 'password' type="text" placeholder="Enter your password"  required>
			<%
				} 
			%>
		</div>
		<div class='userInput'>
			<label>Confirm Password</label>
			<%
			String errormessage2 = (String) request.getAttribute("errorMessage");
			if(errormessage2 != null && !errormessage2.isEmpty()){
			%>
				<input name = 'confirmPassword' type="text" placeholder="<%=errormessage2 %>" style="border:2px solid red" required>
			<%
				}else{
			%>
				<input name = 'confirmPassword' type="text" placeholder="Enter your Password" required>
			<%
				} 
			%>
		</div>
		
		
		</div>
		
		<p style="padding:5px 35px; font-size: 16px">Already have an account? <a href="/CourseWork/Htmls/Login.jsp" style="font-size: 14px">Sign in</a></p>
		<div class='submit'>
			<button type="submit">Submit</button>
		</div>
		
		
		
	</form>
	</div>
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>