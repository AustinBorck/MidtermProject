<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>PizzaPalette</title>

<jsp:include page="head.jsp" />

</head>


<body>

	<jsp:include page="navBar.jsp"></jsp:include>

	<main class="container-fluid">
		<h1>Pizza Palette</h1>
		<br>
		
		<form action="loginButton.do" method="GET">
		<input class="button" type="submit" value="Login">
		</form>
		<br> <br>
 		
		<form action="searchKeyword.do" method="GET">
			Search: <input class="form-control" type="text" name="keyword" /><br>
			<input class="button" type="submit" value="Search" />
		</form>
		<br> <br>
		
		<h3>Featured Pizzas</h3>
		<br> <br>

	</main>

	<jsp:include page="foot.jsp" />

</body>
</html>