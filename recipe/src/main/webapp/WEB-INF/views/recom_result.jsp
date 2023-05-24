<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 0 }">
	<script>
		alert("이 글을 추천했습니다.");
		
		location.href="maga_cont?maga_num="+${maga_num}+"&page="+${page}+"&state=recom";
	</script>

</c:if>
<c:if test="${result == 1 }">
	<script>
		alert("이미 추천 했습니다.");
		history.go(-1);
	</script>
</c:if>