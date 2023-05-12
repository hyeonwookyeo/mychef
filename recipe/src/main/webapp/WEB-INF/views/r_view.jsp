<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(function(){
	$('#listRe').load("r_listRe?rnum='${rnum}'")
});


</script>
</head>
<body>
<div class="container" align="center">
	<h1>${board.subject }</h1>
	<div><image src="">${board.thumbnail }</div>
	<div>카테고리 ${board.category }</div>
	<div>${board.id } 닉사진  조회수 ${board.readcount }</div>
	<div>${board.description }</div>
	
	<table>
<%-- 	<c:forEach var="item" items="${board }">
		<tr>
			<td>${item.ingre }</td>
			<td>${item.capacity }</td>
		</tr>
	</c:forEach> --%>
	<c:forEach var="item1" items="${map1 }">
		<tr>
			<td>${item1.key } - ${item1.value }</td>
		</tr>
	</c:forEach>
	<c:forEach var="item2" items="${map2 }">
		<tr>
			<td>${item2.key } - ${item2.value }</td>
		</tr>
	</c:forEach> 
	
	
	</table>
	
	<div>추천수${board.recom }</div>
	
	<a href=>수정</a>
	<a href=>삭제</a>
	
	<div><form name="frm">
		댓글 : <textarea row=3 cols=30 name="repl_content"></textarea>
		<button type="button" id="repl_insert">확인</button>
	</form></div>
	<div id="listRe"></div>
	
</div>



</body>
</html>