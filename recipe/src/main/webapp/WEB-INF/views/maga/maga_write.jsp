<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 글 작성</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/maga.js"></script>
</head>
<body>

	<form method="post" action="<%=request.getContextPath() %>/maga_write_ok" enctype="multipart/form-data">
	<table>
		<tr>
			<td>작성자 : </td>
			<td>관리자</td>
		</tr>
		<tr>
			<td>제목 : </td>
			<td>
				<input name="subject" id="subject" size=20 class="input_box">
			</td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td>
				<textarea name="content" id="content" row="8" cols="50" class="input_box" ></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" id="magafile" name="magafile">
			</td>
		</tr>
	</table>
	<input type="submit" value="등록" onclick="return sub(
			)">
	<input type="reset" value="리셋">
	</form>
	

</body>
</html>