<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- (공통) 헤더부분 -->
	<%@ include file="../include/header.jsp"%>

	<%
		String korean = "korean";
		String chinese = "chinese";
		String japanese = "japanese";
		String western = "western";
	%>
	<div class="container">
	<h2 align="center" style="margin: 25px 10px;">카테고리 폼</h2>
	<div class="row">

		<div class="col-sm-3">
			<div class="card" style="width: 300px">
				<a href="r_listForm?category=<%=korean%>&pageNum=1"> <img
					class="card-img-top" src="images/korean.jpg" width=300 height=300
					title="한식">
				</a>
				<div class="card-body">
					<h4 class="card-title" style="text-align: center">한식</h4>
				</div>
			</div>
		</div>

		<div class="col-sm-3">
			<div class="card" style="width: 300px">
				<a href="r_listForm?category=<%=chinese%>&pageNum=1"> <img
					class="card-img-top" src="images/chinese.jpg" width=300 height=300
					title="중식">
				</a>
				<div class="card-body">
					<h4 class="card-title" style="text-align: center">중식</h4>
				</div>
			</div>
		</div>

		<div class="col-sm-3">
			<div class="card" style="width: 300px">
				<a href="r_listForm?category=<%=japanese%>&pageNum=1"> <img
					class="card-img-top" src="images/japanese.jpg" width=300 height=300
					title="일식">
				</a>
				<div class="card-body">
					<h4 class="card-title" style="text-align: center">일식</h4>
				</div>
			</div>
		</div>

		<div class="col-sm-3">
			<div class="card" style="width: 300px">
				<a href="r_listForm?category=<%=western%>&pageNum=1"> <img
					class="card-img-top" src="images/western.jpg" width=300 height=300
					title="양식">
				</a>
				<div class="card-body">
					<h4 class="card-title" style="text-align: center">양식</h4>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer-->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>