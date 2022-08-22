<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminAccount</title>
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include>

	<h2>ADMIN USER: ${loggedInUser.firstName}</h2>

	Username: ${loggedInUser.username}<br>
	Password: ${loggedInUser.password}<br>
	Last Name: ${loggedInUser.lastName}<br>
	
	<form action="getAllUsers.do" method="GET">
	<input type="submit" value="Show all Users">
	</form>

	<form action="logout.do" method="POST">
		<input type="submit" value="Logout">
	</form>

	<form action="updateAccountPage.do">
	<input type="hidden" value="${loggedInUser.id}" name="updateAccount"/>
	<input type="submit" value="Update Account"/>
	</form>
	<form action="deactivateAccount.do" method="POST">
	<input type="hidden" value="${loggedInUser.id}" name="deactivateAccount"/>
	<input type="submit" value="Deactivate Account"/>
	</form>
	
	<jsp:include page="footer.jsp" />
	<jsp:include page="foot.jsp" />

</body>
</html>