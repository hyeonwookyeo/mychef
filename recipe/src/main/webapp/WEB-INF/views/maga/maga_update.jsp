<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 글 수정</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/maga.js"></script>
<script type="text/javascript">
	$(function() {
		$('#imgdel').click(function() {
			var result = confirm("정말로 삭제 하시겠습니까?");
			if (result){		  
				var ffData = {
					"maga_num" : ${maga.maga_num},
				}
			$.ajax({
				type : 'post',
				url : 'idelete',
				data : ffData,
				success : function(data){
					var newtext='<font color="blue">삭제완료!</font>';
		      		$("#img").text('');
		      		$("#img").show();
		      		$("#img").append(newtext);
				}
			});
			}
		});
	});
</script>
</head>
</head>
<body>
	<%@ include file="/resources/header/topview.jsp"%>
	<form method="post"
		action="<%=request.getContextPath()%>/maga_update_ok"
		enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page}"> <input
			type="hidden" name="maga_num" value="${maga.maga_num}">
		<table>
			<tr>
				<td>작성자 :</td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input name="subject" id="subject" size=20
					class="input_box" value="${maga.subject}"></td>
			</tr>
			<tr>
				<td>내용 :</td>
				<td><textarea name="content" id="content" row="8" cols="50"
						class="input_box">${maga.content}</textarea></td>
			</tr>
			<tr>
				<td><input type="file" id="magafile" name="magafile"></td>
			</tr>
		</table>
		<input type="submit" value="수정" onclick="return sub()"> <input
			type="reset" value="리셋"><br>
		<br> 입력 되어있는 사진 :
		<div id="img">
			<c:if test="${maga.mfile != null }">
				<img src="./upload/${maga.mfile}" height="100px" width="100px" />
				<input type="button" id="imgdel" value="삭제">
			</c:if>
			<c:if test="${maga.mfile == null }">
			없어용 "@
		</c:if>

		</div>

	</form>


</body>
</html>