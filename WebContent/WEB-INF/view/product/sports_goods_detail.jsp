<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil" %>
<%@ page import="com.sports.dto.ProductInfoDTO" %>
<%
	ProductInfoDTO pDTO = (ProductInfoDTO) request.getAttribute("pDTO");
%>
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
      <div class="wrap btn-wrap">

        <div class="list_wrap">
          <div class="goods_detail">
            <div class="thumb">
              <img src="<%=CmmUtil.nvl(pDTO.getSrc_filename())%>" alt="thumb">
            </div>
            <div class="info">
              <p class="title"><%=CmmUtil.nvl(pDTO.getProd_name())%></p>
              <p class="sub_text">배송비 2,500원 (50,000원 이상 무료배송)</p>
            </div>
          </div>
          <div class="goods_option">
            <p class="blue_text">옵션 선택</p>
            <div class="select_wrap">
              <select class="col-2">
              <option value="색상선택">색상선택</option>
              <option value="빨강">빨강</option>
              </select>
              <select class="col-2">
                <option value="선택">사이즈선택</option>
                <option value="사이즈">사이즈1</option>
              </select>
            </div>

            <p class="blue_text">수량</p>
            <div class="count_input">
              <a class="incr-btn">–</a>
              <input class="quantity" type="text" value="1" readonly="true">
              <a class="incr-btn">+</a>
            </div>
            <div class="price_wrap">총금액<span class="price">33,000</span><span class="won">원</span></div>
          </div>
        </div>

        <div class="list_wrap">
          <h4 class="goods_detail_title">제품 상세정보</h4>
          <div class="detail_contents">
            <img src="html5/common/images/sample02.png" alt="thumb">
            <dl>
              <dt>제품특징</dt>
              <dd>훈련을 위한 기본 장비로써 가볍고 터칭감이 뛰어나 다양한 훈련에 적합한 제품입니다.
            내구성이 뛰어난 소재로 제작이 되어 더욱 실용적입니다.</dd>
              <dt>상품규격정보</dt>
              <dd>- 재질 : 폴리에스테르 65% + 면 35%<br>
            - 색상 : 검정/노랑/주황/빨강/파랑/밤색/보라</dd>
            </dl>

          </div>
        </div>

        <div class="btn-groub">
          <button class="col-2 blue-btn button">수정</button>
          <button class="col-2 glay-btn button">삭제</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
