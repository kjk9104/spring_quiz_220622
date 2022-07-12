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
			<a href="/lesson06/addbook" class="aTag align-self-center"><span class="text-light">예약하기</span></a>
			<a href="/lesson06/booking_list" class="aTag align-self-center"><span class="text-light">예약목록</span></a>
		</nav>
	</header>
	<content>
		<div>
			<img id="img1" alt="사진" src="/img/test06_banner1.jpg">
		</div>
		<div class="constent d-flex justify-content-center">
			<div class="div1_3 col-4 text-light">
				<samp class="align-middle">실시간<br> 예약하기</samp>
			</div>
			<div id="div2" class="col-4 text-light">
				<h3>예약 확인</h3>
					<div>
						<div class="d-flex justify-content-end">
							이름 : <input type="text" id="name" class="form-control col-7">
						</div>
						<div class="d-flex justify-content-end">
							전화번호 : <input type="text" id="phoneNumber" class="form-control col-7"><br>
						</div>
					</div>
				<div class="d-flex justify-content-end">
					<button class="btn btn-success">조회하기</button>
				</div>
			</div>
			<div class="div1_3 col-4 text-light" >
				<samp>예약문의:<br>
				010-0000-1111</samp>
			</div>
		</div>
	</content>
	<footer>
		<small> 제주특별자치도 제주시 애월읍<br>
		사업자등록번호: 111-22-244222 / 농어촌민박사업자지정 / 대표:김통목<br>
		Copylight 2025 tongnamu.All.right.reserved.
		</small>
	</footer>
	<script>
	$(document).ready(function() {
			let count =1;
		
			setInterval(function (){
				$("#img1").attr('src', '/img/test06_banner'+count+'.jpg');
				count++;
				if(count > 3){
					count = 1;
				}
			}, 20000); 
			$(".btn").on("click",function(){
				let name = $('#name').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if(name ==""){
					alert("이름을 입력해주세요");
					return;
				}
				if(phoneNumber == ""){
					alert("번호를 입력해 주세요");
					return;
				}
				if(phoneNumber.startsWith("010") === false){
					alert("010으로 시작하는 단어만 입력해주세요");
					return;
				}
				
				$.ajax({
					type : "POST"
					,url : "/lesson06/find_booking"
					,data : {
						"name" : name
						,"phoneNumber" : phoneNumber
					}
					,success : function(data){
				 		 if(data.result == "success"){
				 			 alert(
				 				  "이름 : " + data.booking.name+"\n"
				 				  +"날짜 : " + data.booking.date.substring(0, 10) +"\n"
				 				  +"일수 : " + data.booking.day+"\n"
				 				  +"인원 : " + data.booking.headcount+"\n"
				 				  +"상태 : " + data.booking.state+"\n"
				 					 );
				 		 }
				 		 else{
				 			 alert("예약 내역이 없습니다");
				 		 }
				 		 
				 	 }
					,error : function(e){
						 alert("통신에 실패했습니다."+e);
					}
				});
			});
	});
	
	
	
	
	</script>
</body>
</html>