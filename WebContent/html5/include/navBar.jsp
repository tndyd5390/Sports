 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import = "com.sports.util.CmmUtil" %>
 <%
 	String ss_user_no =  CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
 	String ss_user_id =  CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
 	String ss_user_name =  CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
 	String ss_user_auth =  CmmUtil.nvl((String)session.getAttribute("ss_user_auth"));
 %>
 <script>
 
 function myPage(){
	var uNo = '<%=ss_user_no%>';
	if(uNo == ""){
		alert("로그인이 필요한 기능입니다.");
		if(confirm("로그인 하시겠습니까?")){
			location.href="login.do";
		}else{
			return false;
		}
	}else{
		location.href="userDetail.do?uNo="+uNo;
		return true;
	}
 }
 
 //네비바에서 상품 이동
 function doMoveGoods(pNo){
	document.location.href = "/productList.do?pNo="+pNo;
 }

 </script>
 
 <% if(ss_user_auth.equals("U")|ss_user_no.equals("")){ %>
	 <nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">
		<div class="profile">
		<%if(ss_user_no.equals("")){%>
			<p><img src="/html5/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
			<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
			<div class="login_wrap"><a href="/login.do">로그인</a><a href="/userReg.do">회원가입</a></div>
		</div>
		<%}else{ %>
			<p><img src="/html5/common/images/menu/user.png" class="photo"><%=ss_user_name %>님 안녕하세요.</p>
			<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
			<div class="logout_wrap"><a href="/logout.do">로그아웃</a></div>
		<%} %>
		<ul class="menu_list">
			<li><a href="#" onclick="return myPage();">회원 정보</a></li>
			<li>
				<a href="#">마이페이지</a>
				<ul class="col-2">
				<%if(ss_user_no.equals("5")){ %>
					<li><a href="orderList.do">주문정보</a></li>
				<%}else{ %>
					<li><a href="customerOrderList.do?userNo=<%=ss_user_no%>">주문정보</a></li>
				<%} %>
					<li><a href="customerBasketList.do">장바구니</a></li>
				</ul>
			</li>
			<li>
				<a href="productList.do">스포츠 용품 리스트</a>
				<ul class="col-2 more">
					<li><a href="javascript:doMoveGoods('');"><img src="/html5/common/images/menu/ic_01.png" class="icon">전체</a></li>
					<li><a href="javascript:doMoveGoods('1');"><img src="/html5/common/images/menu/ic_02.png" class="icon">검도</a></li>
					<li><a href="javascript:doMoveGoods('2');"><img src="/html5/common/images/menu/ic_03.png" class="icon">공구</a></li>
					<li><a href="javascript:doMoveGoods('3');"><img src="/html5/common/images/menu/ic_04.png" class="icon">권투</a></li>
					<li><a href="javascript:doMoveGoods('4');"><img src="/html5/common/images/menu/ic_05.png" class="icon">기타스포츠용품</a></li>
					<li><a href="javascript:doMoveGoods('5');"><img src="/html5/common/images/menu/ic_06.png" class="icon">농구</a></li>
					<li><a href="javascript:doMoveGoods('6');"><img src="/html5/common/images/menu/ic_07.png" class="icon">무술용품</a></li>
					<li><a href="javascript:doMoveGoods('7');"><img src="/html5/common/images/menu/ic_08.png" class="icon">배구</a></li>
					<li><a href="javascript:doMoveGoods('8');"><img src="/html5/common/images/menu/ic_09.png" class="icon">배드민턴</a></li>
					<li><a href="javascript:doMoveGoods('9');"><img src="/html5/common/images/menu/ic_10.png" class="icon">보호용품</a></li>
					<li><a href="javascript:doMoveGoods('10');"><img src="/html5/common/images/menu/ic_11.png" class="icon">수련용품</a></li>
					<li><a href="javascript:doMoveGoods('11');"><img src="/html5/common/images/menu/ic_12.png" class="icon">수영</a></li>
					<li><a href="javascript:doMoveGoods('12');"><img src="/html5/common/images/menu/ic_13.png" class="icon">스포츠악세사리</a></li>
	        		<li><a href="javascript:doMoveGoods('13');"><img src="/html5/common/images/menu/ic_13.png" class="icon">야구</a></li>
	        		<li><a href="javascript:doMoveGoods('14');"><img src="/html5/common/images/menu/ic_13.png" class="icon">요가/필라테스</a></li>
	        		<li><a href="javascript:doMoveGoods('15');"><img src="/html5/common/images/menu/ic_13.png" class="icon">자전거</a></li>
	        		<li><a href="javascript:doMoveGoods('16');"><img src="/html5/common/images/menu/ic_13.png" class="icon">족구</a></li>
	        		<li><a href="javascript:doMoveGoods('17');"><img src="/html5/common/images/menu/ic_13.png" class="icon">축구</a></li>
	        		<li><a href="javascript:doMoveGoods('18');"><img src="/html5/common/images/menu/ic_13.png" class="icon">탁구</a></li>
	        		<li><a href="javascript:doMoveGoods('19');"><img src="/html5/common/images/menu/ic_13.png" class="icon">테니스</a></li>
	        		<li><a href="javascript:doMoveGoods('20');"><img src="/html5/common/images/menu/ic_13.png" class="icon">헬스</a></li>
				</ul>
			</li>
			<li>
				<a href="#">고객센터</a>
				<ul class="col-2">
					<li><a href="/notice/NoticeList.do">공지사항</a></li>
					<li><a href="/customer/QA/QAList.do">Q&amp;A</a></li>
				</ul>
			</li>
		</ul>
	</nav>
 <%}else{ %>
    <nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">

	<div class="profile">
	<%if(ss_user_no.equals("")){%>
		<p><img src="/html5/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
		<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
		<div class="login_wrap"><a href="/login.do">로그인</a><a href="/userReg.do">회원가입</a></div>
	</div>
	<%}else{ %>
		<p><img src="/html5/common/images/menu/user.png" class="photo"><%=ss_user_name %>님 안녕하세요.</p>
		<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
		<div class="logout_wrap"><a href="/logout.do">로그아웃</a></div>
	<%} %>
	<ul class="menu_list">
		<li><a href="orderList.do">주문관리</a></li>
		<li>
			<a href="#">학원관리</a>
			<ul class="col-2">
				<li><a href="academyMap.do">학원 밀집도 정보</a></li>
				<li><a href="#">거래처 관리</a></li>
			</ul>
		</li>
		<li>
			<a href="#">매출 분석 정보</a>
			<ul class="col-3">
				<li><a href="#"><img src="/html5/common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
				<li><a href="#"><img src="/html5/common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
				<li><a href="basketAnalysis.do"><img src="/html5/common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
			</ul>
		</li>
		<li>
			<a href="productList.do">스포츠 용품 리스트 관리</a>
			<ul class="col-2 more">
					<li><a href="javascript:doMoveGoods('');"><img src="/html5/common/images/menu/ic_01.png" class="icon">전체</a></li>
					<li><a href="javascript:doMoveGoods('1');"><img src="/html5/common/images/menu/ic_02.png" class="icon">검도</a></li>
					<li><a href="javascript:doMoveGoods('2');"><img src="/html5/common/images/menu/ic_03.png" class="icon">공구</a></li>
					<li><a href="javascript:doMoveGoods('3');"><img src="/html5/common/images/menu/ic_04.png" class="icon">권투</a></li>
					<li><a href="javascript:doMoveGoods('4');"><img src="/html5/common/images/menu/ic_05.png" class="icon">기타스포츠용품</a></li>
					<li><a href="javascript:doMoveGoods('5');"><img src="/html5/common/images/menu/ic_06.png" class="icon">농구</a></li>
					<li><a href="javascript:doMoveGoods('6');"><img src="/html5/common/images/menu/ic_07.png" class="icon">무술용품</a></li>
					<li><a href="javascript:doMoveGoods('7');"><img src="/html5/common/images/menu/ic_08.png" class="icon">배구</a></li>
					<li><a href="javascript:doMoveGoods('8');"><img src="/html5/common/images/menu/ic_09.png" class="icon">배드민턴</a></li>
					<li><a href="javascript:doMoveGoods('9');"><img src="/html5/common/images/menu/ic_10.png" class="icon">보호용품</a></li>
					<li><a href="javascript:doMoveGoods('10');"><img src="/html5/common/images/menu/ic_11.png" class="icon">수련용품</a></li>
					<li><a href="javascript:doMoveGoods('11');"><img src="/html5/common/images/menu/ic_12.png" class="icon">수영</a></li>
					<li><a href="javascript:doMoveGoods('12');"><img src="/html5/common/images/menu/ic_13.png" class="icon">스포츠악세사리</a></li>
	        		<li><a href="javascript:doMoveGoods('13');"><img src="/html5/common/images/menu/ic_13.png" class="icon">야구</a></li>
	        		<li><a href="javascript:doMoveGoods('14');"><img src="/html5/common/images/menu/ic_13.png" class="icon">요가/필라테스</a></li>
	        		<li><a href="javascript:doMoveGoods('15');"><img src="/html5/common/images/menu/ic_13.png" class="icon">자전거</a></li>
	        		<li><a href="javascript:doMoveGoods('16');"><img src="/html5/common/images/menu/ic_13.png" class="icon">족구</a></li>
	        		<li><a href="javascript:doMoveGoods('17');"><img src="/html5/common/images/menu/ic_13.png" class="icon">축구</a></li>
	        		<li><a href="javascript:doMoveGoods('18');"><img src="/html5/common/images/menu/ic_13.png" class="icon">탁구</a></li>
	        		<li><a href="javascript:doMoveGoods('19');"><img src="/html5/common/images/menu/ic_13.png" class="icon">테니스</a></li>
	        		<li><a href="javascript:doMoveGoods('20');"><img src="/html5/common/images/menu/ic_13.png" class="icon">헬스</a></li>
			</ul>
		</li>
		<li>
			<a href="#">고객센터 관리</a>
			<ul class="col-2">
				<li><a href="/notice/NoticeList.do">공지사항 관리</a></li>
				<li><a href="/admin/QA/QAList.do">Q&amp;A 관리</a></li>
			</ul>
		</li>
	</ul>
</nav>
<%}%>