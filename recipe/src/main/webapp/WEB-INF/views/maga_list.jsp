<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

		<c:if test="${empty magalist}">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
			
		<c:if test="${not empty magalist}">
		<c:set var="num" value="${listcount-(page-1)*10}" />

		<c:forEach var="b" items="${magalist}">
			<tr>
				<td><c:out value="${num}" /> <c:set var="num" value="${num-1}" />
				</td>
				<td>
					<a href="maga_cont?maga_num=${b.maga_num}&page=${page}&state=cont">
						${b.subject}</a>
				</td>
				<td>관리자</td>

				<td>
				    <c:set var="today" value="<%=new Timestamp(System.currentTimeMillis()) %>" />	
				    <c:set var="today" value="${fn:substring(today, 0, 10) }"/>
					
					<c:set var="dbtoday" value="${fn:substring(b.mdate, 0, 10) }"/>
				    		
					<c:if test="${today == dbtoday}">
						<fmt:formatDate value="${b.mdate}" pattern="HH:mm:ss" />
					</c:if> 
					
					<c:if test="${today != dbtoday}">
						<fmt:formatDate value="${b.mdate}" pattern="yyyy-MM-dd" />
					</c:if>
				</td>
				<td>
					${b.readcount}
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	
	<!-- 검색창 -->
	<form action="maga_list" align=center>
			<input type="hidden" name="pageNum" value="1"> 
			<select	name="search">
				<option value="subject"	<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
				<option value="content"	<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
				<option value="subcon"	<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="확인">
		</form>
		
	<div align=center>
	
	<c:if test="${page < 11}">
		[<]&nbsp;
	</c:if>
	
	<c:if test="${page >= 11}">
		<a href="maga_list?page=${startpage-10}">[<]</a>
	</c:if>
	
	<c:forEach var="a" begin="${startpage}" end="${endpage}">
		<c:if test="${a == page}">
			[${a}]
		</c:if>
		
		<c:if test="${a != page}">
			<a href="maga_list?page=${a}">[${a}]</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${maxpage < startpage+10}">
		[>]&nbsp;
	</c:if>
	
	<c:if test="${maxpage >= startpage+10}">
		<a href="maga_list?page=${endpage+1}">[>]</a>
	</c:if>
	</div>
	
	<a href="maga_write">글쓰기</a>

</body>
</html>