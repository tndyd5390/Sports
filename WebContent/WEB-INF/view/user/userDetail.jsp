
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>

<script>
	
</script>
<style>

</style>
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
				<p>회원 상세</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="user_title">
					<p><b>장총명</b>님의 회원정보</p>
				</div>
				<div>
					<ul class="menulist">
						<li>
							<ul class="user_detail">
								<li><p>ID</p></li>
								<li><p>아이디들어감</p></li>
							</ul>
							<ul class="user_detail">
								<li><p>이름</p></li>
								<li><p>이름들어감</p></li>
							</ul>
							<ul class="user_detail">
								<li><p>이메일</p></li>
								<li><p>이메일들어감</p></li>
							</ul>
							<ul class="user_detail">
								<li><p>연락처</p></li>
								<li><p>연락처들어감</p></li>
							</ul>
							<ul class="user_detail">
								<li><p>주소</p></li>
								<li><p>주소들어감</p></li>
							</ul>
							<ul class="user_detail">
								<li><p>세부주소</p></li>
								<li><p>세부주소들어감</p></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="btn-groub">
					<input type="submit" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="수정"> <input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						onclick="" value="탈퇴">
						<input type="button" class="col-3 glay-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						onclick="" value="목록">
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>

</html>
