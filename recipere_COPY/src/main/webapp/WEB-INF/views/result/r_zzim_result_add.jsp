<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
if(${result}==1){
	alert("찜하기 완료!");
//	location.href="r_view?rnum=${board.rnum }"
	history.go(-1);
}else{
	alert("찜하기 실패! 다시 시도해 주세요.");
	history.go(-1);
}
</script>
