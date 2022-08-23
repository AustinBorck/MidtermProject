<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PizzaJoint</title>
<link rel="stylesheet" href="../css/myStylesheet.css">
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include><br>
	<br>

	<h2>${pizzaJoint.name}</h2>
	<br>

	<div class="home">
		<img class="homeimg" src="${pizzaJoint.image}" height="500"
			width="650"><br>
		<br>

		<div class="pizzaInf">
		<c:forEach var="att" items="${pizzaJoint.attributes}">
			<ul>
				<li>${att.name}</li>
			</ul>
		</c:forEach>

		${pizzaJoint.description}<br>
		<br> ${pizzaJoint.address.phoneNumber}<br>
		${pizzaJoint.address.street}<br> ${pizzaJoint.address.city},
		${pizzaJoint.address.state}, ${pizzaJoint.address.zip}<br> <a
			href="${pizzaJoint.website}" target=_blank>${pizzaJoint.website}</a>
		</div>
	</div>

	<div class="addComment">
		<br><br>
		<form action="addReview.do" method="POST">
			
			  <label>Rating: </label>
			  <input id="rating1" type="radio" name="userRating" value="1">
			  <label for="rating1">1</label>
			  <input id="rating2" type="radio" name="userRating" value="2">
			  <label for="rating2">2</label>
			  <input id="rating3" type="radio" name="userRating" value="3">
			  <label for="rating3">3</label>
			  <input id="rating4" type="radio" name="userRating" value="4">
			  <label for="rating4">4</label>
			  <input id="rating5" type="radio" name="userRating" value="5">
			  <label for="rating5">5</label><br>
			
			Comments: <input type="text" name="comments">
			Photos: <input type="text" name="imageUrl"> <input
				type="hidden" name="pizzaJointId" value="${pizzaJoint.id}">
			<input type="hidden" name="userId" value="${loggedInUser.id}">
			<input type="submit" value="Add Review">
		</form>
	</div><br><br>

	<table class="table table-striped table-hover table-md">
		<thead>
			<tr>
				<th scope="col">User</th>
				<th scope="col">Date</th>
				<th scope="col">Rating</th>
				<th scope="col">Comments</th>
			</tr>
		</thead>

		<c:forEach var="review" items="${reviews}">
		<tbody>
			<td>${review.userReview.username}</td>
			<td>${review.reviewDate}</td>
			<td>${review.rating}</td>
			<td>${review.comments}</td> 
			
				<c:if
					test="${not empty sessionScope.loggedInUser && review.userReview.username == sessionScope.loggedInUser.username}">
					<form action="deleteReview.do" method="POST">
						<input type="hidden" name="reviewId" value="${review.id}">
						<input type="hidden" name="pizzaId" value="${pizzaJoint.id}">
						<input type="submit" value="Delete">
					</form>
				</c:if>
				
		</tbody>
		</c:forEach>
	</table>



	<jsp:include page="foot.jsp" />
</body>
</html>


