<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>나만의 찜 레시피</title>
<body>
    <div class="container">    
        <c:forEach var="j" items="${jlist}">
                <div class="id">${j.id}</div>
                <div class="rnum">글번호: ${j.rnum}</div>
        </c:forEach> 
    </div>   
</body>
</html>