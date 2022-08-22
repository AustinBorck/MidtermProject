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

<h3>Update account</h3>
Restaurant: ${PizzaJoint.name}
<br>
<form action="update.do" method="POST">
<input type="hidden" name="name" value="${PizzaJoint.name}"><br>
<input type="submit" value="Update Restaurant"/>
</form>

<jsp:include page="footer.jsp" />
<jsp:include page="foot.jsp" />
</body>
</html>