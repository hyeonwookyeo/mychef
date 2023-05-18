<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>

<%@include file="../include/a_header.jsp"%>


<body>

		

<form method=post action="boardwrite" enctype="multipart/form-data">
<table border=1 width=400 align=center>
	<caption>글작성</caption>
<!--  	<tr><th>작성자명</th>
		<td><input type=text name="writer" required="required"></td>
	</tr> 
 	<tr><th>비밀번호</th>
		<td><input type=password name="pwd" required="required"></td>
	</tr>  -->
	<tr><th>제목</th>
		<td><input type=text name="subject" required="required"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols=40 rows=5 name="content" required="required"></textarea></td>
	</tr>
			<tr>
					<th>파일</th>
					<td><input type="file" name="aFile1"></td>
				</tr> 
				
<!-- <form id="form1" action="/spring/upload/upload.do" method="post" enctype="multipart/form-data"> -->
<!-- <input type="file" name="file"> 
<input type="submit" value="업로드"> -->
<!-- </form> -->

		
		
			
	
	<tr><td colspan=2 align=center>
			<input type=submit value="글작성">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>

</body>
</html>


<%@include file="../include/a_footer.jsp"%>
