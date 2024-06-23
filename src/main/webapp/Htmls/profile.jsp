<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel='stylesheet' href="/CourseWork/CSS/Profile.css">
</head>
<body>
	<%
		String userSession = (String) session.getAttribute("userName");
		String userEmail = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("email")) userEmail = cookie.getValue();
			}
		}
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	
	
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	
	<c:catch var="sqlException">
    <sql:query var="userEmail" dataSource="${connection }">
        select * from users where email = "<%=userEmail %>";
    </sql:query>
</c:catch>

<c:choose>
    <c:when test="${not empty sqlException}">
        <!-- Handle SQL Exception -->
        <p style=" color: Red; font-size: 24px; font-weight: 600; text-align: center; margin-top: 40px;">Server Error</p>
    </c:when>
    <c:otherwise>
    
    
	
	<c:forEach var="user" items="${userEmail.rows}">
	<div class="main-div">
	<div class="left-nav">
		
		<ul>
			<li class="active"><a href="/CourseWork/Htmls/profile.jsp"><img alt="errpr" src="/CourseWork/icons/profile.png">  Basic Information</a></li>
			<li><a href="/CourseWork/Htmls/Email.jsp" style="color: black"><img alt="error" src="/CourseWork/icons/password.png">  Change Password</a></li>
			<li><a href="/CourseWork/Htmls/OrderHistory.jsp" style="color: black"><img alt="error" src="/CourseWork/icons/history.png">  Order History</a></li>
		</ul>
	</div>
	
	<div class="center-div">
		<div class="input-fields">
		<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String errormessage = (String) request.getAttribute("errorMessage");
			if(errormessage != null && !errormessage.isEmpty()){
		%>

			<p class="error-message" style="color:red; font-weigth: 100; font-size:1.5rem;"><%=errormessage%></p>
		<%
				
			}
		%>
	</div>
			<form style="display: flex; flex-direction: column;" action="/CourseWork/UpdateServlet" method="post">
		
			<label>User Name</label>
			<input Readonly type=text  name="userName" value="${user.userName }">
		
			<label>First Name</label>
			<%
			String errormessage3 = (String) request.getAttribute("errorMessage3");
			if(errormessage3 != null && !errormessage3.isEmpty()){
			%>
			<input Readonly type=text class="inputs" name="firstName" placeholder="<%=errormessage3 %>" style="border: 2px solid red">
			<%
			}
			else{
			%>
			<input Readonly type=text class="inputs" name="firstName" value="${user.firstName }">
			<%
			}
			%>
			<label>Last Name</label>
			<%
			String errormessage4 = (String) request.getAttribute("errorMessage4");
			if(errormessage4 != null && !errormessage4.isEmpty()){
			%>
			<input Readonly type=text class="inputs" name="lastName" placeholder="<%=errormessage4 %>" style="border: 2px solid red">
			<%
			}
			else{
			%>
			<input Readonly type=text class="inputs" name="lastName" value="${user.lastName}">
			<%
			}
			%>
		
			<label>Birthday</label>
			<input Readonly class="inputs" type=date name="birthday" value="${user.birthday }">
		
			<label>Email-Address</label>
			<input  type=text name="email" value="${user.email }" readonly>
			<p>This is your primary email address and will be used to send notification emails.</p>
		
			<label>Phone Number</label>
			<input Readonly class="inputs" type=text name="phone" value="${user.phone }">
		
			<label>Address</label>
			<input Readonly class="inputs" type=text name="address" value="${user.address } ">
			
			
			<div class="submit-button">
				<button onclick= "changeData()" type="button">Changes Info</button>
				<button type="submit" id="save" style="display: none;">Save Changes</button>
			
			</div>
			</form>
		</div>
		
		
	</div>
	
	<div class="right-nav">
	<div class="profile-img">
	
		<img alt="error" src="/CourseWork/photos/${user.profilePic }">
	
	</div>
		
	</div>
	
	</div>
	
	</c:forEach>
	
	
	</c:otherwise>
</c:choose>
	<jsp:include page="Footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		function changeData() {
			var changes = document.getElementsByClassName('inputs');
			var button = document.getElementById('save');
			for(var i = 0; i< changes.length; i++){
				changes[i].removeAttribute("Readonly")
			}
			button.style.display = 'inline';
		}
	</script>
</body>
</html>