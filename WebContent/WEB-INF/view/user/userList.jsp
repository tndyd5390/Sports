
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sports.dto.UserDTO"%>
<%@ page import="com.sports.util.CmmUtil"%>

<% List<UserDTO> uList = (List) request.getAttribute("uList"); %>

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
				<div>
					<ul class="menu_list">
						<li>
							<ul class="theader">
								<li>
									<p>
										<input type="checkbox" class="chkbox">
									</p>
								</li>
								<li><p>번호</p></li>
								<li><p>ID</p></li>
								<li><p>이름</p></li>
								<li><p>권한</p></li>								
							</ul>
<!-- 							<ul class="col-5">
								<li><p><input type="checkbox" class="chkbox"></p></li>
								<li><p>1</p></li>
								<li><p><a href="#">kopokangseo</a></p></li>
								<li><p>데이터분석</p></li>
								<li><p>운영자</p></li>
							</ul>
 -->					
							<%for(UserDTO uDTO : uList){%>
 							<ul class="col-5">
								<li><p><input type="checkbox" class="chkbox"></p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getUser_no()) %></p></li>
								<li><p><a href="#"><%=CmmUtil.nvl(uDTO.getUser_id()) %></a></p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getUser_name()) %></p></li>
								<li><p>운영자</p></li>
							</ul>
							<%}%>							
 						</li>
					</ul>
				</div>
			<div class="more-type">
				<a href="#" class="moremore">더보기</a>
			</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>
</html>
