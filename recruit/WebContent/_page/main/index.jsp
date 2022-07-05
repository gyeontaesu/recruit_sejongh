<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.MainRecruitDAO" %>
<%@ page import="bbs.MainRecruit" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMdd");
	String today = simpleDate.format(date);

	int pageNumber = 1; // 기본 페이지
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<script language="JavaScript">
function bluring(){ 
        if(event.srcElement.tagName=="A"||event.srcElement.tagName=="BUTTON") 
        document.body.focus(); 
} 
document.onfocusin=bluring; 
</script>

<script type="text/javascript">
	$(window).load(function(){

		$("body").on("click", ".mnot_tab ul a", function(){
			var idx = $(".mnot_tab ul a").index($(this));
			$(".mnot_tab ul a").each(function(index){
				if(idx == index){
					$(this).addClass("active");
					$(".mnot_con").eq(index).addClass("show").show();

				}else{
					$(this).removeClass("active");
					$(".mnot_con").eq(index).removeClass("show").hide();
				}
			});
		});
		$(".mnot_tab ul a").eq(0).click();

	});
</script>

<script type="text/javascript" src="../js/isotope.pkgd.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		var $grid;
		$(window).load(function(){	// $(".testText").text("off2");
			$(".mn_list.mn01 ul .item").slice(0, 4).show();
			$(".moreBtn01").click(function(e){
				e.preventDefault();
				$(".mn_list.mn01 ul .item:hidden").slice(0, 4).show();
				$grid.isotope('layout');
				if($(".mn_list.mn01 ul .item:hidden").length == 0){
					alert("더 이상 항목이 없습니다");
					$(".moreBtn01").hide();
				}
			});

			$grid = $(".mn_list.mn01 ul").isotope({
				itemSelector: ".item",
				layoutMode: 'masonry',
				percentPosition: true,
				masonry: {

					gutter: 6,
					transitionDuration: '0.8s'
				}
			});
	
		});
		//]]>

		//<![CDATA[
		var $grid;
		var $grid2;
		var $grid3;
		$(window).load(function(){	// $(".testText").text("off2");
			$(".mn_list.mn01 ul .item").slice(0, 4).show();
			$(".moreBtn01").click(function(e){
				e.preventDefault();
				$(".mn_list.mn01 ul .item:hidden").slice(0, 4).show();
				$grid.isotope('layout');
				if($(".mn_list.mn01 ul .item:hidden").length == 0){
					alert("더 이상 항목이 없습니다");
					$(".moreBtn01").hide();
				}
			});

			$grid = $(".mn_list.mn01 ul").isotope({
				itemSelector: ".item",
				layoutMode: 'masonry',
				percentPosition: true,
				masonry: {

					gutter: 6,
					transitionDuration: '0.8s'
				}
			});

			$(".mn_list.mn02 ul .item2").slice(0, 4).show();
			$(".moreBtn02").click(function(e){
				e.preventDefault();
				$(".mn_list.mn02 ul .item2:hidden").slice(0, 4).show();
				$grid2.isotope('layout');
				if($(".mn_list.mn02 ul .item2:hidden").length == 0){
					alert("더 이상 항목이 없습니다");
					$(".moreBtn02").hide();
				}
			});

			$grid2 = $(".mn_list.mn02 ul").isotope({
				itemSelector: ".item2",
				layoutMode: 'masonry',
				percentPosition: true,
				masonry: {

					gutter: 6,
					transitionDuration: '0.8s'
				}
			});

			$(".mn_list.mn03 ul .item3").slice(0, 4).show();
			$(".moreBtn03").click(function(e){
				e.preventDefault();
				$(".mn_list.mn03 ul .item3:hidden").slice(0, 4).show();
				$grid3.isotope('layout');
				if($(".mn_list.mn03 ul .item3:hidden").length == 0){
					alert("더 이상 항목이 없습니다");
					$(".moreBtn03").hide();
				}
			});

			$grid3 = $(".mn_list.mn03 ul").isotope({
				itemSelector: ".item3",
				layoutMode: 'masonry',
				percentPosition: true,
				masonry: {

					gutter: 6,
					transitionDuration: '0.8s'
				}
			});
	
		});
		//]]>

	</script>



