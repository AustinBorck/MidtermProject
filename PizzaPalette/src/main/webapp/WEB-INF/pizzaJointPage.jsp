<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PizzaJoint</title>
</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include>

<h2>${pizzaJoint.name}</h2>
<c:forEach var="review" items="${reviews}">
<ul>

<li>${review.userReview.username}</li>
<li>${review.comments}</li>
</ul>
	</c:forEach>

</body>
</html>


