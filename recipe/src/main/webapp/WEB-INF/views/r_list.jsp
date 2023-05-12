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
			<c:if test="${empty list}">
				<div class="col-sm-12 text-bg-secondary">
					<b>데이터가 없습니다</b>
				</div>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="board" items="${list }">
					<div class="col-sm-3">
						<div>
							<div class="card" style="width: 400px">
								<a href="r_view?rnum=${board.rnum }&pageNum=${pp.currentPage}">
								<img class="card-img-top" src="./t_images/${board.thumbnail}"></a>
								<div class="card-body">
									<h4 class="card-title">${board.subject }</h4>
									<p class="card-text">${board.id }</p>
									<p class="card-text">${board.readcount }</p>
									<p class="card-text">${board.recom }</p>
									<p class="card-text">${board.rdate }</p>
								</div>
							</div>
						</div>

					</div>
				</c:forEach>
			</c:if>


		</div>
		<table class="table table-striped" border=1>
			<!-- 			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr> -->
			<c:if test="${empty list}">
				<tr align="center">
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:set var="no" value="${number }"></c:set>
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${no}</td>
						<c:if test="${board.state =='n' }">
							<td colspan="4">삭제된 데이터 입니다</td>
						</c:if>
						<c:if test="${board.state !='n' }">
							<td><a
								href="r_view?rnum=${board.rnum }&pageNum=${pp.currentPage}"
								class="btn btn-default"> ${board.subject}</a></td>
						<%-- 	<td>${board.writer}</td>
							<td>${board.reg_date}</td>
							<td>${board.readcount}</td> --%>
						</c:if>
					</tr>
					<c:set var="no" value="${no - 1}"></c:set>
				</c:forEach>
			</c:if>
		</table>
		<form action="list?pageNum=1">
			<select name="search">
				<option value="subject"
					<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
				<option value="content"
					<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
				<option value="writer"
					<c:if test="${search=='writer'}">selected="selected" </c:if>>작성자</option>
				<option value="subcon"
					<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> <input type="text" name="keyword"> <input type="submit"
				value="확인">
		</form>
		<ul class="pagination">
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a
						href="${path }/list/pageNum/${pp.startPage - 1}?search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/list/pageNum/${i}?search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a
						href="${path }/list/pageNum/${pp.endPage + 1}?search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="${path }/list/pageNum/${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/list/pageNum/${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/list/pageNum/${pp.endPage + 1}">다음</a></li>
				</c:if>
			</c:if>
		</ul>

		<c:if test="${empty sessionScope.id }">
			<div align="center">
				<a href="r_insertForm" class="btn btn-info">글 입력</a>
			</div>
		</c:if>

	</div>
</body>
</html>