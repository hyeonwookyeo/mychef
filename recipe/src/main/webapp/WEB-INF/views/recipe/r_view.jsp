<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function delete_check(){
	var text="삭제하시겠습니까?";
	if(confirm(text)){
		var rnum = $("#rnum").val();
		$.ajax({
		    type : "post",
		    url : "r_delete",
		    data : {"rnum":rnum},
		    success : function(data){
		    	if(data == 1){
					  alert("글이 삭제되었습니다.");
					  location.href="r_listForm?category=${board.category}&pageNum=${pageNum}"
				  }else{
					  alert("글 삭제를 실패했습니다.");
				  } 
		    }
		});
	}
}

/* function re_comm(id, rnum){
	var id = $("#id").val();
	if(sessionScop.id=""){
		alert("로그인이 필요합니다.");
	}else{
		var comfrm = "id="+id+"&rnum="+rnum;
		$.post("r_recomm",comfrm, function(data) {
			$('#r_recomm').html(data);
		});
	}
} */

</script>
<script>
$(document).ready(function() {
    $('#listRe').load('r_listRe?rnum=${board.rnum}');
    
    $('#r_recomm_img').click(function(){
    	var id = $("#id").val();
    	var rnum = $("#rnum").val();
    	
		if(id==""){
			alert("로그인이 필요합니다.");
		}else{
			var commfrm = "id="+id+"&rnum="+rnum;
			$.ajax({
				type:"post",
				url:"r_recomm",
				data:commfrm,
				success:function(data){
					$('#r_recomm').html(data);
				}
			});
		}
	});
    
    
    $("#r_zzim_img").click(function(){
    	
    	var id = $("#id").val();
    	var rnum = $("#rnum").val();
    	
    	if(id==""){
    		alert("로그인이 필요합니다.");
    	}else{
    		var zzimfrm = "id="+id+"&rnum="+rnum;
    		$.ajax({
    			type:"post",
    			url:"r_zzim",
    			data:zzimfrm,
    			success:function(data){
    				$('#r_zzim').html(data);
    			}
    		});
    	}	
    }); 		
    
    
});
</script>
<script>
$(function(){
	$('#reple_insert').click(function(){
		var id = $("#id").val();
		var rnum = $("#rnum").val();
		var re_content = $("#re_content").val();
		var formData = new FormData();
		var inputFile = $("input[name='re_rfile1']")
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++) {
			formData.append("uploadFile", files[i]);
		}
		
		formData.append("id", id);
		formData.append("rnum", rnum);
		formData.append("re_content", re_content);	
		
		if(re_content==""){
			alert("리플을 입력하세요.");
			$("#re_content").focus();
		}else{
			$.ajax({
				type:"post",
				url:"r_insertRe",
				data:formData,
				processData: false,
				contentType: false,
				enctype : 'multipart/form-data',
				success:function(result){
					alert("리뷰가 작성되었습니다");
					$('#listRe').load('r_listRe?pageNum=1&rnum=${board.rnum}');
					document.getElementById("re_content").value='';
					document.getElementById("re_rfile1").value='';
				}
			});
		}
	});
});
</script>	
</head>
<body>
	<!-- (공통) 헤더부분 -->
	<%@ include file="/resources/header/topview.jsp"%>
					
	<div class="container" align="center">
	<input type="hidden" id="rnum" name=rnum value="${board.rnum }"> 
	<input type="hidden" id="id" name=id value="${id}"> 
	
		<h1>${board.subject }</h1>
		<div>
			<img src="./t_images/${board.thumbnail}" width=500/>
		</div>
		<div>카테고리 ${board.category }</div>
		<div>
		<c:if test="${not empty member.profile }"><img src="./upload/${member.profile }" width=35 height=35></c:if>
		<c:if test="${empty member.profile }"><img src="./upload/pepe.jpg" width=35 height=35></c:if>
		${member.nickname} 조회수 ${board.readcount }</div>
		<div>${board.description }</div>

		<table>
			<c:forEach var="item1" items="${map1 }">
				<tr>
					<td>${item1.key } ${item1.value }</td>
				</tr>
			</c:forEach>
			<c:forEach var="item2" items="${map2 }">
				<tr>
					<td><img src="./r_images/${item2.key }" width=300 /> ${item2.value }</td>
				</tr>
				console.log("${item2.key}")
			</c:forEach>


		</table>

		<div>
		<image id="r_recomm_img" src="images/good.png" width="50" height="50"></image>
		<img id="r_zzim_img" src="images/zzim.jpg" width="50" height="50"/>
		<div id="r_recomm">추천수 : ${recomm_state }</div>
		<div id="r_zzim">
		
		</div>
		</div><br>


		<c:if test="${!empty id and id == board.id}">
			<div align="center">
				<a href="r_updateForm?pageNum=${pageNum }&rnum=${board.rnum }">글 수정</a>
				<button type="button" onClick="delete_check()">글 삭제</button>
			</div>
		</c:if>
		<div><a href="r_listForm?&pageNum=${pageNum }&category=${board.category}">목록</a></div>


		<c:if test="${!empty id}">
			<div>
				<form id="frm" name="frm" enctype="multipart/form-data">
				 <!-- method="post" enctype="multipart/form-data" action="r_insertRe" -->
					<input type="hidden" id="rnum" name=rnum value="${board.rnum }"> 
					<input type="hidden" id="id" name=id value="${id}"> 
					<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"> 
					<input type="file" id="re_rfile1" name="re_rfile1" multiple="multiple"> 댓글 :
					<textarea rows=3 cols=30 id="re_content" name="re_content"></textarea>
					<input type="button" value="댓글입력" id="reple_insert">
				</form>
			</div>
		</c:if>
			<div id="listRe"></div>
	</div>

</body>
</html>