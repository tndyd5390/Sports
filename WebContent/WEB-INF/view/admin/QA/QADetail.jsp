<!-- for Administrator -->

<%@ page import="com.sports.util.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="com.sports.dto.QADTO"%>
<%@ page import="java.util.ArrayList"%>		
<%@ page import="java.util.List"%>
<%
QADTO rDTO = (QADTO)request.getAttribute("rDTO");

if (rDTO==null) {
	rDTO = new QADTO();
}

String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
String ss_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_name = CmmUtil.nvl((String)session.getAttribute("ss_user_name"));

int access = 1;

if (ss_user_no.equals("")) {
	
	access = 3;
	
} else if (ss_user_no.equals(CmmUtil.nvl(rDTO.getReg_user_no()))) {
	
	access = 2;
	
}

System.out.println("ss_user_no: " + CmmUtil.nvl(rDTO.getReg_user_no()));
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>모두의 스포츠</title>
<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/html5/common/css/style.css">
<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/html5/common/js/jquery-ui.js"></script>
<script src="/html5/common/js/modernizr.custom.js"></script>
<!--[if lte IE 9]>
<script src="/html5/common/js/placeholders.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<script type="text/javascript">

function doReply() {
	
	if ("<%=access%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
	
	} else {
		
		location.href="/admin/QA/QAAnswerReg.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>&answer_yn=<%=CmmUtil.nvl(rDTO.getAnswer_yn())%>";
		
	}
	
}

function doDelete() {
	
	if ("<%=access%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
		
	} else {
		
		if (confirm("작성한 게시글을 삭제하시겠습니까?")) {
			location.href="/admin/QA/QADelete.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>&q_no=<%=CmmUtil.nvl(rDTO.getQ_no())%>";
		}
		
	}
	
}

function doList() {
	location.href="/admin/QA/QAList.do";
}

</script>
	
</head>

<body>

	<section id="wrapper" class="wrapper">
		
	<form name="f" id="f" method="post">	
	
	    <header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title"><p>Q&amp;A</p></div>
		</header>

		<nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">
			<div class="profile">
			<% if(ss_user_no.equals("")) {%>
				<p><img src="/html5/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
				<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
				<div class="login_wrap"><a href="/login.do">로그인</a><a href="/userReg.do">회원가입</a></div>
			<%} else {%>
				<p><img src="/html5/common/images/menu/user.png" class="photo"><%=ss_user_name %>님 안녕하세요.</p>
				<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
				<div class="logout_wrap"><a href="/logout.do">로그아웃</a></div>
			<%} %>
			</div>
			<ul class="menu_list">
				<li><a href="#">주문관리</a></li>
				<li>
					<a href="#">학원관리</a>
					<ul class="col-2">
						<li><a href="#">학원 밀집도 정보</a></li>
						<li><a href="#">거래처 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">매출 분석 정보</a>
					<ul class="col-3">
						<li><a href="/admin/sale/list.do"><img src="/html5/common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
						<li><a href="#"><img src="/html5/common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
						<li><a href="#"><img src="/html5/common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
					</ul>
				</li>
				<li>
					<a href="#">스포츠 용품 리스트 관리</a>
					<ul class="col-2 more">
						<li><a href="#"><img src="/html5/common/images/menu/ic_01.png" class="icon">전체상품</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_02.png" class="icon">태권도</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_03.png" class="icon">합기도</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_04.png" class="icon">검도</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_05.png" class="icon">복싱, MMA</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_06.png" class="icon">스포츠의류</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_07.png" class="icon">스포츠용품(구기)</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_08.png" class="icon">네트&amp;골대</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_09.png" class="icon">휘트니스</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_10.png" class="icon">학교체육용품</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_11.png" class="icon">체육대회용품</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_12.png" class="icon">측정용품&amp;호각</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_13.png" class="icon">펌프</a></li>
		        		<li><a href="#"><img src="/html5/common/images/menu/ic_13.png" class="icon">정리용품</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터 관리</a>
					<ul class="col-2">
						<li><a href="/admin/notice/NoticeList.do">공지사항 관리</a></li>
						<li><a href="/admin/QA/QAList.do">Q&amp;A 관리</a></li>
					</ul>
				</li>
			</ul>
		</nav>

		<div class="container detail">
			<div class="wrap btn-wrap">
			
				<div class="list_wrap qna_detail">
					<div class="top">
						<p class="title"><%=CmmUtil.nvl(rDTO.getTitle())%></p>
						<p class="sub_text"><%=CmmUtil.nvl(rDTO.getUser_name())%><span><%=CmmUtil.nvl(rDTO.getReg_dt())%></span></p>
					</div>
          			<div class="content">
          				<%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br>") %>
          				<br />
          				<img alt="" src="<%="/upload/qa_file/" + rDTO.getFile_name() %>" style="width:100%; height:100%">
          			</div>          			
				</div>
        		<div class="btn-groub">
					<button class="col-3 deep-btn button" onclick="javascript:doReply();return false;">답글</button>
					<button class="col-3 blue-btn button" onclick="javascript:doDelete();return false;">삭제</button>
					<button class="col-3 glay-btn button" onclick="javascript:doList();return false;">목록</button>
				</div>
				
			</div>
		</div>
		
		<footer class="footer">
    	<a href="#">
      		<img src="/html5/common/images/ic_kakao.png" alt="카카오톡" class="kakao">
    	</a>
    	<div class="company_info">
      		<p>대표이사 : 장명훈 ㅣ 대표번호 : 010-9057-6156</p>
      		<p>사업자등록번호 : 567-36-00142</p>
      		<p>통신판매업신고 : 2017-인천서구-0309호</p>
      		<p>인천시 서구 보도진로 18번길 12(가좌동) 진성테크2층</p>
      		<p>Copyright © <strong>모두의 스포츠</strong> All rights reserved. </p>
    	</div>
		</footer>

	</form>	
		
	</section>
		  
	<div id="c-mask" class="c-mask"></div>
	<script src="/html5/common/js/classie.js"></script>
	<script src="/html5/common/js/common.js"></script>
	  
</body>

</html>