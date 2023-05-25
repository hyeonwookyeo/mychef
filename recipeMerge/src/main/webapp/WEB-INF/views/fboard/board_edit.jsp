<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

	
	<form method="post" action="<%=request.getContextPath() %>/board_up_ok"  enctype="multipart/form-data">
	 <input type="hidden" name="comm_num" value="${board.comm_num}" />
 	 <input type="hidden" name="page" value="${page}" />
  
	<table>
		<tr>
			<td>작성자 : 
			    관리자
     		</td>
		</tr>
		<tr>
			<td>제목 : </td>
			<td>
				<input name="subject" id="subject" size=20 class="input_box" value="${board.subject}">
			</td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td>
				<textarea name="content" id="content" row="8" cols="50" class="input_box" >${board.content}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" id="commfile2" name="commfile2" value="${board.commfile}">
				<img src="./upload/${board.commfile}" height="200px" width="200px"/><br>
			</td>
		</tr>
	</table>
	<input type="submit" value="등록"/>
	<input type="reset" value="리셋"/> <!-- class="input_button" onclick="$('#board_name').focus();" --> 
	</form>
	

</body>
</html>