<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<h3>Update account</h3>
User: ${user.username}
<br>
<form action="update.do" method="POST">
<input type="hidden" name="username" value="${user.username}"><br>
Password: <input type="text" name="password" value="${user.password}"><br>
First Name: <input type="text" name="firstName" value="${user.firstName}"><br>
Last Name: <input type="text" name="lastName" value="${user.lastName}"><br>
<input type="hidden" value="${user.id}" name="updateAccount"/>
<input type="submit" value="Update Account"/>
</form>
</body>
</html>