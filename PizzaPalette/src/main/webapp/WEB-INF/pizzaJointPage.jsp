<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PizzaJoint</title>
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include>

<h2>${pizzaJoint.name}</h2>
<c:forEach var="review" items="${reviews}">
<ul>

<li>${review.userReview.username}</li>
<li>${review.comments}</li>
<li>${review.rating}</li>
<li>${review.reviewDate}</li>
</ul>
	</c:forEach>
<form action="addReview.do" method="POST">
Comments: <input type="text" name="comments"><br>
Rating: <input type="number" name="userRating" min="0" step="1" max="5"><br>
Photos: <input type="text" name="imageUrl">
<input type="hidden" name="pizzaJointId" value="${pizzaJoint.id}">
<input type="hidden" name="userId" value="${loggedInUser.id}">
<input type="submit" value="Add Review">
</form>
<jsp:include page="footer.jsp" />
<jsp:include page="foot.jsp" />
</body>
</html>


