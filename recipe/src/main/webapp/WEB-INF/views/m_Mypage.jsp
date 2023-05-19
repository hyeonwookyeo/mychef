<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="true" %> <!-- 현재 페이지를 세션에 추가해줌 -->
<%--
세션 객체에 id 속성이 있으면 해당 값(id)을 가져와서 로그인 유지 상태를 보여주고,
세션 객체에 id 속성이 없으면 로그인을 할 수 있는 화면을 보여준다.
 --%>
 
<%--  <%@include file="../include/header.jsp" %> --%>
 
 <%
String id = (String) session.getAttribute("id");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Left</title>

<!-- <script>
	$(function(){
		 $("#Mypage1").load("m_editForm");
	});
    </script>	 -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(function(){
		 $("#Mypage").load("m_editForm");
	});
    </script>	





</head>
<body>
<%
//세션 객체에 id 속성이 있으면 보여질 화면
if(id != null) { //세션에 id 값이 있다 ▶ 로그인 상태를 유지하는 화면 %>
	<%=id %>님 방문을 환영합니다!<br />
	<button type="button" class="btn btn-primary" onclick="location.href='m_logOut'">로그아웃</button>
<%} else { //세션에 id 값이 없다 ▶ 로그인 값이 없다%>
<form action="m_loginForm" method="post">
	
</form>
<%} %>

<div>

 <input type="button" value="회원 정보 수정"
         onClick="location='m_editForm?'">
      <input type="button" value="회원 탈퇴"
         onClick="location='m_delForm?'">
      <input type="button" value="찜리스트"
         onClick="location.href='basketList?id=${sessionScope.id}'">

</div>


    <div id="Mypage"></div>	



</body>
</html>