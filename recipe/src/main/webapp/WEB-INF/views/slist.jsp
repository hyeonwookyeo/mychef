<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			var txt = $('#td_'+id).text();
			$('#td_'+id).html("<textarea row='3' cols='30' id='tt_"+id+"'>"+txt+"</textarea>");
			$('#btn_'+id).html(
				"<input type='button' value='확인' onclick='up("+id+")'>"+
				"<input type='button' value='취소' onclick='lst()'>");
		});
		
		$('.edit2').click(function() {
			var id = $(this).attr('id');	// magare_num
			$('#div_'+id).attr("style","display=block");
		
		});
		
	});
	
	// 답글 삽입
	function dapup(commre_num){
		var re_content = $('#divtd_'+commre_num).val();
		var id = $("#id").val();
		var formData = "comm_num=${board.comm_num}&id="+id+"&re_content="+re_content+"&commre_num="+commre_num+"&ref="+commre_num+"&ref_lev=1"
		$.post('sInsert',formData,function(data){
			$('#slist').html(data); 
		});
	}
	
	// 수정 -> 확인
	function up(id){
		var re_content = $('#tt_'+id).val();
		var formData = "commre_num="+id+"&re_content="+re_content+"&comm_num=${board.comm_num}";
/* 		"magare_num="+id+"&re_content="+re_content+"&maga_num=${maga.maga_num}&ref_lev=0"; */	

		$.post('repUpdate',formData,function(data){
			$('#slist').html(data);
		});
	}


	// 수정 -> 취소
	function lst(){
		$('#slist').load('slist?comm_num=${board.comm_num}');
	}
	
	// 댓글 삭제
 	function del(comm_num,commre_num) {
		var formData="comm_num="+comm_num+"&commre_num="+commre_num+"&ref_lev";
		$.post("repDelete",formData, function(data) {
			alert('댓글이 삭제 되었습니다.');
			$('#slist').html(data);
		});
	}
</script>
</head>
<body>
	<div align=center>
		<table>
			<c:forEach var="rb" items="${slist}">
				<tr>
					<td>${rb.id}날짜</td>		<!-- ${rb.re_date} -->
					<c:if test="${rb.ref_lev == 0}">
 						<td><input type="button" value="답글" class="edit2" id="${rb.commre_num}"></td>
					</c:if>
 					<c:if test="${rb.id == sessionScope.id}">				
 						<td id="btn_${rb.commre_num}">
 						<input type="button" value="수정" class="edit1" id="${rb.commre_num}">
						<input type="button" value="삭제" id="del_re"
								onclick="del(${rb.comm_num},${rb.commre_num})"></td>
					</c:if>
				</tr>
				<tr>
					<td colspan=2 align=center id="td_${rb.commre_num}">${rb.re_content}</td>
				</tr>
				<tr>
					<td><div id="div_${rb.commre_num}" style="display:none">
						<textarea row='3' cols='30' id="divtd_${rb.commre_num }"></textarea>
						<input type="hidden" name="id" id="id" value="${sessionScope.id}">
						<input type="button" value="확인" onclick="dapup(${rb.commre_num})">
						<input type="button" value="취소" onclick="lst()">
					</div></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>