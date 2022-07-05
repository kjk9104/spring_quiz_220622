<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/quiz05_1.css">
<title>날씨 정보</title>
</head>
<body>
	<div id="wrap">
		<div class="contents d-flex">
			<nav class="bg-primary">
				<!-- 로고 영역  -->
				<div class="d-flex justify-content-center pt-4">
					<h3><a>기상청</a></h3>
				</div>
				<!-- 메뉴 영역 ul(nav), li(nav-item), a(nav-link) 세로메뉴(flex-column)-->
				<ul class="nav flex-column">
					<li class="nav-item"><a href="#" class="nav-link">날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link">날씨 입력</a></li>
					<li class="nav-item"><a href="#" class="nav-link">테마 날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link">관측 기후</a></li>
				</ul>
			</nav>
			<section class="right">
				<div class="mt-4 mx-4">
					<table class="table text-center">
					<h1>과거 날씨</h1>
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<c:forEach var="weatherhistory" items="${WeatherList}">
						<tbody>
							<tr>
								<td>
								    <fmt:formatDate value="${weatherhistory.date}" pattern="yyyy년 MM월 dd일"/>
							    </td>
								<td>
									<c:choose>
										<c:when test="${weatherhistory.weather eq '비'}">
											<img src="/img/rainy.jpg" alt="비">
										</c:when>
										<c:when test="${weatherhistory.weather eq '흐림'}">
											<img src="/img/cloudy.jpg" alt="흐림">
										</c:when>
										<c:when test="${weatherhistory.weather eq '맑음'}">
											<img src="/img/sunny.jpg" alt="맑음">
										</c:when>
										<c:when test="${weatherhistory.weather eq '구름조금'}">
											<img src="/img/partlyCloudy.jpg" alt="구름조금">
										</c:when>
									</c:choose>
								</td>	
								<td>${weatherhistory.temperatures}℃</td>
								<td>${weatherhistory.precipitation}mm</td>
								<td>${weatherhistory.microDust}</td>
								<td>${weatherhistory.windSpeed}km/h</td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
				</div>
			</section>
		</div>
		<footer class="d-flex align-items-center">
			<div class="ml-4">
				<h1>기상청 이미지</h1>
			</div>
			<div class="text-secondary">
				<small class="text-xecondary">(07062)서울시 동작구 여의대로방로 16길 61<br>
					Copyright@2020 KMA. All Rights RESERVED.
				 </small>
			</div>
		</footer>
	</div>
</body>
</html>