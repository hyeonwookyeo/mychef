<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/set.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<script>
	if(result == 1){
		alert("회원이 삭제되었습니다!");
		self.close();
	}else{
		alert("문제 발생! 다시 시도해주세요");
		history.go(-1);
	}
</script>

</body>
</html>