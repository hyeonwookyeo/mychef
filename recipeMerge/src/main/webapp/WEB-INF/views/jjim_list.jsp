<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/set.jsp"%>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link href="css/mypage.css" rel="stylesheet">
</head>
<body>

<div class="container p-5 my-5 border">
	<table class="table">
		<c:if test="${empty list }">
		<tr>
			<td>아직 찜한 레시피가 없습니다.</td>
		</tr>
		</c:if>
	
		<c:if test="${not empty list}">
		<c:forEach var="board" items="${list }">
		<tr class="img-box">
			<td>
			<a href="r_view?rnum=${board.rnum }"><img src="./t_images/${board.thumbnail }" class="jjim-img"></a>
			</td>
			<td>${board.subject }
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
</div>
</body>
</html>