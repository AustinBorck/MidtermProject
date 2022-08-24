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
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>

	<h2>${pizzaJoint.name}</h2><br>

	<div class="home row" >
		<div class="col">
			<img class="homeimg" src="${pizzaJoint.image}" height="500"
				width="650"><br> <br>
		</div>

		<div class="pizzaInf col desc">
			<ul>
				<c:forEach var="att" items="${pizzaJoint.attributes}">
					<li>${att.name}</li>
				</c:forEach>
			</ul>

			${pizzaJoint.description}<br> <br>
			${pizzaJoint.address.phoneNumber}<br>
			${pizzaJoint.address.street}<br> 
			${pizzaJoint.address.city},
			${pizzaJoint.address.state}, 
			${pizzaJoint.address.zip}<br> 
			<a href="${pizzaJoint.website}" target=_blank>${pizzaJoint.website}</a><br>
	
			<h5>Approved: ${pizzaJoint.approved}</h5><br>
			
			<form action="updatePizzaJoint.do" method="GET">
				<input type="hidden" value="${pizzaJoint.id}" name="updatePizzaJoint">
				<input type="submit" value="EDIT" class="btn btn-warning">
			</form>
			
			<form action="reactivatePizzajoint.do" method="POST">
				<input type="hidden" value="${pizzaJoint.id}" name="id">
				<input type="submit" value="REACTIVATE" class="btn btn-secondary">
			</form>
			
			<form action="deactivatePizzajoint.do" method="POST">
				<input type="hidden" value="${pizzaJoint.id}" name="id">
				<input type="submit" value="DEACTIVATE" class="btn btn-danger">
			</form>
	
		</div>
	</div>
		
<jsp:include page="foot.jsp" />
</main>
</body>
</html>