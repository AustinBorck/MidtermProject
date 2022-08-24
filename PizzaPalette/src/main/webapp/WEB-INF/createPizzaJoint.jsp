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
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>
	
	<h3>Create a Pizza Joint</h3><br>
	
	<form action="createPizzaJoint.do" method="POST">
		Restaurant Name: <input type="text" name="name" required><br><br>
		Image URL: <input type="text" name="imageUrl" required><br><br>
		Website URL: <input type="text" name="website" required><br><br>
		Description: <input type="text" name="description" required><br><br>
		Special Features:<br>
		<input type="checkbox" name="attributes" value="1" required> Delivery
		<input type="checkbox" name="attributes" value="2"> Dine-in
		<input type="checkbox" name="attributes" value="3"> Carry-out
		<input type="checkbox" name="attributes" value="18"> Take-and-bake<br>
		<input type="checkbox" name="attributes" value="4"> New York style
		<input type="checkbox" name="attributes" value="5"> Brooklyn style
		<input type="checkbox" name="attributes" value="6"> Chicago style
		<input type="checkbox" name="attributes" value="7"> California style
		<input type="checkbox" name="attributes" value="8"> Wood-fired
		<input type="checkbox" name="attributes" value="9"> Deep-dish
		<input type="checkbox" name="attributes" value="10"> Sicilian style
		<input type="checkbox" name="attributes" value="11"> Thin-crust
		<input type="checkbox" name="attributes" value="12"> Detriot style
		<input type="checkbox" name="attributes" value="13"> Neapolitan style
		<input type="checkbox" name="attributes" value="19"> Colorado style<br>
		<input type="checkbox" name="attributes" value="14"> Vegan options
		<input type="checkbox" name="attributes" value="15"> Gluten-free options
		<input type="checkbox" name="attributes" value="16"> Kosher options
		<input type="checkbox" name="attributes" value="17"> Keto options <br>
		
		<br>Street: <input type="text" name="street" required><br><br>
		City: <input type="text" name="city" required>
		State: <input type="text" name="state" required>
		Zip Code: <input type="text" name="zip" required><br><br>
		Phone Number: <input type="text" name="phone" required><br><br>
		
		
		<input type="submit" value="Create PizzaJoint">

	</form>

<jsp:include page="foot.jsp" />
</main>	
</body>
</html>