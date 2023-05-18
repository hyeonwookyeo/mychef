<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/style.css">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

<c:if test="${sessionScope.mem_id != 'admin'}">
<div class="top-header">
<div class="header">
</c:if>

<c:if test="${sessionScope.mem_id == 'admin'}">
<div class="top-header">
<div class="header">

		<a href="">목록</a>
		<a href="">목록</a>

</c:if>
<c:if test="${sessionScope.mem_id != null}">
	<div class="login">
		<a href="Mypage?mem_id=${sessionScope.mem_id}">마이페이지(${sessionScope.mem_id})</a>
		<a href="Logout">로그아웃</a>
	</div>	
</c:if>

</div>
</div>

<div id="wrap" align="center">
	<div class="info">
		<button type="button" class="btn btn-primary" onClick="location.href='admin_view'">HOME</button> 
		<button type="button" class="btn btn-primary" onClick="location.href='boardlist?admin_id=${sessionScope.admin_id}'"> 공지사항 </button>
		<button type="button" class="btn btn-primary">이벤트</button> 
		<button type="button" class="btn btn-primary" onclick="location.href='member_list'">회원관리</button> 
		<button type="button" class="btn btn-primary">글관리</button> 
		<button type="button" class="btn btn-primary" onclick="location.href='Logout'">로그아웃</button>
	</div>
</div>
