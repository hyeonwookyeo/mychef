<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시판 목록</h2>
		<div class="row">
			<div>
				${total }개의 리뷰가 있습니다
			</div>
			<c:if test="${empty rlist}">
				<div>
					<b>리뷰를 새로 달아주세요</b>
				</div>
			</c:if>
			<c:if test="${not empty rlist}">
				<c:forEach var="reboard" items="${rlist }">
					<div>
						<span>섬네일</span>닉네임
						<div>${reboard.re_rfile }</div>
						<div>${reboard.content }</div>
						<div>${reboard.re_date }</div>
					</div>
				</c:forEach>
			</c:if>


		</div>
		<ul class="pagination">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<li><a href="r_listRe?pageNum=${pp.startPage - 1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li><c:if test="${pp.currentPage==i}">class="active"</c:if> <a
					href="r_listRe?pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<li><a href="r_listRe?pageNum=${pp.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>