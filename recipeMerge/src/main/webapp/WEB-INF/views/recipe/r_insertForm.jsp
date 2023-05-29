<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피글 입력</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>

<script type="text/javascript">
	var i = 2;			// 조리사진 추가시, img 태그당 증가 id값 (초기출력번호 1)
	var j = 2;			// 조리사진 추가시, input 태그당 증가 id값
	
	// 재료 폼 삭제버튼
	$(document).on('click', "[name='ingre_del']", function() {
		var tr = $(this).parent().parent().parent();
		var row_idx = parseInt($(".row_idx").text());
		if(row_idx==1){
			alert("재료는 한가지 이상 입력해야 합니다.");
		}else{
		$("#tbody_id:last > tr:last").remove();
		}
	});
	
	
	// 조리과정사진 + 조리과정내용 폼 삭제버튼
	function cook_del() {
		$("#tbody_id2:last > tr:last").remove();
		$("#tbody_id2:last > tr:last").remove();
		i--;
	}
	
	// 재료 폼 추가 버튼
	function ingre_add() {
		var row_idx = parseInt($(".row_idx:last").text()) + 1;
		if (!row_idx) {
			row_idx = 1;
		}
		var str = "";

		str += "<tr style='border: 1px solid black;'>";
		str += "	<td style='border: 1px solid black; text-align:center;' class=\"row_idx\">" + row_idx + "</td>";
		str += "	<td style='border: 1px solid black; text-align:center;'><input type=\"text\" id='ingre' name='ingre'></td>";
		str += "	<td style='border: 1px solid black; text-align:center;'><input type=\"text\" id='capacity' name='capacity'></td>";
		str += "	<td style='border: 1px solid black; text-align:center;'>";
		str += "		<div class=\"btn-group\">";
		str += "			<button type='button' class='btn btn-primary btn-sm' name='ingre_del'>삭제</button>";
		str += "		</div>";
		str += "	</td>";
		str += "</tr>";

		$("#tbody_id:last").append(str);
	}
	
	
	// 조리과정사진 + 조리과정내용 추가 버튼
	function cook_add() {
		var str = "";

		str += "<tr style='border: 1px solid black;'>";
		str += "	<td style='border: 1px solid black;'>조리과정 사진</td>";
		str += "	<td><input multiple=\"multiple\" type=\"file\" name='r_file1' onchange=\"readURL(this, 'cook" + i + "');\" id=\"r_file" + i + "\">";
		str += "		<img id=\"cook" + i + "\" src=\"images/Plus.jpg\" width=300 height=250 class=\"preview\"/></td>";
		str += "</tr>";
		str += "<tr style='border: 1px solid black;'>";
		str += "	<td style='border: 1px solid black;'>조리과정 설명</td>";
		str += "	<td style='border: 1px solid black;'><textarea rows=\"5\" cols=\"30\" id='content" + i + "' name='content1'></textarea></td>";
		str += "</tr>";

		$("#tbody_id2:last").append(str);
		i++;
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
	
	// 글 작성 버튼 클릭
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
			
			// thumbnail1
			if(($("#thumbnail1").val())==""){
				alert("레시피 대표사진을 첨부해주세요.");
				$("#thumbnail1").focus();
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
			
			// r_file1 - content1
			for(var i=1; i<1+r_fileCnt; i++){
				if($("#r_file"+i).val()==""){
					alert("조리사진을 추가 해주세요.");
					return false;
				}else if($("#content"+i).val()==""){
					alert("조리과정 설명을 입력해주세요.");
					$("#content"+i).focus();
					return false;
				}else{
				r_fileSize = document.getElementById("r_file"+i).files[0].size;
				r_imgFile = $("#r_file"+i).val();
					if(!r_imgFile.match(fileForm)){
						alert("이미지 파일만 업로드 가능합니다.");
						return false;
					}else if(r_fileSize > maxSize){
						alert("파일 사이즈는 5MB까지 가능합니다.");
						return false;
					}
				}
			}
			
			
			$('form').serialize();
			$('form').attr('method', 'POST');
			$('form').attr('action', 'r_insert');
			$('form').submit();
		});
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

<!-- <link href="css/r_custom.css" rel="stylesheet"> -->


