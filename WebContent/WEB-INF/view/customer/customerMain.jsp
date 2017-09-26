<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>

</head>

<body>
  <section id="wrapper" class="wrapper">
    <header class="header">
	<div class="wrap">
		<div class="left_menu">
			<img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
		</div>
		<div class="logo">
			<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
		</div>
	</div>
</header>
<%@include file="/html5/include/customerNavBar.jsp" %>
    <div class="container">
      <ul class="menu">
        <li>
          <a href="userList.do"><img src="/html5/common/images/ic_menu_01member.png" alt="회원관리">
            <p>회원정보</p>
          </a>
        </li>
        <li>
          <a href="#"><img src="/html5/common/images/ic_menu_02access.png" alt="권한관리">
            <p>마이페이지</p>
          </a>
        </li>
        <li>
          <a href="#"><img src="/html5/common/images/ic_menu_03order.png" alt="주문관리">
            <p>스포츠 용품 리스트</p>
          </a>
        </li>
        <li>
          <a href="#"><img src="/html5/common/images/ic_menu_04academy.png" alt="학원관리">
            <p>고객센터</p>
          </a>
        </li>
      </ul>
    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>