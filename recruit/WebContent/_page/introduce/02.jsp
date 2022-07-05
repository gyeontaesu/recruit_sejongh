<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="0"/>
	<jsp:param name="layoutNum2" value="1"/>
</jsp:include>
<script type="text/javascript">
	$(window).load(function(){

		$("body").on("click", ".vis_tab>.inConts>ul>li", function(){
			var idx = $(".vis_tab>.inConts>ul>li").index($(this));
			$(".vis_tab>.inConts>ul>li").each(function(index){
				if(idx == index){
					$(this).addClass("active");
					$(".vis_con").eq(index).addClass("show");

				}else{
					$(this).removeClass("active");
					$(".vis_con").eq(index).removeClass("show");
				}
			});
		});
		$(".vis_tab>.inConts>ul>li").eq(0).click();

	});
</script>

<div class="bTitle"><p>MISSION</p></div>

<p class="tac bTxt mt70">건강하고 행복한 미래</p>
<p class="tac rbt mTxt f22 mt60">우리는 우리가 가진 모든 능력을 이용하여 인류가 건강하고 행복한 미래를 누릴 수 있도록 최선을 다한다.</p>

<div class="vision_wp">

	<div class="vis_con vis01">
		<div class="vis_top">
			<div class="bTitle"><p>세종병원 그룹 VISION 2030</p></div>
			<p class="tac bTxt mt50">디지털 전환을 통하여 미래의료를 선도하는 병원 그룹</p>
		</div>
		<div class="line"></div>
	</div>
	<div class="vis_tab infit">
		<div class="inConts">
			<ul>
				<li class="v01">
				<p class="mt80 tac" align = "center"><img src="/images/new/vision_bot.png" alt="" /></p>
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>