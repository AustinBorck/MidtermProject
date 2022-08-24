<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllUsers</title>
<jsp:include page="head.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>

<strong> User Id </strong><br>
	${user.id}<br><br>
<strong> Username </strong><br>
	${user.username}<br><br>
	<strong> Password </strong><br>
	${user.password}<br><br>
	<strong> First Name </strong><br>
	${user.firstName}<br><br>
	<strong> Last Name </strong><br>
	${user.lastName}<br><br>
	<strong> Active Status </strong><br>
	${user.enabled}<br><br>
	<strong> User Role </strong><br>
	${user.role}<br><br>
	
		<form action="updateAccountPage.do">
			<input type="hidden" value="${user.id}" name="updateAccount" /> <input
				type="submit" value="Update Account" />
		</form>
		
		<form action="deactivateAccount.do" method="POST">
			<input type="hidden" value="${user.id}" name="deactivateAccount" /> <input
				type="submit" value="Deactivate Account" />
		</form><br><br>

<jsp:include page="foot.jsp" />
</main>
</body>
</html>