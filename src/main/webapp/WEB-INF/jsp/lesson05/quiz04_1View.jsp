<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>JSTL fn 라이브러리</title>
</head>
<body>
	<div class="container">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화 번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<c:forEach var="member" items="${members}" varStatus="status">
				<tbody>
					<tr>
						<td>${status.count}</td>
						<td>${member.getName()}</td>
						<td>
						<c:choose>
								<c:when
									test="${fn:startsWith(member.getPhoneNumber(), '010')}">
						${member.getPhoneNumber()}
						</c:when>
							<c:otherwise>
									유효하지 않는 번호 입니다.
							</c:otherwise>
						</c:choose>
						</td>
						<td>${fn:replace(member.getNationality(),'시대','-')}</td>
						<td><b>${fn:split(member.getEmail(),'@')[0]} </b>@${fn:split(member.getEmail(),'@')[1]}</td>
						<td>
								<c:if test="${fn:length(member.getIntroduce()) > 15}">
										${fn:substring(member.getIntroduce(),0,15)}...
								</c:if>
								<c:if test="${fn:length(member.getIntroduce()) <= 15}">
										${member.getIntroduce()}
								</c:if>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>