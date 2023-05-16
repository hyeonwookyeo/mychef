<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 폼</title>
<style>
    body {
      min-height: 100vh;
 text-align: center;
      background: -webkit-gradient(linear, left bottom, right top, from(#008000), to(#2ca38f));
      background: -webkit-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
      background: -moz-linear-gradient(bottom left, #008000 0%, #2ca38f 100%);
      background: -o-linear-gradient(bottom left, #008000 0%,#2ca38f 100%);
      background: linear-gradient(to top right, #008000 0%, #2ca38f 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
<script>
 function check(){
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#del_cont").val())==""){
		 alert("탈퇴사유를 입력하세요!");
		 $("#del_cont").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>
 <div class="input-form col-md-12 mx-auto">
 <div id="del_wrap">
  <h2 class="del_title">회원탈퇴</h2>
  <form method="post" action="member_del_ok.do" onsubmit="return check()">
    <table id="del_t">
     <tr>
      <th>회원아이디</th>
      <td>
      ${d_id}
      </td>
     </tr>
     
     <tr>
      <th>회원이름</th>
      <td>${d_name}</td>
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
      <textarea name="del_cont" id="del_cont" rows="7" cols="30" class="input_box"></textarea>
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
  </div>
</body>
</html>