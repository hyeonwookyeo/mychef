<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>
 function update_check(){
	var text="리뷰를 수정하시겠습니까?";
	if(confirm(text)){
		$.ajax({
		    type : "post",
		    url : "r_updateRe",
		    data : {"reboard":${"#frm}"},
		    success : function(data){   
		    	alert(data);
		    }
		});
	}
}	

function delete_check(){
	var text="리뷰를 삭제하시겠습니까?";
	if(confirm(text)){
		$.ajax({
		    type : "post",
		    url : "r_deleteRe",
		    data : {"rre_num":${rre_num}},
		    success : function(data){
		    	alert(data);
		    }
		});
	}
}	 
</script>	
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시판 목록</h2>
		<div class="row">
			<div>
				${total }개의 리뷰가 있습니다
			</div>
			<c:if test="${empty rlist}">
				<div>
					<b>리뷰를 새로 달아주세요</b>
				</div>
			</c:if>
			<c:if test="${not empty rlist}">
				<c:forEach var="reboard" items="${rlist }">
					<div>
					<input type="hidden" name="rre_num" value="${reboard.rre_num }">
					<input type="hidden" name="rnum" value="${reboard.rnum }">
						<span><img src=""/></span>닉네임${reboard.id }
						
 						<%-- <c:forEach var="reply_images" items="${reply_imgList }"> --%>
 						<c:forTokens items="${reboard.re_rfile }" delims="+" var="test">
 						<img src="./reply_images/${test}" >
 						<br>
 						
 						</c:forTokens>
						<div>${reply_images }</div>
						</c:forEach> 

						<div>${reboard.re_content }</div>
						<div>${reboard.re_date }</div>
						<c:if test="${!empty id and id == reboard.id}">
							<div>
								<button type="button" onClick="update_check()">수정</button>
								<button type="button" onClick="delete_check()">삭제</button>
							</div>
						</c:if>
						<br>
					</div>
				<%-- </c:forEach> --%>
				
			</c:if>   


		</div>
		
		<ul>
			<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="r_view?rpageNum=${pp.startPage - 1}&rnum=${rnum}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">disabled</c:if> >
					<a href="r_view?rpageNum=${i}&rnum=${rnum}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="r_view?rpageNum=${pp.endPage + 1}&rnum=${rnum}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>