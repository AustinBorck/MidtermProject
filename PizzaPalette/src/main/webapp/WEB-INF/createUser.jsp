<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateAnAccount</title>

<jsp:include page="head.jsp" />

</head>

<body>

	<jsp:include page="navBar.jsp"></jsp:include><br><br>
	
	<h3>Create an Account</h3><br>
	
	<form action="createAccount.do" method="POST">
		First Name: <input type="text" name="firstname" required><br><br>
		Last Name: <input type="text" name="lastname" required><br><br>
		Username: <input type="text" name="username" required><br><br>
		Password: <input type="password" name="password" required><br><br>
		<input type="submit" value="Create Account">
	</form>

	<jsp:include page="foot.jsp" />
	
</body>
</html>