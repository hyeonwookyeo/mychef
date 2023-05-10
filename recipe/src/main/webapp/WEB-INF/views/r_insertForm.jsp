<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).on('click', "[name='dtl_del']", function(){
	var tr = $(this).parent().parent().parent();
	tr.remove();
});
function btn_add(){
	var row_idx = parseInt($(".row_idx:last").text()) + 1;
	if(!row_idx){row_idx=1;}
	var str = "";

	str += "<tr>";
	str += "	<td style='text-align:center;' class=\"row_idx\">"+row_idx+"</td>";
	str += "	<td style='text-align:center;'><input type=\"text\" \"></td>";
	str += "	<td style='text-align:center;'><input type=\"text\" \"></td>";
	str += "	<td style='text-align:center;'><input type=\"text\" \"></td>";
	str += "	<td style='text-align:center;'>";
	str += "		<div class=\"btn-group\">";
	str += "			<button type='button' class='btn btn-primary btn-sm' name='dtl_del'>삭제</button>";
	str += "		</div>";
	str += "	</td>";
	str += "</tr>";
	
	$("#tbody_id:last").append(str);
}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시판 글쓰기</h2>
		<form action="r_insert" method="post" enctype="multipart/form-data">
			<%--
			<input type="hidden" name="pageNum" value="${pageNum}"> --%>
			<table border=1>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
					<select id="category">
						<option value="korean">한식</option>
						<option value="chinese">중식</option>
						<option value="japanese">일식</option>
						<option value="western">양식</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td><input type="file" name="thumbnail"></td>
				</tr>
				<tr>
					<td>간략한 설명</td>
					<td><input type="text" name="description"></td>
				</tr>
				</table> <br><br>
				
			<table border=1>
			<thead>
			<tr>
				<th style="width:20%; text-align:center;vertical-align:middle;">No</th>
				<th style="width:20%; text-align:center;vertical-align:middle;">제목</th>
				<th style="width:20%; text-align:center;vertical-align:middle;">내용</th>
				<th style="width:20%; text-align:center;vertical-align:middle;">추가내용</th>
				<th style="width:20%; text-align:center;">
					<button class="btn btn-default btn-sm" type="button"  onclick='btn_add();'>
						<strong>추가</strong>
					</button>
				</th>
			</tr>
			</thead>
			<tbody id="tbody_id">
			</tbody>
			</table><br><br>
				
				
<!-- 				
				<table border=1>
				<tr>
					<td>재료</td>
					<td><input type="text" name="ingre"></td>
					<td>용량</td>
					<td><input type="text" name="capacity"></td>
					<td><input type="button" value="추가" onClick="tableCreate_ingre()"></td>
				</table> <br><br> 
-->
				
				<table border=1>
				<tr>
					<td>조리사진</td>
					<td><input type="file" name="rfile"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="30" name="content"	required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>