<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AccountPage</title>
<jsp:include page="head.jsp" />

</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include><br><br>

	<h2>Welcome, ${loggedInUser.firstName}</h2><br>

	Username: ${loggedInUser.username}<br>
	Password: ${loggedInUser.password}<br>
	Last Name: ${loggedInUser.lastName}<br><br>

	<form action="logout.do" method="POST">
		<input type="submit" value="Logout">
	</form><br>

	<form action="updateAccountPage.do">
	<input type="hidden" value="${loggedInUser.id}" name="updateAccount"/>
	<input type="submit" value="Update Account"/>
	</form><br>
	
	<form action="deactivateAccount.do" method="POST">
	<input type="hidden" value="${loggedInUser.id}" name="deactivateAccount"/>
	<input type="submit" value="Deactivate Account"/>
	</form>
	
	<jsp:include page="foot.jsp" />
	
</body>
</html>