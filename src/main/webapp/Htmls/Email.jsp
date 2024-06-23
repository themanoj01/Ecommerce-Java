<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email</title>
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
			<li><a href="/CourseWork/Htmls/profile.jsp" style="color: black"><img alt="error" src="/CourseWork/icons/profile.png">  Basic Information</a></li>
			<li class="active"><a href="/CourseWork/Htmls/Email.jsp"><img alt="error" src="/CourseWork/icons/password.png">  Change Password</a></li>
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
			<form style="display: flex; flex-direction: column;" action="/CourseWork/EmailUpdate" method="post">
			
			<label>Old Password</label>
			<input class="inputs" type=text name="oldPassword" disabled>
			
			<label>Password</label>
			<input class="inputs" type=text name="password" disabled>
			
			<label> Confirm Password</label>
			<input class="inputs" type=text name="confirmPassword" disabled>
			
			<input class="inputs" type="hidden" name="email" value="${user.email }">
			
			
			
			<div class="submit-button">
				<button onclick= "changeData()" type="button">Changes Password</button>
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
				changes[i].disabled = false
			}
			button.style.display = 'inline';
		}
	</script>
</body>
</html>