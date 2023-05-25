<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	// 수정 버튼
	$(function() {
		$('.edit1').click(function() {
			var id = $(this).attr('id');	// magare_num
			var txt = $.trim($('#td_'+id).text());
			$('#td_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt+"</textarea>");
			$('#tt_'+id).focus();	
			$('#btn_'+id).html(
				"<input type='button' value='확인' onclick='up("+id+")'>"+
				"<input type='button' value='취소' onclick='lst()'>");
		});
		
		$('.edit2').click(function() {
			var id = $(this).attr('id');	// magare_num
			$('#div_'+id).attr("style","display=block");
			$('#divtd_'+id).focus();
		});
		
	});
	
	// 답글 삽입
	function dapup(re_num){
		if($('#divtd_'+re_num).val().trim() == ""){
			alert("답글을 입력해 주세요.");
			$('#divtd_'+re_num).focus();
			return false;
		}
		var re_content = $('#divtd_'+re_num).val();
		var id = $("#id").val();
		var formData = "maga_num=${maga.maga_num}&id="+id+"&re_content="+re_content+"&magare_num="+re_num+"&ref="+re_num+"&ref_lev=1"
		$.post('sInsert',formData,function(data){
			$('#slist').html(data); 
		});
	}

	// 수정 -> 확인
	function up(id){
		if($('#tt_'+id).val().trim() == ""){
			alert("수정할 문구를 입력해주세요.");
			$('#tt_'+id).focus();
			return false;
		}
		var re_content = $('#tt_'+id).val();
		var formData = "magare_num="+id+"&re_content="+re_content+"&maga_num=${maga.maga_num}";
/* 		"magare_num="+id+"&re_content="+re_content+"&maga_num=${maga.maga_num}&ref_lev=0"; */	

		$.post('repUpdate',formData,function(data){
			$('#slist').html(data);
		});
	}

	// 수정 -> 취소
	function lst(){
		$('#slist').load('slist?maga_num=${maga.maga_num}');
	}
	// 댓글 삭제
 	function del(maga_num,magare_num,ref_lev) {
		var formData="maga_num="+maga_num+"&magare_num="+magare_num+"&ref_lev="+ref_lev;
		$.post("repDelete",formData, function(data) {
			alert('댓글이 삭제 되었습니다.');
			$('#slist').html(data);
		});
	}
</script>
</head>
<body>
	<div id="slist" align=center>
		<table border=1>
			<c:forEach var="rb" items="${slist}">
				<tr>
					<td>
						<c:if test="${rb.ref_lev == 1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<img src="./upload/${rb.profile}" height="20px" width="20px"/></td>
					<td>${rb.id} ${rb.re_date}</td>		<!-- ${rb.re_date} -->
					
 						<td id="btn_${rb.magare_num}">
					<c:if test="${rb.ref_lev == 0}">
 						<input type="button" value="답글" class="edit2" id="${rb.magare_num}">
					</c:if>
 					<c:if test="${rb.id == sessionScope.id}">				
 						<input type="button" value="수정" class="edit1" id="${rb.magare_num}">
 						<input type="button" value="삭제" id="del_re" onclick="del(${rb.maga_num},${rb.magare_num},${rb.ref_lev})">
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center id="td_${rb.magare_num}">
					<c:if test="${rb.ref_lev == 1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						${rb.re_content}</td>
				</tr>
				<tr>
					<td><div id="div_${rb.magare_num}" style="display:none">
						<textarea rows="3" cols="30" id="divtd_${rb.magare_num}"></textarea>
						<input type="hidden" name="id" id="id" value="${sessionScope.id}">
						<input type="button" value="확인" onclick="dapup(${rb.magare_num})">
						<input type="button" value="취소" onclick="lst()">
					</div></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>