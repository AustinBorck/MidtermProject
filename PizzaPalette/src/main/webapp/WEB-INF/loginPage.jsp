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
	<jsp:include page="navBar.jsp"></jsp:include>

<h2>Login</h2>

<form action="login.do" method="POST">
Username: <input type="text" name="username">
Password: <input type="password" name="password">
<input type="submit"  value="Login">
</form>
<form action="createAccountPage.do" method="GET">
New to PizzaPalette? <input type="submit"  value="Create an Account">
</form>


	<jsp:include page="foot.jsp" />

</body>
</html>