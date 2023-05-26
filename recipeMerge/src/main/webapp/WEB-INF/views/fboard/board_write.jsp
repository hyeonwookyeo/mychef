<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 글 작성</title>
</head>
<body>

	<!-- (공통) 헤더부분 -->
	<%@ include file="../include/header.jsp"%>
	
	<form method="post" action="<%=request.getContextPath() %>/board_write_ok"  enctype="multipart/form-data">
	<table class="table table-bordered">
		<tr>
			<td>작성자 : </td>
			<td>관리자</td>
		</tr>
		<tr>
			<td>제목 : </td>
			<td>
				<input name="subject" id="subject" size=20 class="input_box" placeholder="제목을 입력하시오.">
			</td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td>
				<textarea name="content" id="content" row="8" cols="50" class="input_box" placeholder="내용을 입력하시오."></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" id="commfile2" name="commfile2" >
			</td>
		</tr>
	</table>
	<input type="submit" value="등록" style="background-color: aquamarine;"/>
	<input type="reset" value="리셋" style="background-color: aquamarine;"/> <!-- class="input_button" onclick="$('#board_name').focus();" --> 
	</form>
	

</body>
</html>