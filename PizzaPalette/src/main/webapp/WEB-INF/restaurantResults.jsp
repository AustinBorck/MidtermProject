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

	<jsp:include page="navBar.jsp"></jsp:include><br><br>
	
	<h1>Pizza Restaurants</h1></ul>
	
	<div >
	<c:forEach var="pizzajoint" items="${results}">
		<table class="table-primary table-stripped-columns table-hover" >
		<tbody >
			<tr>
				<td><img src="${pizzajoint.image }"/></td>
				<td><a href="singleResult.do?id=${pizzajoint.id}">${pizzajoint.name}</a></td>
				<td>
					<c:forEach var="att" items="${pizzajoint.attributes}">
						<ul><li>${att.name}</li></ul>
					</c:forEach>
				</td><br><br>
			</tr>
		</tbody>
		</table>
	</c:forEach>
	</div>
	
	<jsp:include page="foot.jsp" />

</body>
</html>
