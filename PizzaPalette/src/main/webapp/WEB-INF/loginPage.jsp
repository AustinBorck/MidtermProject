<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login</title>

<jsp:include page="head.jsp" />

</head>

<body>

	<jsp:include page="navBar.jsp"></jsp:include><br>
	<br>

	<h2>Login</h2>
	<br>

	<form action="login.do" method="POST">
		Username: <input type="text" name="username"><br>
		<br> Password: <input type="password" name="password"><br>
		<br> <input type="submit" value="Login">
	</form>
	<br>
	<br>

		New to PizzaPalette? <a href="createAccountPage.do">Create an account</a>

	<jsp:include page="foot.jsp" />

</body>
</html>