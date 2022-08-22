<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<div style='float: left'>
		<img src="${pizzaJoint.image}">
	</div>
	<div style='float: right'>
		<table border="1" width="44" style="margin-left: 30%; float: top;">
			<tr>
				<td>
					<p>${pizzaJoint.description}</p>

				</td>

			</tr>
			<tr>
				<td><c:forEach var="att" items="${pizzaJoint.attributes}">
 ${att.name},
</c:forEach></td>


			</tr>
		</table>
	</div>

	<%-- 
<img alt="${pizzaJoint.name}" src="${pizzaJoint.image}" height= "400" style="width: 50%" >
<br>
${pizzaJoint.description}
<br>
<c:forEach var="att" items="${pizzaJoint.attributes}">
 ${att.name},
</c:forEach> --%>
	<br>
	<a href="${pizzaJoint.website}" target=_blank>${pizzaJoint.website}</a>
	<br> ${pizzaJoint.address.phoneNumber}
	<br> ${pizzaJoint.address.street}
	<br> ${pizzaJoint.address.city}
	<br> ${pizzaJoint.address.state}
	<br> ${pizzaJoint.address.zip}
	<br>

	<c:forEach var="review" items="${reviews}">
		<ul>

			<li>${review.userReview.username}</li>
			<li>${review.comments}</li>
			<li>${review.rating}</li>
			<li>${review.reviewDate}</li>
		</ul>
	</c:forEach>
	<form action="addReview.do" method="POST">
		Comments: <input type="text" name="comments"><br> Rating:
		<input type="number" name="userRating" min="0" step="1" max="5"><br>
		Photos: <input type="text" name="imageUrl"> <input
			type="hidden" name="pizzaJointId" value="${pizzaJoint.id}"> <input
			type="hidden" name="userId" value="${loggedInUser.id}"> <input
			type="submit" value="Add Review">
	</form>
	<jsp:include page="footer.jsp" />
	<jsp:include page="foot.jsp" />
</body>
</html>


