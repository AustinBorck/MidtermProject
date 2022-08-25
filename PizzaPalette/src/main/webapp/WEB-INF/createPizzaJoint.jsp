<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		<hr>
		<c:set var="category" value="${attributes.get(0).category.name}" />
		
		
		<c:forEach var="a" items="${attributes}">
				<input type="checkbox" name="attributes" value="${a.id}"> ${a.name}
				<c:if test="${a.category.name != category}">
				<br>
				<c:set var="category" value="${a.category.name}"/>
				</c:if>
		
		</c:forEach>
		
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