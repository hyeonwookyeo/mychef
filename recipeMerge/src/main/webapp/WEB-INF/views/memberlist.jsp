<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ include file = "./include/set.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>

<link href="./css/custom.css" rel="stylesheet">

<script>
	$(document).ready(function(){
		$("button[id^='manage_']").click(function(){
			var id = $(this).attr('id').split("_").reverse()[0];
			window.open('manage_member?id='+id, 
						"_blank", 
						"top=20, left=30, width=450, height=400, resizable=no");
		});
	});
</script>
</head>
<body>						

<%@ include file="./include/header.jsp"%>
<div class="container">

<h2 style="text-align: center;">회원목록</h2>

<table border="1" align=center width="100%">
    <tr>
        <th>no</th>
        <th>아이디</th>
        <th>닉네임</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>가입일</th> 
        <th>탈퇴일</th>
        <th>회원상태</th>
        <th>회원관리</th>
    </tr>
    <c:if test="${empty memberlist}">
		<tr>
			<td colspan="9">가입한 회원이 없습니다</td>
		</tr>
	</c:if>
    <c:if test="${not empty memberlist}">
    <c:set var="number" value="${no }"/>
    <c:forEach items="${memberlist}" var="m">   
        <tr>
            <td>${number}</td>
            <td>${m.id}</td>
            <td>${m.nickname}</td>
            <td>${m.pwd}</td>
            <td>${m.name}</td>
            <td>${m.mailid}</td>
    		<td>
            	<fmt:formatDate value="${m.joindate}" pattern="yyyy-MM-dd"/>
            </td> 
            <td>
 				<c:if test="${m.state == 2}">
     				 <fmt:formatDate value="${m.deldate}" pattern="yyyy-MM-dd"/>
  				</c:if>
			</td>
            
            <td>
            	<c:if test="${m.state == 1}">
            		일반회원
            	</c:if>
            	<c:if test="${m.state == 2}">
            		탈퇴회원
            	</c:if>            
           </td>
           <td><button type="button" id="manage_${m.id }">
            	관리</button>
           </td>
        </tr>
    <c:set var="number" value="${number-1 }"/>
    </c:forEach>
    </c:if>
</table>

<!-- 페이징처리 -->
<div>
	<ul class="pagination justify-content-center">
	
	<c:if test="${page > startPage }">
		<li class="page-item"><a href="memberlist?page=${page-1 }" class="page-link golist_${i }">이전</a></li>
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == page }">
			<li class="page-item active"><a href="#" class="page-link">${i }</a></li>
		</c:if>
		<c:if test="${i != page }">
			<li class="page-item"><a href="memberlist?page=${i }" class="page-link">${i }</a></li>
		</c:if>
	</c:forEach>
	<c:if test="${page < endPage }">
		<li class="page-item"><a href="memberlist?page=${page+1 }" class="page-link">다음</a></li>
	</c:if>
	
	
	
	<c:if test="">
		<li class="page-item"><a href="memberlist?page=${endPage }" class="page-link"></a>다음</li>
	</c:if>
	</ul>

</div>
</div>

</body>
