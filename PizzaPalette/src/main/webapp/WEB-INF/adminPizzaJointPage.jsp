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

	<h2>${pizzaJoint.name}</h2>
	<h3>APPROVED: ${pizzaJoint.approved}</h3>
	
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
	
	
	

	<div class="image">
		<img src="${pizzaJoint.image}" height= "400" style="width: 50%">
	</div>

	<table id="table-1">
       <tbody>
			<tr class="row-1">
				<td class="column-1">
					<p>${pizzaJoint.description}</p>

				</td>

	</tr>
			<tr class="row-2">
				<td class="column-2"><c:forEach var="att" items="${pizzaJoint.attributes}">
 				${att.name},
				</c:forEach></td>


			</tr>
			</tbody>
		</table>
		
		
<jsp:include page="foot.jsp" />
</main>
</body>
</html>