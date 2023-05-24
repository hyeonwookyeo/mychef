<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == 1}">
	<script>
		alert("레시피 글 작성 완료.");
		location.href="r_listForm?category=${category}";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("레시피 글 작성 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>