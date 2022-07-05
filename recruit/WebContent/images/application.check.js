jQuery(function($){

	var $application_check	= $("#application_check");

	// auto_jump & key validator
	$application_check.find("input[type='text'],input[type='password']")
					.live("keyup keypress keydown paste", function(e){return jquery_Form.onkey($(this), e);});

	$application_check
		// 입력내용 확인
		.find("form")
			.submit(function(){
				if(jquery_Form.validate($(this)) == false)	return false;

				return true;
			})
			.end()
		// 채용구분 선택시
		.find("select[name='APNTINFONO']")
			.change(function(){
				var $selected	= $(this.options[this.selectedIndex]);

				var fromdate	= $selected.attr("fromdate");
				var todate		= $selected.attr("todate");

				if(fromdate == "" || todate == "")
					$("#period").html("");
				else
					$("#period").html(fromdate.substring(0, 4)+"-"+fromdate.substring(4, 6)+"-"+fromdate.substring(6, 8)+" ~ "
									+todate.substring(0, 4)+"-"+todate.substring(4, 6)+"-"+todate.substring(6, 8));
			})
			.end()

		// 수험번호 조회 클릭
		.find("button.find_EXAMNO")
			.click(function(){
				var $form = $(this.form);

				// 입력내용 확인
				//if(jquery_Form.validate($form.find(":input").filter("[name='APNTINFONO'],[name='KORNAME'],[name='RREGNO[]'],[name='PWD']")) == false)	return false;
				if(jquery_Form.validate($form.find(":input").filter("[name='APNTINFONO'],[name='KORNAME'],[name='PWD']")) == false)	return false;
				
				$.ajax({type:"POST",
						url:"proc.php",
						data: "action=getEXAMNO&"+$form.serialize(),
						dataType: "json",
						success: function(json){
							if(json["EXAMNO"])
							{
								alert($form.find("input[name='KORNAME']").val()+'님의 수험번호는 "'+json["EXAMNO"]+'"입니다.');
								$form.find("input[name='EXAMNO']").val(json["EXAMNO"]);
							}
							else
							{
								alert("입력하신 정보가 다릅니다.");
							}
						}
					});
			})
			.end()
			;
	
	
});
