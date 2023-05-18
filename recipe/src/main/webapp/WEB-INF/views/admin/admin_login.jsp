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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<!-- <link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/bootstrap_20211222.css" />
<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/font_20221221.css" />
<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/ez_recipe_20220322.css" /> -->

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
<%-- <div class="header">
	<div class="logo-line">
	<div class="logo">
	   <h2 align="center">요리의 민족</h2>
		<a href="admin_view"><img src="${path}/images/free-icon-chef-10626633 (1).png"></a>
		
		
	</div> --%>
	
	
<!-- 	<div class="container_etc" style="width:460px;">
    <h2>로그인 / 회원가입</h2> -->
    <!--div class="guide_txt" style="text-align: center; padding-top: 0; font-weight: 300;">5초안에 간편하게 시작하세요</div-->
        <!--div class="join_btn2_n">
            <button type="submit" onclick="loginWithNaver()" class="btn"><span>네이버로 간편 시작</span></button>
        </div-->
        
   <!--      <form name="form_login" id="formLogin" method="post" action="https://www.10000recipe.com/user/login_confirm.html" autocomplete="off" onsubmit="return doSubmit()">
            <input type="hidden" name="q_mode" value="check">
            <input type="hidden" name="q_path" value="https://www.10000recipe.com/">
            <div class="form_login_in" style="padding-right:22px;">
                <input type="text" name="id_user" class="" id="id_user" placeholder="아이디">
                <span id="idMsg" style="display:none; color:#FF0000;">아이디를 입력해주세요.</span>
            </div>
            <div class="form_login_in">
                <input type="password" name="tx_passwd" class="" id="tx_passwd" placeholder="비밀번호">
                <span id="pwMsg" style="display:none;color:#FF0000;">비밀번호를 입력해주세요.</span>
            </div> -->
           <!--  <div class="checkbox">
                <label>
                    <input type="checkbox" name="login_perma" value="1"><span class="guide_txt">로그인 상태 유지</span>
                </label>
            </div> -->
         <!--    <div class="form_login_btn">
                <button type="submit">로그인</button>
            </div>
        </form>
  
    </div> -->
	

	<h2 align="center">관리자</h2>
	<form method="post" action="admin_login" id="tab1" align="center">
	<div class="a">
		<h4 class="empty">ID</h4>
		<input type="text" name="admin_id" id="admin_id" placeholder="ID를 입력하세요." required="required">

		<h4 class="empty">비밀번호</h4>
		<input type="password" name="admin_pwd" id="admin_pwd"	placeholder="비밀번호를 입력하세요." class="mem1" required="required">
		<div class="position1">
			<input type="submit" value="로그인" id="sign_up">
		</div>
	</div>
	</form>
</body>
</html>