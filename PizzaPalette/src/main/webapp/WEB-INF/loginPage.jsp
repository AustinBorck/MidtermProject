<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<jsp:include page="head.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navBar.jsp"></jsp:include><br><br>

		<h2 class="text-center">Login</h2>
		<br>

		<div class="mb-3">

			<form action="login.do" method="POST">
				<label for="usernameinput" class="form-label"></label> 
				<input type="text" class="form-control" name="username" id="usernameinput"
					placeholder="Username">
					
				<label for="passwordinput" class="form-label"></label>
				<input type="password" class="form-control" name="password"
					id="passwordinput" placeholder="Password"><br>
					
				<div class="text-center">
					<input type="submit" value="Login" class="btn btn-primary">
				</div>
			</form>
			
		</div><br>

		<div class="text-center">
			New to PizzaPalette? <a href="createAccountPage.do">Create an account</a>
		</div>
		
<jsp:include page="foot.jsp" />
</main>
</body>
</html>