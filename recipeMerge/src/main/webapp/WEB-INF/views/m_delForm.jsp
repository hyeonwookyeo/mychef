<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>


<style>
/* 전체 폼 스타일 */
#del_wrap {
  width: 400px;
  margin: 0 auto;
}

.del_title {
  text-align: center;
  font-size: 24px;
  margin-bottom: 20px;
  color: #008080;
}

#del_t {
  width: 100%;
  margin-bottom: 20px;
  border-collapse: collapse;
}

#del_t th,
#del_t td {
  padding: 10px;
  border: 1px solid #ccc;
}

#del_menu {
  text-align: center;
  margin-top: 20px;
}

/* 입력 필드 스타일 */
.input_box {
  width: 100%;
  padding: 5px;
  font-size: 16px;
  border: 1px solid #ccc;
}

.input_button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #008080;
  border: none;
  cursor: pointer;
  color: #fff;
}

.input_button:hover {
  background-color: #006666;
}
</style>

<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<script src="./js/jquery.js"></script>
<script>
 function check(){
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#delcontent").val())==""){
		 alert("탈퇴사유를 입력하세요!");
		 $("#delcontent").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>
 <div id="del_wrap">
  <h2 class="del_title">회원탈퇴</h2>
  <form method="post" action="m_delForm_ok" onsubmit="return check()"> 
  <input type="hidden" name="id" value="${sessionScope.id}">
    <table id="del_t">
     <tr>
      <th>회원아이디</th>
      <td>
    	  ${sessionScope.id}
      </td>
     </tr>
     <tr>
      <th>비밀번호</th>
      <td>
    	  <input type="password" name="pwd" id="pwd" size="14" class="input_box" />
      </td>
     </tr>
     
     <tr>
      <th>탈퇴사유</th>
      <td>
      	<textarea name="delcontent" id="delcontent" rows="7" cols="30" class="input_box"></textarea>
      </td>
     </tr>
    </table>
    
    <div id="del_menu">
     <input type="submit" value="탈퇴" class="input_button" />
     <input type="reset" value="취소" class="input_button"
     		onclick="$('#pwd').focus();" />
    </div>
  </form>
 </div>
</body>
</html>