<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>
// 리뷰 수정버튼 클릭시
$(function() {
	$('.r_update_check').click(function() {
		var id = $(this).attr('id');
		var content = $('#content_'+id).text();	// replytext / id:td_태그의 내용을 추출
		$('#content_'+id).html(
					"<textarea rows='3' cols='30' name='nnn"+id+"' id='content_"+id+"'>"+content+"</textarea>");
		
		
		$('#btn_'+id).html(
					"<div id='updatediv_"+id+"'>"
				  +"<input type='file' id='r_file_"+id+"'name='re_rfile1' multiple> "
				  +"<input type='button' value='수정하기' onclick='update("+id+")'>"
				  +"<input type='button' value='취소' onclick='lst("+id+")'>"
				  +"</div>");
	});
	
});

// 취소 버튼 클릭시
function lst(id) {
	$('#listRe').load("r_listRe?rnum=${rnum}");
}

 

//리뷰 삭제
function r_delete_check(rre_num){
	var text="리뷰를 삭제하시겠습니까?";
	if(confirm(text)){
		$.ajax({
			type:'post',
			url:'r_deleteRe',
			data:{"rre_num":rre_num},
			success:function(result){
				alert("리뷰가 삭제되었습니다.");
				$('#listRe').html(result);
			}
			
		});
	}
} 
// 리뷰 수정
function update(id){
	var text = "리뷰를 수정하시겠습니까?";
	if(confirm(text)){
		alert("id는 "+id);
		
		var re_content = $("#content_"+id).val();
		var nnn = $("[name='nnn'"+id+"]").val();
		alert("re_content는 "+re_content)
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
				<form id="frm${reboard.rre_num }" name="frm" enctype="multipart/form-data">
					<div>
					<input type="hidden" id="rre_num${reboard.rre_num }" name="rre_num" value="${reboard.rre_num }">
					<input type="hidden" name="rnum" value="${reboard.rnum }">
						<span><img src=""/></span>닉네임${reboard.id }<br>
						<!-- 이미지 뿌려주기 작업 -->
						<div id="file_${reboard.rre_num }">
						<c:forTokens items="${reboard.re_rfile }" delims="]" var="test">
						
						<img src="./reply_images/${test }" width="200px">
						</c:forTokens>
						</div>
						
						<div id="content_${reboard.rre_num }">${reboard.re_content }</div>
						<div><fmt:formatDate value="${reboard.re_date }" pattern="yyyy년 MM월 dd일"/></div>
						<c:if test="${!empty id and id == reboard.id}">
							<div id="btn_${reboard.rre_num }">
								<input type="button" id="${reboard.rre_num } " value="리뷰 수정" class="r_update_check">
								<input type="button" value="리뷰 삭제" onClick="r_delete_check(${reboard.rre_num})">
							</div>
						</c:if>
						<br>
					</div>
				</form>
				</c:forEach>
			</c:if>   
		</div>
		
		<ul>
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<li><a href="r_view?rpageNum=${pp.startPage - 1}&rnum=${rnum}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li <c:if test="${pp.currentPage==i}">class="disabled"</c:if> >
				<a href="r_view?rpageNum=${i}&rnum=${rnum}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<li><a href="r_view?rpageNum=${pp.endPage + 1}&rnum=${rnum}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>