</head>
<body>
<div class="bgcolor">

	<!-- (공통) 헤더부분 -->
	<%@ include file="../include/header.jsp"%>
	<br><br>
	
	<div class="outbox">
		<h2 class="text-primary" align="center">레시피 글 쓰기</h2><br>
		<form enctype="multipart/form-data">
			<div class="container innerbox">
					<div class="row">
					<div class="col-1 box">제목</div>
					<div class="col-8 box"><input type="text" class="insert" id="subject" name="subject"></div>
					<div class="col-1 box text-end">분류</div>
					<div class="col-2 box">
					<select id="category" name="category">
							<option value="">선택</option>
							<option value="korean">한식</option>
							<option value="chinese">중식</option>
							<option value="japanese">일식</option>
							<option value="western">양식</option>
					</select>
					</div>
					</div>
					
					<div class="row">
					<h6 align="center">대표사진</h6>
					
					<input type="file" id="thumbnail1" name="thumbnail1" onchange="readURL(this,'cookmain');">
					<div class="imgcontainer" style="display: inline-block; width: 300px; height:300px">
						<img id="cookmain" src="images/Plus.jpg" class="preview" style="width:100%; height:100%;"/>
					</div>
					</div>
					
					
					<div class="row">
					<div class="col-3 box">간략한 설명</div>
					<div class="col-9 box">
					<input type="text" class="insert" id="description" name="description">
					</div>
					</div>
			</div>
			<br>
			
			<div class="container innerbox">
			<table border=1">
				<thead>
					<tr>
						<th
							style="border: 1px solid black; width: 20%; text-align: center; vertical-align: middle;">재료수</th>
						<th
							style="border: 1px solid black; width: 20%; text-align: center; vertical-align: middle;">재료</th>
						<th
							style="border: 1px solid black; width: 20%; text-align: center; vertical-align: middle;">용량</th>
						<th
							style="border: 1px solid black; width: 20%; text-align: center; vertical-align: middle;">추가/삭제</th>
					</tr>
					<tr>
						<%int row_idx = 1; %>
						<td style='border: 1px solid black; text-align:center;' class="row_idx"><%=row_idx %></td>
						<td style='border: 1px solid black; text-align:center;'><input type="text" id='ingre' name='ingre'></td>
						<td style='border: 1px solid black; text-align:center;'><input type="text" id='capacity' name='capacity'></td>
						<td style='border: 1px solid black; text-align:center;'>
							<div>
							<button type='button' name='ingre_del' class='btn btn-primary btn-sm'>삭제</button>
							</div>
						</td>
					</tr>
						
					
					
				</thead>
				<tbody id="tbody_id">
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
		
			</div>
			<br>
			<br>
			
			<div class="container innerbox" style="display: flex;">
			<div class="middle">
			<table border=1>
				<tr style='border: 1px solid black;'>
					<td style='border: 1px solid black;'>조리과정 사진</td>
					<td style='border: 1px solid black;'>
					<input type="file" multiple="multiple" id="r_file1" name="r_file1"
						onchange="readURL(this,'cook1');">
					<img id="cook1" src="images/Plus.jpg" width=300 height=250 class="preview"/></td>
				</tr>
				
				<tr style='border: 1px solid black;'>
					<td style='border: 1px solid black;'>조리과정 설명</td>
					<td style='border: 1px solid black;'>
					<textarea rows="5" cols="30" id="content1" name="content1"></textarea>
					</td>
				</tr>
				<tbody id="tbody_id2"></tbody>
			</table>
			<br>
			
			<table border=1>
				<tr>
					<td style='border: 1px solid black;'>
						<button type="button" class='btn btn-primary btn-sm'
							onClick='cook_add();'>
							<strong>조리과정 추가</strong>
						</button>
					</td>
					
					<td style='border: 1px solid black;'>
						<button type="button" class='btn btn-primary btn-sm'
							onClick='cook_del();'>
							<strong>조리과정 삭제</strong>
						</button>
					</td>
				</tr>
			</table>
			
			</div>
			</div>
			
			<br>
			<br> 
			
			<div class="sub">
			<input type="button" value="글 작성" id="sub" class="btn btn-info">
			</div>
			
		</form>
	</div>
</div>

	<!-- Footer-->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>