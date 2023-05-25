<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
<%@ include file="../include/header.jsp"%>
	<div class="container">
			<div style="position:absolute; left:400px; top:100px; font-size:40px;">
				${maga.subject}</div><br>
				
			<div style="position:absolute; left:1100px; top:100px; font-size:14px;">
				<fmt:formatDate value="${maga.mdate}" pattern="YYYY.MM.dd HH:mm"/></div><br>
			<div style="position:absolute; left:1100px; top:120px; font-size:14px;">
				조회 : ${maga.readcount}&nbsp;&nbsp;&nbsp;&nbsp;추천 : ${maga.recom}</div><br>
			
			
			<div contentEditable="false" style="border:1px solid; position:absolute; left:50%;
				transform:translateX(-50%); top:300px; width: 700px; flex:1;">
			<c:if test="${maga.mfile != null }">
			<img src="./upload/${maga.mfile}" height="200px" width="200px"/><br>
			</c:if>
				${maga.content}
			</div>
	</div>

	<div id="btn" style="position:absolute; left:50%; transform:translateX(-50%); top:400px;">
	<input type="button" value="수정" class="input_button"
		onclick="location='maga_update?maga_num=${maga.maga_num}&page=${page}'"/>
	<input type="button" value="삭제" class="input_button"
		onclick="maga_del_config(${maga.maga_num},${page})"/>
	<input type="button" value="목록" class="input_button"
		onclick="location='maga_list?page=${page}'" /><br>
	</div>
		
	<div style="position:absolute; left:50%; transform:translateX(-50%); top:500px;">
	<input type="button" value="추천" class="recom_button"
		onclick="recom(${maga.maga_num},${page})"/>
		추천수 : ${maga.recom}
	</div><br>
		
	<form name="frm" id="frm" style="position:absolute; left:50%; transform:translateX(-50%); top:600px;">
		<input type="hidden" name="id" id="id" value="${sessionScope.id}">
		<input type="hidden" name="ref_lev" id="ref_lev" value="0">
		<input type="hidden" name="maga_num" id="maga_num" value="${maga.maga_num}"> 댓글 :
		<textarea rows="3" cols="50" name="re_content" id="re_content"></textarea>
		<input type="button" value="확인" id="repInsert">
	</form>
	<div id="slist" style="position:absolute; left:50%; transform:translateX(-50%); top:700px;
			 padding-bottom : 50px"></div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>