<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#join_Id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#join_Id").focus();
					return false;
				}
				if($("#join_Pass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#join_Pass").focus();
					return false;
				}
				if($("#join_Name").val()==""){
					alert("성명을 입력해주세요.");
					$("#join_Name").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/register" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="join_Id">아이디</label>
					<input class="form-control" type="text" id="join_Id" name="join_Id" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="join_Pass">패스워드</label>
					<input class="form-control" type="password" id="join_Pass" name="join_Pass" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="join_Name">성명</label>
					<input class="form-control" type="text" id="join_Name" name="join_Name" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>