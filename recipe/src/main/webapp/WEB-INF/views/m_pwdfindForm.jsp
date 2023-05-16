<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script src="./js/jquery.js"></script>
<script>
 function check(){
	 if($.trim($("#id").val())==""){
		 alert("ID 입력하세요");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#name").val())==""){
		 alert("성함을 입력하세요");
		 $("#name").val("").focus();
		 return false;
	 }
	 
 }
</script>
</head>
<body>
 <div id="pwd_wrap">
 
 <c:if test="${empty pwdok}">
  <h2 class="id_title">비밀번호 찾기</h2>
  <form method="post" action= "pwd_find_ok" onsubmit="return check()">
   <table id="pwd_t">
    <tr>
     <th>아이디</th>
     <td><input name="id" id="id" size="14" class="input_box" /></td>
    </tr>
    
    <tr>
     <th>성함</th>
     <td><input name="name" id="name" size="14" class="input_box" /></td>
    </tr>
   </table>
   <div id="pwd_menu">
    <input type="submit" value="찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button" onclick="$('#id').focus();"/>
   </div>
   <div id="pwd_close">
    <input type="button" value="닫기" class="input_button" onclick="self.close();" />
   </div>
  </form>
  </c:if> 
  <c:if test="${!empty pwdok}">
   <h2 class="id_title2">비밀번호 찾기 결과</h2>
   <table id="id_t2">
    <tr>
      <th>검색한 비밀번호:</th>
      <td>${pwdok}</td>
    </tr>
   </table>
   <div id="id_close2">
   		<input type="button" value="닫기" class="input_button" onclick="self.close();" />		
   </div>
  </c:if>
 
 </div>
</body>
</html>