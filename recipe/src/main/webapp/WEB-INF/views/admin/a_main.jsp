<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Main</title>
	<link rel="stylesheet" href="${path}/css/style.css">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<style>
  	  #wrap {text-align: center; font-size: 30px; color: #fff; background: #A3CC7A;}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
	$(function(){
		 $("#adminmain").load("n_boardlist");
	});
    </script>	
	
</head>

<body>


<div class="logo-line">
	<div class="logo">
		<a href="admin_view"><img src="${path}/images/free-icon-chef-10626633.png"></a>
	</div>
</div>

<%-- <%@include file="../include/top.jsp" %> <br> --%>


<div class="main">

		
	<%--@include file="../include/header.jsp" --%> <br>	
		
   
    <div id="adminmain"></div>	

	
	<%--@include file="../include/footer.jsp" --%>
	
</div>
