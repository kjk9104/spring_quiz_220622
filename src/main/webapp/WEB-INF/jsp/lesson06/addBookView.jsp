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
        
        <link rel="stylesheet" type="text/css" href="/css/bookView.css">
<meta charset="UTF-8">
<title>예약하기</title>
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
	<content class="d-flex justify-content-center">
		<div class="main">
			<h1>예약하기</h1>
			<h6>이름</h6>
			<input type="text" id="name" class="form-control">
			<h6>예약날짜</h6>
			<input type="text" id="date" class="form-control">
			<h6>숙박일수</h6>
			<input type="text" id="day" class="form-control">
			<h6>숙박인원</h6>
			<input type="text" id="headcount" class="form-control">
			<h6>전화번호</h6>
			<input type="text" id="phoneNumber" class="form-control"><br>
			<button type="button" class="btn btn-warning">예약하기</button>
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
            	
                // 모든 데이터피커에 적용
                $.datepicker.setDefaults({
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
                    , dateFormat: 'yy-mm-dd'
                });

                // 오늘 날짜로 이동하는 함수
                $.datepicker._gotoToday = function(id) {
                    $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
                };


                $('#date').datepicker({
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
            	
            	
            	$(".btn").on("click",function(){
            		let name = $("#name").val().trim();
            		let date = $("#date").val().trim();
            		let day = $("#day").val().trim();
            		let headcount = $("#headcount").val().trim();
            		let phoneNumber = $("#phoneNumber").val().trim();
            		
            		if(name == ""){
            			alert("이름을 입력해 주세요");
            			return;
            		}
            		
            		if(date == ""){
            			alert("날짜을 입력해 주세요");
            			return;
            		}
            		
            		if(day == ""){
            			alert("숙박일수를 입력해 주세요");
            			return;
            		}
            		
            		if(headcount == ""){
            			alert("숙박인원을 입력해 주세요");
            			return;
            		}
            		
            		if(phoneNumber == ""){
            			alert("전화번호을 입력해 주세요");
            			return;
            		}
            		
            		if(phoneNumber.startsWith("010") == false){
            			alert("010으로 시작하게 입력 해주세요");
            			return;
            		}
            		
            		
            		
        			$.ajax({
        				type : "POST"
        				,url : "/lesson06/booking"
        				,data : { 
        					"name" : name 
        					,"date" : date 
        					,"day" : day 
        					,"headcount" : headcount 
        					,"phoneNumber" : phoneNumber 
        					}
	        			 ,success : function(data){
	    			 		 //{"result" :"success"}
	    			 		 if(data.result == "success"){
	    			 			location.reload(true); // 새로고침
	    			 		 } else{
	    			 			 alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요")
	    			 		 }
	    			 	 }
        				,error : function(e){
        					 alert("통신에 실패했습니다."+e);
        				}
        			})
            	})
            	

            });

        </script>
</body>
</html>