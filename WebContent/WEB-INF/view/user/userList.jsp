
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.dto.UserDTO"%>
<%@ page import="com.sports.util.CmmUtil"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
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
				<p>회원 관리</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="search type">
					<select class="search_type">
						<option value="이름">이름</option>
						<option value="아이디">아이디</option>
					</select> <input type="text">
					<button class="blue btn">검색</button>
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>
</html>
