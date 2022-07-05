$(function(){
	var $menu	= $('#slidemenu');
	var $menu_list = $menu.children('li'); //메인메뉴
	var $overlay = $('#overlay');

  $menu_list.bind('mouseover',function(){
		var $this = $(this);
		$this.addClass('slide  selected');
		$this.children('div').css('z-index','9999').stop().slideDown(0, function(){
			$menu_list.not('.slide').children('div').hide();//반대로 이동할때 서브메뉴 표시토록
			$this.removeClass('slide');
		});
	}).bind('mouseleave',function(){
		var $this = $(this);
		$this.removeClass('selected').children('div').css('z-index','1');//아웃시 젯인덱스1
	});

	$menu.bind('mouseenter',function(){
		var $this = $(this);
		$overlay.stop().fadeTo(200, 0.7);

	}).bind('mouseleave',function(){
		var $this = $(this);
		$overlay.stop().fadeTo(200, 0);
		$menu_list.children('div').hide();
	});

});