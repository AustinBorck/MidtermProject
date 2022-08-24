<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<jsp:include page="foot.jsp" />

</body>
</html>