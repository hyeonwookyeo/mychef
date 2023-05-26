<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true"%>
<!-- 현재 페이지를 세션에 추가해줌 -->

<%@ include file="./include/header.jsp"%>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<%--
세션 객체에 id 속성이 있으면 해당 값(id)을 가져와서 로그인 유지 상태를 보여주고,
세션 객체에 id 속성이 없으면 로그인을 할 수 있는 화면을 보여준다.
 --%>

<%--  <%@include file="../include/header.jsp" %> --%>

<%
	String id = (String) session.getAttribute("id");
%>

<title>회원 마이페이지</title>

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

<link href="css/mypage.css" rel="stylesheet">
<link href="css/all-style.css" rel="stylesheet">


<!-- 메인화면 첫화면에 공지사항 리스트 띄움  -->




</head>

<body id="page-top">

<%--  <%
//세션 객체에 id 속성이 있으면 보여질 화면
if(id != null) { //세션에 id 값이 있다 ▶ 로그인 상태를 유지하는 화면 %>
	<%=id %>님 방문을 환영합니다!<br />
	<button type="button" class="btn btn-primary" onclick="location.href='m_logOut'">로그아웃</button>
<%} else { //세션에 id 값이 없다 ▶ 로그인 값이 없다%>
<form action="m_loginForm" method="post">
	
</form>
<%} %>

<div> --%>

	<!-- Page Wrapper -->
	<div id="wrapper">
	

<%@ include file="./include/m_side.jsp"%>

<script>
	$(function() {
		$("#mypage").load("m_editForm");
		
		 $("#M_jjim").click(function(){
			 
			$("#mypage").load("m_jjimlist");
		
		 });
		 $("#M_edit").click(function(){
			 
			$("#mypage").load("m_editForm");
		
		 });	
		 $("#M_remove").click(function(){
			 
				$("#mypage").load("m_delForm");
			
			 });	
		
	});
</script>

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

									 <div id="mypage"></div>	
									
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
												<a class="btn btn-primary" href="m_logOut">Logout</a>
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