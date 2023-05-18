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
<title>관리자 페이지 헤더</title>
</head>
<body>

<div id="wrap" align="center">
	<div class="info">
		<button type="button" class="btn btn-primary" onClick="location.href='a_main'">HOME</button> 
		<button type="button" class="btn btn-primary" onClick="location.href='n_boardlist?admin_id=${sessionScope.admin_id}'"> 공지사항 </button>
		<button type="button" class="btn btn-primary">이벤트</button> 
		<button type="button" class="btn btn-primary" onclick="location.href='member_list'">회원관리</button> 
		<button type="button" class="btn btn-primary" onclick="location.href='a_Logout'">로그아웃</button>
	</div>
</div>
