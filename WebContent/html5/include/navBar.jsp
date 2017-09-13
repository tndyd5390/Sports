 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import = "com.sports.util.CmmUtil" %>
 <%
 	String ss_user_no =  CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
 	String ss_user_id =  CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
 	String ss_user_name =  CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
 %>
    <nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">

	<div class="profile">
	<%if(ss_user_no.equals("")){%>
		<p><img src="html5/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
		<button class="c-menu__close"><img src="html5/common/images/menu/cancel.png" alt="닫기"></button>
		<div class="login_wrap"><a href="login.do">로그인</a><a href="userReg.do">회원가입</a></div>
	</div>
	<%}else{ %>
		<p><img src="html5/common/images/menu/user.png" class="photo"><%=ss_user_name %>님 안녕하세요.</p>
		<button class="c-menu__close"><img src="html5/common/images/menu/cancel.png" alt="닫기"></button>
		<div class="logout_wrap"><a href="logout.do">로그아웃</a></div>
	<%} %>
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
				<li><a href="/admin/sale/list.do"><img src="html5/common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
				<li><a href="#"><img src="html5/common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
				<li><a href="#"><img src="html5/common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
			</ul>
		</li>
		<li>
			<a href="#">스포츠 용품 리스트 관리</a>
			<ul class="col-2 more">
				<li><a href="#"><img src="html5/common/images/menu/ic_01.png" class="icon">전체상품</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_02.png" class="icon">태권도</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_03.png" class="icon">합기도</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_04.png" class="icon">검도</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_05.png" class="icon">복싱, MMA</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_06.png" class="icon">스포츠의류</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_07.png" class="icon">스포츠용품(구기)</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_08.png" class="icon">네트&amp;골대</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_09.png" class="icon">휘트니스</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_10.png" class="icon">학교체육용품</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_11.png" class="icon">체육대회용품</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_12.png" class="icon">측정용품&amp;호각</a></li>
				<li><a href="#"><img src="html5/common/images/menu/ic_13.png" class="icon">펌프</a></li>
        <li><a href="#"><img src="html5/common/images/menu/ic_13.png" class="icon">정리용품</a></li>
			</ul>
		</li>
		<li>
			<a href="#">고객센터 관리</a>
			<ul class="col-2">
				<li><a href="#">공지사항 관리</a></li>
				<li><a href="#">Q&amp;A 관리</a></li>
			</ul>
		</li>
	</ul>
</nav>
