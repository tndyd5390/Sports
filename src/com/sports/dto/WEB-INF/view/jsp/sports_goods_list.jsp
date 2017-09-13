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
        <p>스포츠 용품</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>


    <div class="container detail">
      <div class="wrap search-wrap">
        <div class="search array">
          <button class="array-btn"><img src="html5/common/images/ic_array.png" alt="정렬이미지"></button>
          <input type="text" placeholder="검색하세요">
          <button class="blue btn">검색</button>
        </div>

        <div class="list_wrap">
          <ul class="sports_list">
            <li><a href="#">태권도</a></li>
            <li><a href="#">검도</a></li>
            <li><a href="#">합기도</a></li>

            <li><a href="#">복싱, MMA</a></li>
            <li><a href="#">스포츠용품(구기)</a></li>
            <li><a href="#">네트&amp;골대</a></li>

            <li><a href="#">휘트니스</a></li>
            <li><a href="#">스포츠의류</a></li>
            <li><a href="#">측정용품&amp;호각</a></li>

            <li><a href="#">펌프</a></li>
            <li><a href="#">정리용품</a></li>
            <li><a href="#">체육대회용품</a></li>

            <li><a href="#">학교체육용품</a></li>
            <li><a href="#">전체</a></li>
          </ul>
        </div>
        <div class="goods_list_wrap">
          <ul class="goods_list">
            <li>
              <a href="#">
              <div class="thumb">
                <img src="html5/common/images/sample01.png" alt="thumb">
              </div>
              <div class="info">
                <p class="title">한국스포츠 KSD 태권도 품 도복 (아동) TKD POOM Uniform (Child) </p>
                <p class="price register">30,000원</p>
              </div>
              </a>
              <button class="register-btn thumb-btn">등록</button>
            </li>
            <li>
              <a href="#">
              <div class="thumb">
                <img src="html5/common/images/sample02.png" alt="thumb">
              </div>
              <div class="info">
                <p class="title">한국스포츠 KSD 태권도 품 도복 (아동) TKD POOM Uniform (Child) </p>
                <p class="price edit">30,000원</p>
                </div>
                <button class="edit-btn thumb-btn">편집</button>
              </div>
            </li>
          </ul>

        </div>

      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
