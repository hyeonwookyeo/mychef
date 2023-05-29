<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/set.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("[id^='change_']").click(function(){
		var id = $(this).attr('id').split("_").reverse()[0];
		alert("선택한 회원의 닉네임을 변경하시겠습니까?");
		
		var str = "";

		str += "<form action='a_change_member'>";
		str += "<input type='hidden' name='id' value="+id+">";
		str += "<p>";
		str += "	<input type='text' name='nickname'>";
		str += "</p>";
		str += "<input type='submit' value='확인'>";
		str += "<input type='reset' value='취소'>";
		str += "</form>";

		$("#nickname_change").append(str);
	});
	$("[id^='delete_']").click(function(){
		var id = $(this).attr('id').split("_").reverse()[0];
		var text = "선택한 회원을 삭제하시겠습니까?"
		if(confirm(text)){
			location.href="a_delete_member?id="+id;
		}
		
	});
});
</script>

</head>



<body>

<div class="container">
	<div>
	<button type="button" id="change_${id }">아이디 변경</button>
	<button type="button" id="delete_${id }">회원 삭제</button>
	
	</div>
	<div id="nickname_change">
	
	</div>
</div>

</body>
</html>