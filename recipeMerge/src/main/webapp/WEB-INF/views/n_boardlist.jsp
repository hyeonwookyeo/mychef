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
<title>공지사항 게시판 목록</title>

</head>
<body>						
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js"></script>

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
		
			 

<!-- 회원용 헤더 -->
<%@ include file="./include/header.jsp" %>
   
	<div id="wrapper">
		   <!-- Content Wrapper -->
       <div id="content-wrapper" class="d-flex flex-column"> 

<div id="content-wrapper" class="d-flex flex-column"> 
    <!-- DataTales Example -->
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" style="width: 1000px; margin: 0 auto;" cellspacing="0">
                
 <%--  <caption>공지사항</caption> --%>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		
		<!-- 화면 출력 번호 변수 정의  -->
		<c:set var="num" value="${listcount-(page-1)*10 }" />

		<c:forEach var="b" items="${n_boardlist }">
			<tr>
				<td>${num}<c:set var="num" value="${num-1 }" />
				</td>

				<td><a href="n_boardcontent?ann_Num=${b.ann_Num }&page=${page}">
						${b.subject } </a></td>


				<td><fmt:formatDate value="${b.aDate }" pattern="yyyy-MM-dd" />
				</td>
				<td>${b.readCount }</td>
				<%--     <td>${b.state }</td> --%>
		    </tr>
		</c:forEach>
	</table>

	<!-- 페이지 처리  -->
	<center>
		<c:if test="${listcount > 0 }">

			<!-- 1 page로 이동  -->
			<a href="n_boardlist?page=1" style="text-decoration: none"> << </a>

			<!-- 이전 블럭으로 이동  -->
			<c:if test="${page > 1 }">
				<a href="n_boardlist?page=${page - 1 }">이전</a>
			</c:if>

			<!-- 각 블럭에 10개 페이지 출력  -->

			<c:forEach var="i" begin="${startPage }" end="${endPage }">

				<c:if test="${i == page }">
					<!-- 현재 페이지  -->  
     [${i }]
 </c:if>
</c:forEach>

			<!-- 다음 블럭으로 이동  -->
			<c:if test="${endPage < pageCount }">
				<a href="n_boardlist?page=${page + 1 }">다음</a>
			</c:if>

			<!-- 마지막 page로 이동  -->
			<a href="n_boardlist?page=${pageCount }" style="text-decoration: none">
				>></a>
		</c:if>
	</center>
	
	<!-- 글작성 버튼 관리자만 보이게함  -->
	<c:if test="${sessionScope.admin_id == 'admin'}">
       <a href="n_boardform">글작성</a> <br>
    </c:if>
	
	  </div>

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
                        
                        
                    <!-- <thead> -->

              

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
