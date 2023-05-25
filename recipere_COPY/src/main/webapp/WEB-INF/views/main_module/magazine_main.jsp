<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 추가한 부분 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>

<!-- Content Row-->
		<div class="row gx-4 gx-lg-5" id="magazine">
		<c:forEach var="maga" items="${mlist }">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
					<img class="card-img-top" src="./upload/${maga.mfile }">
						<h2 class="card-title">${maga.subject }</h2>
						<p class="card-text">${maga.content }</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" 
						href="maga_cont?maga_num=${maga.maga_num }&page=1&state=cont">더 보기</a>
					</div>
				</div>
			</div>
		</c:forEach>	
		</div>


</body>
</html>