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
<title>매거진 목록</title>
</head>
<body>

	<!-- (공통) 헤더부분 -->
	<%@ include file="../include/header.jsp"%>
	
	<!-- 매거진 리스트 -->
	<h2>매거진 목록</h2>
	글 개수 : ${pp.total}

	<table border=1 align=center>
		<tr>
			<td>게시글 번호</td>
			<td>게시글 제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<!-- 리스트 출력 -->
		<c:if test="${empty magalist}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>

		<c:if test="${not empty magalist}">
			<c:set var="num" value="${no}" />

			<c:forEach var="b" items="${magalist}">
				<tr>
					<td><c:out value="${num}" /> <c:set var="num"	
							value="${num-1}" /></td>
					<td><a
						href="maga_cont?maga_num=${b.maga_num}&page=${page}&state=cont">
							${b.subject}</a> [${b.re_cnt}]</td>
					<td>관리자</td>

					<td><c:set var="today"
							value="<%=new Timestamp(System.currentTimeMillis())%>" /> <c:set
							var="today" value="${fn:substring(today, 0, 10) }" /> <c:set
							var="dbtoday" value="${fn:substring(b.mdate, 0, 10) }" /> <c:if
							test="${today == dbtoday}">
							<fmt:formatDate value="${b.mdate}" pattern="HH:mm" />
						</c:if> <c:if test="${today != dbtoday}">
							<fmt:formatDate value="${b.mdate}" pattern="yyyy.MM.dd" />
						</c:if></td>
					<td>${b.readcount}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>


	<!-- 검색창 -->
	<form action="maga_list" align=center>
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
	<div align=center>
		<!-- 검색 했을때 -->
		<c:if test="${not empty keyword}">
			<c:if test="${pp.startPage > pagePerBlk}">
				<a
					href="maga_list?page=${startPage-10}&search=${search}&keyword=${keyword}">이전</a>
			</c:if>

			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}">[${i}]</c:if>
				<c:if test="${pp.currentPage!=i}">
					<a href="maga_list?page=${i}&search=${search}&keyword=${keyword}">[${i}]</a></c:if>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage }">
				<a
					href="maga_list?page=${startPage+1}&search=${search}&keyword=${keyword}">다음</a>
			</c:if>
		</c:if>

		<!-- 검색 안할때 -->
		<c:if test="${empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk}">
				<a href="maga_list?page=${pp.startPage-10}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}">[${i}]</c:if>
				<c:if test="${pp.currentPage!=i}">
					<a href="maga_list?page=${i}">[${i}]</a></c:if>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="maga_list?page=${pp.endPage+1}">다음</a>
			</c:if>
		</c:if>
	</div>


	<a href="maga_write">글쓰기</a>

</body>
</html>