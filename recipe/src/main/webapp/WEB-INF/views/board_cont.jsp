<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>이벤트 게시판 내용보기</title>
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
</head>
<body>
<div class="input-form col-md-12 mx-auto">
	<div id="boardcont_wrap">
		<h2 class="boardcont_title">이벤트 게시물 내용보기</h2>
		<table id="boardcont_t">
			<tr>
				<th>제목</th>
				<td>${bcont.board_subject}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td>
					<%--  ${board_cont} --%> 
					<pre>${bcont.board_content}</pre>
				</td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${bcont.board_readcount}</td>
			</tr>
		</table>

		<div id="boardcont_menu">
			<input type="button" value="수정" class="input_button"
				onclick="location='board_cont.do?board_num=${bcont.board_num}&page=${page}&state=edit'" />
			<input type="button" value="삭제" class="input_button"
				onclick="location='board_cont.do?board_num=${bcont.board_num}&page=${page}&state=del'" />
			<input type="button" value="답변" class="input_button"
				onclick="location='board_cont.do?board_num=${bcont.board_num}&page=${page}&state=reply'" />
			<input type="button" value="목록" class="input_button"
				onclick="location='board_list.do?page=${page}'" />
		</div>
	</div>
	</div>
</body>
</html>