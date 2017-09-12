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
			<img src="html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
		</div>
		<div class="logo">
			<a href="#"><h2 class="title">모두의 스포츠</h2></a>
		</div>
	</div>

	<div class="page_title">
		<p>Q&amp;A</p>
	</div>
</header>

  <%@include file="/html5/include/navBar.jsp" %>


    <div class="container detail">
      <div class="wrap btn-wrap">
        <div class="list_wrap qna_detail">
          <div class="top">
            <p class="title">QnA 게시판 이용시에 지켜야할 주의사항입니다.</p>
            <p class="sub_text">관리자<span>2017-04-14  14:15</span></p>
          </div>
          <div class="content">
            1. QnA 게시판은 실명제로 운영됩니다.<br>
            2. 답글은 주말, 공휴일 제외 24시간 이내로 확인하실 수 있습니다.<br>
            3. 목적에 맞지 않는 글은 작성자의 동의 없이 삭제될 수 있습니다.
          </div>
        </div>
        <div class="btn-groub">
          <button class="col-3 deep-btn button">수정</button>
          <button class="col-3 blue-btn button">삭제</button>
          <button class="col-3 glay-btn button">목록</button>
        </div>
      </div>

    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>
