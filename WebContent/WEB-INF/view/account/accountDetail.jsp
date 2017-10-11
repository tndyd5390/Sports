<%@page import="com.sports.dto.AcademyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	AcademyDTO aDTO = (AcademyDTO) request.getAttribute("aDTO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/html5/include/head.jsp"%>
<script>
	function goUpdate(aNo){
		location.href = "accountUpdate.do?aca_no="+aNo;
	}
	function goBack(){
		location.href = "accountmanagement.do";
	}
	function doDelete(aNo){
		if(confirm("해당 거래처를 삭제 하시겠습니까?")){
			alert("삭제되었습니다.");
			location.href = "accountDelete.do";
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
				<p>거래처 정보</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<form name="f" id="f" action="accountRegProc.do" method="post" onsubmit='return doJoin();'>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">거래처명</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getAca_name())%>>
							</li>
							<li>
								<p class="blue_text">대표자명</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getAca_ceo())%>>
							</li>
							<li>
								<p class="blue_text">우편번호</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getAca_area1())%>>
							</li>
							<li>
								<p class="blue_text">주소</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getAca_area2())%>>
							</li>
							<li>
								<p class="blue_text">상세주소</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getAca_area3())%>>
							</li>
							<li>
								<p class="blue_text">업종</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getAca_event1())%>>
							</li>
							<li>
								<p class="blue_text">전화번호</p>
								<input type="text" readonly value=<%=CmmUtil.nvl(aDTO.getTel())%>>
							</li>
							<li>
								<p class="blue_text">거래발생일</p>
								<textarea readonly><%=CmmUtil.nvl(aDTO.getAca_comment()) %></textarea>
							</li>
						</ul>
					</div>
					<div class="btn-groub">
					<input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="수정" onclick="goUpdate(<%=CmmUtil.nvl(aDTO.getAca_no())%>)">
					<input type="button" class="col-3 blue-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="삭제"
						onclick="return doDelete(<%=CmmUtil.nvl(aDTO.getAca_no())%>)">
					<input type="button" class="col-3 glay-btn"
						style="height: 51px; font-size: 17px; font-weight: 600; cursor: pointer;"
						value="목록" onclick="goBack()">
				</div>
				</form>
			</div>
		</div>
	<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>
</html>
