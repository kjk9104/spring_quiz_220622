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
				<label for="name">제목</label> <input type="text" id="name"
					name="name" class="form-control col-10" placeholder="제목을 입력해주세요">
		</div>
		<div class="form-group">
				<label for="url">주소</label> <input type="text" id="url"
					name="url" class="form-control col-10" placeholder="주소를 입력해주세요">
		</div>
		<input type="button" id="addBtn" value="저장" class="btn col-10 bg-success text-white">
	</div>
	
<script>
	$(document).ready(function(){
		$('#addBtn').on('click', function(){
			let name = $('#name').val().trim();
			let url = $('#url').val().trim();
			if(name == ""){
				alert("제목을 입력해 주세요");
				return;
			}
			if(url == ""){
				alert("주소를 입력해주세요");
				return;
			}
		
			$.ajax({
				type:"POST"
				,url: "/lesson06/add_favorite"
				,data: {
					"name": name
					,"url" : url
				}
				
				, success: function(data){
					alert(data);
					location.href="/lesson06/favorite_list" //수행이 끝나고 가고 싶은 주소 입력
				}
				, comlete: function(data){
					alert("완료");
				}
				, error: function(e){
					alert("error" + e);
				}
			});
		});
	});
	

</script>
</body>
</html>