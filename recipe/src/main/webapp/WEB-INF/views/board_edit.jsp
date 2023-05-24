<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시글 수정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('#imgdel').click(function() {
			var result = confirm("정말로 삭제 하시겠습니까?");
			if (result){		  
				var ffData = {
					"comm_num" : ${board.comm_num},
				};
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
				<input type="file" id="commfile" name="commfile" >
				
			</td>
		</tr>
	</table>
	<input type="submit" value="등록"/>
	<input type="reset" value="리셋"/> <!-- class="input_button" onclick="$('#board_name').focus();" --> 
	<br> 입력 되어있는 사진 :
		<div id="img">
			<c:if test="${board.commfile != null }">
				<img src="./upload/${board.commfile}" height="100px" width="100px" />
				<input type="button" id="imgdel" value="삭제">
			</c:if>
			<c:if test="${board.commfile == null }">
			없어용 "@
		</c:if>

		</div>
	</form>
	

</body>
</html>