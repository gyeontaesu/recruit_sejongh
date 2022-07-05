<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="2"/>
	<jsp:param name="layoutNum2" value="5"/>
</jsp:include>



<div id="application_check">
	<form action="write.php" method="post">
	<div class="inConts pb100">

		<p class="bTxt tbl tac fw300">입사 지원서 수정</p>

		<div id="application">

			<!-- 접수완료 -->
			<div class="comp_wp tac stp_con mt70">
				<p><img src="/images/new/comp_logo.gif" alt="" /></p>

				<div class="gray_bx sm mt20">
					세종병원에 지원하신 모든 지원자분들께 감사드립니다.<br />
					<span class="tbl">온라인 지원서 작성시 입력하셨던 이름과 비밀번호를  입력</span>하시면 지원서를 수정 하실 수 있습니다.
				</div><!-- gray_bx -->

				<div class="pw_inp sel">
					<ul>
						<li class="required">
							<p>채용 구분</p>
							<select name="APNTINFONO"required="required" title="채용구분" style="width:100%">
								<option value="" fromdate="" todate="">선택</option>
							<?php $today = date('Ymd'); $todays="where RPEMAPNT.APNTFROMDD<='".$today."' and '".$today."'<=RPEMAPNT.APNTTODD"; ?>
							<?php $result = aunuri_db_query("select RPEMAPNT.*, (select zsdddept.inorddeptnm from com.zsdddept where RPEMAPNT.deptcd=zsdddept.deptcd and ROWNUM=1) AS inorddeptnm from MIS.RPEMAPNT $todays order by APNTINFONO desc"); ?>
							<?php while($row = aunuri_db_fetch_array($result)) { ?>
								<option value="<?=$row['APNTINFONO']?>" fromdate="<?=$row['APNTFROMDD']?>" todate="<?=$row['APNTTODD']?>"><?=$row['TITL']?></option>
							<?php } ?>
							</select>
						</li>
						<li class="required">
							<p>성명 입력</p>
							<input type="text" name="KORNAME" class="text"  required="required" title="성명" placeholder="성명 입력"/>
						</li>
					</ul>
				</div>
				<div class="pw_inp sel">
					<ul>
						<li class="required">
							
							<p>비밀번호 입력</p>
							<input type="password" name="PWD" class="text"  required="required" title="비밀번호" placeholder="비밀번호 입력" />
						</li>
						<li class="required">
							<p>수험번호 조회</p>
							<input type="text" name="EXAMNO" class="text"required="required" title="수험번호" placeholder="수험번호를 조회하세요" />
							<button type="button" class="find_EXAMNO"><span>수험번호 조회</span></button>
							
						</li>
					</ul>
				</div>

				<div class="buttonBox mt40">
					<button type="submit" class="submit dark"><span>입사지원서 수정</span></button>
				</div>
				 
			</div><!-- comp_wp -->

			
			<!-- 접수완료 End -->
		
			<script>
			$(document).ready(function() {
			$(".numberCheck").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
			});
			</script>

		</div><!-- application 종료 -->
		</form>
	</div><!-- inConts -->
	

</div>


<script type="text/javascript" src="/images/jquery.form.min.js"></script>
<script type="text/javascript" src="/images/application.check.js"></script>





<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>