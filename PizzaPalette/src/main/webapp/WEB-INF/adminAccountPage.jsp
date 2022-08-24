<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminAccount</title>

<jsp:include page="head.jsp" />

</head>
<body>

	<jsp:include page="navBar.jsp"></jsp:include><br><br>
	<div class="text-center">

	<h2>ADMIN USER </h2><br>

	<strong> Username </strong><br>
	${loggedInUser.username}<br>
	<strong> Password </strong><br>
	${loggedInUser.password}<br>
	<strong> First Name </strong><br>
	${loggedInUser.firstName}<br>
	<strong> Last Name </strong><br>
	${loggedInUser.lastName}<br><br>
	
	<form action="getAllUsers.do" method="GET">
	<input type="submit" value="Show all Users" class="btn btn-info">
	</form><br>
	
	<form action="createPizza.do" method="GET">
	<input type="submit" value="Create New PizzaJoint" class="btn btn-info">
	</form><br>
	
	<form action="pizzaJointById.do" method="GET">
		Search for a PizzaJoint by ID<br> <input type="text" name="pizzaJointId">
		<input type="submit" value="Search" class="btn btn-info">
	</form><br>
	
	<form action="logout.do" method="POST">
		<input type="submit" value="Logout" class="btn btn-secondary">
	</form><br>

	<form action="updateAccountPage.do">
	<input type="hidden" value="${loggedInUser.id}" name="updateAccount"/>
	<input type="submit" value="Update Account" class="btn btn-warning"/>
	</form><br>
	
	<form action="deactivateAccount.do" method="POST">
	<input type="hidden" value="${loggedInUser.id}" name="deactivateAccount"/>
	<input type="submit" value="Deactivate Account" class="btn btn-danger"/>
	</form><br>
	

	</div>
	
		<table class="table table-striped table-hover table-md">
			<thead>
				<tr>
					<th scope="col">Pizza Joint</th>
					<th scope="col">User</th>
					<th scope="col">Date</th>
					<th scope="col">Rating</th>
					<th scope="col">Comments</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="review" items="${reviews}">
					<tr>
						<td>${review.pizzaJoint.name } </td>
						<td>${loggedInUser.username}</td>
						<td>${review.reviewDate}</td>
						<td>${review.rating}</td>
						<td>${review.comments}</td>

						<c:if
							test="${not empty sessionScope.loggedInUser && review.userReview.username == sessionScope.loggedInUser.username}">
							<td><form action="deleteReview.do" method="POST">
								<input type="hidden" name="reviewId" value="${review.id}">
								<input type="hidden" name="pizzaId" value="${pizzaJoint.id}">
								<input type="submit" value="Delete">
							</form></td>
						</c:if>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	<jsp:include page="foot.jsp" />

</body>
</html>