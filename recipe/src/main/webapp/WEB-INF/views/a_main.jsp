<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 메인페이지</title>

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="resources/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.js"></script>


<!-- 메인화면 첫화면에 공지사항 리스트 띄움  -->
<script>
	$(function() {
		$("#adminmain").load("n_boardlist");
	});
</script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					관리자 페이지 <sup></sup>
				</div>
			</a>


            <!-- 사이드 바 -->
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>카테고리</span></a>
					
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
					
						<h6 class="collapse-header">게시판</h6>
						<a class="collapse-item" href="a_main">공지사항</a> 
						<a class="collapse-item" href="board_list">이벤트</a> 
						<a class="collapse-item" href="">회원관리</a>
							
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">로그아웃</h6>
						<a class="collapse-item" href="a_Logout">Logout</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!--  사이드바 끝 -->
		
		
		

		<!-- 내용 월페이퍼 -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 내용 화면 -->
			<div id="content">

				<!-- DataTales Example -->
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>

								<!-- 첫화면 공지사항 띄움 -->
								<div class="container-fluid">

									<div id="adminmain"></div>
=
								</div>
								<!-- /.container-fluid -->
								</div>
								<!-- End of Main Content -->
								</div>
								<!-- End of Content Wrapper -->
								</div>
								<!-- End of Page Wrapper -->
								

								<!--하단 스크롤 -->
								<a class="scroll-to-top rounded" href="#page-top"> <i
									class="fas fa-angle-up"></i>
								</a>
								

								<!-- 로그아웃 Modal-->
								<div class="modal fade" id="logoutModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Ready to
													Leave?</h5>
												<button class="close" type="button" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">로그아웃 하시겠습니까?</div>
											<div class="modal-footer">
												<button class="btn btn-secondary" type="button"
													data-dismiss="modal">Cancel</button>
												<a class="btn btn-primary" href="a_Logout">Logout</a>
											</div>
										</div>
									</div>
								</div>

								<!-- Bootstrap core JavaScript-->
								<script src="resources/vendor/jquery/jquery.min.js"></script>
								<script
									src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

								<!-- Core plugin JavaScript-->
								<script
									src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

								<!-- Custom scripts for all pages-->
								<script src="resources/js/sb-admin-2.min.js"></script>

								<!-- Page level plugins -->
								<script
									src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
								<script
									src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

								<!-- Page level custom scripts -->
								<script src="resources/js/demo/datatables-demo.js"></script>
</body>
</html>