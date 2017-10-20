<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.sports.util.CmmUtil" %>
<%@ page import="com.sports.util.TextUtil" %>
<%@ page import="com.sports.dto.UserDTO" %>
<%
	UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
	String auth = (String) session.getAttribute("ss_user_auth");
	if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/html5/include/head.jsp"%>
<script>
	function doCancle(){
		var auth = '<%=auth%>';
		console.log(auth);
		if(auth=='A'){
			location.href = "userList.do";
		}else{
			location.href = "main.do";
		}
	}

	function doUpdate() {
		var id = $('id');
		var email = $('#email');
		var userName = $('#userName');
		var postcode = $('#postcode');
		var address1 = $('#address1');
		var phone = $('#phone');
		var check = $('#check');

		if (email.val() == "") {
			alert("이메일을 입력하세요")
			email.focus();
			return false;
		} else if (userName.val() == "") {
			alert("성명을 입력하세요.");
			userName.focus();
			return false;
		} else if (postcode.val() == "" || address1.val() == "") {
			alert("주소를 입력하세요.");
			return false;
		} else if (ovlapE == false) {
			alert("아이디 중복확인이 필요합니다.")
			email.focus();
			return false;
		} else if (tel.val() == "") {
			alert("연락처를 입력하세요.");
			tel.focus();
			return false;
		} else {
			if (confirm("가입하시겠습니까?")) {
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
					<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>
			<div class="page_title">
				<p>회원 정보</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<form name="f" id="f" action="userDetailUpdateProc.do" method="post" onsubmit='return doUpdate();'>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">이름</p> <input type="text" id="userName"
								name="userName" value="<%=CmmUtil.nvl(uDTO.getUser_name())%>">
							</li>
							<li>
								<p class="blue_text">이메일</p> <input type="email" id="email"
								name="email" value="<%=CmmUtil.nvl(uDTO.getEmail())%>">
							</li>
							<li>
								<p class="blue_text">휴대폰번호</p> <input type="text" id="tel"
								name="tel" value="<%=CmmUtil.nvl(uDTO.getTel())%>">
							</li>
							<li>
								<p class="blue_text">우편번호</p>
								<div class="input_btn_wrap">
									<input type="text" id="postcode" name="postcode"
										onclick="daumPostcode()" value="<%=CmmUtil.nvl(uDTO.getPostcode())%>">
									<input type="button" class="line-btn" onclick="daumPostcode()" value="주소찾기">
									<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
																	.getElementById('postcode').value = data.zonecode;
															document
																	.getElementById('address1').value = fullAddr;
															document
																	.getElementById(
																			'address2')
																	.focus();
														}
													}).open();
										}
									</script>
								</div>
							</li>
							<li>
								<p class="blue_text">주소</p> <input type="text" id="address1"
								name="address1" onclick="daumPostcode()" value="<%=TextUtil.exchangeEscapeNvl(uDTO.getAddress1())%>">
							</li>
							<li>
								<p class="blue_text">상세주소</p> <input type="text" id="address2"
								name="address2" value="<%=CmmUtil.nvl(uDTO.getAddress2())%>">
							</li>
							<%if(ss_user_auth.equals("A")){ %>
							<li>
								<p class="blue_text">권한</p> 
								<select name="auth" id="auth" style="width:50%;">
									<option value="A" <%=CmmUtil.select("A", uDTO.getAuth_code()) %>>운영자</option>
									<option value="U" <%=CmmUtil.select("U", uDTO.getAuth_code()) %>>유저</option>
								</select>
							</li>
							<%} %>
						</ul>
					</div>
					<div class="btn-groub">
						<input type="hidden" name="uNo" value="<%=CmmUtil.nvl(uDTO.getUser_no())%>">
						<input type="submit" class="col-2 blue-btn"
							style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
							value="수정"> 
						<input type="button" class="col-2 glay-btn"
							style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
							onclick="doCancle();" value="취소">
					</div>
				</form>
			</div>
		</div>
	<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>
</html>
