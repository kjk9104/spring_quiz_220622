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
<title>우리 동네 가게</title>
<link  rel="stylesheet" type="text/css"  href="/css/quiz06_1.css">
</head>
<body>
	<header class="bg-info d-flex flex-wrap align-content-center col-10"">
		<h3 class="text-white">배탈의 민족</h1>
	</header>
	<div class="content">
			 <h1>우리 동네 가게</h1>
			 <c:forEach var="store" items="${storeList}">
				 <div class="border border-info col-10 d-flex flex-column justify-content-center col-10" >
				 	<a href="quiz_review_list"><h3><Strong>${store.name}</Strong></h3>
				 	<span>전화번호 : ${store.phoneNumber}</span><br>
				 	<span>주소 : ${store.address}</span></a>
				 </div> 
			 </c:forEach>
	</div>
	<hr>
	<footer>
		<div>
			<h3>(주)우와한 형제</h3>
			<span class="text-secondary"><strong>고객센터 : 1500-1500</strong></span>
		</div>
	</footer>
</body>
</html>