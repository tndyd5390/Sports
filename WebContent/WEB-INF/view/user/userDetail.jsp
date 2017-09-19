<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.dto.UserDTO"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="com.sports.util.TextUtil"%>
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
		if(confirm("해당 유저를 삭제 하시겠습니까?")){
			alert("삭제되었습니다.");
			location.href = "userDelete.do?uNo="+uNo;
			return true;		
		}else{
			return false;
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
				<p>회원 상세</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="user_title">
					<p>
						<b><%=CmmUtil.nvl(uDTO.getUser_name())%></b>님의 회원정보
					</p>
					<input type="hidden" id="uNo"
						value="<%=CmmUtil.nvl(uDTO.getUser_no())%>">
				</div>
				<div class="user-detail-table">
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>ID</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=CmmUtil.nvl(uDTO.getUser_id()) %></span>
						</div>
					</div>
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>이름</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=CmmUtil.nvl(uDTO.getUser_name())%></span>
						</div>
					</div>
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>이메일</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=CmmUtil.nvl(uDTO.getEmail()) %></span>
						</div>
					</div>
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>우편번호</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=CmmUtil.nvl(uDTO.getPostcode()) %></span>
						</div>
					</div>
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>주소</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=TextUtil.exchangeEscapeNvl(uDTO.getAddress1()) %></span>
						</div>
					</div>
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>주소2</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=CmmUtil.nvl(uDTO.getAddress2()) %></span>
						</div>
					</div>
					<div class="user-detail-row">
						<div class="user-detail-cell1">
							<span>권한</span>
						</div>
						<div class="user-detail-cell2">
							<span><%=CmmUtil.nvl(uDTO.getAuth()) %></span>
						</div>
					</div>
				</div>
				<div class="btn-groub">
					<input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="수정" onclick="goUpdate(<%=CmmUtil.nvl(uDTO.getUser_no())%>)">
					<input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="탈퇴"
						onclick="return doDelete(<%=CmmUtil.nvl(uDTO.getUser_no())%>)">
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
