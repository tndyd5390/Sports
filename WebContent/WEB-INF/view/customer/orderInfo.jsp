 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 
	이 주석을 본다면 개발자겠지???
	아 진짜 뷰 만들기 개 힘들다 진짜 ㅠㅠㅠㅠ 
-->
<head>
<%@include file="/html5/include/head.jsp" %>
<style type="text/css">

</style>	
</head>
<body>
  <section id="wrapper" class="wrapper">
       <header class="header">
      <div class="wrap">
        <div class="left_menu">
          <img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
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
      <div class="wrap search-wrap btn-wrap">
	        <div class="search type">
				<select class="search_type" id="searchType">
					<option value="name">이름</option>
					<option value="id">아이디</option>
				</select> <input type="text" id="searchValue" onkeyup="doSearch()">
			</div>
        <div class="btn-groub">
          <button class="col-2 blue-btn button" onclick="doSubmit();">결제하기</button>
          <button class="col-2 glay-btn button">취소하기</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
