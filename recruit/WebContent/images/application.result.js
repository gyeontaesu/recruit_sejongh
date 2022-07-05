jQuery(function($){

	var $application_result	= $("#application_result");

	// auto_jump & key validator
	$application_result.find("input[type='text'],input[type='password']")
					.live("keyup keypress keydown paste", function(e){return jquery_Form.onkey($(this), e);});

	$application_result
		// 입력내용 확인
		.find("form")
			.submit(function(){
				if(jquery_Form.validate($(this)) == false)	return false;

				return true;
			})
			.end()
		.find("button.cancel")
			.click(function(){
				location.href = "/recruit/";
			})
			.end();
});
