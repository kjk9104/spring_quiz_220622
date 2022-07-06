<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <!-- jquery : bootstrap, datepicker -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

        <!-- bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!-- datepicker-->
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/quiz05_2.css">
<title>날씨 입력</title>
</head>
<body>
 	<div id="wrap">
 		<div class="contents d-flex">
	 			<!-- nav 영역  -->
	 			<nav  class="bg-primary">
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
	 			<!-- section 영역  -->
		 			<section class="right">
		 			<!-- 날짜 날씨 미세먼지 입력칸 -->
			 			<div class="mt-4 mx-4 ">
			 				<h1 class="font-weight-bold">날씨 입력</h1>
			 				<form method="post" action="/lesson05/quiz05/add_weather">
			 					<div class="mt-5 d-flex form-control space-ecenly align-items-center">
			 						 <span>날짜</span>
		                			<input type="text" class="form-control col-3 mx-3" id="startDate" name="date">
			 						 <span>날씨</span>
		                			<select class="form-control selectpiker col-2 mx-3" name="weather">
		                				<option>맑음</option>
									    <option>비</option>
									    <option>구름</option>
									    <option>구름 조금</option>
		                			</select>
		                			<span>미세먼지</span>
		                			<select class="form-control selectpiker col-2  mx-3" name="microDust">
		                				<option>좋음</option>
									    <option>보통</option>
									    <option>나쁨</option>
									    <option>매우 나쁨</option>
		                			</select>
			 						
		                		</div>
			 						<!-- 기온 강수량 풍속 입력칸  -->
				 				<div class="mt-5 d-flex form-control  justify-content-around align-items-center">
				 					 <span>기온</span>
										  <div class="input-group-append">
					 					  <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="temperatures">
										    <span class="input-group-text">℃</span>
										  </div>
				 					 <span>강수량</span>
										  <div class="input-group-append">
					 					  <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="precipitation">
										    <span class="input-group-text">mm</span>
										  </div>
				 					 <span>풍속</span>
										  <div class="input-group-append">
					 					  <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="windSpeed">
										    <span class="input-group-text">km/h</span>
										  </div>
				 				</div>
				 				<!--저장 버튼  -->
				 				<div class="d-flex justify-content-end">
				 					 <button type="submit" id="saveBtn"class="btn btn-success mt-3">저장</button>
				 				</div>
				 				</form>
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
 			<!-- footer 영역  -->
 		
 	</div>
</body>

 <script>
 //ready 함수 : DOM tree가 모두 구성된 후 부려지는 함수
            $(document).ready(function() {
                // 모든 데이터피커에 적용
                $.datepicker.setDefaults({
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
                    , dateFormat: 'yy-mm-dd'
                });

                // 오늘 날짜로 이동하는 함수
                $.datepicker._gotoToday = function(id) {
                    $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
                };


                $('#startDate').datepicker({
                    showButtonPanel: true // 오늘 버튼 노출
                    , minDate:0 // 오늘과 그 이후만 선택 가능

                    // 시작일이 선택되는 순간 종료일의 minDate 변경
                    , onSelect:function(dateText) {
                        $('#endDate').datepicker('option', 'minDate', dateText);
                    }
                });

                $('#endDate').datepicker({
                    minDate:0 
                });
            });

</script>
</html>