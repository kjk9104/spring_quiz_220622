<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1JSTL core변수</h1>
	<c:set var="number1" value="36" />
	<c:set var="number2">3</c:set>

	<h3>
		첫번째 숫자 : ${number1}<br>
	</h3>
	<h3>
		두번째 숫자 : ${number2}<br>
	</h3>

	<h1>2.JSTL core연산</h1>

	<h3>더하기 : ${number1+number2}</h3>
	<h3>빼기 : ${number1-number2}</h3>
	<h3>곱하기 : ${number1*number2}</h3>
	<h3>나누기 : ${number1/number2}</h3>

	<h1>3.JSTL core out</h1>
	<h3>
		<c:out value="<title>core out</title>" />
	</h3>

	<h1>4.JSTL core if</h1>
<%-- 	<c:set var="average">${(number1+number2)/2}</c:set> --%>
	<c:set var="average" var="${(number1+number2)/2}"/>

	<!--안되는 코드-->

	<%-- 	<c:if test="${number3/2 >= 10}"> --%>
	<%-- 		<h1>${number3}</h1> --%>
	<%-- 	</c:if> --%>

<%-- 	<c:if test="${(number1+number2)/2 >= 10}"> --%>
<%-- 		<h1>${average}h1</h1> --%>
<%-- 	</c:if> --%>
	
	<c:if test="${average >= 10}">
		<h1>${average}h1</h1>
	</c:if>

	<%-- 	<c:if test="${(number1+number2)/2 <= 10"> --%>
	<%-- 		<h3>${number3} h3</h3> --%>
	<%-- 	</c:if> --%>

	<!--되는 코드  -->

	<%-- 	<c:choose> --%>
	<%-- 		<c:when test="${(number1+number2)/2 >= 10}"> --%>
	<%-- 			<h1>${number3} h1</h1> --%>
	<%-- 		</c:when> --%>
	<%-- 		<c:otherwise> --%>
	<%-- 			<h3>${number3} h3</h3>	 --%>
	<%-- 		</c:otherwise> --%>
	<%-- 	</c:choose> --%>

	<h1>5.core if</h1>
	<c:if test="${(number1*number2)>100}">
		<c:out value="<script>alert('너무 큰수입니다.')</script>" escapeXml="false"></c:out>
	</c:if>

</body>
</html>