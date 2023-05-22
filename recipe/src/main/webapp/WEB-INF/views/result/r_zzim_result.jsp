<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		alert("들어왔음");
	if(result == 0){
		alert("결과값은  " +result );
		location.href="r_zzim_add?id=${id}&rnum=${rnum}";
	}else if{
		alert("찜을 취소하시겠습니까?");
		location.href="r_zzim_remove?id=${id}&rnum=${rnum}";
	}

</script>

</body>
</html>