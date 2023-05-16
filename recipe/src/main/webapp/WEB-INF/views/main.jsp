<!-- 메인페이지 테스트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.nav{
      height: 70px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1000px;
      margin:auto;
}
.nav.logo img {
width: 100px;
}
.nav.nav_but a {
text-decoration: none;
padding-left:20px;
padding-right: 20px;
color:black;

}
.header{
background: url(123.jpg);
background-postion:center;
background-size: cover;
height:700px;
display: flex;
align-items:center;
justify-content: center;
}
.header.title {
text-align : center;
}
.header.title img {
width:100px;
}
.header.title h1{
font-size:40px;
color:#444;
letter-spacing: 0.2em;
margin-botoon:0;
}


</style>
<title>Insert title here</title>
</head>
<body>
<div class ="nav">
<div class ="logo"></div>
<img src="./images/cook.jpg" alt="">
</div>
<div class="nav_but">
     <a href="location.href='member_join">마이페이지</a>
     <a href="location.href='member_edit">페이지2</a>
     <a href="location.href='member_edit">페이지3</a>
</div>

<seciton class="header">
<div class="title">
<img src="./imgages/123.jpg" alt="">
<h1>Next Le시피</h1>
<p>Next Le시피♥</p>
</div>
</seciton>

메인페이지 테스트 <br><br>

테이블 전달테스트 <br>
<form action="main_test">
	<input type="text" name="name"> <br>
	<input type="text" name="age"> <br>
	<input type="submit" value="테스트"> <br>
</form>


<input type="button" value="회원가입폼"  onClick="location.href='member_join' "/>
<input type="button" value="회원수정폼"  onClick="location.href='member_edit' "/>
<input type="button" value="로그인폼"  onClick="location.href='member_login' "/>
<input type="button" value="회원삭제폼"  onClick="location.href='member_del' "/>
<input type="button" value="게시판폼"  onClick="location.href='board_cont' "/>
<input type="button" value="게시판삭제폼"  onClick="location.href='board_del' "/>
<input type="button" value="게시판수정폼"  onClick="location.href='board_edit' "/>
<input type="button" value="게시판리스트"  onClick="location.href='board_list' "/>
<input type="button" value="답변달기"  onClick="location.href='board_reply' "/>
<input type="button" value="게시판 입력폼"  onClick="location.href='board_write' "/>
</body>
</html>