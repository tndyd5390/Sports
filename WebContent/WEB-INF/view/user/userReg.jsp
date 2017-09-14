<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/html5/include/head.jsp"%>
<script>
	var ovlapId = false;
	function doCancle() {
		location.href = 'mainTest.do';
	}

	function doJoin() {
		var id = $('id');
		var email = $('#email');
		var userName = $('#userName');
		var password = $('#password');
		var passwordCheck = $('#passwordCheck');
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
		} else if (password.val() == "") {
			alert("비밀번호를 입력하세요.");
			password.focus();
			return false;
		} else if (passwordCheck.val() == "") {
			alert("비밀번호 재확인을 입력하세요.");
			passwordCheck.focus();
			return false;
		} else if (password.val() != passwordCheck.val()) {
			alert("비밀번호가 일치하지 않습니다.");
			passwordCheck.focus();
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
		} else if(check.val()==null){
			alert("이용약관 동의가 필요합니다.");
			return false;
		} else {
			if (confirm("가입하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
	}

	function checkId() {
		var id = $('#id').val();
		$.ajax({
			url : 'idCheck.do',
			method : 'post',
			data : {
				'id' : id
			},
			success : function(data) {
				if ($.trim(data) == 1) {
					alert("이미 존재하는 아이디 입니다.");
					$('#id').focus();
					ovlapId = false;
				} else if (!$('#id').val()) {
					alert("아이디를 입력 해주세요.");
					$('#id').focus();
					ovlapId = false;
				} else {
					alert("가능한 아이디 입니다.");
					ovlapId = true;
				}
			}
		})
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
				<p>회원 가입</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<form name="f" id="f" action="userRegProc.do" method="post" onsubmit='return doJoin();'>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">아이디</p>
								<div class="input_btn_wrap">
									<input type="text" id="id" name="id"><input
										type="button" class="line-btn" onclick="checkId()"
										value="중복확인">
								</div>
							</li>
							<li>
								<p class="blue_text">비밀번호</p> <input type="password"
								id="password" name="password">
							</li>
							<li>
								<p class="blue_text">비밀번호 확인</p> <input type="password"
								id="passwordCheck" name="passwordCheck">
							</li>
							<li>
								<p class="blue_text">이름</p> <input type="text" id="userName"
								name="userName">
							</li>
							<li>
								<p class="blue_text">이메일</p> <input type="email" id="email"
								name="email">
							</li>
							<li>
								<p class="blue_text">휴대폰번호</p> <input type="text" id="tel"
								name="tel">
							</li>
							<li>
								<p class="blue_text">우편번호</p>
								<div class="input_btn_wrap">
									<input type="text" id="postcode" name="postcode"
										onclick="daumPostcode()">
									<input type="button" class="line-btn" onclick="daumPostcode()" value="주소찾기">
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
								name="address1" onclick="daumPostcode()">
							</li>
							<li>
								<p class="blue_text">상세주소</p> <input type="text" id="address2"
								name="address2">
							</li>
							<li>
								<p class="blue_text">이용약관</p> <textarea></textarea>
								<p>
									동의<input type="checkbox">
								</p>
							</li>
						</ul>
					</div>
					<div class="btn-groub">
						<input type="submit" class="col-2 blue-btn"
							style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
							value="등록"> 
						<input type="button" class="col-2 glay-btn"
							style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
							onclick="doCancle();" value="취소">
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@include file="/html5/include/footer.jsp"%>
</body>
</html>
