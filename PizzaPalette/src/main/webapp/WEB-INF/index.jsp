<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>PizzaPalette</title>

<jsp:include page="head.jsp" />
<link rel="stylesheet" href="css/myStylesheet.css">
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
		
		<h3>This Week's Top Rated Pizza Joints</h3>
		<br> <br>

	</main>
	
	
		
		<c:forEach var="top" items="${top}">
	<div class="top3">
			<a href= "singleResult.do?id=${top.id}" ><img alt="${top.name}" src="${top.image}" class="place" style="width:100%;"></a>
			
			<div class="picDesc"><h3>${top.name}</h3> 
			
			</div>
		
	</div>
		</c:forEach>
		
	
	
	<br> 
	<br> 
	<jsp:include page="footer.jsp" />
	<jsp:include page="foot.jsp" />

</body>
</html>