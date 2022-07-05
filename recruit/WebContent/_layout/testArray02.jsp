<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String[] arr = {"순두부","된장찌개","제육덮밥"};
	request.setAttribute("menu", arr);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 코어 라이브러리 : forEach / items 배열출력실습</title>
</head>
<body>
<h3>String 배열</h3>
<ul>
	<c:forEach var="dish" items="${menu}">
		<li> ${dish }</li>
	</c:forEach>
</ul>
 
<hr>
 
   
 
</body>
</html>