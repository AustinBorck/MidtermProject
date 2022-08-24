<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<jsp:include page="head.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>

	<h1>Contact Us</h1>

	<form action="contacted.do" method="POST">
					
		<label for="message">Message:</label> 
		<input type="text" id="contact" name="lname">
		<br><br>
					
		<input class="button" type="submit" value="Send message" />

	</form>

<jsp:include page="foot.jsp" />
</main>
</body>
</html>