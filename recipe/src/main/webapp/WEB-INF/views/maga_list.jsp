<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt"%>

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



	<table border=1>
		<tr>
			<td>게시글 번호</td>
			<td>게시글 제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<c:set var="num" value="${listcount-(page-1)*10}" />

		<c:forEach var="b" items="${magalist}">
			<tr>
				<td><c:out value="${num}" /> <c:set var="num" value="${num-1}" />
				</td>
				<td>${b.subject}</td>
				<td>관리자</td>
<% 
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	String today = sf.format(now);
%>

				<td>
					<c:out value="${today }"/>
					<c:if test="">
						<fn:formatDate value="${b.mdate}" pattern="a hh:mm:ss" />
					</c:if> 
					
					<c:if test="">
						<fn:formatDate value="${b.mdate}" pattern="yyyy-MM-dd" />
					</c:if>
				</td>
				<td>
					${b.readcount}
				</td>
			</tr>
		</c:forEach>

		<tr></tr>
	</table>

</body>
</html>