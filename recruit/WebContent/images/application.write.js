jQuery(function($){
	/*
	step3에서 확인 누르면 입력내용 확인하고 입사지원!
	*/

	// 페이지 전환
	function change_step(step)
	{
		switch(step)
		{
			case 1:
				$step1.show().find(":input:first").focus();
				$step2.hide();
				$step3.hide();
				break;

			case 2:
				$step1.hide();
				$step2.show()//.find(":input:first").focus();
				$step3.hide();
				break;

			case 3:
				$step1.hide();
				$step2.hide();
				$step3.show().find(":input:first").focus();
				break;
		}

		$processbar.children("li:nth-child(3)").addClass("on");
	} // end function

	// 팝업
	// 리턴값 : true(팝업), false(팝업없음)
	function popup(popup_name, option)
	{
		$popup_content	= $popup.find("> div.popup > div.content > div").hide();
		$this_popup		= $popup_content.filter(".data_"+popup_name).show();
		if($this_popup.size() > 0)
		{
			$popup
				.find("> div.popup")
					.css({"width":$this_popup.attr("width"), "height":$this_popup.attr("height")})
					.end()
				.trigger("open")
				.data("option", option);

			$this_popup.trigger("open");

			return true;
		}

		return false;
	} // end function

	$(window).bind("beforeunload", function(){
		return "작성중인 내용은 저장되지 않았습니다!";
	});

	$application_form	= $("#application_form");
	$application		= $("#application");
	$processbar			= $application.children("prcBar>ul");
	$step1				= $application.children("div.step1");
	$step2				= $application.children("div.step2");
	$step3				= $application.children("div.step3");

	$popup				= $("#popup").appendTo("#wrap");


	/*** upload image ***/
	function fileDialogComplete(numFilesSelected, numFilesQueued)
	{
		try {
			if (numFilesQueued > 0) {
				this.startUpload();
			}
		} catch (ex) {
			this.debug(ex);
		}
	}
	function uploadSuccess(file, serverData) {
		try {
			eval("json="+serverData+";");

			$("#photo_input").val(json.filename);
			$("#photo_view").attr("src", json.url);

		} catch (ex) {
			this.debug(ex);
		}
	}
	/*
	var settings_object = {
		upload_url : "../upload.php",
		flash_url : "../images/swfupload.swf",
		file_size_limit : "364 KB",

		//file_types : "*.jpg;*.gif;*.png",
		file_types : "*.jpg",
		file_types_description : "이미지파일",

		file_dialog_complete_handler : fileDialogComplete,
		upload_success_handler : uploadSuccess,

		// Button Settings
		button_placeholder_id : "uploadButtonPlaceholder",
		button_width: 400,
		button_height: 400,
		button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_cursor: SWFUpload.CURSOR.HAND,
		button_action: SWFUpload.BUTTON_ACTION.SELECT_FILE
	};
	swfu = new SWFUpload(settings_object);
	*/

	/*** input ***/

		// auto_jump & key validator
		$application.find("input[type='text'],input[type='password']")
					.live("keyup keypress keydown paste", function(e){return jquery_Form.onkey($(this), e);});

		// date
		$application.find("input.date")
			/*
			.each(function(){
				this.defaultValue = "예)2010-01-01";
				if(this.value == "") {
					this.value = this.defaultValue;
				}
			})
			.live("blur", function(){
				if(this.value == "") {
					this.value = this.defaultValue;
				}
			})
			.live("focus", function(){
				if(this.value == this.defaultValue) {
					this.value = "";
				}
			})

			.live("focus", function(){
				$this = $(this);
				$this.attr("maxlength", "10")
					.attr("invalid_msg", $this.attr("title")+"를 입력하실땐 날짜형식으로 넣어주세요\n\n예시) 2010-01-01")
					.attr("pattern", "/^[0-9-]+$/")
					.attr("rm_pattern", "/[^0-9-]/g");
			})
			*/
			.live("blur", function(){
				this.value = this.value.replace(/\./g, "-");
			})
			;

		$inputs		= $application_form.find(":input");

		// 주민번호 입력했을 경우
		/*
		$inputs.filter("input[name='RPEMENSU[RREGNO][]']")
			// 성별/생년월일 자동입력
			.blur(function(){
				var $pregno		= $application.find("input[name='RPEMENSU[RREGNO][]']");
				var $birth		= $application.find("input[name='RPEMENSU[BRTHMD]']");
				var $sex		= $application.find("input[name='RPEMENSU[GNDR]']");
				var str_pregno1	= $pregno.eq(0).val();
				var str_pregno2	= $pregno.eq(1).val();

				if(str_pregno1.length == 6 && str_pregno2.length == 7)
				{
					var birthY	= str_pregno1.substring(0,2);
					var birthM	= str_pregno1.substring(2,4);
					var birthD	= str_pregno1.substring(4,6);
					var sex		= str_pregno2.substr(0, 1);

					switch(sex)
					{
						case "1":
						case "2":
							birthY = "19" + birthY;
							break;

						case "3":
						case "4":
							birthY = "20" + birthY;
							break;
					}
					$sex.filter("[value='"+(sex%2 == 1 ?"M":"F")+"']").attr("checked", true);
					$birth.val(birthY+"-"+birthM+"-"+birthD);
				}
			});
		*/
		// 중복지원 확인
		if($inputs.filter("[name='action']").val() == "write")
		{
			$inputs.filter("input[name='RPEMENSU[RREGNO][]']")
				.blur(function(){
					var $APNTINFONO	= $application_form.find("input[name='APNTINFONO']");
					var $pregno		= $application.find("input[name='RPEMENSU[RREGNO][]']");
					var str_pregno1	= $pregno.eq(0).val();
					var str_pregno2	= $pregno.eq(1).val();
					if(str_pregno1.length == 6 && str_pregno2.length == 7)
					{
						//alert($(this).parent().html());
						$("#ajax-loading").appendTo($(this).parent().css("position", "relative"));
						$.ajax({
							type	:"POST",
							url		:"proc.php",
							data	:"action=checkDuplication&APNTINFONO="+$APNTINFONO.val()+"&RREGNO="+str_pregno1+str_pregno2,
							dataType:"script"
						});
					}
				});
		}

		// 이메일
		$emailaddr_select	= $inputs.filter("[name='RPEMENSU[EMAILADDR]']");
		$etcemailaddr_text	= $inputs.filter("[name='RPEMENSU[ETCEMAILADDR]']");
		$emailaddr_select
			.change(function(){
				var $this = $(this);
				if($this.val() == '08')
				{
					$etcemailaddr_text
						.attr("required", $this.attr("required"))
						.attr("title", $this.attr("title"))
						.val("").show().focus();
				}
				else
				{
					$etcemailaddr_text
						.removeAttr("required")
						.removeAttr("title")
						.val("").hide();
				}
			});
		if($emailaddr_select.val() != "08") // 기타가 아니면
			$etcemailaddr_text.hide();

		// 우편번호 검색 버튼
		$inputs.filter("button.findzip")
			.click(function(){
				var $this = $(this);
				popup("find_kozip", {form:this.form, zip1:$this.attr("zip1"), zip2:$this.attr("zip2"), addr1:$this.attr("addr1"), addr2:$this.attr("addr2")});
			});

		// 코드 검색 버튼
		$application.find("button.find_code")
			.live("click", function(){
				var $this = $(this);
				popup("find_code", {form:this.form
									, rel_hidden_input:$this.siblings("input[type='hidden']")
									, rel_first_input:$this.siblings("input[class='licd']")
									, rel_data_input:$this.siblings("input[class='text find_code']")
									, rel_text_input:$this.siblings("input[type='text']")
									, code_name:$this.attr("code_name")
									, title:$this.attr("title")});
			});

		/*
		// 역종
		$inputs.filter("select[name='RPEDARMY[CLSSVCSTATCD]']")
			.change(function(){
				
			})
			.trigger("change");
			*/

		// 보훈대상
		$inputs.filter("select[name='RPEMENSU[BHTRGTPSNYN]']")
			.change(function(){
				var $target = $application.find(":input").filter("[name='RPEMENSU[BHFLAG]'],[name='RPEMENSU[BHSRVVFAMYNM]'],[name='RPEMENSU[BHNO]'],[name='RPEMENSU[SRVVFAMYRELA]'],[name='RPEMENSU[BHPICE]']");
				if(this.value == "Y")
					$target.attr("disabled", false);
				else
					$target.attr("disabled", true);
			})
			.trigger("change");

	/*** step1 ***/
	$step1
		.children("div.buttonBox")
			.find("button.next")
				.click(function(){
				// 입력내용 확인

					/*
					if(typeof(document.application_form.accept) != "undefined") {
						if (document.application_form.accept.checked == false) {
							document.application_form.accept.focus();
							alert("개인정보 수집에 동의해주세요.");
							return false;
						}
					}
					*/

					// 처음 작성시 이미지가 첨부되지 않은 경우
					if($("#application_form input[name='action']:first").val() == "write" && $("#photo_input").val() == "")
					{
						alert("사진첨부는 필수입니다.");
						return;
					}
					
					if($("#application_form input[name='RPEMENSU[CARERYN]']").val() == "")
					{
						alert("지원구분을 선택해주세요.");
						return;
					}
					if(jquery_Form.validate($step1) == false)	return false;
					//if(jquery_Form.validate($step1) == false)	return;

					// goto Step2
					change_step(2);
				})
			.end()
		.end();
	/*** step2 ***/
	$step2
		.children("div.buttonBox")
			.find("button.prev")
				.click(function(){
					// goto Step1
					change_step(1);
				})
			.end()
			.find("button.next")
				.click(function(){
					// 입력내용 확인
					if(jquery_Form.validate($step2) == false)	return;

					// goto Step3
					change_step(3);
				})
			.end()
		.end();
	/*** step3 ***/
	$step3
		.children("div.buttonBox")
			.find("button.prev")
				.click(function(){
					// goto Step2
					change_step(2);
				})
			.end()
		.end();
	
	$("#application_form")
		.submit(function(){
			var $this = $(this);

			// 입력내용 확인
			if(jquery_Form.validate($this) == false)	return false;
			
			//$this.attr("action", "proc.php");
			//$this.submit();
			
			// 데이터 저장
			$.ajax({
				type	:"POST",
				url		:"proc.php",
				data	:$this.serialize(),
				dataType:"json",
				success: function(req){
					var action = req['action'];
					jQuery(window).unbind("beforeunload");
					if (action == 'write') {
						location.href="/recruit/application/complete.php?id="+req['id']+'&examno='+req['examno'];
					}
					else {
						alert('정상적으로 입사지원서가 수정되었습니다.감사합니다.');
						location.href="/recruit/";
					}
				}


				/* proc.php 오류코드 분석 
				
				success: function(req){
				alert(req);
				},
				error: function(req2){
				alert(req2);
				}
				*/

			});
			// 연속 입력되지 않도록 처리
			$this.find("[type='submit']").attr("disabled", "true");
			return false;
		});

	/*** 항목갯수가 유동적인 테이블 처리 ***/
	$step1

		.children(".board_write.add")
			.each(function(){
			var $this_table	= $(this);
			var $sample_tr	= $this_table.find(".inp_wp > ul");
//			var $sample_tr2 = $this_table.find("> tbody > tr:last").hide();
//			$sample_tr.find(":input").attr("disabled", true);

			
			$this_table
				// bind item_add
				.bind("item_add", function(){
					$sample_tr.clone()
						.find(":input")
							.attr("disabled", false)
							.attr("value",'')
							.end()
						.appendTo($this_table.children(".inp_wp"))
						.show();

				})

//				.trigger("item_add")
				.find("button.item_add")
					.click(function(){
						$this_table.trigger("item_add");
					})
					.end()
				// bind item_del
				.find("button.item_del")
					.live("click", function(){
						$(this).closest('ul.row').remove();

						if($this_table.find("> .inp_wp > ul").size() < 1)
							$this_table.trigger("item_add");

					})
					.end();
			})
		
			
			;

			// bind item_add
				$this_table = $('.dynamic_data2');
				$('.dynamic_data2').bind("item_add", function(){
					$sample_tr.clone()
						.find(":input")
							.attr("disabled", false)
//							.attr("value",'')
							.end()
						.appendTo($this_table.children("tbody"))
						.show();

				})

	/*** 팝업 ***/
	function popup_reset_pos()
	{
		//$popup.animate({"top":$(window).scrollTop()}, {queue:false, duration:100});
	}

	$popup
		.bind("open", function(){
			var $this	= $(this);
			var $popup	= $this.find("> div.popup");
			var width	= Number($popup.css("width").replace(/px/, ""));
			var height	= Number($popup.css("height").replace(/px/, ""));
			var round_size = 70;
			var padding_width	= 26;
			var padding_height	= 40;

			// 스크롤시에도 팝업이 중앙에 위치하기 위해
			$(window).bind("scroll", popup_reset_pos).trigger("scroll");

			$this
				.find("> div.overlay")
					.css("opacity", 0.2)
					.end()
				.find(".close_btn")
					.unbind("click")
					.click(function(){
						$popup.trigger("close");
						$("#ajax-loading").hide();
					})
					.end()
				.find("> div.popup")
					.find("> div.content")
						.css({"left":padding_width, "top":padding_height, "width":width-padding_width*2, "height":height-padding_height*2})
						.end()
					// 중앙정렬
					.css({"left":"50%", "top":"400px", "margin-top":Math.floor(-height/2), "margin-left":Math.floor(-width/2)})
					.find("> div.top_left").css({"left":0, "top":0, "width":width-round_size, "height":height-round_size}).end()
					.find("> div.top_right").css({"left":"100%", "top":0, "width":round_size, "height":height-round_size, "margin-left":-round_size, "background-position":"right top"}).end()
					.find("> div.bottom_left").css({"left":0, "top":"100%", "width":width-round_size, "height":round_size, "margin-top":-round_size, "background-position":"left bottom"}).end()
					.find("> div.bottom_right").css({"left":"100%", "top":"100%", "width":round_size, "height":round_size, "margin-left":-round_size, "margin-top":-round_size, "background-position":"right bottom"}).end()
					.end()
				.show()
				;
		})
		.bind("close", function(){
			var $this = $(this);
			var close_fn = $this.data("close_fn");
			$this.hide();

			// 원래 위치로 이동
			$popup.find("> div.data").append($popup.find("> div.popup > div.content > div"));

			$(window).unbind("scroll", popup_reset_pos);

			if(close_fn)
			{
				close_fn();
			}
		});


	/*** 우편번호검색 ***/
	var $find_kozip = $("#popup div.data_find_kozip")
		.bind("open", function(){
			$find_kozip.find("div.resultBox")
				.find("ul.data,div.no_data").hide().end()
				.find("div.no_input").show().end();

			$(this).find("input[name='dong']").val("").focus();
		})
		.find("form")
			.bind("submit", function(){
				function ajax_success(json)
				{
					if(json.length == 0)
					{
						$find_kozip.find("div.resultBox")
							.find("ul.data,div.no_input").hide().end()
							.find("div.no_data").show().end();
					}
					else
					{
						var s = "";

						for(k in json)
						{
							var value = json[k];
							var addSplit = value.split("±");
							s += '<li>['+addSplit[0]+'] <a href="javascript:void(0);" zipcode="'+addSplit[0]+'" addr="'+addSplit[1]+'">'+addSplit[1]+'</a></li>';

							//s += '<li><a href="javascript:void(0);" zipcode="'+k+'" addr="'+value+'">['+k+'] '+value+'</a></li>';
						}

						$find_kozip.find("div.resultBox")
							.find("div.no_data,div.no_input").hide().end()
							.find("ul.data")
								.html(s).show()
								.find("> li > a")
									.click(function(){
										var $this		= $(this);

										var zipcode		= $this.attr("zipcode").split("-");
										var addr		= $this.attr("addr");
										var popup_option= $popup.data("option");

										var tZip1 = zipcode[0].substr(0,3);
										var tZip2 = zipcode[0].substr(3,2);

										$(popup_option["form"])
											.find("input")
												.filter("[name='"+popup_option["zip1"]+"']").val(tZip1).end()
												.filter("[name='"+popup_option["zip2"]+"']").val(tZip2).end()
												.filter("[name='"+popup_option["addr1"]+"']").val(addr).end()
												.filter("[name='"+popup_option["addr2"]+"']").focus().end();

										$popup.trigger("close");

										return false;
									})
								.end();
					}
				} // end function

				var $this	= $(this);
				var dong	= $this.find("input[name='dong']").val();
				if(dong == "")
				{
					$find_kozip.find("div.resultBox")
						.find("ul.data,div.no_data").hide().end()
						.find("div.no_input").show().end();

					$this.find("input[name='dong']").focus();
					return false;
				}
				
				$("#ajax-loading").appendTo($find_kozip.find("div.resultBox"));

				$.ajax({type:"POST",
						url:"proc.php",
						data: "action=find_kozip&dong="+dong,
						dataType: "json",
						success: ajax_success
					});

				return false;
			});

	/*** 코드검색 ***/
	var $find_code = $("#popup div.data_find_code")
		.bind("open", function(){
			var popup_option= $popup.data("option");
			
			$find_code
				.find("input[name='code']")
					.val(popup_option["code_name"])
					.end()
				.find("div.headline")
					.html(popup_option["title"]+" 검색")
					.end()
				.find("div.resultBox")
					.children("ul.data").hide().end()
					.children("div.no_data").html("찾는 "+popup_option["title"]+"이 없습니다. 정확하게 다시 입력해주세요.").hide().end()
					.children("div.no_input").html("찾고자 하는 "+popup_option["title"]+"을 입력해주세요.").show().end()
				;

			$(this).find("input[name='keyword']").val("").focus();
		})
		.find("form")
			.bind("submit", function(){
				function ajax_success(json)
				{
					if(json.length == 0)
					{
						var popup_option= $popup.data("option");

						$find_code.find("div.resultBox")
							.find("ul.data,div.no_input").hide().end()
							.find("div.no_data").show().end();

						if(confirm("찾는 "+popup_option["title"]+"이 없습니다.                  \n\n\n직접 입력하시겠습니까?") == true)
						{
							$(popup_option["rel_first_input"]).val('00');
							$(popup_option["rel_text_input"]).removeAttr("readonly").focus();
							$popup.trigger("close");
						}
					}
					else
					{
						var s = "";

						for(k in json)
						{
							var value = json[k];

							s += '<li><a href="javascript:void(0);" code="'+k+'" code_name="'+value+'">'+value+'</a></li>';
						}

						$find_code.find("div.resultBox")
							.find("div.no_data,div.no_input").hide().end()
							.find("ul.data")
								.html(s).show()
								.find("> li > a")
									.click(function(){
										var $this		= $(this);

										var code		= $this.attr("code");
										var code_name	= $this.attr("code_name");
										var popup_option= $popup.data("option");

										$(popup_option["rel_first_input"]).val(code);
										$(popup_option["rel_text_input"]).attr("readonly","readonly").focus();
										$(popup_option["rel_data_input"]).val(code_name);

										$popup.trigger("close");

										return false;
									})
								.end();
					}
				} // end function

				var $this	= $(this);
				var code	= $this.find("input[name='code']").val();
				var keyword	= $this.find("input[name='keyword']").val();
				if(keyword == "")
				{
					$find_code.find("div.resultBox")
						.find("ul.data,div.no_data").hide().end()
						.find("div.no_input").show().end();

					$this.find("input[name='keyword']").focus();
					return false;
				}
				
				$("#ajax-loading").appendTo($find_code.find("div.resultBox"));

				$.ajax({type:"POST",
						url:"proc.php",
						data: "action=find_code&code="+code+"&keyword="+encodeURIComponent(keyword),
						dataType: "json",
						success: ajax_success
					});

				return false;
			});

	/*** ajax 로딩바 설정 ***/
	$ajax_loading = $("#ajax-loading").find("div.overlay").css({"opacity":0.2});
	$("#ajax-loading")
		.ajaxStart(function(){
			$(this).show();
		})
		.ajaxSuccess(function(){
			$(this).hide();
		});


	/*
	// input name 리스트 얻기 : 중복확인 위해서...
	var str = "";
	$(":input")
		.each(function(){
			str += $(this).attr("name") + "\n";
		});
	$(document.body).append("<textarea>"+str+"</textarea>");
	/**/

	change_step(1);
});


