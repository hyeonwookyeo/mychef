<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>찜 목록 prototype</title>

    <style>
        .container {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
            column-gap: 1rem;
            row-gap: 2rem;
        }

        .item > img {
            width: 15vw;
            height: 100%;
        }

        .item > .title {
            font-weight: bold;
            font-size: large;
        }

        .item > .customer-name {
            font-size: small;
        }

        .item > .hits {
            font-size: small;
        }
    </style>
</head>
<body>
    <h1>📌찜한 리스트</h1>
    <div class="container">
        <c:forEach var="favorite" items="${favorites}">
            <article class="item">
                <img src="${favorite.imgUrl}" alt="이미지" width="10vw" height="10vh" />
                <div class="title">${favorite.title}</div>
                <div class="customer-name">${favorite.customerName}</div>
                <div class="hits">조회수 ${favorite.hits}</div>
            </article>
        </c:forEach>
    </div>
</body>
</html>