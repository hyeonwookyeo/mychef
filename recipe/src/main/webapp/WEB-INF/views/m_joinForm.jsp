<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('join_zip').value = data.zonecode;
				document.getElementById('join_addr1').value = data.address;
			}
		}).open();
	}
</script>

</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원가입</h2>
		<form name="f" method="post" action="m_joinOk"
			onsubmit="return check()" enctype="multipart/form-data">

			<table id="join_t">
				<tr>
					<th>회원아이디</th>
					<td><input name="id" id="id" size="14" class="input_box" /> 
					<input type="button" value="아이디 중복체크" class="input_button" onclick="id_check()" />
					<div id="idcheck"></div></td>
				</tr>
				
				<tr>
					<th>회원닉네임</th>
					<td><input name="nickname" id="nickname" size="14" class="input_box" /> <input
						type="button" value="닉네임 중복체크" class="input_button"
						onclick="nickname_check()" />
						<div id="nickncheck"></div></td>
				</tr>
				

				<tr>
					<th>회원 비밀번호</th>
					<td><input type="password" name="pwd" id="pwd" size="14"
						class="input_box" /></td>
				</tr>
				
				<tr>
					<th>회원 비밀번호 확인</th>
					<td><input type="password" name="pwd2" id="pwd2" size="14"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>회원 이름</th>
					<td><input name="name" id="name" size="14" class="input_box" />
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td><input name="birth" id="birth" size="6" placeholder = "(6자리)" class="input_box" />
					</td>
				</tr>

				<tr>
					<th>우편번호</th>
					<td><input name="zip" id="join_zip" size="5" class="input_box"
						readonly onclick="post_search()" /> 
						<input type="button" value="우편번호 검색" class="input_box" onclick="openDaumPostcode()" />
					</td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input name="addr1" id="join_addr1" size="50"
						class="input_box" readonly onclick="post_search()" /></td>
				</tr>

				<tr>
					<th>나머지 주소</th>
					<td><input name="addr2" id="addr2" size="40"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>휴대전화번호</th>
					<td><%@ include file="/WEB-INF/views/phone_number.jsp"%>
						<select name="phone1">
							<c:forEach var="p" items="${phone}" begin="0" end="5">
								<option value="${p}">${p}</option>
							</c:forEach>
					</select>-<input name="phone2" id="phone2" size="4" maxlength="4"
						class="input_box" />-<input name="phone3" id="phone3" size="4"
						maxlength="4" class="input_box" /></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input name="mailid" id="mailid" size="10" class="input_box" />@<input
						name="domain" id="domain" size="20" class="input_box" readonly />
						<!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 --> <select
						name="mail_list" onchange="domain_list()">
							<option value="">=이메일선택=</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="0">직접입력</option>
					</select></td>
				</tr>

				<tr>
					<th>프로필사진</th>
					<td><input type="file" id = "profile" name="profile1" /></td>
				</tr>
			</table>

			<div id="join_menu">
			 <input type="submit" value="회원가입" class="input_button" />
			 <input type="reset" value="가입취소" class="input_button" 
			 	onclick="$('#id').focus();"/>		 
			</div>
		</form>
	</div>
</body>
</html>