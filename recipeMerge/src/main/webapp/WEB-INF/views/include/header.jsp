<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<style>

@font-face {
  font-family: 'KCCMurukmuruk';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCMurukmuruk.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
}

.my-text {
  font-size: 20px;
  font-family: 'KCCMurukmuruk', sans-serif;
}

.navbar-custom {
  background-color: #CAFF99;
}
.logo {
  width: 50px; /* 이미지의 너비를 400px로 설정합니다. */
	height: auto; /
}

}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Small Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="resources/image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>


<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-light navbar-custom">
		<div class="container px-5">
		<a href="main">
		<img src="images/logo.png" class="logo">
		</a>
			<a class="navbar-brand my-text" href="main" > &nbsp;NEXT LE시피</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
<%-- 		<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="testMain">
            <img src="${pageContext.request.contextPath}/resources/images/logo2.png" alt="로고" width="50" height="50" class="d-inline-block align-text-top">
            NEXT LE시피
        </a>
        <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
		 --%>
			

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			

					<!-- 로그인 세션이 없는 경우 : 회원 로그인 안한 경우 -->
					<li class="nav-item">
					
					
					<c:if test="${empty sessionScope.id && empty sessionScope.admin_id }">
							 
								<a href="${pageContext.request.contextPath}/n_boardlist"
							class="text-black my-text text-decoration-none">공지사항</a> |
						<a href="list"
					class="text-black my-text text-decoration-none">자유게시판</a> |
						<a href="categoryForm"
						class="text-black my-text text-decoration-none">레시피</a> |
						<a href="maga"
						class="text-black my-text text-decoration-none">매거진</a> |
						<a href="${pageContext.request.contextPath}/m_loginForm"
								class="text-black my-text text-decoration-none">로그인</a> |
						<a href="${pageContext.request.contextPath}/m_joinForm"
								class="text-black my-text text-decoration-none">회원가입</a> 
        					
    				</c:if></li>
    				
					<!-- 로그인 세션이 있는 경우  : 회원 로그인한 경우 -->
					<c:if test="${!empty sessionScope.id && empty sessionScope.admin_id}">
						<%-- <img src="${pageContext.request.contextPath}/images/person-hearts.svg"
							width=15px>  ${sessionScope.id }님 환영합니다 &nbsp; | --%>
							<%-- <img src="${pageContext.request.contextPath}/images/person-hearts.svg" width="15px" 
							style="color: white;">
                           <span style="color: white;">${sessionScope.id}님 환영합니다&nbsp;|</span> --%>
							
							<a href="${pageContext.request.contextPath}/n_boardlist"
							class="text-black my-text text-decoration-none">공지사항</a> |
						<a href="list"
					class="text-black my-text text-decoration-none">자유게시판</a> |
						<a href="categoryForm"
						class="text-black my-text text-decoration-none">레시피</a> |
						<a href="maga"
						class="text-black my-text text-decoration-none">매거진</a> |
						<a href="${pageContext.request.contextPath}/m_mypage"
						class="text-black my-text text-decoration-none">마이페이지</a> |
						<a href="${pageContext.request.contextPath}/m_logOut" 
    						class="text-black my-text text-decoration-none">로그아웃</a> 
					</c:if>	
					
				
					<!-- 관리자 세션이 있는 경우 : 관리자 로그인한 경우-->
					<c:if test="${!empty sessionScope.admin_id}">
					<%-- 	<img src="${pageContext.request.contextPath}/images/person-hearts.svg"
							width=15px>  ${sessionScope.admin_id }님 환영합니다 &nbsp;  --%>
						<a href="${pageContext.request.contextPath}/n_boardlist"
							class="text-black my-text text-decoration-none">공지사항</a> |
						<a href="list"
					class="text-black my-text text-decoration-none">자유게시판</a> |
					<a href="categoryForm"
						class="text-black my-text text-decoration-none">레시피</a> |
						<a href="maga"
						class="text-black my-text text-decoration-none">매거진</a> |
						<a href="${pageContext.request.contextPath}/a_main"
							class="text-black my-text text-decoration-none">관리자페이지</a> |
						<a href="${pageContext.request.contextPath}/a_Logout"							
							class="text-black my-text text-decoration-none">관리자로그아웃</a> |
					</c:if>
					
				</ul>
			</div>
		</div>
	</nav>

	<!-- Bootstrap core JS-->
	<script
		src="resources/https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>
