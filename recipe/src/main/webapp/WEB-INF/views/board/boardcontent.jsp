<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#008000),
		to(#2ca38f));
	background: -webkit-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
	background: -moz-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
	background: -o-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
	background: linear-gradient(to top right, #008000 0%, #2ca38f 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	margin: 0 auto;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js"></script>


<script>
   	function del(num, page){
   		var result = confirm("삭제 하시겠습니까?");
   		if(result){
   			location.href="boarddelete?ann_Num="+num+"&page="+page
   		}   		
   	} 
   
   </script>

</head>


<%@include file="../include/header.jsp"%>
<br>


<body>
	<div class="input-form col-md-12 mx-auto">
		<!--  <div id="bbswrite_wrap"> -->

		<!--   <table id="bbswrite_t"> -->

		<form name="f" method="post" action="" onsubmit="return check()"
			enctype="multipart/form-data">


			<table border=1 width=400 align="center">
				<caption>상세 페이지</caption>
				<tr>
					<td>날짜</td>
					<td><fmt:formatDate value="${board.aDate }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${board.subject }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre>${board.content }</pre> ${content }</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<c:if test="${!empty board.aFile }">
							<img src="./upload/${board.aFile }" width="200" height="100">
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="button" value="목록"
						onclick="location.href='boardlist?page=${page}'"> <input
						type="button" value="수정"
						onclick="location.href='boardupdateform?ann_Num=${board.ann_Num }&page=${page}'">

						<input type="button" value="삭제"
						onclick="del(${board.ann_Num}, ${page})"></td>
				</tr>
			</table>
</body>
</html>

<%@include file="../include/footer.jsp"%>

