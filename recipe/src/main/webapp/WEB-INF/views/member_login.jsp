<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
    </style>
</head>
  <body class="text-center">




</head>
<body>
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
          onclick="location='member_join'" />
    <input type="button" value="ID찾기" class="input_button"
          onclick="location='id_find'" />
    <input type="button" value="비밀번호 찾기" class="input_button"
          onclick="location='pwd_find'" />
   
    </div>
   </form>
 </div>
</body>
</html>