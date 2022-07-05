<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String[] arr = {"병원 소개","채용 프로세스","채용 공고","결과확인"};
	request.setAttribute("mainMenu", arr);
	

	String[] arr1 = {"인재상","비전과 핵심가치","찾아오시는 길","채용 프로세스","채용 공고","조회/수정","결과확인"};
	request.setAttribute("subMenu", arr1);
	
	String[] arr2 = {"bg01","bg02 wht","bg04 wht","bg05"};
	request.setAttribute("sVisual", arr2);
%>

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


<script type="text/javascript" src="/js/jquery-1.8.3.min"></script>
<script type="text/javascript" src="/js/publisher.js"></script>
<script type="text/javascript" src="/images/embed.js"></script>
<script type="text/javascript" src="/js/TweenMax.min.js"></script>
<script type="text/javascript">
function fixPNG(el)
{
	if(typeof(DD_belatedPNG) == "undefined")
		el.style.behavior = "none";
	else
		DD_belatedPNG.fixPng(el);
}

jQuery(function($){
	// over된 것이 없으면 Active가 활성화
	function timer_active()
	{
		if($menu_li.filter(".over").size() == 0)
		{
			$menu_li.filter(".active").trigger("refresh");
		}
	}

	var $menu		= $("#snb > div.menu");
	var $menu_li	= $menu.find("> ul > li");
	var li_height	= $menu_li.eq(0).height();
	var $over_bg	= $menu.children("div.over_bg");

	$menu_li
		.bind("refresh", function(){
			var $this		= $(this);
			var number1		= Number($this.attr("number1"));
			var number2		= Number($this.attr("number2"));
			var is_active	= $this.hasClass("active");
			var is_over		= $this.hasClass("over");

			// 오버된 것이 없으면서 활성화되어있으면
			if( ! is_over && is_active && $menu_li.filter(".over").size() == 0)
				is_over	= true;

			$this.css("background-position", (number1-1)*-200+"px " + ((number2-1)*-50-(is_over?25:0))+"px");

			if(is_over)
			{
				// 마우스 올리면 해당 위치로 이동
				$over_bg.css({"top":(number2-1)*li_height});

				if(is_active == false)
					$menu_li.filter(".active").trigger("refresh");
			}
			else
				window.setTimeout(timer_active, 30);
		})
		.trigger("refresh")
		.hover(function(){
				$(this).addClass("over").trigger("refresh");
			}, function(){
				$(this).removeClass("over").trigger("refresh");
			}
		)
		;
});
</script>
</head>
<body>
<iframe id="hidden_iframe" name="hidden_iframe" style="display:none;"></iframe>
<form name="upload_frm" target="hidden_iframe" method="post" enctype="multipart/form-data" action="../upload.php">
<input type="hidden" name="MAX_FILE_SIZE" value="524288">
</form>

<style>
#mask { position:absolute; left:0; top:0; z-index:9000; background-color:#000; display:none; }
#boxes .window { position:absolute; left:0; top:0; width:440px; display:none; z-index:9999; padding:20px;}
#boxes #zip { width:475px;  height:303px; border:5px #5797d1 solid; background:#fff;}
#boxes #photo { width:475px;  height:203px; border:5px #5797d1 solid; background:#fff;}
#floating {z-index:9999;}
#loading {background:#fff;width:300px;height:20px;border:3px #b1252b solid;padding:40px 0;text-align:center;display:none;}
</style>
<div id="boxes">
	<div id='floating'>

		<div id='loading' class='window'>
			<img id='limg' src='/images/load_data.gif' alt='' />
			<p style='padding-top:10px;' id='lmsg'>임시 저장중입니다...</p>
		</div>

		<div id="zip" class="window">
			<p style='padding-bottom:10px;height:24px'>
				<a href="#" class="close"><img src='/images/close_btn.gif' alt='닫기' style='float:right;'/></a>
			</p>
			<p style='clear:both;height:10px;'></p>
			우편번호 검색 <input type='text' class='input' id='zaddress' onkeyup="findZip(this.value,document.getElementById('ziptype').value)" />&nbsp; (ex : 삼성동)
			<hr />
			<div id='ziplist'></div>
		</div>

		<div id="photo" class="window">
			<p style='padding-bottom:10px;height:24px'>
			<a href="#" class="close"><img src='/images/close_btn.gif' alt='닫기' style='float:right;'/></a>
			</p>
			<div style='position:relative;left:30px;'>
				<iframe src='../file_upload.html' frameborder='0' leftmargin='0' topmargin='0' width='400' scrolling='no' height='150'></iframe>
			</div>

		</div>
	</div>
	<div id="mask"></div>
</div>

<div id="wrap">
	<!--[s] header> -->
	<div id="header">
		<jsp:include page="_header.jsp" flush="true"/>
	</div>
	<!--[e] header-->

	<div id="containerWrap">
		<div id="container">

			<div id="subTop">
				<div class="sVisual <c:forEach var="bg" items="${sVisual}" begin="${param.layoutNum}" end="${param.layoutNum}">${bg }</c:forEach>">
					<div class="inConts">

						<div class="location">
							<span class="home_icon"></span>  <span class="arr"></span>					
							<c:forEach var="main" items="${mainMenu}" begin="${param.layoutNum}" end="${param.layoutNum}">${main }</c:forEach>							
							<span class="arr lst"></span> <span  class="lst" ><c:forEach var="sub" items="${subMenu}" begin="${param.layoutNum2}" end="${param.layoutNum2}">${sub }</c:forEach>	</span>
						</div><!-- location -->

						<div class="title">
							<p class="bt"><c:forEach var="sub" items="${subMenu}" begin="${param.layoutNum2}" end="${param.layoutNum2}">${sub }</c:forEach></p>
							<c:set var="susText" value="${param.layoutNum2}" />
							<%-- ${susText} 레이아웃 코드번호 확인--%>
							<c:if test="${susText eq '2'}">
							<p  class="st active">세종병원그룹으로 찾아오시는 길입니다.</p>
							</c:if>
							
							<c:if test="${susText eq '6'}">
 								<p  class="st active">우리와 함께할 미래의 세종인을 기대합니다.</p>
 							</c:if>
							
						</div>

					</div><!-- inConts -->
				</div><!-- sVisual -->	
					
			</div><!-- subTop -->		
			<div id="content" class="bg01">
				

