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
		<table>
		<tbody>
		<tr>
			<td><img alt="" src="logo.png" width="200" height="200"></td>
			<td> <h1 class="text-center" >Pizza Palette</h1></td>
		</tr>
		</tbody>
		</table>
		<br>
 		
		<form action="searchKeyword.do" method="GET">
			<div class="input-group">
				<input class="form-control rounded" type="text" name="keyword" placeholder="Search for Restaurant" aria-label="Search" aria-describedby="search-addon">
				<input type="submit" class="btn btn-outline-primary" value="search"/>
			</div>
		</form>
		<br> <br>
		
		<h3 class="text-center">This Week's Top Rated Pizza Joints</h3>
		<br> <br>

	</main>
	
	
		
		<c:forEach var="top" items="${top}">
	<div class="top3">
			<a href= "singleResult.do?id=${top.id}" >
			<img alt="${top.name}" src="${top.image}" width="200" height="200" class="place" ></a>
			
			<div class="picDesc"><h3>${top.name}</h3> <br><br>
			
			</div>
		
	</div>
		</c:forEach>
	<br> 
	<br> 
 
<jsp:include page="foot.jsp" />
</main>
</body>
</html>