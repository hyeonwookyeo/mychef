<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/set.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>NEXT RE시피</title>
<!-- Favicon-->
<link rel="icon" type="resources/image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />


<!-- 추가한 부분 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#carousel').load('main_carousel');
		$("#free_board").load('main_free_board');
		$("#new_recipe").load('main_new_recipe');
		$("#magazine").load('main_magazine');
	});
</script>

<style>
.img_thumbnail {
	width: 700px;
	height: 500px;
	object-fit: cover;
}
</style>
</head>
<body>

	<%@ include file="./include/header.jsp"%>

	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<div class="row gx-4 gx-lg-5 align-items-center my-5">
			<div id="carousel" class="col-lg-7">
				<!-- <img class="img-fluid rounded mb-4 mb-lg-0"
			src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /> -->

			</div>
			<div class="col-lg-5">
				<h1 class="font-weight-light">
					다양한 레시피를 <br> 만나보세요
				</h1>
				<p>
					요리가 어려우세요? 알고보면 쉬운 요리도 많아요. 하고 싶은 요리를 찾아 따라해보세요! <br>실력이 쑥쑥!
				</p>
				<a class="btn btn-primary" href="#free_board">최신 게시판</a> <a
					class="btn btn-primary" href="#magazine">매거진</a>
				<!--   <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">인기 레시피</a> -->
			</div>
		</div>
	</div>


	<!-- Features section-->
	<section class="py-5"></section>
	<!-- body -->

	<section class="py-5">
		<div class="container px-5 my-5">
			<div class="row gx-5">
				<div id="free_board"></div>
			</div>
		</div>
		<div class="container px-5 my-5">
			<div class="row gx-5">
				<div id="new_recipe"></div>
			</div>
		</div>
		<div class="container px-5 my-5">
			<div class="row gx-5">
				<div id="magazine"></div>
			</div>
		</div>
	</section>

	<!-- Footer-->

	<footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link text-white"
					href="a_loginform">관리자 로그인</a></li>
			</ul>
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>


	<!--  
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
           
        </footer> -->

	<!-- Bootstrap core JS-->
	<script
		src="resources/https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>
