<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%
	String[] arr = {"순두부","된장찌개","제육덮밥"};
	request.setAttribute("menu", arr);%>
<jsp:forward page="testArray02.jsp" />