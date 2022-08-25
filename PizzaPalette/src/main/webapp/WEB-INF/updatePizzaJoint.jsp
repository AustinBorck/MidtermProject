<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<jsp:include page="head.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>

<h3>Update Pizza Joint</h3>
	<form action="updatePizza.do" method="POST">
		Restaurant Name: <input type="text" name="name" value="${pizzaJoint.name}" required><br>
		Image URL <input type="text" name="imageUrl" value="${pizzaJoint.image}"required><br>
		Website URL: <input type="text" name="website" value="${pizzaJoint.website}"required><br>
		Description: <input type="text" name="description" value="${pizzaJoint.description}"required><br>
		Special Features<br>
		
		<hr>
		<c:set var="category" value="${attributes.get(0).category.name}" />
		
		
		<c:forEach var="a" items="${attributes}">
				<input type="checkbox" name="attributes" value="${a.id}" 
				<c:if test="${pizzaJoint.attributes.contains(a)}">
				checked
				</c:if>
				> ${a.name}
				<c:if test="${a.category.name != category}">
				<br>
				<c:set var="category" value="${a.category.name}"/>
				</c:if>
		
		</c:forEach>
		
		
		
		
		<br>Street: <input type="text" name="street" value="${pizzaJoint.address.street}" required><br>
		City: <input type="text" name="city" value="${pizzaJoint.address.city}" required><br>
		State: <input type="text" name="state" value="${pizzaJoint.address.state}" required><br>
		Zip Code: <input type="text" name="zip" value="${pizzaJoint.address.zip}" required><br>
		Phone Number: <input type="text" name="phone" value="${pizzaJoint.address.phoneNumber}" required><br>
		
		<input type="hidden" value="${pizzaJoint.id}" name="id">
		<input type="submit" value="Update">
	</form>
	
<jsp:include page="foot.jsp" />
</main>
</body>
</html>