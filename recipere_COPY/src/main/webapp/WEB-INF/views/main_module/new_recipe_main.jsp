<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/set.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

var multipleCardCarousel = document.querySelector(
		  "#carouselExampleControls"
		);
		if (window.matchMedia("(min-width: 768px)").matches) {
		  var carousel = new bootstrap.Carousel(multipleCardCarousel, {
		    interval: false,
		  });
		  var carouselWidth = $(".carousel-inner")[0].scrollWidth;
		  var cardWidth = $(".carousel-item").width();
		  var scrollPosition = 0;
		  $("#carouselExampleControls .carousel-control-next").on("click", function () {
		    if (scrollPosition < carouselWidth - cardWidth * 4) {
		      scrollPosition += cardWidth;
		      $("#carouselExampleControls .carousel-inner").animate(
		        { scrollLeft: scrollPosition },
		        600
		      );
		    }
		  });
		  $("#carouselExampleControls .carousel-control-prev").on("click", function () {
		    if (scrollPosition > 0) {
		      scrollPosition -= cardWidth;
		      $("#carouselExampleControls .carousel-inner").animate(
		        { scrollLeft: scrollPosition },
		        600
		      );
		    }
		  });
		} else {
		  $(multipleCardCarousel).addClass("slide");
		}

</script>
<style>

.carousel-inner {
  padding: 1em;
}
.card {
  margin: 0 0.5em;
  box-shadow: 2px 6px 8px 0 rgba(22, 22, 26, 0.18);
  border: none;
}
.carousel-control-prev,
.carousel-control-next {
  background-color: #e1e1e1;
  width: 6vh;
  height: 6vh;
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
}
@media (min-width: 768px) {
  .carousel-item {
    margin-right: 0;
    flex: 0 0 33.333333%;
    display: block;
  }
  .carousel-inner {
    display: flex;
  }
}
.card .img-wrapper {
    max-width: 100%;
    height: 13em;
    display: flex;
    justify-content: center;
    align-items: center;
}
.card img {
    max-height: 100%;
}
@media (max-width: 767px) {
  .card .img-wrapper {
    height: 17em;
  }
}

</style>

<body>
<div id="carouselExampleControls" class="carousel" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="card">
                <div class="img-wrapper"><img src="..." class="d-block w-100" alt="..."> </div>
                <div class="card-body">
                    <h5 class="card-title">Card title 1</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <c:forEach var="newlist" items="${new_rlist }">
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="./t_images/${newlist.thumbnail }" class="d-block w-100" alt="안나옴"> </div>
                <div class="card-body">
                    <h5 class="card-title">${newlist.subject }</h5>
                    <p class="card-text">${newlist.description }</p>
                    <a href="r_view?rnum=${newlist.rnum }" class="btn btn-primary">열람</a>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

</body>
</html>