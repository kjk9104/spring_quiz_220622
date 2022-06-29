<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div class=container>
		<h1>판매자 추가</h1>
		<form method=get action="/lesson04/add_seller">
			<div class="form-group">
				<label for="name">닉네임</label> <input type="text" id="nickname"
					name="name" class="form-control col-3" placeholder="닉네임을 입력해주세요">
			</div>
			<div class="form-group">
				<label for="name">프로필 사진 url</label> <input type="text" id="profileImageUrl"
					name="name" class="form-control col-3" placeholder="주소를 입력해 주세요">
			</div>
			<div class="form-group">
				<label for="name">온도</label> <input type="text" id="temperature"
					name="name" class="form-control col-3" placeholder="온도를 입력해 주세요">
			</div>
		</form>
	</div>
</body>
</html>