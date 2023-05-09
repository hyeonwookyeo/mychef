<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#login_wrap {
	width: 400px; /* 로그인 폼 너비 */
	margin: 0 auto; /* 수평 중앙 정렬 */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
}
</style>
<script>
	function check() {
		if ($.trim($("#id").val()) == "") {
			alert("아이디를 입력해주세요");
			$("#id").val("").focus();
			return false;
		}
		if ($.trim($("#pwd").val()) == "") {
			alert("비밀번호를 입력해주세요");
			$("#pwd").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="login_wrap">
		<h2 class="loin_title">로그인</h2>
		<form method="post" action="member_login_ok.do"
			onsubmit="return check()">
			<table id="login_t">
				<tr>
					<th>아이디</th>
					<td><input name="id" id="id" size="20" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" id="pwd" size="20"
						class="input_box" /></td>
				</tr>
			</table>
			<br>
			<div id="login_menu">
				<input type="submit" value="로그인" class="input_button" /> <input
					type="reset" value="취소" class="input_button"
					onclick="$('#id').focus();" /> <input type="button" value="회원가입"
					class="input_button" onclick="location='member_join'" /> <input
					type="button" value="ID찾기" class="input_button"
					onclick="location='id_find'" /> <input type="button"
					value="비밀번호 찾기" class="input_button" onclick="location='pwd_find'" />

			</div>
		</form>
	</div>
</body>
</html>
