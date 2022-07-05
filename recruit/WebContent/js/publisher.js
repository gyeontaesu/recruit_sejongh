var scrollTop,			
	 gnbTop,				// GNB Top
	 lnbTop,				// LNB Top

	 win_w,				
	 win_h,			

	 lyNums = 0,			
	 lyOne = 0;			

var pgCode, depth_1, depth_2, depth_3, depth_4;


$(function(){
	if($("html").hasClass("layerIns")){
		$.ajax({
			type : "GET" //"POST", "GET"
			, url : "../addLayer.html" //Request URL
			, error : function(request, status, error) {

			 alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
			}
			, success : function(data, status, request) {

				$(".layerCell").append(data);
				//alert(response+", "+status+", "+request)
				//$(".layerCell")
			}
			, beforeSend: function() {
				$(".layerCell").html("")
			}
			, complete: function() {
				//$(".small>a").eq(0).click();
			}
		});
	}

	/*if($("html").hasClass("sub")){
		menuTop = $(".sub #container #snb").offset().top;
		scrollTop = $(window).scrollTop();
		scrollE(scrollTop);
	}*/
});

$(window).load(function(){
	$("body").append('<p class="testText"></p>');


	// Gnb on
	$("body").on("mouseenter", ".gnb>li", function(){
		var idx = $(".gnb>li").index($(this));

		if($("html").hasClass("main")){
			$("#header .bgGnb").slideDown(150);

		}else{
			$("#header .bgGnb").slideDown(150);
		}
		$(".gnb>li").each(function(index){
			if(idx == index){
				$(this).addClass("active");
				$(".gnbSub").eq(index).slideDown(200);
			}else{
				$(this).removeClass("active");
				$(".gnbSub").eq(index).slideUp(100);
			}
		});
	});

	// Gnb off
	$("body").on("mouseleave", ".gnb", function(){
		$(".gnb>li").each(function(index){
			$(this).removeClass("active");
			if($(this).hasClass("openPage")){
				$(this).find(".gnbSub").slideDown(200);
			}else{
				$(this).find(".gnbSub").slideUp(100);
			}
		});
		if($("html").hasClass("main")){
			$("#header .bgGnb").slideUp(200);
		}else{
			$("#header .bgGnb").slideUp(200);
		}
	});

	start_motion();
	function start_motion(){
		$(".mainTxt.tp").stop().animate({'opacity': '1', 'top' : '0'}, 1500,  'easeInOutExpo');
		$(".mainTxt.bt").stop().delay(250).animate({'opacity': '1', 'top' : '0'}, 1500,  'easeInOutExpo');
		$(".subTxt").stop().delay(450).animate({'opacity': '1', 'top' : '0'}, 1500,  'easeInOutExpo');
		$(".main_box .box01").stop().delay(550).animate({'opacity': '1', 'bottom' : '0px'}, 1500,  'easeInOutExpo');
		$(".main_box .box02").stop().delay(650).animate({'opacity': '1', 'bottom' : '0px'}, 1500,  'easeInOutExpo');
		$(".main_box .box03").stop().delay(750).animate({'opacity': '1', 'bottom' : '0px'}, 1500,  'easeInOutExpo');
	};



	// Go Top
	$("body").on("click", ".goTop", function(){
		$('html, body').animate({scrollTop: 0}, 300);
	});

});

// 레이어 열기
var layOne = true;
function openLay(name){
	if(layOne == true){
		winH = $(window).height();
		TweenLite.to($("#wrap"), 0.3, {height:winH, "position":"relative"});
		TweenLite.to($("#wrap #wrapArea"), 0.3, {"position":"absolute", delay:0.3});

		lyNums++;
		$(".layerBox").each(function(index){
			if($(this).hasClass(name)){
				layOne = false;
				$(this).layerScript({divs : name});
			}

		});

		// 레이어 스크롤
		$("body").on("scroll", "#layerArea", function(e){
			var siteTop = $("#layerBg").scrollTop();
			if(siteTop > 30){
				$(".layerArea .title").addClass("fixed");
			}else{
				$(".layerArea .title").removeClass("fixed");
			}
		});
	}
}

// 레이어 닫기
function layerClose(name){
	$(".layerBox").each(function(index){
		if($(this).hasClass(name)){
			var e = $(this);

			e.hide().attr("style","");
			$(".layerBgIn").remove();
			$(".layerBox").eq(0).show();

			lyNums --;
			if(lyNums == 0){
				$("html").css("overflow-y","auto");
				$("body").removeClass("lyOn");
				$("#layerBg").fadeOut(300);
				$("#layerArea").removeClass("ons");
				$(".layerBox").hide();

				TweenLite.to($("#wrap"), 0.3, {height:"auto", "position":"relative"});
				TweenLite.to($("#wrap #wrapArea"), 0.3, {"position":"relative"});
			}
		}
	});
}

// Plugin Script
jQuery(function($){
	//[s] Tab Script
	$.fn.tabScript = function(o){
		o = $.extend({
			btns : '',
			conts : '',
			classd: ''
		}, o || {});

		var e = $(this),
			  e_btn = e.find(o.btns),
			  e_cont = e.find(o.conts);

		// 초기화
		e_btn.eq(0).addClass(o.classd);
		e_cont.eq(0).show();

		// 클릭 이벤트
		e.on("click", o.btns, function(){
			e_btn.removeClass(o.classd);
			if(!e.hasClass("noScript")){
				e_cont.hide();
			}

			var idx = e_btn.index($(this));
			e_btn.each(function(index){
				if(idx == index){
					$(this).addClass(o.classd);
					if(!e.hasClass("noScript")){
						e_cont.eq(index).show();
					}
				}
			});
		});
	}
	//[e] Tab Script

	//[s] Layer Script
	$.fn.layerScript = function(o){
		o = $.extend({
			divs : ''
		}, o || {});

		var e = $(this),
			  bg = $('<div id="layerBg"></div>'),
			  bgIn = $('<div class="layerBgIn"></div>'),
			  ly_w,
			  ly_h,
			  closeDiv = o.divs;

		//tab
		if(e.hasClass("tab")){
			// 플러그인 텝 메뉴
			$(".tabArea.ly").tabScript({
				btns : '.btnTab>a',
				conts : '.tabConts',
				classd: 'active',
				nums: '0'
			});
		}

		$("body").attr("lyNums", lyNums);
		// 열기
		if(!$("body").hasClass("lyOn")){
			$("html").css("overflow-y","auto");
			$("body").addClass("lyOn");
			$("#layerArea").addClass("ons");
			bg.prependTo($("body"));
		}

		e.show();
		layOne = true;

		if(lyNums == 2){
			bgIn.prependTo($("#layerArea .layerIn"));
			$(".layerBox").eq(0).hide();
			e.css("z-index",13);
		}

		// select box 디자인
		e.find(".selectType.lay").each(function(index){
			if(!$(this).hasClass("on")){
				$(this).addClass("on");
				$(this).find("select.selectCus").customSelect({customClass:"selType"});
			}
		});

		// 닫기
		$(this).find(".closeLy").off("click");
		$(this).find(".closeLy").on('click', function(){
			layerClose(closeDiv);
		});
	}
	//[e] Layer Script

	
});
