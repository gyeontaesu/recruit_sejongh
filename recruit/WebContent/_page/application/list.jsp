<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.RpemapntDAO" %>
<%@ page import="bbs.Rpemapnt" %>
<%@ page import="java.util.ArrayList" %>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="2"/>
	<jsp:param name="layoutNum2" value="4"/>
</jsp:include>

<%
	int pageNumber = 1; // 기본 페이지
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>

<p class="bTxt tbl tac fw300">채용 공고</p>

<div class="search_top tar mt30">
	<form method="get" action="list.jsp">
	<input type="hidden" name="code" value="" />
	<select name="s_target" class="target">
		<option value="title_content" <c:if test="${param.s_target eq 'title_content'}">selected</c:if>>전체</option>
		<option value="title" <c:if test="${param.s_target eq 'title'}">selected</c:if>>제목</option>
		<option value="content" <c:if test="${param.s_target eq 'content'}">selected</c:if>>내용</option>
	</select>
	<input type="text" class="text keyword" name="s_keyword" value="${param.s_keyword}"  placeholder="검색어를 입력하세요" />
	<button type="submit" class="submit"><span>검색</span></button>
	</form>
</div>


<div class="inConts">
	<div class="board_list nobord link mt45">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td width="100" class="tt">번호</td>
				<td width="200" class="tt">부서</td>
				<td width="auto" class="tt">제목</td>

			</tr>
			<%
			RpemapntDAO rpemapntDAO = new RpemapntDAO();
				ArrayList<Rpemapnt> list = rpemapntDAO.getlist(pageNumber);
				for(int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td class="rbt"><%= list.get(i).getApntinfono() %></td>
				<td><%= list.get(i).getDeptcd() %></td>
				<td class="title"><a href="view.jsp?id=<%= list.get(i).getApntinfono() %>"><%= list.get(i).getTitl() %></a></td>
			</tr>
			
			<%
						}
					%>
		</table>
	</div><!-- board_list -->

	<!--[s] Paging -->
			<%
				if (pageNumber != 1) {
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if (rpemapntDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
	<div class="paging_all mt45">
		<div class="paging til rbt">
		
			
		
			<a class="ml3"><img src="/images/new/board_prev2.gif" alt="PPrev" /></a>
			<a class="ml3"><img src="/images/new/board_prev.gif" alt="Prev" /></a>

			<span class="num">
				

				<a class="prevPages" ><span class="page"></span></a>
				


				<a class="curPage"><span class="page"></span></a>

				

				<a class="nextPages" ><span class="page"></span></a>
				

			</span>

			<a class="on"><img src="/images/new/board_next.gif" alt="Next" /></a>
			<a class="on"><img src="/images/new/board_next2.gif" alt="NNext" /></a>
		</div>
	</div>
	<!--[e] Paging -->
</div><!-- inConts -->




<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>