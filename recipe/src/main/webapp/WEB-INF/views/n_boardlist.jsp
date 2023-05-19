<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>

<style> </style>

</head>
<body>

<%-- 	<%@include file="../include/a_header.jsp"%> --%>
<br>

	<a href="n_boardform">글작성</a> <br>

	<table border=1 align="center" width=1000>

		<caption>공지사항</caption>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		
		<!-- 화면 출력 번호 변수 정의  -->
		<c:set var="num" value="${listcount-(page-1)*10 }" />

		<c:forEach var="b" items="${n_boardlist }">
			<tr>
				<td>${num}<c:set var="num" value="${num-1 }" />
				</td>

				<td><a href="n_boardcontent?ann_Num=${b.ann_Num }&page=${page}">
						${b.subject } </a></td>


				<td><fmt:formatDate value="${b.aDate }" pattern="yyyy-MM-dd" />
				</td>
				<td>${b.readCount }</td>
				<%--     <td>${b.state }</td> --%>
		    </tr>
		</c:forEach>
	</table>

	<!-- 페이지 처리  -->
	<center>
		<c:if test="${listcount > 0 }">

			<!-- 1 page로 이동  -->
			<a href="n_boardlist?page=1" style="text-decoration: none"> << </a>

			<!-- 이전 블럭으로 이동  -->
			<c:if test="${page > 1 }">
				<a href="n_boardlist?page=${page - 1 }">이전</a>
			</c:if>

			<!-- 각 블럭에 10개 페이지 출력  -->

			<c:forEach var="i" begin="${startPage }" end="${endPage }">

				<c:if test="${i == page }">
					<!-- 현재 페이지  -->  
     [${i }]
 </c:if>
</c:forEach>

			<!-- 다음 블럭으로 이동  -->
			<c:if test="${endPage < pageCount }">
				<a href="n_boardlist?page=${page + 1 }">다음</a>
			</c:if>

			<!-- 마지막 page로 이동  -->
			<a href="n_boardlist?page=${pageCount }" style="text-decoration: none">
				>></a>
		</c:if>
	</center>

</body>
</html>

































