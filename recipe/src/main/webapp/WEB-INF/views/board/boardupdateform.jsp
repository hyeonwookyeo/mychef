<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="../include/header.jsp" %> <br>	    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>

<form method=post action="boardupdate">
<input type="hidden" name="ann_Num" value="${board.ann_Num }">
<input type="hidden" name="page" value="${page }">

<table border=1 width=400 align=center>
<caption>글수정</caption>

<tr>
<th>제목</th>
<td>
<input type=text name="subject" required="required" value="${board.subject }">
</td>
</tr>

<tr>
<th>내용</th>
<td><textarea rows="5" cols="40" name="content" required="required">${board.content }</textarea></td>
</tr>

<tr>
					<th>파일</th>
					<td><input type="file" id = "profile" name="boardwrite" /></td>
				</tr>

<tr>
<td colspan="2" align="center">
  <input type="submit" value="글수정">
  <input type="reset" value="취소">
</td>
</tr>

</table>
</form>

</body>
</html>


<%@include file="../include/footer.jsp" %>















