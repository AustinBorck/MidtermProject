<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>

<jsp:include page="head.jsp" />

</head>
<body>

	<jsp:include page="navBar.jsp"></jsp:include>
	
	<h1>Books </h1>
	
	<div>
		<table class="table table-striped table-hover table-md">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Title</th>
		      <th scope="col">Author</th>         	            	
		      <th scope="col">Genre</th>
		      <th scope="col">Series</th>
		      <th scope="col">Series Name</th>
		      <th scope="col">Series Number</th>
		      <th scope="col">Description</th>
		      <th scope="col">Page Count</th>
		      <th scope="col">Date Created</th>
		      <th scope="col">Date Updated</th>
		      <th scope="col">Edit/Delete</th>
		    </tr>
		  </thead>
		
		<c:forEach var="book" items="${book }">
		  <tbody>
		    <tr>
		      <th scope="row">${book.id}</th>
		      <td><a href="edit.do?id=${book.id}">${book.title}</a></td>
		      <td>${book.author}</td>
		      <td>${book.genre}</td>
		      <td>${book.series}</td>
		      <td>${book.seriesName}</td>
		      <td>${book.number}</td>
		      <td>${book.description}</td>
		      <td>${book.pageCount}</td>
		      <td>${book.dateCreated}</td>
		      <td>${book.dateUpdated}</td>
		      <td>
		      	<form action="edit.do?id=${book.id }" method="GET">
		      	<input type="hidden" value="${book.id }" name="id"/>
		      	<button class="button" type="submit">Edit ${book.id }</button>
		      	</form>
		      </td>
		      
		    </tr>
		  </tbody>
		</c:forEach>
		
		</table>
	</div>
	
	<jsp:include page="foot.jsp" />

</body>
</html>
