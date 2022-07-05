<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/_layout/_layoutT.jsp">
	<jsp:param name="layoutNum" value="3"/>
	<jsp:param name="layoutNum2" value="6"/>
</jsp:include>
<div id="application_result" style="padding-bottom:100px;">
	<form method="post">
	<div class="inConts">

		<p class="bTxt tbl tac fw300">입사 지원 결과 확인</p>

		<div id="application">

			<!-- 접수완료 -->
			<div class="comp_wp tac login stp_con mt70">
				<p><img src="/images/new/comp_logo.gif" alt="" /></p>

				<div class="gray_bx sm mt20">
					세종병원에 지원하신 모든 지원자분들께 감사드립니다.<br />
					<span class="tbl">온라인 지원서 작성시 입력하셨던 이름과 비밀번호를  입력</span>하시면 지원 결과를 확인하실 수 있습니다.
				</div><!-- gray_bx -->

				<div class="pw_inp">
						<ul>
							<li class="required">
								<p>성명 입력</p>
								<input type="text" name="KORNAME" class="text"  required="required" title="성명" placeholder="성명 입력" style="background:#fff !important" />
							</li>
							<li class="required pw">
								<p>비밀번호 입력</p>
								<input type="password" name="PWD" class="text" required="required" title="비밀번호" placeholder="비밀번호 입력" />
							</li>
						</ul>
					</div>

				<div class="buttonBox mt30">
					<div class="forgot">
						<a><img src="/images/new/info_ic.gif" alt="" />
							<span>비밀번호 분실 시 총무팀에 문의하세요. </span><br>
							<span style="display:inline-block;padding-top:7px;margin-left:23px;">부천세종병원 (032-340-1809) / 인천세종병원 (032-240-8732)</span>
						</a>
					</div>
					<button type="submit" class="submit dark"><span>결과 확인</span></button>
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
	

	</form>

	

	<div class="inConts">
		<div class="board_list nobord link mt50 boldt">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td width="165" class="tt">기관</td>
					<td width="145" class="tt">부서</td>
					<td width="130" class="tt">직군</td>
					<td width="auto" class="tt">제목</td>
					<td width="140" class="tt">성명</td>
					<td width="150" class="tt">합격여부</td>
				</tr>
				<tbody>
			
					<tr>
						<td><div class="ntag"><div><p><?=$hospital?></p></div></div></td>
						<td><?=$row['INORDDEPTNM']?></td>
						<td><?=$row['GRUPJOBLNNM']?></td>
						<td class="tit tal"><?=$row['TITL']?></td>
						<td><?=$row['KORNAME']?></td>
						<!--<td><?=substr($row['RREGNO'], 0, 6)?>-*******</td>-->
						<td class="proc">
						
						</td>
					</tr>
					<?php } ?>
				</tbody>
				<?php } ?>

			</table>
	
		</div><!-- board_list -->


	</div><!-- inConts -->

</div>


<script type="text/javascript" src="/images/jquery.form.min.js"></script>
<script type="text/javascript" src="/images/application.result.js"></script>
<jsp:include page="/_layout/_layoutF.jsp" flush="true"/>