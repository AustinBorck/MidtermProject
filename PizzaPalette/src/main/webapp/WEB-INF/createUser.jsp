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
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>
	
	<div class="text-center">
	<h3>Create an Account</h3><br>
	<form action="createAccount.do" method="POST">
		First Name<br>
		 <input type="text" name="firstname" required><br><br>
		Last Name <br>
		 <input type="text" name="lastname" required><br><br>
		Username <br>
		 <input type="text" name="username" required><br><br>
		Password <br>
		 <input type="password" name="password" required><br><br>
		<input type="submit" value="Create Account" class="btn btn-primary">
	</form>
	</div>

<jsp:include page="foot.jsp" />
</main>
</body>
</html>