<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<!-- Carousel 추가-->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
  	<c:forEach var="i" begin="1" end="${fn:length(rlist) }">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="${i }"></button>
  	</c:forEach>
    <!-- <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button> -->
  </div>

  <!-- The slideshow/carousel -->
  
  <div class="carousel-inner">
   <div class="carousel-item active">
      <a><img src="./images/western.jpg" alt="고양이" class="img_thumbnail"></a>
      <div class="carousel-caption">
     	 <h4>${rboard.subject }</h4>`
    	<p>${rboard.description }</p>
      </div>
  	</div>
  
  	<c:forEach var="rboard" items="${rlist }">
 	 <div class="carousel-item">
      <img src="./t_images/${rboard.thumbnail }" alt="추천 음식" class="img_thumbnail">
      <div class="carousel-caption">
     	 <h4>${rboard.subject }</h4>`
    	<p>${rboard.description }</p>
      </div>
  	</div>
  </c:forEach>
 </div>

  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>	

</body>
</html>