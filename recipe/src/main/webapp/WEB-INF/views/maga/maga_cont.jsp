<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$('#slist').load('slist?maga_num=${maga.maga_num}');
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
					"maga_num" : $("#maga_num").val(),
					"id" : $("#id").val(),
					"re_content" : $("#re_content").val(),
					"ref_lev" : $("#ref_lev").val()
			}
			$.ajax({
				type : 'post',
				url : 'sInsert',
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
	<form>
	<table border=1 align=center>
		<tr>
			<td>${maga.subject}</td>
			<td><fmt:formatDate value="${maga.mdate}" pattern="YYYY.MM.dd HH:mm	"/> </td>
		</tr>

		<%-- <tr>
			<th>프로필사진</th>
			<td><c:if test="${empty maga.mfile}">&nbsp;</c:if> 
			<c:if test="${!empty maga.mfile}">
					<img src="./upload/${maga.mfile}" height="100" width="100" />
			</c:if></td>
		</tr> --%>	
		<tr>
			<td>관리자</td><td>조회 : ${maga.readcount}&nbsp;&nbsp;&nbsp;&nbsp;추천 : ${maga.recom}</td>
		</tr>
		<%-- <tr>
			<td colspan=2><img src="./upload/${maga.mfile}" height="200px" width="200px"/><br>
							<textarea rows=20 cols=80 >${maga.content}</textarea></td>
		</tr> --%>
		<tr>
			<td><div contentEditable="true">
			<img src="./upload/${maga.mfile}" height="200px" width="200px"/><br>
				${maga.content }
			</div></td>
		</tr>
	</table>
	</form>

	<div align=right>
	<input type="button" value="수정" class="input_button"
		onclick=""/>
	<input type="button" value="삭제" class="input_button"
		onclick="maga_del_config(${maga.maga_num},${page})"/>
	<input type="button" value="목록" class="input_button"
		onclick="location='maga_list?page=${page}'" /><br>
	</div>
		
	<div align=center>
	<input type="button" value="추천" class="recom_button"
		onclick="recom(${maga.maga_num},${page})"/>
		추천수 : ${maga.recom}
	</div><br>
		
	<form name="frm" id="frm" align="center">
		<input type="hidden" name="id" id="id" value="${sessionScope.id}">
		<input type="hidden" name="ref_lev" id="ref_lev" value="0">
		<input type="hidden" name="maga_num" id="maga_num" value="${maga.maga_num}"> 댓글 :
		<textarea rows="3" cols="50" name="re_content" id="re_content"></textarea>
		<input type="button" value="확인" id="repInsert">
	</form>
	<div id="slist"></div>

</body>
</html>