
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.sports.dto.UserDTO" %>
<%@ page import ="com.sports.util.CmmUtil" %>

<% UserDTO uDTO = (UserDTO) request.getAttribute("uDTO"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>

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
				<p>아이디 찾기</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="list_wrap">
					<ul class="register_list">
						<li>
							<center>
								<p><%=CmmUtil.nvl(uDTO.getUser_name()) %>회원님의 아이디는</p>
							</center>
						</li>
						<li>
							<center>
								<p>  <%=CmmUtil.nvl(uDTO.getUser_id()) %> 입니다 </p>
							</center>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>

</html>
