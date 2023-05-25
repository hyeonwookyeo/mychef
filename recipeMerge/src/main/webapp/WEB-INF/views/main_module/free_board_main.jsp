<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/set.jsp"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 매거진 리스트 -->
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
			<c:set var="num" value="${num }" />
			<!-- 반복문 시작 -->
			<c:forEach var="b" items="${boardlist}">
				<tr>
					<td><c:out value="${num}" /> <c:set var="num" value="${num-1}" /></td>
					<td><a href="free_board_cont?comm_num=${b.comm_num}&page=1&state=cont">
						${b.subject}</a></td>
					<td>${b.id}</td>
					<td>
						<c:set var="today" value="<%=new Timestamp(System.currentTimeMillis())%>" /> 
						<c:set var="today" value="${fn:substring(today, 0, 10) }" /> 
						<c:set var="dbtoday" value="${fn:substring(b.cdate, 0, 10) }" /> 
							<c:if test="${today == dbtoday}">
								<fmt:formatDate value="${b.cdate}" pattern="HH:mm" />
							</c:if>
						 	<c:if test="${today != dbtoday}">
								<fmt:formatDate value="${b.cdate}" pattern="yyyy.MM.dd" />
							</c:if></td>
					<td>${b.readcount}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>