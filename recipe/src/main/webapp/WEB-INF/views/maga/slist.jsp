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
	// 댓글 삭제
	/* $(function() {
		$('#del_re').click(function() {
			var result = confirm("정말로 댓글을 삭제 하시겠습니까?");
			if (result) {
				var magare_num = $("#magare_num").val();
				$.ajax({
					type : 'post',
					url : 'repDelete',
					data : magare_num,
					success : function(data) {
						$('#slist').html(data);
						alert('댓글이 삭제 되었습니다.');
					}
				});
			}
		});
	}); */
	
	function del(rno) {
		$.post("repDelete",rno, function(data) {
			alert('댓글이 삭제 되었습니다.');
			$('#slist').html(data);
		});
	}
</script>
</head>
<body>
	<div align=center>
		<input type="hidden" name="magare_num" id="magare_num"
			value="${magare_num}">
		<table border=1>
			<c:forEach var="rb" items="${slist}">
				<tr>
					<td>${rb.id}${rb.re_date}</td>
					<c:if test="${rb.id == sessionScope.id}">
					<td><input type="button" value="삭제" id="del_re"
						onclick="del(${rb.magare_num})"></td>
					</c:if>
				</tr>
				<tr>
					<td colspan=2>${rb.re_content}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>