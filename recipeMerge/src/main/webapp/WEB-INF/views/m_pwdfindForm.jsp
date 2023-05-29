<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="./js/jquery.js"></script>
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>

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

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="/css/bootstrap.css">
<!--  부트스트랩 js 사용 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">

<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	overflow: hidden;
}

.wave {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 100%;
	z-index: -1;
}

.container {
	width: 100vw;
	height: 100vh;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 7rem;
	padding: 0 2rem;
}

.img {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.pwdwrap {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	text-align: center;
}

.img img {
	width: 500px;
}

form {
	width: 360px;
}

.pwdwrap img {
	height: 100px;
}

.pwdwrap h2 {
	margin: 15px 0;
	color: #333;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.pwdwrap .input-div {
	position: relative;
	display: grid;
	grid-template-columns: 7% 93%;
	margin: 25px 0;
	padding: 5px 0;
	border-bottom: 2px solid #d9d9d9;
}

.i {
	color: #d9d9d9;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i {
	transition: .3s;
}

.input-div>div {
	position: relative;
	height: 45px;
}

.input-div>div>h5 {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 18px;
	transition: .3s;
}

.input-div:before, .input-div:after {
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: #38d39f;
	transition: .4s;
}

.input-div:before {
	right: 50%;
}

.input-div:after {
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after {
	width: 50%;
}

.input-div.focus>div>h5 {
	top: -5px;
	font-size: 15px;
}

.input-div.focus>.i>i {
	color: #38d39f;
}

.input-div>div>input {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	background: none;
	padding: 0.5rem 0.7rem;
	font-size: 1.2rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass {
	margin-bottom: 4px;
}

.input-div.findpass {
	margin-bottom: 4px;
}

a {
	display: block;
	text-align: right;
	text-decoration: none;
	color: #999;
	font-size: 0.9rem;
	transition: .3s;
}

a:hover {
	color: #38d39f;
}

.btn {
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
}

.btn:hover {
	background-position: right;
}

@media screen and (max-width: 1050px) {
	.container {
		grid-gap: 5rem;
	}
}

@media screen and (max-width: 1000px) {
	form {
		width: 290px;
	}
	.login-content h2 {
		font-size: 2.4rem;
		margin: 8px 0;
	}
	.img img {
		width: 400px;
	}
}

@media screen and (max-width: 900px) {
	.container {
		grid-template-columns: 1fr;
	}
	.img {
		display: none;
	}
	.wave {
		display: none;
	}
	.login-content {
		justify-content: center;
	}
}
</style>

</head>


<body>
<body>
	<img class="wave"
		src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="images/logo.png" alt="이미지" />

		</div>


		<div id="pwd_wrap" class="pwdwrap">
			<c:if test="${empty member}">
				<form method="post" action="m_pwdfindokForm"
					onsubmit="return check()">
					<h2 class="id_title">비밀번호 찾기</h2>
					<div class="input-div one">
						<div class="i">
							<i class="fas fa-user"></i>
						</div>
						<div class="div">
							<input name="id" id="id" type="text" placeholder=ID
								class="input">
						</div>
					</div>
					<div class="input-div user">
						<div class="i">
							<i class="fas fa-lock"></i>
						</div>
						<div class="div">
							<input name="name" id="name" type="text" placeholder=이름
								class="input">
						</div>
					</div>
					<br> <br> <input type="submit" class="btn" value="조회">
					<input type="button" value="닫기" class="btn"
							onclick="location='m_loginForm'" />

				</form>

			</c:if>

			<c:if test="${!empty pwdok}">
				<form method="post" action="m_passfindokForm"
					onsubmit="return check()">
					<script>
					alert("${pwdok}");
					</script>
			</c:if>		
			</form>

</body>
</html>