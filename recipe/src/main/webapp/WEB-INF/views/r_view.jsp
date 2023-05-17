<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
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
					  location.href="r_listForm?pageNum=${pageNum}"
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
    $('#listRe').load('r_listRe?pageNum=1&rnum=${board.rnum}');
    
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
});
</script>
</head>
<body>
	<div class="container" align="center">
	<input type="hidden" id="rnum" name="rnum" value="${board.rnum}">
	
		<h1>${board.subject }</h1>
		<div>
			<img src="./t_images/${board.thumbnail}" width=500/>
		</div>
		<div>카테고리 ${board.category }</div>
		<div>${board.id }닉사진 조회수 ${board.readcount }</div>
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
			</c:forEach>


		</table>

		<div>
		<image id="r_recomm_img" src="images/comm.jpg" width="50" height="50"></image>
		<div id="r_recomm"></div>
		</div><br>


		<c:if test="${!empty id and id == board.id}">
			<div align="center">
				<a href="r_updateForm?pageNum=${pageNum }&rnum=${board.rnum }">수정</a>
				<button type="button" onClick="delete_check()">삭제</button>
			</div>
		</c:if>
		<div><a href="r_listForm?&pageNum=${pageNum }">목록</a></div>


		<c:if test="${!empty id}">
			<div>
				<form name="frm" method="post" enctype="multipart/form-data" action="r_insertRe">
					<input type="hidden" id="rnum" name=rnum value="${board.rnum }"> 
					<input type="hidden" id="id" name=id value="${id}"> 
					<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"> 
					<input type="file" name="re_rfile1" multiple> 댓글 :
					<textarea rows=3 cols=30 name="re_content"></textarea>
					<input type="submit" id="repl_insert">
				</form>
			</div>
		</c:if>
			<div id="listRe"></div>
			
			
	</div>

</body>
</html>