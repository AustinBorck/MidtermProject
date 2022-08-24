<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<jsp:include page="head.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navBar.jsp" /><br><br>

	<h3>Update account</h3><br>
	
	User: ${user.username}<br>
	
	<form action="update.do" method="POST">
		<input type="hidden" name="username" value="${user.username}"><br>
		Password: <input type="text" name="password" value="${user.password}"><br><br>
		First Name: <input type="text" name="firstName" value="${user.firstName}"><br><br>
		Last Name: <input type="text" name="lastName" value="${user.lastName}"><br><br>
		<input type="hidden" value="${user.id}" name="updateAccount" /> 
		<input type="submit" value="Update Account" />
	</form>

<jsp:include page="foot.jsp" />
</main>
</body>
</html>