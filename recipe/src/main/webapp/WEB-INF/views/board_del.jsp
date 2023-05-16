<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>]게시물 삭제</title>
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
 	 function del_check(){
		  if($.trim($("#pwd").val())==""){
			  alert("삭제 비번을 입력하세요!");
			  $("#pwd").val("").focus();
			  return false;
	 	 }
  	}
	</script>
</head>

<body>
<div class="input-form col-md-12 mx-auto">
 <div id="boarddel_wrap">
  <h2 class="boarddel_title">게시물 삭제</h2>
  <form method="post" action="board_del_ok.do" onsubmit="return del_check()">
  <input type="hidden" name="board_num" value="${bcont.board_num}" />
  <input type="hidden" name="page" value="${page}" />
   <table id="boarddel_t">
    <tr>
     <th>삭제 비밀번호</th>
     <td>
      <input type="password" name="pwd" id="pwd" size="14" class="input_box" />
     </td>
    </tr>
   </table>
   <div id="boarddel_menu">
    <input type="submit" value="삭제" class="input_button" />
    <input type="reset" value="취소" class="input_button" onclick="$('#pwd').focus();" />
   </div>
  </form>
 </div>
 </div>
</body>
</html>
