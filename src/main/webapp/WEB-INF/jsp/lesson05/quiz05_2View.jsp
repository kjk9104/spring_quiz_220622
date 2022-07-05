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

<title>날씨 입력</title>
  <div class="event-box">
            <h1 class="font-weight-bold">날씨 입력</h1>

            <div class="d-flex justify-content-between align-items-center">
                <span>날짜</span>
                <input type="text" class="form-control col-4" id="startDate">

                <span>날씨</span>
                <input type="checkbox" class="form-control col-4" id="endDate">
            </div>

            <button type="button" class="btn btn-info w-100 mt-3">저장</button>
        </div>
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
</head>
<body>

</body>
</html>