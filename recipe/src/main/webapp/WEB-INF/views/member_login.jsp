<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
 function check(){
    if($.trim($("#id").val())==""){
       alert("아이디를 입력해주세요");
       $("#id").val("").focus();
       return false;
    }
    if($.trim($("#pwd").val())==""){
       alert("비밀번호를 입력해주세요");
       $("#pwd").val("").focus();
       return false;
    }
 }
</script>
</head>
</head>
<body>
  <div class="input-form col-md-12 mx-auto">
 <div id="login_wrap">
  <h2 class="loin_title">로그인</h2>
  <form method="post" action="member_login_ok.do" onsubmit="return check()">
   <table id="login_t">
    <tr>
     <th>아이디</th>
     <td>
     <input name="id" id="id" size="20" class="input_box" />
     </td>
    </tr>
    
     <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="password" id="pwd" size="20" class="input_box" />
     </td>
    </tr>
   </table>
    <div id="login_menu">
    <input type="submit" value="로그인" class="input_button" />
    <input type="reset" value="취소" class="input_button"
          onclick="$('#id').focus();"/>
    <input type="button" value="회원가입" class="input_button"
          onclick="location='member_join.do'" />
    <input type="button" value="ID찾기" class="input_button"
          onclick="location='id_find'" />
    <input type="button" value="비밀번호 찾기" class="input_button"
          onclick="location='pwd_find'" />
    </div>
   </form>
 </div>
 </div>
</body>
</html>