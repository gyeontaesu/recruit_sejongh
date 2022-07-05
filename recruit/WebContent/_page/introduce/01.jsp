<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="0"/>
	<jsp:param name="layoutNum2" value="0"/>
</jsp:include>
<div class="inConts">
	<div class="bTitle"><p>세종 인재상</p></div>

	<div class="intro_tt">
		<span class="tbl">봉사, 창의, 인화</span>를 바탕으로<br />
		<span class="tbl">기초역량, 직무역량, 리더십역량</span>을 두루 갖춘 세종인 
	</div>
	<p class="mt70 tac"><img src="/images/new/intro_01.jpg" alt="" /></p>
</div><!-- inConts -->
<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>