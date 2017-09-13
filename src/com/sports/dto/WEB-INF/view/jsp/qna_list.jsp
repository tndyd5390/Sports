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
      <div class="wrap search-wrap btn-wrap">
        <div class="search type">
          <select class="search_type">
						<option value="이름">이름</option>
						<option value="아이디">아이디</option>
					</select>
          <input type="text" placeholder="동입력">
          <button class="blue btn">검색</button>
        </div>

        <div class="list_wrap">
          <ul class="list-groub">
            <li class="notice">
              <input type="checkbox" class="checkbox">
              <a href="#">
                <p class="title"><span class="blue_text">[공지]</span>QnA게시판 이용시 주의사항<img src="html5/common/images/ic_new.png" alt="new" class="ic_new"></p>
                <p class="sub_text">관리자<span>2017-04-14</span></p>
              </a>
            </li>
            <li>
              <input type="checkbox" class="checkbox">
              <a href="#">
                <p class="title">QnA게시판 이용시 주의사항</p>
                <p class="sub_text">강지원<span>2017-04-14</span></p>
                <img src="html5/common/images/ic_lock.png" class="ic_lock" alt="lock">
              </a>
            </li>
            <li class="list-reply">
              <input type="checkbox" class="checkbox">
              <a href="#">
                <p class="title"><img src="html5/common/images/ic_reply.png" alt="답글" class="ic_reply">QnA게시판 이용시 주의사항</p>
                <p class="sub_text">강지원<span>2017-04-14</span></p>
              </a>
            </li>
          </ul>
          <label class="all_select"><input type="checkbox">모두 선택하기</label>
          <button class="add_btn">더보기</button>
        </div>
        <div class="btn-groub">
          <button class="col-2 blue-btn button">편집하기</button>
          <button class="col-2 glay-btn button">작성하기</button>
        </div>
      </div>

    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>
