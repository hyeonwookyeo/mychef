<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

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
		    data : {"reboard":$("#frm").serialize()},
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

function r_image_add() {
    var str = "";
    var r_image_grp = "<c:out value='${review_image}'/>"; 
    var r_image = r_image_grp.split("]");

    for (var i = 0; i < r_image.length; i++) {
        str += "<div>";
        str += "    <img src='reply_images/" + r_image[i] + "' width='500'/>"; //
        str += "</div>";
    }
    $("#r_image_add").append(str);
}

// 테스트용
$(document).ready(function() {
	$('#r_image_add').load(r_image_add());
});




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
			 	<c:set var="i" value="0"> 
				<c:forEach var="reboard" items="${rlist }">
					<div>
					<input type="hidden" name="rre_num" value="${reboard.rre_num }">
					<input type="hidden" name="rnum" value="${reboard.rnum }">
						<span><img src=""/></span>닉네임${reboard.id }
						<!-- 이미지 뿌려주기 작업 -->
						
						<c:set var="review_image" value="${reboard.re_rfile}"></c:set>
						${fn:split(review_image,']')[${i}]}
						
						<c:set var="image" value="${fn:split(review_image,']')[${i}]}"/> <br>
						${image } <br>
						
						<%-- <c:set var="i" value="${i+1}"/> --%>
						<div id="r_image_add"></div>						
						
						
						<div>${reboard.re_content }</div>
						<div><fmt:formatDate value="${reboard.re_date }"
										pattern="yyyy년 MM월 dd일"/></div>
						<c:if test="${!empty id and id == reboard.id}">
							<div>
								<button type="button" onClick="update_check()">수정</button>
								<button type="button" onClick="delete_check()">삭제</button>
							</div>
						</c:if>
						<br>
					</div>
				</c:forEach>
			</c:set> 
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