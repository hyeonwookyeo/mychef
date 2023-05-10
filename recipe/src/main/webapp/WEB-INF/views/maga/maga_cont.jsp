<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
</head>
<body>

	<table border=1 align=center>
		<tr>
			<td>제목</td>
			<td>${maga.subject}</td>
		</tr>

		<tr>
			<th>프로필사진</th>
			<td><c:if test="${empty maga.mfile}">&nbsp;</c:if> 
			<c:if test="${!empty maga.mfile}">
					<img src="images/${maga.mfile}"
						height="100" width="100" />
			</c:if></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${maga.content}</pre></td>
		</tr>
	</table>

	<input type="button" value="목록" class="input_button"
		onclick="location='maga_list?page=${page}'" />



</body>
</html>