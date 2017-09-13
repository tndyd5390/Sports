
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<style>
.width80 {
	width: 80%;
}

.width100 {
	width: 100%;
	font-size: 16px;
}
</style>

<script>
function doSubmit(f){
	var id = $('#id');
	var password = $('#password');
	if(id.val() == ""){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}else if(password.val()=="")){
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}else{
		f.submit();
		return true;
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
					<a href="#"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>

			<div class="page_title">
				<p>로그인</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="list_wrap">
				<form method="post" name="f" id="f" action="loginProc.do" onsubmit="return doSubmit(this)">
					<ul class="register_list">
						<li>
							<p class="blue_text">아이디</p> <input type="text" name="id" id="id">
						</li>
						<li>
							<p class="blue_text">비밀번호</p> <input type="password" name="password" id="password">
						</li>
						<li>
							<center>
								<button class="btn btn-primary width100">로그인</button>
							</center>
						</li>
						<hr>
						<li>
							<div class="col-xs-6 text-center">
								<a href="">아이디 찾기</a>
							</div>
							<div class="col-xs-6 text-center">
								<a href="">비밀번호 찾기</a>
							</div>
						</li>
					</ul>
				</form>
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>

</html>
