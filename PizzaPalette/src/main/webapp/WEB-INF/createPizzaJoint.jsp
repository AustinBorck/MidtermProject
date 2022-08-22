<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateAPizzaJoint</title>
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include>
	<h3>Create a Pizza Joint</h3>
	<form action="createPizzaJoint.do" method="POST">
		Restaurant Name: <input type="text" name="name" required><br>
		Image URL <input type="text" name="imageUrl" required><br>
		Website URL: <input type="text" name="website" required><br>
		Description: <input type="text" name="description" required><br>
		Special Features<br>
		Delivery: <input type="checkbox" name="attributes" value="1">
		Dine-in: <input type="checkbox" name="attributes" value="2">
		Carry-out: <input type="checkbox" name="attributes" value="3">
		New York style: <input type="checkbox" name="attributes" value="New York style">
		Brooklyn style: <input type="checkbox" name="attributes" value="Brooklyn style">
		<br>Chicago style: <input type="checkbox" name="attributes" value="Chicago style">
		California style: <input type="checkbox" name="attributes" value="California style">
		Wood-fired: <input type="checkbox" name="attributes" value="Wood-fired">
		Deep-dish: <input type="checkbox" name="attributes" value="Deep-dish">
		Sicilian style: <input type="checkbox" name="attributes" value="Sicilian style">
		Thin-crust: <input type="checkbox" name="attributes" value="Thin-crust">
		<br>Detriot style: <input type="checkbox" name="attributes" value="Detriot style">
		Neapolitan style: <input type="checkbox" name="attributes" value="Neapolitan style">
		Vegan options: <input type="checkbox" name="attributes" value="Vegan options">
		Gluten-free options: <input type="checkbox" name="attributes" value="Gluten-free options">
		<br>Kosher options: <input type="checkbox" name="attributes" value="Kosher options">
		Keto options: <input type="checkbox" name="attributes" value="Keto options">
		Take and bake: <input type="checkbox" name="attributes" value="Take & bake">
		Colorado style: <input type="checkbox" name="attributes" value="Colorado style">
		
		<br>Street: <input type="text" name="street" required><br>
		City: <input type="text" name="city" required><br>
		State: <input type="text" name="State" required><br>
		Zip Code: <input type="text" name="zip" required><br>
		Phone Number: <input type="text" name="phone" required><br>
		
		
		<input type="submit" value="Create PizzaJoint">




	</form>


	<jsp:include page="footer.jsp" />
	<jsp:include page="foot.jsp" />
</body>
</html>