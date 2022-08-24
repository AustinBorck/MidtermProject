<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pizza Restaurants</title>
<jsp:include page="head.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>
	
	<h1>Pizza Restaurants</h1></ul>
	
	<div >
	<c:forEach var="pizzajoint" items="${results}">
		<table class="table table-striped table-hover table-md table-row" >
		<tbody >
			<tr>
				<td><img src="${pizzajoint.image }" height="250" width="250"/></td>
				<td><a href="singleResult.do?id=${pizzajoint.id}">${pizzajoint.name}</a></td>
				<td>
					<c:forEach var="att" items="${pizzajoint.attributes}">
						<ul><li>${att.name}</li></ul>
					</c:forEach>
				</td>
			</tr>
		</tbody>
		</table>
	</c:forEach>
	</div>
	
<jsp:include page="foot.jsp" />
</main>
</body>
</html>
