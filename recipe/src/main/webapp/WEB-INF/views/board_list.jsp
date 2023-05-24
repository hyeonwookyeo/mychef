<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 목록</title>
</head>
<body>
	<!-- 매거진 리스트 -->
	<h2>매거진 목록</h2>
	글 개수 : ${listcount}

	<table border=1 align=center>
		<tr>
			<td>게시글 번호</td>
			<td>게시글 제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<!-- 리스트 출력 -->
		<c:if test="${empty boardlist}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>

		<c:if test="${not empty boardlist}">
				<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	<!-- 반복문 시작 -->
			<c:forEach var="b" items="${boardlist}">
				<tr>
					<td>
					<!-- 번호 출력부분 -->
					<c:out value="${num}" /> 
					<c:set var="num" value="${num-1}" />
					</td>
					
					<td>
					<!-- 제목 출력 부분 -->
					<a href="board_cont?comm_num=${b.comm_num}&page=${page}&state=cont">
							${b.subject}</a></td>
					<td>${b.id}</td>

					<td>
					<c:set var="today"
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
	</table>


	<!-- 검색창 -->
	<form action="board_list" align=center>
		<input type="hidden" name="pageNum" value="1"> 
		<select	name="search">
			<option value="subject"	<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
			<option value="content"	<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
			<option value="subcon" <c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
		</select> 
		<input type="text" name="keyword"> 
		<input type="submit" value="확인">
	</form>
	
	
	<!-- 페이징 번호 -->

	
	<div id="bbslist_paging">			
		<c:if test="${not empty keyword }">
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="board_list?page=${page-1}&search=${search}&keyword=${keyword}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startPage}" end="${endPage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="board_list?page=${a}&search=${search}&keyword=${keyword}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="board_list?page=${page+1}&search=${search}&keyword=${keyword}">[다음]</a>
			</c:if>			
		</c:if>

	<c:if test="${empty keyword }">
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="board_list?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startPage}" end="${endPage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="board_list?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="board_list?page=${page+1}">[다음]</a>
			</c:if>			
		</c:if>
		</div>
			<div id="bbslist_w">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location='board_write.do?page=${page}'">
		</div>

</body>
</html>