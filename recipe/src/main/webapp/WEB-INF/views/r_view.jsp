<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

$(document).ready(function() {
    $('#listRe').load('r_listRe?pageNum='1'&rnum=${board.rnum}');
});

function check(){
	var text = "정말로 삭제하시겠습니까?";
	if(confirm(text)){
		$.ajax({
		    type: 'POST',
		    url: '${path }/r_delete/pageNum/${pageNum}/rnum/${board.rnum}',
		    success: function(response) {
		    	if(response == 1){
					  alert("글이 삭제되었습니다");
					  location.href="r_listForm?pageNum=${pageNum}"
				  }else{
					  alert("비밀번호가 틀립니다")
				  } 
		    }, 
		});
	}
}



</script>
</head>
<body>
	<div class="container" align="center">
		<h1>${board.subject }</h1>
		<div>
			<image src=""></image>${board.thumbnail }
		</div>
		<div>카테고리 ${board.category }</div>
		<div>${board.id }닉사진 조회수 ${board.readcount }</div>
		<div>${board.description }</div>

		<table>
			<c:forEach var="item1" items="${map1 }">
				<tr>
					<td>${item1.key }- ${item1.value }</td>
				</tr>
			</c:forEach>
			<c:forEach var="item2" items="${map2 }">
				<tr>
					<td>${item2.key }- ${item2.value }</td>
				</tr>
			</c:forEach>


		</table>

		<div>추천수${board.recom }</div>
		<br>


		<c:if test="${!empty id and id == board.id}">
			<div align="center">
				<a href="r_updateForm?pageNum=${pageNum }&rnum=${board.rnum }">수정</a>
				<button type="button" onClick="check()">삭제</button>
			</div>
		</c:if>


		<c:if test="${!empty id}">
			<div>
				<form name="frm" method="post" enctype="multipart/form-data" action="r_insertRe">
					<input type="hidden" name=rnum value="${board.rnum }"> <input
						type="hidden" name=id value="${id }"> <input type="file"
						name="re_rfile1" multiple> 댓글 :
					<textarea rows=3 cols=30 name="re_content"></textarea>
					<input type="submit" id="repl_insert">
				</form>
			</div>
		</c:if>
			<div id="listRe"></div>
			
			
	</div>

</body>
</html>