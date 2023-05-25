function sub() {
	if ($.trim($("#subject").val()) == "") {
		alert("제목을 입력하세요!");
		$("#subject").val("").focus();
		return false;
	}

	if ($.trim($("#content").val()) == "") {
		alert("내용을 입력하세요!");
		$("#content").val("").focus();
		return false;
	}


	// 썸네일 유효성검사 변수
	if(($("magafile").val())!=""){

		var t_imgFile = $('#magafile').val();
		var fileForm = /(.?).(jpg|jpeg|png|gif|bmp|pdf)$/; // 정규표현식
		var maxSize = 5 * 1024 * 1024; // 파일 최대크기
		var t_fileSize = document.getElementById("magafile").files[0].size;

		if (!t_imgFile.match(fileForm)) {
			alert("이미지 파일만 업로드 가능합니다.");
			return false;
		} else if (t_fileSize > maxSize) {
			alert("파일 사이즈는 5MB까지 가능합니다.");
			return false;
		}


	}
}