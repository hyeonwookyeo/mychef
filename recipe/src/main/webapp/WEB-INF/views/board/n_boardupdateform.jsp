<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../include/a_header.jsp"%>
<br>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>

	<form method=post action="boardupdate" enctype="multipart/form-data">
		<input type="hidden" name="ann_Num" value="${board.ann_Num }">
		<input type="hidden" name="page" value="${page }">

		<table border=1 width=400 align=center>
			<caption>글수정</caption>

			<tr>
				<th>제목</th>
				<td><input type=text name="subject" required="required"
					value="${board.subject }"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="40" name="content"
						required="required">${board.content }</textarea></td>
			</tr>

			<tr>
					<td>첨부파일</td>
					<td>
						<c:if test="${!empty board.aFile }">
							<img src="./upload/${board.aFile }" width="200" height="100">
						</c:if>
					</td>
				</tr>


			<td colspan="2" align="center"><input type="submit" value="글수정">
				<input type="reset" value="취소"></td>
			</tr>

		</table>
	</form>

</body>
</html>


<%@include file="../include/a_footer.jsp"%>















