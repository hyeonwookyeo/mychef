<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피게시판 목록</title>
	
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style>
div.btn-group {
  position: relative;
  left: 1200px;
}

div.card {width:100%; height:100%; overflow:hidden;}
.card-img-top {width:80%; height:150; padding:7; overflow:hidden;}

</style>
</head>
<body>

<%@ include file="../include/header.jsp"%>


		<h2 class="text-primary" align="center">레시피 목록</h2>
		<div>
		<div style="text-align:left; margin-left: 2em" > 총 <b>${total }</b>개의 레시피를 만나보세요~!</div>
		<div class="btn-group">
  			<button type="button" class="btn btn-outline-success" onClick="location.href='r_listForm?category=${category}'">최신순</button>
  			<button type="button" class="btn btn-outline-success" onClick=
  			"location.href='r_listForm?category=${category}&sort=readcount'">조회순</button>
  			<button type="button" class="btn btn-outline-success" onClick=
  			"location.href='r_listForm?category=${category}&sort=recom'">추천순</button>
		</div>
		</div>
		<p></p>
		
	<div class="container" align="center">
	
		<div class="row">
			<c:if test="${empty list}">
				<div class="col-sm-12 text-bg-secondary">
					<b>데이터가 없습니다</b>
				</div>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="board" items="${list }">
					<c:if test="${board.state != 'n' }">
						<div class="col-sm-3">
							<div>
								<div class="card">
									<a href="r_view?rnum=${board.rnum }&pageNum=${pageNum}">
										<img class="card-img-top" src="./t_images/${board.thumbnail }">
									</a>
									<div class="card-body">
										<h4 class="card-title">${board.subject }</h4>
										<c:if test="${not empty board.profile }">
										<img src ="./upload/${board.profile }" width=30 height=30>
										</c:if>
										<c:if test="${empty board.profile }">
										<img src ="./upload/pepe.jpg" width=30 height=30>
										</c:if>
										<span class="card-text">${board.nickname }</span>
										<span class="card-text">조회수${board.readcount }</span> <span
											class="card-text">추천수${board.recom }</span>
										<p class="card-text"><fmt:formatDate value="${board.rdate }"
										pattern="yyyy년 MM월 dd일"/>
										</p>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>


		</div>
		
		<form action="r_listForm?pageNum=1">
			<input type="hidden" name="category" value="${category}">
			<select name="search">
				<option value="subject"
					<c:if test="${search=='subject'}">selected="selected" </c:if>>제목</option>
				<option value="content"
					<c:if test="${search=='content'}">selected="selected" </c:if>>내용</option>
					<!-- id 닉네임으로 변경할 것!!!!!!!!!!!! -->
				<option value="id" 
					<c:if test="${search=='id'}">selected="selected" </c:if>>아이디</option>
				<option value="subcon"
					<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> <input type="text" name="keyword"> <input type="submit" value="확인">
		</form>
		<ul>
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="r_listForm?category=${category }&pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
					
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
					<a href="r_listForm?category=${category }&pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>					
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="r_listForm?category=${category }&pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
			
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="r_listForm?category=${category }&pageNum=${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<c:if test="${pp.currentPage==i}"></c:if>
					<a href="r_listForm?category=${category }&pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="r_listForm?category=${category }&pageNum=${pp.endPage + 1}">다음</a></li>
				</c:if>
			</c:if>
		</ul>

		<c:if test="${!empty id }">
			<div align="center">
				<a href="r_insertForm" class="btn btn-info">글 입력</a>
			</div>
		</c:if>

	</div>
	
	
	<!-- Bootstrap core JS-->
	<script
		src="resources/https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>