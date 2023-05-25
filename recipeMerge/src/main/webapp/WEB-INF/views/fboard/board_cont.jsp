<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('#slist').load('free_slist?comm_num=${board.comm_num}');
		$('#repInsert').click(function() {
			if (!frm.re_content.value) {
				alert('댓글 입력 후에 클릭하시오');
				frm.re_content.focus();
				return false;
			}			  
			var frmData = $('#frm').serialize();
//			var id = session.getAttribute("id");
//			var maga_num = $("#maga_num").val();
//			var re_content = $("#re_content").val();
			var ffData = {
					"comm_num" : $("#comm_num").val(),
					"id" : $("#id").val(),
					"re_content" : $("#re_content").val(),
					"ref_lev" : $("#ref_lev").val()
			}
			$.ajax({
				type : 'post',
				url : 'free_sInsert',
				data : frmData,
				success : function(data){
					$('#slist').html(data);
					$("#re_content").val("");
				}
			});
		});
	});
</script>
</head>

<script>
	
	function board_del_config(comm_num,page){
	 	var result = confirm("정말로 삭제 하시겠습니까?");
	 	if(result){
	 		location.href="board_del_ok?comm_num="+comm_num+"&page="+page;	
	 	}
	}
	
	
</script>
<script>
	
	function board_up_config(comm_num,page){
	 	var result = confirm("정말로 수정 하시겠습니까?");
	 	if(result){
	 		location.href="board_up_form?comm_num="+comm_num+"&page="+page;	
	 	}
	}
	
	
</script>

<body>
	
	<!-- (공통) 헤더부분 -->
	<%@ include file="../include/header.jsp"%>
	
	<form>
	<table border=1 align=center>
		<tr>
			<td>${board.subject}</td>
			<td><fmt:formatDate value="${board.cdate}" pattern="YYYY.MM.dd HH:mm	"/> </td>
		</tr>

		<%-- <tr>
			<th>프로필사진</th>
			<td><c:if test="${empty maga.mfile}">&nbsp;</c:if> 
			<c:if test="${!empty maga.mfile}">
					<img src="./upload/${maga.mfile}" height="100" width="100" />
			</c:if></td>
		</tr> --%>	
		<tr>
			<td>아이디 :${board.id }</td>
			<td>조회 : ${board.readcount}&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<%-- <tr>
			<td colspan=2><img src="./upload/${maga.mfile}" height="200px" width="200px"/><br>
							<textarea rows=20 cols=80 >${maga.content}</textarea></td>
		</tr> --%>
		<tr>
			<td><div contentEditable="true">
			<img src="./upload/${board.commfile}" height="200px" width="200px"/><br>
				${board.content }
			</div></td>
		</tr>
	</table>
	</form>

	<div align=right>
	<input type="button" value="수정" class="input_button"
		onclick="board_up_config(${board.comm_num},${page})"/>
	<input type="button" value="삭제" class="input_button"
		onclick="board_del_config(${board.comm_num},${page})"/>
	<input type="button" value="목록" class="input_button"
		onclick="location='board_list?page=${page}'" /><br>
	</div>
		

		
	<form name="frm" id="frm" align="center">
		<input type="hidden" name="id" id="id" value="${sessionScope.id}">
		<input type="hidden" name="ref_lev" id="ref_lev" value="0">
		<input type="hidden" name="comm_num" id="comm_num" value="${board.comm_num}"> 댓글 :
		<textarea rows="3" cols="50" name="re_content" id="re_content"></textarea>
		<input type="button" value="확인" id="repInsert">
	</form>
	<div id="slist"></div>

</body>
</html>