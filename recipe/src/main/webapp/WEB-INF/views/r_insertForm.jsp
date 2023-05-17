<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript">
	var i = 2;

	$(document).on('click', "[name='ingre_del']", function() {
		var tr = $(this).parent().parent().parent();
		$("#tbody_id:last > tr:last").remove();
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

		str += "<tr>";
		str += "	<td>조리사진</td>";
		str += "	<td><input multiple=\"multiple\" type=\"file\" name='r_file1' onchange=\"readURL(this, 'cook" + i + "');\" id=\"r_file" + i + "\">";
		str += "		<img id=\"cook" + i + "\" src=\"images/western.jpg\" width=300 height=350 class=\"preview\"/></td>";
		str += "</tr>";
		str += "<tr>";
		str += "	<td>내용</td>";
		str += "	<td><textarea rows=\"5\" cols=\"30\" name='content1'></textarea></td>";
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

	$(function() {
		$('#sub').click(function() {
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
			document.getElementById(imgId).src = "";
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
		<h2 class="text-primary">레시피 글 쓰기</h2>
		<form enctype="multipart/form-data">
			<%--
			<input type="hidden" name="pageNum" value="${pageNum}"> --%>
			<table border=1>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td><select id="category" name="category">
							<option value="korean">한식</option>
							<option value="chinese">중식</option>
							<option value="japanese">일식</option>
							<option value="western">양식</option>
					</select></td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td><input type="file" id="thumbnail1" name="thumbnail1"
						onchange="readURL(this,'cookmain');">
						<img id="cookmain" src="images/chinese.jpg" width=300 height=350 class="preview"/></td>
				</tr>
				<tr>
					<td>간략한 설명</td>
					<td><input type="text" name="description"></td>
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
				<tr>
					<td>조리사진</td>
					<td><input type="file" multiple="multiple" id="r_file1" name="r_file1"
						onchange="readURL(this,'cook1');">
						<img id="cook1" src="images/western.jpg" width=300 height=250 class="preview"/></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="30" name="content1"></textarea></td>
				</tr>
				<tbody id="tbody_id2"></tbody>
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
			<br> <input type="button" value="확인" id="sub">

		</form>
	</div>
</body>
</html>