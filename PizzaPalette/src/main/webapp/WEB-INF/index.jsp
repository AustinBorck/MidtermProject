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
	
	
	<img alt="Slyce Pizza Co." src="https://slycepizzaco.com/wp-content/uploads/2021/04/IMG_0254-1-1-1-400x511.jpg" height= "100" width="100">
	<img alt="BeauJo's" src="https://scontent.fapa1-1.fna.fbcdn.net/v/t31.18172-8/23551028_10156984807817818_3481223647572248205_o.jpg?_nc_cat=106&ccb=1-7&_nc_sid=cdbe9c&_nc_ohc=6kNLa5st-30AX8eUI89&_nc_ht=scontent.fapa1-1.fna&oh=00_AT-75tYofjmOh2siqHA1f20JE0NImlQnjX6Y0ZrXwo47ew&oe=63237F7E" height= "100" width="100">
	<img alt="Windsor Brick Oven Pizza & Subs" src="https://scontent.fapa1-1.fna.fbcdn.net/v/t39.30808-6/277529442_7160938983976846_3071662410654817087_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=4VzFCLI7a0QAX-qBGbN&_nc_ht=scontent.fapa1-1.fna&oh=00_AT-VLCI6UR3hm3ojC0AKY5FeQ8d8IWcsUAwHCmOMaZLdaw&oe=63040B6C" height= "100" width="100">
	<jsp:include page="footer.jsp" />
	<jsp:include page="foot.jsp" />

</body>
</html>