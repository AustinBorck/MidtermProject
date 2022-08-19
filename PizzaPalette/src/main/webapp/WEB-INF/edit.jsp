<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit/Delete</title>

<jsp:include page="head.jsp" />

</head>
<body>

	<jsp:include page="navBar.jsp"></jsp:include>

	<c:choose>
		<c:when test="${! empty book}">
			<ul>
				<h2>Edit or Delete a book</h2>
				<br>
				<br>
				
				Title: ${book.title}<br><br>
				Author: ${book.author}<br><br>
				Genre: ${book.genre}<br><br>
				Part of Series? ${book.series}<br><br>
				Series Name: ${book.seriesName}<br><br>
				Book Number in Series: ${book.number}<br><br>
				Page Count: ${book.pageCount}<br><br>
				Description: ${book.description}<br><br>

				<form action="edited.do" method="POST">
					<input type ="hidden" id="id" name="id" value="${book.id }">
					<br> 
					
					Title: <input type="text" id="title" name="title"
						value="${book.title}" placeholder="${book.title }" /> 
					<br> <br>

					Author: <input type="text" id="author" name="author"
						value="${book.author}" placeholder="${book.author }" />
					<br> <br> 
					
					<label for="genre">Genre:</label> 
					<select class="genre" name="genre" required>
							<option value=""></option>
							<option value="Science Fiction">Science Fiction</option>
							<option value="Urban Fantasy">Urban Fantasy</option>
							<option value="Romance">Romance</option>
							<option value="Fantasy">Fantasy</option>
							<option value="Poem">Poem</option>
							<option value="History">History</option>
							<option value="Mythology">Mythology</option>
					</select>
					<br> <br>
					
					<section class="series">
						<label for="series">Series:</label> <select
							id="series" name="series" value="${book.series}"
						placeholder="${book.series }" >
							<option value=""></option>
							<option value="true">Yes</option>
							<option value="false">No</option>
						</select>
					</section>
					<br> 
					
					Series Name: <input type="text"
						id="seriesName" name="seriesName" value="${book.seriesName}"
						placeholder="${book.seriesName }" /> 
					<br> <br>
					
					Number in Series: <input type="text"
						id="number" name="number" value="${book.number}"
						placeholder="${book.number }" /> 
					<br> <br>

					Description: <input type="text" id="description"
						name="description" value="${book.description}"
						placeholder="${book.description }" /> 
					<br> <br>
					
					Page Count: <input type="text" id="pageCount"
						name="pageCount" value="${book.pageCount}"
						placeholder="${book.pageCount }" /> 
					<br> <br>
					
					<input class="button" type="submit" value="Update" />

				</form>

				<form action="delete.do" method="POST">
					<input type="hidden" id="id" name="id" value="${book.id }"/>
					
					<br><input class="button" type="submit" value="Delete" />
				</form>
				
		</c:when>
		<c:otherwise>
			<p>No book found</p>
		</c:otherwise>
	</c:choose>

	<jsp:include page="foot.jsp" />
</body>
</html>