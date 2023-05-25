<!-- 메인페이지 테스트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "./include/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- (공통) 헤더부분 -->
<%@ include file="./include/header.jsp"%>

메인페이지 테스트 <br><br>

테이블 전달테스트 <br>
<form action="main_test">
	<input type="text" name="name"> <br>
	<input type="text" name="age"> <br>
	<input type="submit" value="테스트"> <br>
</form> <br>

<br><br>
레시피 탭 테스트<br><br>
<input type="button" value="인기" onClick="location.href='popular' ">
<input type="button" value="레시피목록" onClick="location.href='categoryForm' ">
<input type="button" value="매거진" onClick="location.href='maga' ">

</body>
</html>