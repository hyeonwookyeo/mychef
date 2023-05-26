<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="./include/set.jsp"%>

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

		$("#A_nboard").click(function() {
			$("#adminmain").load("n_boardlist");
		});
		$("#A_magazine").click(function() {
			$("#adminmain").load("maga_list");
		});
		$("#A_member_manage").click(function() {
			$("#adminmain").load("memberlist");
		});
		$("[id^='change_']").click(function(){
			var page = $(this).attr('id').split("_").reverse()[0];
			$("#adminmain").load("memberlist");
		}
	});
</script>

<link href="css/mypage.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="./include/a_side.jsp"%>

		<!-- 내용 월페이퍼 -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 내용 화면 -->
			<!-- 	<div id="content"> -->

			<!-- DataTales Example -->
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<div id="adminmain"></div>
						<thead>

							<!-- 첫화면 공지사항 띄움 -->
							<div class="container-fluid">

								<div id="adminmain"></div>

							</div>

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
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/datatables-demo.js"></script>
</body>
</html>