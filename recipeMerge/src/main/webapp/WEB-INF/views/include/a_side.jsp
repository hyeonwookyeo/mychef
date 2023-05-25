<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>

<style> </style>

<script>

$(document).ready(function() {
    // 사이드바 접기
    $('#sidebarToggle').on('click', function() {
        $('body').toggleClass('sidebar-toggled');
        $('.sidebar').toggleClass('toggled');
    });
});


</script>

</head>
<body>						
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/board.js"></script> --%>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    
    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="resources/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    


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
					
<!-- 		//				<h6 class="collapse-header" href="board_list">게시판</h6> -->
						<!-- <h6 class="collapse-header"></h6> -->
						<a class="collapse-item" href="n_boardlist">공지사항</a>
						<c:if test="${sessionScope.memberLevel == 'admin'}">
   							 <a href="n_boardform?admin_id=${sessionScope.admin_id}">글작성</a><br>
						</c:if>
							
						<a class="collapse-item" href="board_list">이벤트</a> 
						<a class="collapse-item" href="memberlist">회원관리</a>		
						<!-- 	
						<div class="collapse-divider"></div> -->
						<h6 class="collapse-header">로그아웃</h6>
						<a class="collapse-item" href="a_Logout">Logout</a>
						<a class="collapse-item" href="testMain">메인</a>
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

</body>
</html>

