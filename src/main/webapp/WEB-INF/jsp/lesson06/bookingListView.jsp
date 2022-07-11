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
<title>예약 리스트</title>
</head>
<body>
	<header>
		<div  class="d-flex justify-content-center"><h1>통나무 펜션</h1></div>
		<nav class="d-flex justify-content-around col-12 bg-warning">
			<span class="text-light">펜션소개</span>
			<span class="text-light">객실보기</span>
			<span class="text-light">예약하기</span>
			<span class="text-light">예약목록</span>
		</nav>
	</header>
	<content>
		<table class="table text-center ">
			<thead>
				<tr>
					<th>이름</th>				
					<th>예약날짜</th>				
					<th>숙박일수</th>				
					<th>숙박인원</th>				
					<th>전화번호</th>				
					<th>예약상태</th>				
					<th></th>				
				</tr>
			</thead>
			<div class="d-flex justify-content-center"><h3>예약 목록 보기</h3></div>
			<c:forEach var="booking" items="${bookinglist}">
			<tbody>
				<tr>
					<td>${booking.name}</td>
					<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 MM월 dd일"/></td>
					<td>${booking.day}</td>
					<td>${booking.headcount}</td>
					<td>${booking.phoneNumber}</td>
					<c:choose>
						<c:when test="${booking.state eq '대기중'}">
							<td class="text-primary">${booking.state}</td>
						</c:when>
						<c:when test="${booking.state eq '확정'}">
							<td class="text-success">${booking.state}</td>
						</c:when>
					</c:choose>
					<td><button type="button" class="btn btn-danger delBtn" data-booking-phoneNumber="${booking.phoneNumber}">삭제</button></td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</content>
<script>
$(document).ready(function(){
	$(".delBtn").on("click", function(e){
	 	let bookingPhoneNum = $(this).data('booking-phoneNumber');
		
	 	alert(bookingPhoneNum);
	});
});


</script>
</body>
</html>