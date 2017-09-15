<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.dto.UserDTO" %>
<%@ page import="com.sports.util.CmmUtil" %>
<%
	UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<script>
	function goUpdate(uNo){
		location.href = "userDetailUpdate.do?uNo="+uNo;
	}
	function goBack(){
		location.href = "userList.do";
	}
	function doDelete(uNo){
		location.href = "userDelete.do?uNo="+uNo;
	}
	
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
					<p><b><%=CmmUtil.nvl(uDTO.getUser_name())%></b>님의 회원정보</p>
					<input type="hidden" id="uNo" value="<%=CmmUtil.nvl(uDTO.getUser_no()) %>">
				</div>
				<div>
					<ul class="menulist">
						<li>
							<ul class="user_detail">
								<li><p>ID</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getUser_id())%></p></li>
							</ul>
							<ul class="user_detail">
								<li><p>이름</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getUser_name())%></p></li>
							</ul>
							<ul class="user_detail">
								<li><p>이메일</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getEmail())%></p></li>
							</ul>
							<ul class="user_detail">
								<li><p>연락처</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getTel())%></p></li>
							</ul>
							<ul class="add">
								<li><p>주소</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getAddress1()) %></p></li>
							</ul>
							<ul class="user_detail">
								<li><p>세부주소</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getAddress2())%></p></li>
							</ul>
							<ul class="user_detail">
								<li><p>가입일</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getReg_dt())%></p></li>
							</ul>
							<ul class="user_detail">
								<li><p>권한</p></li>
								<li><p><%=CmmUtil.nvl(uDTO.getAuth())%></p></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="btn-groub">
					<input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="수정" onclick="goUpdate(<%=CmmUtil.nvl(uDTO.getUser_no())%>)"> 
					<input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="탈퇴" onclick="doDelete(<%=CmmUtil.nvl(uDTO.getUser_no())%>)">
					<input type="button" class="col-3 glay-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="목록" onclick="goBack()">
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>

</html>
