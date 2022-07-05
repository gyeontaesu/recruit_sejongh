<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="0"/>
	<jsp:param name="layoutNum2" value="2"/>
</jsp:include>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=k16d1QoCWzEI75U9Gx9b"></script>

<script type="text/javascript">
	$(window).load(function(){

		$("body").on("click", ".map_tab ul a", function(){
			var idx = $(".map_tab ul a").index($(this));
			$(".map_tab ul a").each(function(index){
				if(idx == index){
					$(this).addClass("active");
					$(".map_con").eq(index).addClass("show").fadeIn(500);

				}else{
					$(this).removeClass("active");
					$(".map_con").eq(index).removeClass("show").fadeOut(200);
				}
			});
		});
		$(".map_tab ul a").eq(0).click();

	});
</script>

<div class="inConts">
	<!-- 공고분류탭 -->
	<div class="map_tab infit">
		<ul>
			<li><a href="javascript:void(0);">부천세종병원</a></li>
			<li><a href="javascript:void(0);" style="width:166px;">인천세종병원</a></li>
		</ul>
	</div>

	<div class="map_wp">
		

		<!-- 세종 -->
		<div class="map_con">
			<div class="mapw">
				<div id="daumRoughmapContainer1616132160309" class="root_daum_roughmap root_daum_roughmap_landing"></div>
			</div>

			<!--
				2. 설치 스크립트
				* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
			-->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1616132160309",
					"key" : "24wy3",
					"mapWidth" : "1180",
					"mapHeight" : "400"
				}).render();
			</script>

			<div class="map_list">
				<img src="/images/new/map_01.jpg" alt="세종병원오시는길" />
			</div>
		</div><!-- map_con -->
		
		<!-- 메디세종 -->
		<div class="map_con">
			<div class="mapw">
				<div id="daumRoughmapContainer1616132435845" class="root_daum_roughmap root_daum_roughmap_landing"></div>
			</div>

			<!--
				2. 설치 스크립트
				* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
			-->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1616132435845",
					"key" : "24wy8",
					"mapWidth" : "1180",
					"mapHeight" : "400"
				}).render();
			</script>

			<div class="map_list">
				<img src="/images/new/map_02.jpg" alt="인천세종병원오시는길" />
			</div>
			
		</div><!-- map_con -->
	</div><!-- map_wp -->
	
</div>




<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>