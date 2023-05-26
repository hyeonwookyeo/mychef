<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/set.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>

<link href="css/all-style.css" rel="stylesheet">

</head>
<body>

	<!-- (공통) 헤더부분 -->
	<%@ include file="../include/header.jsp"%>

	<!-- 매거진 리스트 -->
	<h2 align="center">자유게시판 목록</h2>
	글 개수 : ${listcount}

	<table class="table table-striped" border=1 align=center>
		<thead>
			<tr>
				<td>게시글 번호</td>
				<td>게시글 제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>

		<tbody>
			<!-- 리스트 출력 -->
			<c:if test="${empty boardlist}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>

			<c:if test="${not empty boardlist}">
				<c:set var="num" value="${listcount-(page-1)*10}" />
				<!-- 반복문 시작 -->
				<c:forEach var="b" items="${boardlist}">
					<tr>
						<td>
							<!-- 번호 출력부분 --> <c:out value="${num}" /> <c:set var="num"
								value="${num-1}" />
						</td>

						<td>
							<!-- 제목 출력 부분 --> <a
							href="free_board_cont?comm_num=${b.comm_num}&page=${page}&state=cont">
								${b.subject}</a>
						</td>
						<td>${b.id}</td>

						<td><c:set var="today"
								value="<%=new Timestamp(System.currentTimeMillis())%>" /> <c:set
								var="today" value="${fn:substring(today, 0, 10) }" /> <c:set
								var="dbtoday" value="${fn:substring(b.cdate, 0, 10) }" /> <c:if
								test="${today == dbtoday}">
								<fmt:formatDate value="${b.cdate}" pattern="HH:mm" />
							</c:if> <c:if test="${today != dbtoday}">
								<fmt:formatDate value="${b.cdate}" pattern="yyyy.MM.dd" />
							</c:if></td>
						<td>${b.readcount}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>


	<!-- 검색창 -->
	<form action="board_list" align=center>
		<input type="hidden" name="pageNum" value="1"> <select
			name="search">
			<option value="subject"
				<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
			<option value="content"
				<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
			<option value="subcon"
				<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
		</select> <input type="text" name="keyword"> <input type="submit"
			value="확인">
	</form>


	<!-- 페이징 번호 -->


	<div id="bbslist_paging" class=text-center>
		<c:if test="${not empty keyword }">

			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page <=1 }">
						<li class="page-item active"><a
							href="#"
							class="page-link">이전</a></li>
					</c:if>
					<c:if test="${page > 1 }">
						<li class="page-item"><a
							href="board_list?page=${page-1}&search=${search}&keyword=${keyword}"
							class="page-link">이전</a></li>
					</c:if>

					<c:forEach var="a" begin="${startPage}" end="${endPage}">
						<c:if test="${a == page }">
							<li class="page-item active"><a
								href="#"
								class="page-link">이전</a></li>
						</c:if>
						<c:if test="${a != page }">
							<li class="page-item"><a
								href="board_list?page=${a}&search=${search}&keyword=${keyword}"
								class="page-link">${a}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${page >= maxpage }">
						<li class="page-item active"><a
							href="#"
							class="page-link">다음</a></li>
					</c:if>
					<c:if test="${page < maxpage }">
						<li class="page-item"><a
							href="board_list?page=${page+1}&search=${search}&keyword=${keyword}"
							class="page-link">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>

		<c:if test="${empty keyword }">

			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page <=1 }">
						<li class="page-item active"><a
							href="#"
							class="page-link">이전</a></li>
					</c:if>

					<c:if test="${page > 1 }">
						<li class="page-item"><a href="board_list?page=${page-1}"
							class="page-link">이전</a></li>
					</c:if>

					<c:forEach var="a" begin="${startPage}" end="${endPage}">
						<c:if test="${a == page }">
							<li class="page-item active"><a
								href="#"
								class="page-link">${a} </a></li>
						</c:if>
						<c:if test="${a != page }">
							<li class="page-item"><a href="board_list?page=${a}"
								class="page-link" class="page-link">${a}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${page >= maxpage }">
						<li class="page-item active"><a
							href="#"
							class="page-link">다음</a></li>
					</c:if>
					<c:if test="${page < maxpage }">
						<li class="page-item"><a href="board_list?page=${page+1}"
							class="page-link">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
	</div>
	<div id="bbslist_w" align="center">
	<div>
		<input type="button" value="글쓰기" class="input_button"
			style="background-color: aquamarine;"
			onclick="location='free_board_write?page=${page}'">
	</div>
	</div>

</body>
</html>