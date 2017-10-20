<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil" %>
<% String auth = CmmUtil.nvl((String) session.getAttribute("ss_user_auth")); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
</head>
<%if(auth.equals("")|auth==null|auth.equals("U")){ %>
<body>
  <section id="wrapper" class="wrapper">
    <header class="header">
	<div class="wrap">
		<div class="left_menu">
			<img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
		</div>
		<div class="logo">
			<a href="/main.do"><h2 class="title">모두의 스포츠</h2></a>
		</div>
	</div>
</header>
<%@include file="/html5/include/navBar.jsp" %>
<script>
function myPage(){
	var uNo = '<%=ss_user_no%>';
	if(uNo == ""){
		if(confirm("로그인 하시겠습니까?")){
			location.href="login.do";
		}else{
			return false;
		}
	}else{
		location.href="/userDetail.do?uNo="+uNo;
		return true;
	}
 }
 
 function myOrder(){
	var uNo = "<%=ss_user_no%>";
	if(uNo == ""){
		if(confirm("로그인 하시겠습니까?")){
			location.href="login.do";
		}else{
			return false;
		}
	}else{
		location.href="/customerOrderList.do?userNo="+uNo;
		return true;
	}
 }
</script>
    <div class="container">
      <ul class="menu">
        <li>
          <a href="#" onclick="return myPage();"><img src="/html5/common/images/ic_menu_01member.png" alt="회원정보">
            <p>회원정보</p>
          </a>
        </li>
        <li>
          <a href="#" onclick="return myOrder();"><img src="/html5/common/images/ic_menu_02access.png" alt="마이페이지">
            <p>주문내역</p>
          </a>
        </li>
        <li>
          <a href="/productList.do"><img src="/html5/common/images/ic_menu_03order.png" alt="스포츠 용품 리스트">
            <p>스포츠 용품<br>리스트</p>
          </a>
        </li>
        <li>
          <a href="/customer/QA/QAList.do"><img src="/html5/common/images/ic_menu_04academy.png" alt="고객센터">
            <p>고객센터</p>
          </a>
        </li>
      </ul>
    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>
<%}else{ %>
<body>
  <section id="wrapper" class="wrapper">
    <header class="header">
	<div class="wrap">
		<div class="left_menu">
			<img src="html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
		</div>
		<div class="logo">
			<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
		</div>
	</div>
</header>
<%@include file="/html5/include/navBar.jsp" %>
    <div class="container">
      <ul class="menu">
        <li>
          <a href="/userList.do"><img src="html5/common/images/ic_menu_01member.png" alt="회원관리">
            <p>회원관리</p>
          </a>
        </li>
        <li>
          <a href="orderList.do"><img src="html5/common/images/ic_menu_03order.png" alt="주문관리">
            <p>주문관리</p>
          </a>
        </li>
        <li>
          <a href="/accountmanagement.do"><img src="html5/common/images/ic_menu_04academy.png" alt="학원관리">
            <p>학원관리</p>
          </a>
        </li>
        <li>
          <a href="/basketAnalysis.do"><img src="html5/common/images/ic_menu_05sale.png" alt="매출분석정보">
            <p>매출분석정보</p>
          </a>
        </li>
        <li>
          <a href="/productList.do" class="two-rows"><img src="html5/common/images/ic_menu_06list.png" alt="스포츠용품리스트관리">
            <p>스포츠용품<br>리스트관리</p>
          </a>
        </li>
        <li>
          <a href="/customer/QA/QAList.do"><img src="html5/common/images/ic_menu_07community.png" alt="커뮤니티관리">
            <p>커뮤니티관리</p>
          </a>
        </li>
      </ul>
    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>
<%} %>

</html>