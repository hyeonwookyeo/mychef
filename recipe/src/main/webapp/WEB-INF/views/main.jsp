<!-- 메인페이지 테스트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

MyPage <br><br>
${sessionScope.id }  님 환영 합니다. <br> <br> <br> <br><br>

테이블 전달테스트 <br>
<form action="main_test">
	<input type="text" name="name"> <br>
	<input type="text" name="age"> <br>
	<input type="submit" value="테스트"> <br>
</form>
<input type="button" value="회원정보 수정" onClick="location.href='m_editForm'"/>
<input type="button" value="회원정보 삭제" onClick="location.href='m_delForm'"/>
<input type="button" value="게시판 리스트" onClick="location.href='board_list'"/>
<input type="button" value="게시판 입력" onClick="location.href='board_write'"/>
<input type="button" value="회원가입 " onClick="location.href='m_joinForm' ">
<input type="button" value="로그인" onClick="location.href='m_loginForm' ">

</body>
</html>