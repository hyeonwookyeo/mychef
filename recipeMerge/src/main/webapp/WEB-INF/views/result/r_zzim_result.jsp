<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
if(${result}==0){
	location.href="r_zzim_add?id=${id}&rnum=${rnum}";
}else{
	alert("삭제하시겠습니까?");
	location.href="r_zzim_remove?id=${id}&rnum=${rnum}";
}
</script>