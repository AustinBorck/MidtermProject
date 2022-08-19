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
	<jsp:include page="navBar.jsp"></jsp:include>

<h2>Your account </h2>
${loggedInUser}

<form action="logout.do" method="POST">
<input type="submit"  value="Logout">
</form>
</body>
</html>