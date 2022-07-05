<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="1"/>
	<jsp:param name="layoutNum2" value="3"/>
</jsp:include>

<div class="inConts">
	<div class="bTitle"><p>채용 프로세스</p></div>
	<p class="tac mt70"><img src="/images/new/proc_con.jpg" alt="" /></p>
</div>




<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>