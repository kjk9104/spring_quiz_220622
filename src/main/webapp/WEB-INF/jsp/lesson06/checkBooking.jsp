<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery : bootstrap, datepicker -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

        <!-- bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!-- datepicker-->
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/checkBooking.css">
<title>예약 확인</title>
</head>
<body>
	<header>
		<div class="d-flex justify-content-center"><h1>통나무 펜션</h1></div>
		<nav class="d-flex justify-content-around col-12 ">
			<a href="/lesson06/check_booking" class="aTag align-self-center"><span class="text-light">펜션소개</span></a>
			<a href="#" class="aTag align-self-center"><span class="text-light">객실보기</span></a>
			<a href="/lesson06/book" class="aTag align-self-center"><span class="text-light">예약하기</span></a>
			<a href="/lesson06/booking_list" class="aTag align-self-center"><span class="text-light">예약목록</span></a>
		</nav>
	</header>
	<content>
		<div>
			<img id="img1" alt="사진" src="/img/test06_banner1.jpg">
		</div>
		<div class="d-flex justify-content-around">
			<div class="div1_3">
				실시간 예약하기
			</div>
			<div id="div2">
				<h3>예약 확인</h3>
				<input type="text" id="name" class="form-control">
				<input type="text" id="phoneNumber" class="form-control">
				<button class="btn btn-success">조회하기</button>
			</div>
			<div>
				<div class="div1_3">예약문의:
				010-0000-1111</div>
			</div>
		</div>
	</content>
	<footer>
		<small> 제주특별자치도 제주시 애월읍<br>
		사업자등록번호: 111-22-244222 / 농어촌민박사업자지정 / 대표:김통목<br>
		Copylight 2025 tongnamu.All.right.reserved.
		</small>
	</footer>
	
</body>
</html>