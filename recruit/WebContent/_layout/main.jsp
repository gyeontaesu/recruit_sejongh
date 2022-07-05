<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>세종병원 채용정보</title>

<link href="/css/common.css" rel="stylesheet" type="text/css">
<link href="/css/layout.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/js/jquery.lastest.js"></script>
<script type="text/javascript" src="/js/jquery.ui.lastest.js"></script>
<script type="text/javascript" src="/js/publisher.js"></script>
<script type="text/javascript" src="/images/embed.js"></script>

<script type="text/javascript">try{document.execCommand("BackgroundImageCache",false,true)}catch(r){}</script>
</head>

<body >

<div id="wrap" style="background:#f6f6f6;">
	<!--[s] header> -->
	<div id="header">
		<jsp:include page="_header.jsp" flush="true"/>
	</div>
	<!--[e] header-->

	<!--[s] 메인컨텐츠-->
	<div id="mainCon">
		<div class="inConts">

			<div class="mainTxt tp">대한민국을 넘어 세계로 도약하는</div>
			<div class="mainTxt bt">세종병원그룹</div>
			<div class="subTxt">역량있는 의료인을 세종병원그룹으로 초대합니다. </div>
			
			<div class="main_box infit">
				<div class="box01">
				    <a href="/_page/introduce/01.jsp" >
						<p class="tt">인재상</p>
						<div class="bline"></div>
						<p class="st">
							봉사, 창의, 인화를 바탕으로<br />
							기초역량과, 직무역량,<br />
							리더십역량을 두루 갖춘 세종인.
						</p>
					</a>
				</div>
				<div class="box02">
				    <a href="/_page/process/index.jsp" >
						<p class="tt">채용 프로세스</p>
						<div class="bline"></div>
						<p class="st">
							세종병원 그룹의<br />
							채용절차를 알아보세요.
						</p>
					</a>
				</div>
				<div class="box03">
				    <a href="/_page/application/list.jsp" >
						<p class="tt">채용공고</p>
						<div class="bline"></div>
						<p class="st">
							세종병원 그룹에서 진행중인 <br />
							채용 공고를 확인하고<br />
							입사지원서를 작성하세요.
						</p>
					</a>
				</div>
			</div><!-- main_box -->
		</div>
	</div>
	<!--[e] 메인컨텐츠-->
	<div class="main_btn infit">
		<!--a href="../board/list.php?code=2">공지사항<?php if ($notice_new) { ?><img src="../images/new/new_ic.png" alt="" class="new" /><?php } ?><img src="../images/new/main_arr.png" alt="" class="arr" /></a-->
		<a href="#" style="width:590px;">FAQ<img src="../images/new/main_arr.png" alt="" class="arr" /></a>
		<a href="/_page/introduce/map.jsp">찾아오시는 길<img src="../images/new/main_arr.png" alt="" class="arr" /></a>
	</div><!-- main_btn 종료 -->

	<!--[s] 메인 채용공고-->
	
	<div id="content" >
		<div class="inConts pb0">
			<jsp:include page="/_page/main/index.jsp" flush="true"/>
		</div>
	</div>
	
	<!--[e] 메인 채용공고-->

	<!--[s] 푸터-->
	<div id="footer">
		<jsp:include page="_footer.jsp" flush="true"/>
	</div>
	<!--[e] 푸터-->
	


</div><!-- wrap 종료 -->

</body>
</html>
