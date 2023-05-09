<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시판 글쓰기</h2>
		<form action="r_insert" method="post" enctype="multipart/form-data">
			<%--
			<input type="hidden" name="pageNum" value="${pageNum}"> --%>
			<table border=1>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td><input type="file" name="thumbnail"></td>
				</tr>
				<tr>
					<td>재료</td>
					<td><input type="text" name="ingre"></td>
				</tr>
				<tr>
					<td>조리사진</td>
					<td><input type="file" name="rfile"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="30" name="content"	required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>