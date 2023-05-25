var idcheckbutton = false;
var nickcheckbutton = false;

function check() {
	if ($.trim($("#id").val()) == "") {
		alert("회원아이디를 입력하세요!");
		$("#id").val("").focus();
		return false;
	}
	if(idcheckbutton == false){
		alert("아이디 중복 검사를 해주세요.");
		return false;
	}
	if ($.trim($("#nickname").val()) == "") {
		alert("회원닉네임을 입력하세요!");
		$("#nickname").val("").focus();
		return false;
	}
	if(nickcheckbutton == false){
		alert("닉네임 중복 검사를 해주세요.");
		return false;
	}
	if ($.trim($("#pwd").val()) == "") {
		alert("회원비번을 입력하세요!");
		$("#pwd").val("").focus();
		return false;
	}
	if ($.trim($("#pwd2").val()) == "") {
		alert("회원비번확인을 입력하세요!");
		$("#pwd2").val("").focus();
		return false;
	}
	if ($.trim($("#pwd").val()) != $.trim($("#pwd2").val())) {
		// !=같지않다 연산. 비번이 다를 경우
		alert("비번이 다릅니다!");
		$("#pwd").val("");
		$("#pwd2").val("");
		$("#pwd").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("회원이름을 입력하세요!");
		$("#name").val("").focus();
		return false;
	}
	
	if ($.trim($("#birth").val()).length !=6){
		alert("생년월일 6자리를 입력하세요!");
		$("#birth").val("").focus();
		return false;
	}
	if ($.trim($("#join_zip").val()) == "") {
		alert("우편번호를 입력하세요!");
		$("#zip").val("").focus();
		return false;
	}
	if ($.trim($("#join_addr1").val()) == "") {
		alert("주소를 입력하세요!");
		$("#addr1").val("").focus();
		return false;
	}
	if ($.trim($("#addr2").val()) == "") {
		alert("나머지 주소를 입력하세요!");
		$("#addr2").val("").focus();
		return false;
	}
	if ($.trim($("#phone2").val()).length != 4) {
		alert("휴대전화번호 가운데 4자리를 입력하세요");
		$("#phone2").val("").focus();
		return false;
	}
	if ($.trim($("#phone3").val()).length != 4) {
		alert("휴대전화번호 마지막 4자리를 입력하세요");
		$("#phone3").val("").focus();
		return false;
	}
	if ($.trim($("#mailid").val()) == "") {
		alert("메일 아이디를 입력하세요!");
		$("#mailid").val("").focus();
		return false;
	}
	if ($.trim($("#domain").val()) == "") {
		alert("메일 주소를 입력하세요!");
		$("#domain").val("").focus();
		return false;
	}
	if ($.trim($("#profile").val()) == "") {
		alert("프로필사진를 넣어주세요!");
		$("#profile").val("").focus();
		return false;
	}
	
	
	
	
}
/* 아이디 중복 체크 */
function id_check() {
	
	console.log("in");
	$("#idcheck").hide();
	var memid = $("#id").val();

	// 1.입력글자 길이 체크
	if ($.trim($("#id").val()).length < 4) {
		var newtext = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#id").val("").focus();
		return false;
	}
	;
	if ($.trim($("#id").val()).length > 12) {
		var newtext = '<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);// span 아이디 영역에 경고문자 추가
		$("#id").val("").focus();
		return false;
	}
	;

	// 입력아이디 유효성 검사
	if (!(validate_userid(memid))) {
		var newtext = '<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');// 문자 초기화
		$("#idcheck").show();// span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#id").val("").focus();
		return false;
	}
	;

	// 아이디 중복확인
	$.ajax({
		type : "POST",
		url : "m_idCheck",
		data : {
			"memid" : memid
		},
		success : function(data) {
//			alert("return success=" + data);
			if (data == 1) { // 중복 ID
				var newtext = '<font color="red">중복 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#id").val('').focus();
				return false;

			} else { // 사용 가능한 ID
				var newtext = '<font color="blue">사용가능한 아이디입니다.</font>';
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append(newtext);
				$("#nickname").focus();
				
				idcheckbutton = true;
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	});// $.ajax
};
/* 아이디 중복 체크 끝 */

/* 닉네임 중복 체크 */
function nickname_check() {
	
	console.log("in");
	$("#nickncheck").hide();
	var memnick = $("#nickname").val();

	// 1.입력글자 길이 체크
	if ($.trim($("#nickname").val()).length < 2) {
		var newtext2 = '<font color="red">닉네임는 2자 이상이어야 합니다.</font>';
		$("#nickncheck").text('');
		$("#nickncheck").show();
		$("#nickncheck").append(newtext2);// span 닉네임 영역에 경고문자 추가
		$("#nickname").val("").focus();
		return false;
	}
	;
	if ($.trim($("#nickname").val()).length > 10) {
		var newtext2 = '<font color="red">닉네임은 10자 이하이어야 합니다.</font>';
		$("#nickncheck").text('');
		$("#nickncheck").show();
		$("#nickncheck").append(newtext2);// span 닉네임 영역에 경고문자 추가
		$("#nickname").val("").focus();
		return false;
	}
	;

	// 입력닉네임 유효성 검사
	if (!(validate_usernick(memnick))) {
		var newtext2 = '<font color="red">닉네임은 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#nickncheck").text('');// 문자 초기화
		$("#nickncheck").show();// span 닉네임 영역을 보이게 한다.
		$("#nickncheck").append(newtext2);
		$("#nickname").val("").focus();
		return false;
	}
	;

	// 닉네임 중복확인
	$.ajax({
		type : "POST",
		url : "m_nicknCheck",
		data : {
			"memnick" : memnick
		},
		success : function(data) {
//			alert("return success=" + data);
			if (data == 1) { // 중복 닉네임
				var newtext2 = '<font color="red">중복 닉네임입니다.</font>';
				$("#nickncheck").text('');
				$("#nickncheck").show();
				$("#nickncheck").append(newtext2);
				$("#nickname").val('').focus();
				return false;

			} else { // 사용 가능한 닉네임
				var newtext2 = '<font color="blue">사용가능한 닉네임입니다.</font>';
				$("#nickncheck").text('');
				$("#nickncheck").show();
				$("#nickncheck").append(newtext2);
				$("#pwd").focus();
				
				nickcheckbutton = true;
			}
		},
		error : function(e) {
			alert("data error" + e);
		}
	});// $.ajax
};
/* 닉네임 중복 체크 끝 */

function validate_userid(memid) {
	var pattern = new RegExp(/^[a-z0-9_]+$/); // 영문 소문자,숫자 ,_가능,정규표현식
	return pattern.test(memid);
};

function validate_usernick(memnick) {
	var pattern = new RegExp(/^[a-z0-9_]+$/); // 영문 소문자,숫자 ,_가능,정규표현식
	return pattern.test(memnick);
};

//메일 선택창
function domain_list() {
	var num = f.mail_list.selectedIndex;
	/*
	 * selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	 */
	if (num == -1) { // num==-1은 해당 리스트목록이 없다

		return true;
	}

	if (f.mail_list.value == "0") { // 직접입력
		f.domain.value = "";
		f.domain.readOnly = false;
		f.domain.focus();
	} else { // 리스트목록을 선택했을때
		f.domain.value = f.mail_list.options[num].value;
		f.domain.readOnly = true;
	}
}

/* 회원정보 수정 경고창 */
function edit_check() {
	if ($.trim($("#pwd").val()) == "") {
		alert("회원비번을 입력하세요!");
		$("#pwd").val("").focus();
		return false;
	}
	if ($.trim($("#pwd2").val()) == "") {
		alert("회원비번확인을 입력하세요!");
		$("#pwd2").val("").focus();
		return false;
	}
	if ($.trim($("#pwd").val()) != $.trim($("#pwd2").val())) {
		// !=같지않다 연산. 비번이 다를 경우
		alert("비번이 다릅니다!");
		$("#pwd").val("");
		$("#pwd2").val("");
		$("#pwd").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("회원이름을 입력하세요!");
		$("#name").val("").focus();
		return false;
	}
	if ($.trim($("#join_zip").val()) == "") {
		alert("우편번호를 입력하세요!");
		$("#zip").val("").focus();
		return false;
	}
	if ($.trim($("#join_addr1").val()) == "") {
		alert("주소를 입력하세요!");
		$("#addr1").val("").focus();
		return false;
	}
	if ($.trim($("#addr2").val()) == "") {
		alert("나머지 주소를 입력하세요!");
		$("#addr2").val("").focus();
		return false;
	}
	if ($.trim($("#phone2").val()).length != 4) {
		alert("휴대전화번호 가운데 4자리를 입력하세요");
		$("#phone2").val("").focus();
		return false;
	}
	if ($.trim($("#phone3").val()).length != 4) {
		alert("휴대전화번호 마지막 4자리를 입력하세요");
		$("#phone3").val("").focus();
		return false;
	}
	if ($.trim($("#mailid").val()) == "") {
		alert("메일 아이디를 입력하세요!");
		$("#mailid").val("").focus();
		return false;
	}
	if ($.trim($("#domain").val()) == "") {
		alert("메일 주소를 입력하세요!");
		$("#domain").val("").focus();
		return false;
	}
	if ($.trim($("#profile").val()) == "") {
		alert("프로필사진를 넣어주세요!");
		$("#profile").val("").focus();
		return false;
	}
}