<div class="mainNotice">
	<p class="mTit">채용 공고</p>
	
	<!-- 공고분류탭 -->
	<div class="mnot_tab infit mt40">
		<ul>
			<li><a href="javascript:void(0);">전체</a></li>
			<li><a href="javascript:void(0);">부천세종병원</a></li>
			<li><a href="javascript:void(0);" style="width:166px;">인천세종병원</a></li>
		</ul>
	</div>
	
	<!-- 검색 -->	
	<div class="mnotSc">
		<form method="get" action="../application/list.php">
		<input type="hidden" name="s_target" value="title+content">
		<input type="text" name="s_keyword" value="" required id="stx" class="sc_input" size="25" maxlength="20" placeholder="검색어를 입력하세요.">
		<input type="image" src="../images/new/sc_btn.png" class="sc_btn">
		</form>
	</div>

	<!-- 공고리스트 -->
	<div class="mnot_wp">
		<!-- 전체 -->
		<div class="mnot_con mt15">
			<div class="mn_list mn01">
				<ul>
				<%
				MainRecruitDAO mainRecruitDAO = new MainRecruitDAO();
				ArrayList<MainRecruit> list = mainRecruitDAO.getlist(pageNumber);
				for(int i = 0; i < list.size(); i++) {
				%>
					<li class="item">
						<div class="ntag"><div><p>
						<%! String abc = "201" ;%>
						<%= list.get(i).getInstcd() %>
						<% if (abc == "201") { %>
						<span class="tgreen"">부천세종병원</span>
						<%
						} 
						%>
						</p></div></div>
						<div class="ctg">신입</div>
						<div class="cont">
							<p class="title"><a href="/application/view.php?id=<%= list.get(i).getApntinfono() %>&page=<?=$_GET['page']?>&s_target=<?=$_GET['s_target']?>&s_keyword=<?=urlencode($_GET['s_keyword'])?>"><%= list.get(i).getTitl() %></a></p>
							<p class="date">
								<%= list.get(i).getApntfromdd() %>
								~
								<%= list.get(i).getApnttodd() %>
							</p>
						</div>
						<div class="proc"><span class="on">진행중</span><!--<span class="off">마감</span>--></div>
						<a class="more"  href="/_page/application/view.jsp?id=<%= list.get(i).getApntinfono() %>&page=<?=$_GET['page']?>&s_target=<?=$_GET['s_target']?>&s_keyword=<?=urlencode($_GET['s_keyword'])?>" class="moreB">자세히 보기</a>
					</li>
					<%
						}
					%>
				</ul>
				<div class="dbBtn mt35 moreBtn01"><a href="javascript:void(0);" class="">채용 공고 더 불러오기<img src="../images/new/more_btn.png" alt=">" /></a></div>
				
			</div><!-- mn_list -->
		</div><!-- mnot_con -->

		<!-- 세종병원 -->
		<div class="mnot_con mt15">
			<div class="mn_list mn02">
				<ul>
					<%
			//	MainRecruitDAO mainRecruitDAO1 = new MainRecruitDAO();
			//	ArrayList<MainRecruit> list = mainRecruitDAO1.getlist(pageNumber);
			//	for(int i = 0; i < list.size(); i++) {
				%>
					<li class="item2">
						<div class="ntag"><div><p><?=$hospital?></p></div></div>
						<div class="ctg">신입1</div>
						<div class="cont">
							<p class="title"><a href="../application/view.php?id=<?=$row['APNTINFONO']?>&page=<?=$_GET['page']?>&s_target=<?=$_GET['s_target']?>&s_keyword=<?=urlencode($_GET['s_keyword'])?>"><?=$row['TITL']?></a></p>
							<p class="date">
								<?=substr($row['APNTFROMDD'], 0, 4)?>.<?=substr($row['APNTFROMDD'], 4, 2)?>.<?=substr($row['APNTFROMDD'], 6, 2)?>
								~
								<?=substr($row['APNTTODD'], 0, 4)?>.<?=substr($row['APNTTODD'], 4, 2)?>.<?=substr($row['APNTTODD'], 6, 2)?>
							</p>
						</div>
						<div class="proc"><span class="on">진행중</span><!--<span class="off">마감</span>--></div>
						<a class="more"  href="../application/view.php?id=<?=$row['APNTINFONO']?>&page=<?=$_GET['page']?>&s_target=<?=$_GET['s_target']?>&s_keyword=<?=urlencode($_GET['s_keyword'])?>" class="moreB">자세히 보기</a>
					</li>
					<%
				//		}
					%>

				</ul>
				<div class="dbBtn mt35 moreBtn02"><a href="javascript:void(0);" class="">채용 공고 더 불러오기<img src="../images/new/more_btn.png" alt=">" /></a></div>
				
			</div><!-- mn_list -->
		</div><!-- mnot_con -->

		<!-- 메디세종병원 -->
		<div class="mnot_con mt15">
			<div class="mn_list mn03">
				<ul>
					<?
					?>
					<li class="item3">
						<div class="ntag"><div><p><?=$hospital?></p></div></div>
						<div class="ctg">신입2</div>
						<div class="cont">
							<p class="title"><a href="../application/view.php?id=<?=$row['APNTINFONO']?>&page=<?=$_GET['page']?>&s_target=<?=$_GET['s_target']?>&s_keyword=<?=urlencode($_GET['s_keyword'])?>"><?=$row['TITL']?></a></p>
							<p class="date">
								<?=substr($row['APNTFROMDD'], 0, 4)?>.<?=substr($row['APNTFROMDD'], 4, 2)?>.<?=substr($row['APNTFROMDD'], 6, 2)?>
								~
								<?=substr($row['APNTTODD'], 0, 4)?>.<?=substr($row['APNTTODD'], 4, 2)?>.<?=substr($row['APNTTODD'], 6, 2)?>
							</p>
						</div>
						<div class="proc"><span class="on">진행중</span><!--<span class="off">마감</span>--></div>
						<a class="more"  href="../application/view.php?id=<?=$row['APNTINFONO']?>&page=<?=$_GET['page']?>&s_target=<?=$_GET['s_target']?>&s_keyword=<?=urlencode($_GET['s_keyword'])?>" class="moreB">자세히 보기</a>
					</li>
					<??>
					
				</ul>
				<div class="dbBtn mt35 moreBtn03"><a href="javascript:void(0);" class="">채용 공고 더 불러오기<img src="../images/new/more_btn.png" alt=">" /></a></div>
			</div><!-- mn_list -->
		</div><!-- mnot_con -->
		
	</div><!-- mnot_wp -->
	


</div><!-- mainNotice 종료 -->

​


