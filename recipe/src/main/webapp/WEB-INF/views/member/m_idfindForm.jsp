<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="./js/jquery.js"></script>
<script>
 function check(){
	 if($.trim($("#name").val())==""){
		 alert("성함을 입력하세요");
		 $("#name").val("").focus();
		 return false;
	 }
	 if($.trim($("#birth").val())==""){
		 alert("생년월일 6자리를 입력하세요");
		 $("#birth").val("").focus();
		 return false;
	 }
	 
 }
</script>
</head>
<body>
 <div id="id_wrap">
 
 <c:if test="${empty member}">
  <h2 class="id_title">아이디 찾기</h2>
  <form method="post" action= "id_find_ok" onsubmit="return check()">
   <table id="id_t">
    <tr>
     <th>성함</th>
     <td><input name="name" id="name" size="14" class="input_box" /></td>
    </tr>
    
    <tr>
     <th>생년월일 6자리</th>
     <td><input name="birth" id="birth" size="14" class="input_box" /></td>
    </tr>
   </table>
   <div id="id_menu">
    <input type="submit" value="찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button" onclick="$('#name').focus();"/>
   </div>
   <div id="id_close">
    <input type="button" value="닫기" class="input_button" onclick="self.close();" />
   </div>
  </form>
  </c:if> 
  <c:if test="${!empty member}">
   <h2 class="id_title2">아이디찾기 결과</h2>
   <table id="id_t2">
    <tr>
      <th>검색한 아이디:</th>
      <td>${member.id}</td>
    </tr>
   </table>
   <div id="id_close2">
   		<input type="button" value="닫기" class="input_button" onclick="self.close();" />		
   </div>
  </c:if>
 
 </div>
</body>
</html>