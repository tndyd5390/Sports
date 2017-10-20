<%@page import="com.sports.dto.AcademyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
	AcademyDTO aDTO = (AcademyDTO) request.getAttribute("aDTO");
	String user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/html5/include/head.jsp"%>
<script>

	function doBack() {
		if (confirm("이전 페이지로 이동하시겠습니까?")) {
			location.href = "accountmanagement.do";
			return true;
		} else {
			return false;
		}
	}

	function doJoin() {
		var aca_name = $('#aca_name');
		var aca_ceo = $('#aca_ceo');
		var aca_area1 = $('#aca_area1')
		var aca_area2 = $('#aca_area2');
		var aca_area3 = $('#aca_area3');
		var aca_event1 = $('#aca_event1');
		var tel = $('#tel');
		var aca_comment = $('#aca_comment');

		if (aca_name.val() == "") {
			alert("거래처명을 입력하세요")
			aca_name.focus();
			return false;
		} else if (aca_ceo.val() == "") {
			alert("대표자명을 입력하세요.");
			aca_ceo.focus();
			return false;
		} else if (aca_area1.val() == "" || aca_area2.val() == "") {
			alert("주소를 입력하세요.");
			aca_area1.focus();
			return false;
		} else if (aca_event1.val() == "") {
			alert("업종을 입력하세요.");
			return false;
		} else if (tel.val() == "") {
			alert("연락처를 입력하세요.");
			tel.focus();
			return false;
		} else {
			if (confirm("수정하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
	}
</script>
</head>
<body>
	<section id="wrapper" class="wrapper">
		<header class="header">
			<div class="wrap">
				<div class="left_menu">
					<img src="html5/common/images/btn_gnb.png" alt="메뉴"
						id="c-button--slide-left" class="c-button">
				</div>
				<div class="logo">
					<a href="/main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>
			<div class="page_title">
				<p>거래처 수정</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<form name="f" id="f" action="accountUpdateProc.do?aca_no=<%=CmmUtil.nvl(aDTO.getAca_no()) %>" method="post" onsubmit='return doJoin();'>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">거래처명</p>
								<input type="text" id="aca_name" name="aca_name" value="<%=CmmUtil.nvl(aDTO.getAca_name())%>">
							</li>
							<li>
								<p class="blue_text">대표자명</p>
								<input type="text" id="aca_ceo" name="aca_ceo" value="<%=CmmUtil.nvl(aDTO.getAca_ceo())%>">
							</li>
							<li>
								<p class="blue_text">우편번호</p>
								<div class="input_btn_wrap">
									<input type="text" id="aca_area1" name="aca_area1"
										onclick="daumPostcode()" value="<%=CmmUtil.nvl(aDTO.getAca_area1())%>">
									<input type="button" class="line-btn" onclick="daumPostcode()" value="주소찾기">
									<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>									
									<script>
										function daumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															var fullAddr = '';
															var extraAddr = '';
															if (data.userSelectedType === 'R') {
																fullAddr = data.roadAddress;

															} else {
																fullAddr = data.jibunAddress;
															}
															if (data.userSelectedType === 'R') {
																if (data.bname !== '') {
																	extraAddr += data.bname;
																}
																if (data.buildingName !== '') {
																	extraAddr += (extraAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																fullAddr += (extraAddr !== '' ? ' ('
																		+ extraAddr
																		+ ')'
																		: '');
															}
															document
																	.getElementById('aca_area1').value = data.zonecode;
															document
																	.getElementById('aca_area2').value = fullAddr;
															document
																	.getElementById(
																			'aca_area3')
																	.focus();
														}
													}).open();
										}
									</script>
								</div>
							</li>
							<li>
								<p class="blue_text">주소</p> <input type="text" id="aca_area2"
								name="aca_area2" onclick="daumPostcode()" value="<%=CmmUtil.nvl(aDTO.getAca_area2())%>">
							</li>
							<li>
								<p class="blue_text">상세주소</p>
								<input type="text" id="aca_area3" name="aca_area3" value="<%=CmmUtil.nvl(aDTO.getAca_area3())%>">
							</li>
							<li>
								<p class="blue_text">업종</p>
								<input type="text" id="aca_event1" name="aca_event1" value="<%=CmmUtil.nvl(aDTO.getAca_event1())%>">
							</li>
							<li>
								<p class="blue_text">전화번호</p>
								<input type="text" id="tel" name="tel" value="<%=CmmUtil.nvl(aDTO.getTel())%>">
							</li>
							<li>
								<p class="blue_text">거래발생일</p>
								<textarea id="aca_comment" name="aca_comment"><%=CmmUtil.nvl(aDTO.getAca_comment()) %></textarea>
							</li>
						</ul>
					</div>
					<div class="btn-groub">
						<input type="submit" class="col-2 blue-btn"
							style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
							value="수정"> 
						<input type="button" class="col-2 glay-btn"
							style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
							onclick="doBack();" value="이전으로">
					</div>
				</form>
			</div>
		</div>
	<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>
</html>
