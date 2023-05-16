<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>이벤트 게시판 입력폼</title>
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
	<script src="<%=request.getContextPath() %>/js/board.js"></script>
</head>
<body>
 <div class="input-form col-md-12 mx-auto">
 <div id="bbswrite_wrap">
  <h2 class="bbswrite_title">이벤트 게시판 입력폼</h2>
  <form method="post" action="<%=request.getContextPath() %>/board_write.do" onSubmit="return board_check()">
   <table id="bbswrite_t">
    <tr>
     <th>회원 이름</th>
     <td>
     <input name="board_name" id="board_name" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
      <input type="password" name="board_pass" id="board_pass" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글제목</th>
     <td>
      <input name="board_subject" id="board_subject" size="40" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="board_content"  id="board_content" rows="8" cols="50" class="input_box"></textarea>
     </td>
    </tr> 
    
   </table>
   
   <div id="bbswrite_menu">
    <input type="submit" value="등록" class="input_button" />
    <input type="reset" value="취소" class="input_button" onclick="$('#board_name').focus();" />
    
 
   </div>
  </form>
 </div>
 </div>
</body>
</html>