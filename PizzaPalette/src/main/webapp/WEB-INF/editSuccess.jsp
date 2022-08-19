<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edited</title>

<jsp:include page="head.jsp" />

</head>
<body>

	<jsp:include page="navBar.jsp"></jsp:include>

				Title: ${book.title}<br><br>
				Author: ${book.author}<br><br>
				Genre: ${book.genre}<br><br>
				Part of Series? ${book.series}<br><br>
				Series Name: ${book.seriesName}<br><br>
				Book Number in Series: ${book.number}<br><br>
				Page Count: ${book.pageCount}<br><br>
				Description: ${book.description}<br><br>

	<jsp:include page="foot.jsp" />

</body>
</html>