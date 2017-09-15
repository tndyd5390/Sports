 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 
	이 주석을 보는 개발자여....남이 하던 프로젝트는 받는 것이 아니니 절대 받지 말길
-->
<head>
<%@include file="/html5/include/head.jsp" %>
<style type="text/css">
.search-wrap .search input.psySearchText {
	width: 70%;
	padding: 5px 10px;
	margin-left: 5px;
}

a.psySearchBtn {
	width: 25%;
    height: 40px;
    top: 15px;
    right: 15px;
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.8;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    text-decoration: none;
    color: #fff;
    background-color: #5bc0de;
    border-color: #46b8da;
    float: right;
}
div.psyTable {
	display: table;
	width: 100%
}
div.psyRow {
	display: table-row;
}
sapn.psyCell {
	display: table-cell;
	padding: 3px;
	border-bottom: 1px solid #DDDDDD;
}
span.psyCol1 {
	width: 25%;
}
span.psyCol2 {
	width: 75%;
}
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
        <p>주문 정보</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>
    <div class="container detail">
      <div class="wrap search-wrap btn-wrap">
	        <div class="search type">
				<select class="search_type" style="width: 90px;" id="searchType">
					<option value="#">주문 내역</option>
					<option value="#">주문 일자</option>
				</select> 
				<input class="psySearchText" type="text"><a href="#" class="psySearchBtn" >검색</a>
			</div>
		<div class="psyTable">
			<div class="psyRow">
				<span class="psyCell psyCol1">asdf</span>
				<span class="psyCell psyCol2">aerouibfghyviourahefdaeouiwnrfhdjefhoiruajdnwfhiodejunrsawhiekudfrjnoasedfhijknrasuofhedinrajksuoahifendjkursohifnjkerdusaofarekwuniobjafonikbwrejuh</span>
			</div>
			<div class="psyRow">
				<span class="psyCell psyCol1">asdf</span>
				<span class="psyCell psyCol2">aerouibfghyviourahefdaeouiwnrfhdjefhoiruajdnwfhiodejunrsawhiekudfrjnoasedfhijknrasuofhedinrajksuoahifendjkursohifnjkerdusaofarekwuniobjafonikbwrejuh</span>
			</div>
		</div>
      </div>
    </div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>
</html>
