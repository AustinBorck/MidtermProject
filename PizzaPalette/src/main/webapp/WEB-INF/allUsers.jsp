<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllUsers</title>
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navBar.jsp"></jsp:include><br>
	<c:forEach var="u" items="${user}">
	User: ${u.username} <br>
	First Name: ${u.firstName} <br>
	Last Name: ${u.lastName} <br>
	Active Status: ${u.enabled}<br>
	User Role: ${u.role}<br>
	<form action="updateAccountPage.do">
	<input type="hidden" value="${u.id}" name="updateAccount"/>
	<input type="submit" value="Update Account"/>
	</form>
	<form action="deactivateAccount.do" method="POST">
	<input type="hidden" value="${u.id}" name="deactivateAccount"/>
	<input type="submit" value="Deactivate Account"/>
	</form><br>
	</c:forEach>
	
	<jsp:include page="foot.jsp" />
	
</body>
</html>