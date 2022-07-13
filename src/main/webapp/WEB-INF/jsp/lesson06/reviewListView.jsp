<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery : bootstrap -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link  rel="stylesheet" type="text/css"  href="/css/quiz06_2.css">
<title>배탈의 민족 리뷰</title>
</head>
<body>
	<header class="bg-info d-flex flex-wrap align-content-center"">
		<h3 class="text-white">배탈의 민족</h3>
	</header>
	<div class="content">
			 <h1>${storeName} - 리뷰</h1>
			 <c:forEach var="review" items="${reviewList}">
				 <div class="content-box border border-info d-flex flex-column justify-content-center" >
				 	<strong>${review.userName}</strong>
				 	<span>
					 	<c:choose>
					 		<c:when test="${review.point == 0.5}">
					 			<img class="imgStar"src="/img/star_half.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 1.0}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 1.5}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_hlaf.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 2.0}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_half.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 2.5}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_half.png">
					 				<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 3.0}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 3.5}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_half.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 4.0}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_empty.png">
					 		</c:when>
					 		<c:when test="${review.point == 4.5}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_half.png">
					 		</c:when>
					 		<c:when test="${review.point == 5.0}">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 			<img class="imgStar" src="/img/star_fill.png">
					 		</c:when>
					 	</c:choose>
				 	</span>
				 	<span><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 mm월 d일"/></span>
				 	<span>${review.review}</samp>
					<div>
				 		<span class="labelMenu badge">${review.menu}</span>
				 	</div>
				 </div> 
			 </c:forEach>
			 <c:if test="${empty reviewList}">
				 	<h1>작성된 리뷰가 없습니다.</h1>
			 </c:if>
	</div>
	<footer>
		<div>
			<h3>(주)우와한 형제</h3>
			<span class="text-secondary"><strong>고객센터 : 1500-1500</strong></span>
		</div>
	</footer>
</body>
</html>