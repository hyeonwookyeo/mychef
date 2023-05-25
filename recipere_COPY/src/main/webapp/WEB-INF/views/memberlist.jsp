<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>

<%@ include file="./include/header.jsp"%>

<h2 style="text-align: center;">회원목록</h2>

<table border="1" align=center>
    <tr>
        <th>아이디</th>
        <th>닉네임</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>가입일</th>
        <th>회원상태</th>
    </tr>
    <c:forEach items="${memberlist}" var="m">   
        <tr>
            <td>${m.id}</td>
            <td>${m.nickname}</td>
            <td>${m.pwd}</td>
            <td>${m.name}</td>
            <td>${m.mailid}</td>
            <td>
            	<fmt:formatDate value="${m.joindate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
            	<c:if test="${m.state == 1}">
            		일반회원
            	</c:if>
            	<c:if test="${m.state == 2}">
            		탈퇴회원
            	</c:if>            
           </td>
        </tr>
    </c:forEach>
</table>


<!-- <input type="button" value="메인으로" class="btn" onclick="location.href='/a_main'"> -->
</body>
