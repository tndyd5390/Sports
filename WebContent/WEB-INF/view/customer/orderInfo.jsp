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
ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin:0;
}
#mainWrapper{
    width: 100%;
    margin: 0 auto;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 200px;
    
}
#mainWrapper > ul > li:first-child {
    text-align: center;
    font-size:14pt;
    height:40px;
    vertical-align:middle;
    line-height:30px;
}
#ulTable {margin-top:10px;}


#ulTable > li > ul {
    clear:both;
    padding:0px auto;
    position:relative;
    min-width:40px;
}
#ulTable > li > ul > li { 
    float:left;
    font-size:9pt;
    border-bottom:1px solid silver;
    vertical-align:baseline;
}    
#ulTable > li > ul > li:first-child               {width:25%; background-color: #ffffff;border-right: 1px solid silver;}
#ulTable > li > ul > li:first-child +li           {width:25%; background-color: #ffffff;border-right: 1px solid silver;}
#ulTable > li > ul > li:first-child +li+li        {width:25%; background-color: #ffffff;border-right: 1px solid silver;}
#ulTable > li > ul > li:first-child +li+li+li     {width:25%; background-color: #ffffff;}

#ulTable > li:nth-child(odd) {
	background-color: #E1E1E1;
}
div.psyToggleDiv {
	display: none;
}
</style>	
<script type="text/javascript">
	function func(num){
		$('.' + num).toggle();
	}
</script>
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
		<div id="mainWrapper">
        <ul>
            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li style="width:100%; background-color: #c9c9c9;" onclick="func('1');">2017/03/14 거래내역 보기</li>
                        </ul>
                    </li>
                    <li class="1" style="display: none;">
                        <ul>
                            <li>주문번호</li>
                            <li>품명</li>
                            <li>가격</li>
                            <li>배송여부</li>
                        </ul>
                    </li>
                    <li class="1" style="display: none;">
                        <ul>
                            <li>123456</li>
                            <li>태권도복</li>
                            <li>1,000</li>
                            <li>배송 완료</li>
                        </ul>
                    </li>

                    <li class="1" style="display: none;">
                        <ul>
                            <li>123456</li>
                            <li>장갑</li>
                            <li>500</li>
                            <li>배송중</li>
                        </ul>
                    </li>
                    <li>
                        <ul>
                            <li style="width:100%; background-color: #c9c9c9;" onclick="func('2');">2017/05/22 거래내역 보기</li>
                        </ul>
                    </li>
                    <li class="2" style="display: none;">
                        <ul>
                            <li>주문번호</li>
                            <li>품명</li>
                            <li>가격</li>
                            <li>배송여부</li>
                        </ul>
                    </li>
                    <li class="2" style="display: none;">
                        <ul>
                            <li>123456</li>
                            <li>태권도복</li>
                            <li>1,000</li>
                            <li>배송 완료</li>
                        </ul>
                    </li>

                    <li class="2" style="display: none;">
                        <ul>
                            <li>123456</li>
                            <li>장갑</li>
                            <li>500</li>
                            <li>배송중</li>
                        </ul>
                    </li>
                    <li>
                        <ul>
                            <li style="width:100%; background-color: #c9c9c9;" onclick="func('3');">2017/11/11 거래내역 보기</li>
                        </ul>
                    </li>
                    <li class="3" style="display: none;">
                        <ul>
                            <li>주문번호</li>
                            <li>품명</li>
                            <li>가격</li>
                            <li>배송여부</li>
                        </ul>
                    </li>
                    <li class="3" style="display: none;">
                        <ul>
                            <li>123456</li>
                            <li>태권도복</li>
                            <li>1,000</li>
                            <li>배송 완료</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
      </div>
    </div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
