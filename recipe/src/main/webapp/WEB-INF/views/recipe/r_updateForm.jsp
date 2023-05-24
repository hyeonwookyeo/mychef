<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 수정</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript">
	var i = 2;

	$(document).on('click', "[name='ingre_del']", function() {
		var tr = $(this).parent().parent().parent();
		var row_idx = parseInt($(".row_idx").text());
		if(row_idx==1){
			alert("재료는 한가지 이상 입력해야 합니다.");
		}else{
		$("#tbody_id:last > tr:last").remove();
		}
	});

	function cook_del() {
		$("#tbody_id2:last > tr:last").remove();
		$("#tbody_id2:last > tr:last").remove();
	}

	function ingre_add() {
		var row_idx = parseInt($(".row_idx:last").text()) + 1;
		if (!row_idx) {
			row_idx = 1;
		}
		var str = "";

		str += "<tr>";
		str += "	<td style='text-align:center;' class=\"row_idx\">" + row_idx + "</td>";
		str += "	<td style='text-align:center;'><input type=\"text\" name='ingre'></td>";
		str += "	<td style='text-align:center;'><input type=\"text\" name='capacity'></td>";
		str += "	<td style='text-align:center;'>";
		str += "		<div class=\"btn-group\">";
		str += "			<button type='button' class='btn btn-primary btn-sm' name='ingre_del'>삭제</button>";
		str += "		</div>";
		str += "	</td>";
		str += "</tr>";

		$("#tbody_id:last").append(str);
	}

	function cook_add() {
		var str = "";
		var r_fileCnt = $("input[name='r_file1']").length + 1;
		
		
		str += "<tr>";
		str += "	<td>조리사진</td>";
		str += "	<td>" + r_fileCnt +"</td>";
		str += "	<td><input multiple=\"multiple\" type=\"file\" name='r_file1' onchange=\"readURL(this, 'cook" + r_fileCnt + "');\" id=\"r_file" + r_fileCnt + "\">";
		str += "		<img id=\"cook" + r_fileCnt + "\" src=\"images/Plus.jpg\" width=300 height=350 class=\"preview\"/></td>";
		str += "</tr>";
		str += "<tr>";
		str += "	<td>내용</td>";
		str += "	<td><textarea rows=\"5\" cols=\"30\" name='content1'></textarea></td>";
		str += "</tr>";

		$("#tbody_id2:last").append(str);
	}

	$(document).on('click', '.preview', function(e) {
		var id = $(this).attr('id');
		e.preventDefault();
		if (id == 'cookmain') {
			$('#thumbnail1').click();
		} else if (id.startsWith('cook')) {
			var num = id.substring(4);
			$("#r_file" + num).click();
		}
	});

	$(function() {
		$('#sub').click(function() {
			
// 유효성 검사
			
			// 썸네일 유효성검사 변수
			var t_imgFile = $('#thumbnail1').val();
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;		// 정규표현식
			var maxSize = 100 * 1024 * 1024;							// 파일 최대크기
			var t_fileSize;												// 실제 업로드할 파일 크기
			
			// 조리사진 유효성검사 변수
			var r_fileCnt = $("input[name='r_file1']").length;
			var r_imgFile;		
			var r_fileSize;
		
			
			
			// subject
			if($.trim($("#subject").val())==""){
				alert("제목을 입력해야합니다.");
				$("#subject").focus();
				return false;
			}
			
			
			// category
			if(($("#category").val())==""){
				alert("레시피 분류를 선택해야합니다.");
				$("#category").focus();
				return false;
			}
			
			
			if(t_imgFile != "") {
				t_fileSize = document.getElementById("thumbnail1").files[0].size;
			    
			    if(!t_imgFile.match(fileForm)) {
			    	alert("이미지 파일만 업로드 가능합니다.");
			        return false;
			    } else if(t_fileSize > maxSize) {
			    	alert("파일 사이즈는 5MB까지 가능합니다.");
			        return false;
			    }
			}
			
			
			// description
			if(($("#description").val())==""){
				alert("레시피에 대한 간략한 설명을 작성해주세요.");
				$("#description").focus();
				return false;
			}
			
			// ingre
			if(($("#ingre").val())==""){
				alert("재료를 최소 한개 이상 입력해주세요.");
				$("#ingre").focus();
				return false;
			}
			
			// capacity
			if(($("#capacity").val())==""){
				alert("용량을 입력해주세요.");
				$("#capacity").focus();
				return false;
			}
			
			
			// content1
			if(($("#content1").val())==""){
				alert("조리과정 설명을 입력해주세요.");
				$("#content1").focus();
				return false;
			}
			
			$('form').serialize();
			$('form').attr('method', 'POST');
			$('form').attr('action', 'r_update');
			$('form').submit();
		});
		
		
		$("#cancel").click(function(){
			if(confirm("수정을 취소하고 글로 돌아가시겠습니까?")){
				history.go(-1);
			}
		})
	});
	
	

	function readURL(input, imgId) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById(imgId).src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else {
			document.getElementById(imgId).src = "images/Plus.jpg";
		}
	}
		
