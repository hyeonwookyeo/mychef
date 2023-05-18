<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>


<script>
$(function() {
	$('.r_update_check').click(function() {
		var id = $(this).attr('id');
		var content = $('#content_'+id).text();	// replytext / id:td_태그의 내용을 추출
		$('#content_'+id).html("<textarea id=\"content"+id+"\">"+content+"</textarea>");
	});
});

/*
function r_update_check(){
	var text="리뷰를 수정하시겠습니까?";
	if(confirm(text)){
		
		var id = $(this).attr('id');
		
		var rnum = $('#rre_num'+id);	
		var content = $('#content'+id);
		var formData = new FormData();
		var inputFile = $("#file"+id)
		var files = inputFile[0].files;
		for(var i=0; i<files.length; i++) {
			formData.append("uploadFile", files[i]);
		}
		
		formData.append("rre_num", rre_num);	
		formData.append("re_content", re_content);	
		
		if(content==""){
			alert("리플을 입력하세요.");
			$("#re_content").focus();
		}else{
			$.ajax({
				type:"post",
				url:"r_updateRe",
				data:formData,
				processData: false,
				contentType: false,
				enctype : 'multipart/form-data',
				success:function(result){
					$('#listRe').load('r_listRe?pageNum=1&rnum=${board.rnum}');
					alert("리뷰가 수정되었습니다");
					frm.re_content.value = '';
					frm.re_rfile1.value = '';	
				}
			});
		}
		
		
		
		
		
		
		
		
			
		}
		
		
	
	
} // function 종료
*/

/* function r_delete_check(){
	var text="리뷰를 삭제하시겠습니까?";
	if(confirm(text)){
		$.ajax({
			var data = "리뷰가 삭제되었습니다.";
			
			
			var id = $(this).attr('id');
			
		    type : "post",
		    url : "r_deleteRe",
		    data : {"rre_num":${rre_num}},
		    success : function(data){
		    	alert(data);
		    }
		});
	}
}	 */
    /* var str = "";
function r_image_add() {
    var r_image_grp = "<c:out value='${test}'/>"; 
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
 */

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
						<div id="file${reboard.rre_num }">
						<c:forTokens items="${reboard.re_rfile }" delims="]" var="test">
						
						<img src="./reply_images/${test }" width="200px">
						</c:forTokens>
						</div>
						
						<div id="content_${reboard.rre_num }">${reboard.re_content }</div>
						<div><fmt:formatDate value="${reboard.re_date }" pattern="yyyy년 MM월 dd일"/></div>
						<c:if test="${!empty id and id == reboard.id}">
							<div>
								<input type="button" id="${reboard.rre_num } " value="리뷰 수정" class="r_update_check">
								<button type="button" id="dsdfsdfsdfsdfssdfsdfsdfsdf${reboard.rre_num } " onClick="r_delete_check()">리뷰 삭제</button>
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