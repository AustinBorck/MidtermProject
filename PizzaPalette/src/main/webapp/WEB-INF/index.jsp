<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Book Directory</title>

<jsp:include page="head.jsp" />

</head>


<body>

	<jsp:include page="navBar.jsp"></jsp:include>

	<main class="container-fluid">
		<h1>Welcome to the book directory!</h1>

		<form class="form" action="add.do" method="GET">
			Show All: <input class="button" type="submit" value="Add Book" />
		</form>
		<br>
		<br>
		
		<form class="form" action="findAll.do" method="GET">
			Show All: <input class="button" type="submit" value="Show All Books" />
		</form>
		<br>
		<br>

		<form action="getTitle.do" method="GET">
			Search by Title: <input class="form-control" type="text" name="title" /><br>
			<input class="button" type="submit" value="Show Books" />
		</form>
		<br> <br>

		<form action="getAuthor.do" method="GET">
			Search by Author: <input class="form-control" type="text" name="author" /><br> 
			<input class="button" type="submit" value="Show Books" />
		</form>
		<br> <br>

		<form action="getGenre.do" method="GET">
			Search by Genre: <input class="form-control" type="text" name="genre" /><br>
			<input class="button" type="submit" value="Show Books" />
		</form>
		<br> <br>

		<form action="getSeriesName.do" method="GET">
			Search by Series Name: <input class="form-control" type="text" name="seriesName" /><br> 
		<input class="button" type="submit" value="Show Books" />
		</form>
		<br> <br>

		<form action="getDescription.do" method="GET">
			Search by Book Description: <input class="form-control" type="text" name="description" /><br> 
			<input class="button" type="submit" value="Show Books" />
		</form>

	</main>

	<jsp:include page="foot.jsp" />

</body>
</html>