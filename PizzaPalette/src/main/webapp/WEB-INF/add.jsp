<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add</title>

<jsp:include page="head.jsp" />

</head>
<body>

<jsp:include page="navBar.jsp"></jsp:include>

<ul>
				<h2>Add a Book</h2>
				<br>
				<br>
				
				<form action="added.do" method="POST">
					<input type ="hidden" id="id" name="id" value="${book.id }">
					<br> 
					
					Title: <input type="text" id="title" name="title"
						value="${book.title}" placeholder="${book.title }" /> 
					<br> <br>

					Author: <input type="text" id="author" name="author"
						value="${book.author}" />
					<br> <br> 
					
					<section class="genre">
						<label for="genre">Genre:</label> <select
							id="genre" name="genre" value="${book.genre}">
							<option value=""></option>
							<option value="Science Fiction">Science Fiction</option>
							<option value="Urban Fantasy">Urban Fantasy</option>
							<option value="Romance">Romance</option>
							<option value="Fantasy">Fantasy</option>
							<option value="Poem">Poem</option>
							<option value="History">History</option>
							<option value="Mythology">Mythology</option>
						</select>
					</section>
					<br> 
					
					<section class="series">
						<label for="series">Series:</label> <select
							id="series" name="series" value="${book.series}">
							<option value=""></option>
							<option value="true">Yes</option>
							<option value="false">No</option>
						</select>
					</section>
					<br> 
					
					Series Name: <input type="text"
						id="seriesName" name="seriesName" value="${book.seriesName}" /> 
					<br> <br>
					
					Number in Series: <input type="text"
						id="number" name="number" value="${book.number}" /> 
					<br> <br>

					Description: <input type="text" id="description"
						name="description" value="${book.description}" /> 
					<br> <br>
					
					Page Count: <input type="text" id="pageCount"
						name="pageCount" value="${book.pageCount}" /> 
					<br> <br>
					
					<input class="button" type="submit" value="Add" />

				</form>

<jsp:include page="foot.jsp" />

</body>
</html>