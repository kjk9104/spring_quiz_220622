<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>add_fovarite</title>
</head>
<body>
	<div class=container>
		<h1 >즐겨 찾기 추가하기</h1>
		<div class="form-group">
				<label for="name">제목</label> 
				<input type="text" id="name" class="form-control col-10" placeholder="제목을 입력해주세요">
		</div>
		<div class="form-group">
				<label for="url">주소</label> 
			<div class="form-inline">
						<input type="text" id="url" class="form-control col-9" placeholder="주소를 입력해주세요">
						<button type="button" id="chkBtn" class="btn btn-info text-thite">중복확인</button>
			</div> 
					<samall id="duplicationText" class="text-danger d-none">중복된 주소 입니다.</samall>
					<samall id="availableUrl" class="text-success d-none">저장 가능한 주소 입니다.</samall>
			
		</div>
		
			
		
		
		<input type="button" id="addBtn" value="추가" class="btn col-10 btn-success text-white">
	</div>
	
<script>
	$(document).ready(function(){
		
		
		$('#addBtn').on('click', function(){
			let name = $('#name').val().trim();
			let url = $('#url').val().trim();
			if(name === ""){
				alert("제목을 입력해 주세요");
				return;
			}
			if(url === ""){
				alert("주소를 입력해주세요");
				return;
			}
			
			//http 도 아니고 , https도 아닐때 => alert
			if(url.startsWith("http") === false&&url.startsWith("https")===false){
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			// 주소 중복확인 체크
			//'저장 가능한 URL입니다.' 문구가 숨겨져 있을때 alert을 띄운다.
			// d-none이 있을 때
			if($('#availableUrl').hasClass('d-none')){
				alert("중복확인을 다시 해주세요.");
				return;
			}
			
			$.ajax({
				//reqeust
				type:"POST"
				,url: "/lesson06/add_favorite"
				,data: {
					"name": name
					,"url" : url
				}
				
				//response
				, success: function(data){ // json str을 object로 변환해줌
					alert(data.result);
					if(data.result == "success"){
						alert("입력 성공했습니다.");
						location.href="/lesson06/favorite_list"
					}
				}
				, error: function(e){
					alert("error" + e);
				}
			});
		});
		
		//chkBtn (중복확인) 클릭시 
		$("#chkBtn").on('click', function(){
			
			alert("중복확인")
			let url = $("#url").val().trim();
			
			
			if(url == ""){
				alert("주소를 입력해주세요.")
				return;
			}
			
			//중복 확인
			$.ajax({
				//request
				type : "POST"
				,url : "/lesson06/is_duplication"
				,data : {
					"url" : url
				}
										
				//response
				,success : function(data){
					console.log(data.is_duplication);
					if(data.is_duplication){
						// 중복일때
						$("#duplicationText").removeClass('d-none');
						$("#availableUrl").addClass('d-none');
					}else{
						$("#availableUrl").removeClass('d-none');
						$("#duplicationText").addClass('d-none');
						// 사용 가능
					}
				}
				,error : function(e, a){
					alert(e);
					alert(a);
					alert("중복 확인에 실패했습니다");
				}
			});
		});
		
		
	});
	

</script>
</body>
</html>