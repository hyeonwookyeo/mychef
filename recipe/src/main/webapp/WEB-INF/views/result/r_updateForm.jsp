<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		

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

function row_idx_increase(){
	var row_idx = parseInt($(".row_idx:last").text()) + 1;
	if(!row_idx){row_idx=1;}
}

$(document).ready(function(){
	$(".row_idx").load().row_idx_increase();
});

function btn_add(){
	function row_idx_increase()
	var str = "";

	str += "<tr>";
	str += "	<td style='text-align:center;' class=\"row_idx\">"+row_idx+"</td>";
	str += "	<td style='text-align:center;'><input type=\"text\" name='ingre'></td>";
	str += "	<td style='text-align:center;'><input type=\"text\" name='capacity'></td>";
	str += "	<td style='text-align:center;'>";
	str += "		<div class=\"btn-group\">";
	str += "			<button type='button' class='btn btn-primary btn-sm' name='dtl_del'>삭제</button>";
	str += "		</div>";
	str += "	</td>";
	str += "</tr>";
	
	$("#tbody_id:last").append(str);
}

function btn_add2(){
	var str = "";

	str += "<tr>";
	str += "	<td>조리사진</td>";
	str += "	<td><input multiple=\"multiple\" type=\"file\" name='r_file1'></td>";
	str += "</tr>";
 	str += "<tr>";
	str += "	<td>내용</td>";
	str += "	<td><textarea rows=\"5\" cols=\"30\" name='content1'></textarea></td>";
	str += "</tr>"; 

	
	$("#tbody_id2:last").append(str);
}

$(function(){
	$('#sub').click(function() {
	    $('form').serialize();
	    $('form').attr('method', 'POST');
	    $('form').attr('action', 'r_update');
//	    $('form').attr('enctype', 'multipart/form-data');
	    $('form').submit();
	});
});

</script>
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
					<td><input type="text" name="subject" value="${board.subject }"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
					<select id="category" name="category">
						<option value="korean">한식</option>
						<option value="chinese">중식</option>
						<option value="japanese">일식</option>
						<option value="western">양식</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td><input type="file" name="thumbnail1">
					<img src="./t_images/${board.thumbnail }" width=300 /></td>
				</tr>
				<tr>
					<td>간략한 설명</td>
					<td><input type="text" name="description" value="${board.description }"></td>
				</tr>
				</table> <br><br>
				
			<table border=1>
			<thead>
			<tr>
				<th style="width:20%; text-align:center;vertical-align:middle;">No</th>
				<th style="width:20%; text-align:center;vertical-align:middle;">재료</th>
				<th style="width:20%; text-align:center;vertical-align:middle;">용량</th>
				<th style="width:20%; text-align:center;">
					<button class="btn btn-default btn-sm" type="button"  onclick='btn_add();'>
						<strong>추가</strong>
					</button>
				</th>
			</tr>
			</thead>
			<tbody id="tbody_id">
			<c:forEach var="item1" items="${map1 }">
			<tr>
				<td style='text-align:center;' class="row_idx"></td>
				<td style='text-align:center;'><input type="text" name='ingre' value="${item1.key }"></td>
				<td style='text-align:center;'><input type="text" name='capacity' value="${item1.value }"></td>
				<td style='text-align:center;'>
				<div class="btn-group">
					<button type='button' class='btn btn-primary btn-sm' name='dtl_del'>삭제</button>
				</div>
				</td>
			</tr>
			</c:forEach>
			</tbody>
			</table><br><br>
			
			
				
			<table border=1>
			<c:forEach var="item2" items="${map2 }">
			<tr>
				<td>조리사진</td>
				<td><input multiple type="file" name='r_file1'>
				<img src="./r_images/${item2.key }" width=300 />
				</td>
			</tr>
 			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="30" name='content1'>${item2.value }</textarea></td>
			</tr>
			</c:forEach>
			</table>
			
			<table>
			<tr>
				<td>
					<button type="button" class="btn btn-default btn-sm"   onclick='btn_add2();'>
						<strong>추가</strong>
					</button>
				</td>	
			</tr>
			</table><br><br>

			
			<input type="button" value="확인" id="sub">
			
		</form>
	</div>
</body>
</html>