</script>
<style type="text/css">
input[type=file] {
	display: none;
}
</style>

</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">레시피 수정하기</h2>
		<form enctype="multipart/form-data">
		<input type="hidden" name="rnum" value=${board.rnum }>
		
			<table border=1>
				<tr>
					<td>제목</td>
					<td><input type="text" id="subject" name="subject" value="${board.subject }"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td><select id="category" name="category">
							<option value="">선택</option>
							<option value="korean"<c:if test="${board.category == 'korean'}">selected</c:if>>한식</option>
							<option value="chinese"<c:if test="${board.category == 'chinese'}">selected</c:if>>중식</option>
							<option value="japanese"<c:if test="${board.category == 'japanese'}">selected</c:if>>일식</option>
							<option value="western"<c:if test="${board.category == 'western'}">selected</c:if>>양식</option>
					</select></td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td><input type="file" id="thumbnail1" name="thumbnail1"
						onchange="readURL(this,'cookmain');">
						<img id="cookmain" src="./t_images/${board.thumbnail }" width=300 height=350 class="preview"/></td>
				</tr>
				<tr>
					<td>간략한 설명</td>
					<td><input type="text" id="description" name="description" value="${board.description }"></td>
				</tr>
			</table>
			<br>
			<br>

			<table border=1>
				<thead>
					<tr>
						<th
							style="width: 20%; text-align: center; vertical-align: middle;">No</th>
						<th
							style="width: 20%; text-align: center; vertical-align: middle;">재료</th>
						<th
							style="width: 20%; text-align: center; vertical-align: middle;">용량</th>
						<th
							style="width: 20%; text-align: center; vertical-align: middle;">추가/삭제</th>
					</tr>
				</thead>
				<tbody id="tbody_id">
				<c:forEach var="item1" items="${map1 }">
				<c:set var="i" value="${i+1}"/>
					<tr>
						<td style='text-align:center;' class="row_idx">${i }</td>
						<td style='text-align:center;'><input type="text" name='ingre' value="${item1.key }"></td>
						<td style='text-align:center;'><input type="text" name='capacity' value="${item1.value }"></td>
						<td style='text-align:center;'>
						<div class="btn-group">
							<button type='button' class='btn btn-primary btn-sm' name='ingre_del'>삭제</button>
						</div>
						</td>
					</tr>
				</c:forEach> 	
				</tbody>
				<tr>
					<td colspan=3></td>
					<td style="width: 20%; text-align: center; vertical-align: middle;">
						<button class="btn btn-default btn-sm" type="button"
							onclick='ingre_add();'>
							<strong>재료 추가</strong>
						</button>
					</td>
				</tr>
			</table>
			<br>
			<br>

			<table border=1>

			<tbody id="tbody_id2">
			<c:forEach var="item2" items="${map2 }">
			<c:set var="j" value="${j+1}"/>
			<tr>
				<td>조리사진</td>
				<td>${j }</td>
				<td><input multiple type="file" name='r_file1' id="r_file${j }"
						onchange="readURL(this,'cook${j}');">
				<img src="./r_images/${item2.key }" id="cook${j }" width=300 height=250 class="preview"/>
				</td>
			</tr>

 			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="30" name='content1'>${item2.value }</textarea></td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
			<br>

			<table>
				<tr>
					<td>
						<button type="button" class="btn btn-default btn-sm"
							onClick='cook_add();'>
							<strong>조리과정 추가</strong>
						</button>
						<button type="button" class="btn btn-default btn-sm"
							onClick='cook_del();'>
							<strong>조리과정 삭제</strong>
						</button>
					</td>
				</tr>
			</table>
			<br>
			<br> 
			<input type="button" value="확인" id="sub">
			<input type="reset" value="취소">
			<button type="button" id="cancel">돌아가기</button>

		</form>
	</div>
</body>
</html>