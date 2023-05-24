<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="/css/bootstrap.css">
<!--  부트스트랩 js 사용 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">


<style>
.a {
	width: 177px;
	margin: 0 auto;
	/*  background-color: #CFE5B8;  */
	line-height: 2.3em;
	font-size: 1em;
	color: #aaa;
	margin-top: 1em;
	margin-bottom: 1em;
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}

.a h4 {
	text-align: left;
	margin-bottom: 5px;
}

#sign_up {
	margin-top: 20px;
}
</style>

</head>

<body>
	<h2 align="center">관리자</h2>
	<form method="post" action=a_loginForm id="tab1" align="center">
		<div class="a">
			<h4 class="empty">ID</h4>
			<input type="text" name="admin_id" id="admin_id"
				placeholder="ID를 입력하세요." required="required">

			<h4 class="empty">비밀번호</h4>
			<input type="password" name="admin_pwd" id="admin_pwd"
				placeholder="비밀번호를 입력하세요." class="mem1" required="required">
			<div class="position1">
				<input type="submit" value="로그인" id="sign_up">
			</div>
		</div>
	</form>
</body>
</html>