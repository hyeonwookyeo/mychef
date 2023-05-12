<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('#slist').load('${path}/slist/num/${maga_num}')
//		$('#list').load('${path}/list/pageNum/${pageNum}');
		$('#repInsert').click(function() {
			if (!frm.replytext.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.replytext.focus();
				return false;
			}
			var frmData = $('form').serialize();
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;				  
			$.post('${path}/sInsert', frmData, function(data) {
				$('#slist').html(data);
				frm.replytext.value = '';
			});
		});
	});
</script>
</head>

<script>
	
	function maga_del_config(maga_num,page){
	 	var result = confirm("정말로 삭제 하시겠습니까?");
	 	if(result){
	 		location.href="maga_del_ok?maga_num="+maga_num+"&page="+page;	
	 	}
	}
	
	function recom(maga_num,page){
		location.href="maga_recom?maga_num="+maga_num+"&page="+page;
	}
	
	
</script>
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
					<img src="./upload/${maga.mfile}" height="100" width="100" />
			</c:if></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${maga.content}</pre></td>
		</tr>
	</table>
	
	${id }
	
	<input type="button" value="추천" class="recom_button"
		onclick="recom(${maga.maga_num},${page})"/>
	<div id="recomm">추천수</div><br>
	<div>${maga.recom}</div>

	<br><br>
	<input type="button" value="수정" class="input_button"
		onclick=""/>
	<input type="button" value="삭제" class="input_button"
		onclick="maga_del_config(${maga.maga_num},${page})"/>
	<input type="button" value="목록" class="input_button"
		onclick="location='maga_list?page=${page}'" />
		
		
	<form name="frm" id="frm">
		<input type="hidden" name="replyer" value="${board.writer}">
		<input type="hidden" name="bno" value="${board.num}"> 댓글 :
		<textarea rows="3" cols="50" name="replytext"></textarea>
		<input type="button" value="확인" id="repInsert">
	</form>
		<div id="slist"></div>



</body>
</html>