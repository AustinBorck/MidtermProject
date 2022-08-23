<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>

<jsp:include page="head.jsp" />

</head>
<body>

<jsp:include page="navBar.jsp"></jsp:include>
<h3>Update Pizza Joint</h3>
	<form action="updatePizza.do" method="POST">
		Restaurant Name: <input type="text" name="name" value="${pizzaJoint.name}" required><br>
		Image URL <input type="text" name="imageUrl" value="${pizzaJoint.image}"required><br>
		Website URL: <input type="text" name="website" value="${pizzaJoint.website}"required><br>
		Description: <input type="text" name="description" value="${pizzaJoint.description}"required><br>
		Special Features<br>
		Delivery: <input type="checkbox" name="attributes" value="1">
		Dine-in: <input type="checkbox" name="attributes" value="2">
		Carry-out: <input type="checkbox" name="attributes" value="3">
		New York style: <input type="checkbox" name="attributes" value="4">
		Brooklyn style: <input type="checkbox" name="attributes" value="5">
		<br>Chicago style: <input type="checkbox" name="attributes" value="6">
		California style: <input type="checkbox" name="attributes" value="7">
		Wood-fired: <input type="checkbox" name="attributes" value="8">
		Deep-dish: <input type="checkbox" name="attributes" value="9">
		Sicilian style: <input type="checkbox" name="attributes" value="10">
		Thin-crust: <input type="checkbox" name="attributes" value="11">
		<br>Detriot style: <input type="checkbox" name="attributes" value="12">
		Neapolitan style: <input type="checkbox" name="attributes" value="13">
		Vegan options: <input type="checkbox" name="attributes" value="14">
		Gluten-free options: <input type="checkbox" name="attributes" value="15">
		<br>Kosher options: <input type="checkbox" name="attributes" value="16">
		Keto options: <input type="checkbox" name="attributes" value="17">
		Take and bake: <input type="checkbox" name="attributes" value="18">
		Colorado style: <input type="checkbox" name="attributes" value="19">
		
		<br>Street: <input type="text" name="street" value="${pizzaJoint.address.street}" required><br>
		City: <input type="text" name="city" value="${pizzaJoint.address.city}" required><br>
		State: <input type="text" name="state" value="${pizzaJoint.address.state}" required><br>
		Zip Code: <input type="text" name="zip" value="${pizzaJoint.address.zip}" required><br>
		Phone Number: <input type="text" name="phone" value="${pizzaJoint.address.phoneNumber}" required><br>
		
		<input type="hidden" value="${pizzaJoint.id}" name="id">
		<input type="submit" value="Update">




	</form>
<jsp:include page="foot.jsp" />
</body>
</html>