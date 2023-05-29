<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<style> </style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js"></script>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 상세페이지</title>

    <!-- Custom fonts for this template -->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="resources/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    
    <!-- 삭제 코드  -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
    <script>
   	function del(num, page){
   		var result = confirm("삭제 하시겠습니까?");
   		if(result){
   			location.href="boarddelete?ann_Num="+num+"&page="+page
   		}   		
   	} 
   </script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
	<div id="wrapper">
	
		

        <!-- Content Wrapper -->
       <div id="content-wrapper" class="d-flex flex-column"> 

            <!-- Main Content -->  <!--   <div id="content"> -->

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                       <div class="topbar-divider d-none d-sm-block">
                        </li> 
                      </ul>
                   </nav>  
                <!-- End of Topbar -->
                
                
                        <!-- DataTales Example -->
                        <div class="card-body">
                        <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>

                <!-- Begin Page Content -->
	<div class="input-form col-md-12 mx-auto">
	
		<!--  <div id="bbswrite_wrap"> -->
		<!--   <table id="bbswrite_t"> -->
		
		<form name="f" method="post" action="" onsubmit="return check()" enctype="multipart/form-data">

			<table border=1 width=400 align="center">
				<caption>상세 페이지</caption>
				<tr>
					<td>날짜</td>
					<td><fmt:formatDate value="${notice.aDate }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${notice.subject }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre>${notice.content }</pre> ${content }</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><c:if test="${!empty notice.aFile }">
							<img src="./upload/${notice.aFile }" width="200" height="100">
						</c:if></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="button" value="목록"
						onclick="location.href='n_boardlist?page=${page}'"> <input
						type="button" value="수정"
						onclick="location.href='n_boardupdateform?ann_Num=${notice.ann_Num }&page=${page}'">

						<input type="button" value="삭제"
						onclick="del(${notice.ann_Num}, ${page})"></td>
				</tr>
			</table>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    
    

    <!-- 하단 스크롤 -->
   <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a> 


    <!-- 로그아웃 Modal -->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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






