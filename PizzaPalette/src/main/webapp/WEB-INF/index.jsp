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
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>

		<h1>Pizza Palette</h1>
		<br>
 		
		<form action="searchKeyword.do" method="GET">
			<div class="input-group">
				<input class="form-control rounded" type="text" name="keyword" placeholder="Search for Restaurant" aria-label="Search" aria-describedby="search-addon">
				<input type="submit" class="btn btn-outline-primary" value="search"/>
			</div>
		</form>
		<br> <br>
		
		<h3>This Week's Top Rated Pizza Joints</h3>
		<br> <br>

	</main>
	
	
		
		<c:forEach var="top" items="${top}">
	<div class="top3">
			<a href= "singleResult.do?id=${top.id}" ><img alt="${top.name}" src="${top.image}" class="place" style="width:100%;"></a>
			
			<div class="picDesc"><h3>${top.name}</h3> <br>
			
			</div>
		
	</div>
		</c:forEach>
		
	
	
	<br> 
	<br> 
 
<jsp:include page="foot.jsp" />
</main>
</body>
</html>