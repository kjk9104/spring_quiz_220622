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
<title>Favorite_list</title>
</head>
<body>
	<div class="container">
	<h1>즐겨 찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach var="favorite" items="${favoriteList}" varStatus="status">
			<tbody>
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td>
						<!-- (1) name 속성과 value 속성을 이용해서 동적으로 삭제 감지(권장 안함)  -->
<%-- 						<button type="button" name="delBtn" value="${favorite.id}" class="btn btn-danger delete">삭제</button> --%>
						<!-- (2) data를 이용해서 태그에 data를 임시 저장해놓기  -->
						<button type="button" class="btn btn-danger delete" data-favorite-id="${favorite.id}">삭제</button>
					</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
<script>
 $(document).ready(function(){
			// (1) name 속성과 value 속성을 이용해서 동적으로 삭제 감지(권장 안함)
		 $("button[name='delBtn']").on('click', function(e){})
			 
// 			 let id = $(this).attr('value');
// 			 alert(id+"value");
			 
// 			 let id2 = e.target.value;
// 			 alert(id2+"value1");
			 
			 // (2) data를 이용해서 태그에 data를 임시 저장해놓기
			 // 태그 : data-favorite-id data- 그 뒤부터는 우리가 이름을 정한다.(카멜케이스X])
			 // 스크립트: $(this).data(favorite-id); => 태그에 심은 값을 꺼냄
		$(".delete").on('click', function(e){
			let favoriteId = $(this).data('favorite-id');
// 			alert(favoriteId);
			
			 
			 $.ajax({
				 //reqeust
				 type:"POST"
				 ,url: "/lesson06/delete_favorite"
				 ,data:{
					 "id" : favoriteId
				 }
			 	
			 	 //response
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
			 });
			 
		 });
		 
 });
</script>
</body>
</html>