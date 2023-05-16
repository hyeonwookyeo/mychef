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
	});
	// 수정 -> 확인
	function up(id){
		var re_content = $('#tt_'+id).val();
		var formData = "magare_num="+id+'&re_content='+re_content+"&maga_num=${maga.maga_num}";
		$.post('repUpdate',formData,function(data){
			$('#slist').html(data);
		});
	}

	// 수정 -> 취소
	function lst(){
		$('#slist').load('slist?maga_num=${maga.maga_num}');
	}
	// 댓글 삭제
 	function del(maga_num,magare_num) {
		var formData="maga_num="+maga_num+"&magare_num="+magare_num;
		$.post("repDelete",formData, function(data) {
			alert('댓글이 삭제 되었습니다.');
			$('#slist').html(data);
		});
	}
</script>
</head>
<body>
	<div align=center>
		<table border=1>
			<c:forEach var="rb" items="${slist}">
				<tr>
					<td>${rb.id}${rb.re_date}</td>
 					<c:if test="${rb.id == sessionScope.id}">			
 						<td id="btn_${rb.magare_num}">
 						<input type="button" value="수정" class="edit1" id="${rb.magare_num}">
						<input type="button" value="삭제" id="del_re"
								onclick="del(${rb.maga_num},${rb.magare_num})"></td>
					</c:if>
					
				</tr>
				<tr>
					<td colspan=2 id="td_${rb.magare_num}">${rb.re_content}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>