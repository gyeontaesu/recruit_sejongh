<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.RpemapntDAO" %>
<%@ page import="bbs.Rpemapnt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="2"/>
	<jsp:param name="layoutNum2" value="4"/>
</jsp:include>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
	String today = simpleDate.format(date);

	int ID = 0;
	if (request.getParameter("id") != null) {
		ID = Integer.parseInt(request.getParameter("id"));
	}
	
		if (ID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");
		}
	Rpemapnt rpemapnt = new RpemapntDAO().getID(ID);
%>
<//%= request.getParameter("id") %>
<%=today %>

<div class="inConts">

	<p class="bTxt tbl tac fw300">채용 공고</p>

	<!-- [s] 게시판 보기 -->
	<div class="board_view mt35">
		<div class="view_top infit">
			<p class="title"><%= rpemapnt.getTitl() %></p>
		</div>
		<!-- view_top -->

		<div class="tb_top">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td width="240" class="tt">부서 : <%= rpemapnt.getDeptcd() %></td>
				<td width="auto" class="tt">모집분야 : <%= rpemapnt.getRecufild() %></td>
				<td width="150" class="tt"><a class="btnNormal sm" onclick="recruit()" style="cursor:pointer;">지원서 작성하기</a></td>
			</tr>
		</table>
		</div>
		<div class="view_con">
			<?=$content_row['content']?>
		</div>
		<!-- view_con -->
	</div>
	<!-- [e] 게시판 보기 -->

	<div class="btnArea tar mt40">
		<a href="../application/list.php" class="btnNormal">목록</a>
	</div><!-- btnArea -->

	<div class="pageNavi">
		<?php
		if ($row_prev['APNTINFONO']) {
		?>
		<a href="./view.php?id=<?=$row_prev['APNTINFONO']?>" class="btnNormal dark mr18"><img src="../images/new/btn_arr.gif" alt="" class="mr10" />이전글</a>
		<?php
		}
		?>
		<?php
		if ($row_next['APNTINFONO']) {
		?>
		<a href="./view.php?id=<?=$row_next['APNTINFONO']?>" class="btnNormal dark">다음글<img src="../images/new/btn_arr2.gif" alt="" class="ml10" /></a>
		<?php
		}
		?>
	</div><!-- pageNavi -->
</div>




<script type='text/javascript'>
	function recruit() {
	//	var is = confirm("인터넷 익스플로러 8 이하의 환경에서 정상작동합니다. \n\n지원신청을 하시겠습니까?");		
	//	if(is==true) 

		location.href = "https://old.sejongh.co.kr/recruit/application/agree.php?id=<%= request.getParameter("id") %>";
}
</script>

<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>