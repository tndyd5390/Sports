 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 
	이 주석을 보는 개발자여....오늘도 피곤한 하루를 보내었나요???
	저도 죽을 거 같네요...우리 같이 화이팅 합시다. 제가 피곤함을 어필 힐 수 있는 방법을 배웠어요...
	모든 변수명앞에 본인의 이니셜을 붙이세요
	윗사람 중 아무나 보지 않겠습니까???
-->
<head>
<%@include file="/html5/include/head.jsp" %>
<style type="text/css">
.search input.psySearchText {
	width: 70%;
	padding: 5px 10px;
	float: left;
	margin-bottom: 10px;
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
    background-color: #1777CB;
    border-color: #46b8da;
    float: right;
}
.shDTable {
	display: table;
	width: 100%;
	margin-bottom: 10px;
}

.shDTables {
	display: table;
	width: 100%;
	margin-bottom: 10px;
}

.shCTitle {
	display: inline-block;
	width: 27%;
	color: #7f7f7f;
	font-weight: bold;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	height: 30px;
}
.psyTitle{
	background-color:#B9B9B9;
	border: 1px solid #B9B9B9;
	display: inline-block;
	width: 100%;
	color: #7f7f7f;
	font-weight: bold;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	height: 30px;
}
.psyDetail{
	border: 1px solid #B9B9B9;
	width: 25%;
	color: #000000;
	display: table-cell;
	font-weight: bold;
	height: 30px;
	vertical-align: middle;
	text-align: center;
	padding-left: 5px;
	word-break:break-all;
}
.shCDetail {
	display: inline-block;
	width: 75%;
	color: #000000;
	display: table-cell;
	font-weight: bold;
	height: 30px;
	vertical-align: middle;
	padding-left: 5px;
}

.shDelivey {
	background-color: #F2F2F2;
	margin-top: 5px;
	font-weight: bold;
	text-align: center;
	height: 40px;
	display: table-cell;
	vertical-align: middle;
	width: 10%;
	margin-bottom: 20px;
}

.shNDelivey {
	color: red;
	font-weight: bold;
	vertical-align: middle;
	margin: 0 auto;
	color: red;
	font-size: 20px;
	width: 100%;
}

a.psyOrderDetailBtn {
	width: 48%;
	height: 40px;
	top: 15px;
	right: 15px;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 10px;
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
	background-color: #1777CB;
	border-color: #46b8da;
	margin-bottom: 16px;
}
</style>	
<script type="text/javascript">
	function toggleFunc(id){
		$('#' + id).toggle();
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
        <p>주문 환불 목록</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>
    <div class="container detail" align="center">
   		 	<div class="search type">
				<select class="search_type" style="width: 100%; margin-bottom: 10px;" id="searchType">
					<option value="#">주문 내역</option>
					<option value="#">주문 일자</option>
					<option value="#">주문 번호</option>
					<option value="#">주문 내역</option>
					<option value="#">환불 일자</option>
					<option value="#">주소</option>
				</select> 
				<input class="psySearchText" type="text"><a href="#" class="psySearchBtn" >검색</a>
			</div>
 		<div class="shDTables" align="left" style="margin-top:10px;">
 			<div class="psyTitle" align="left" onclick="toggleFunc('1');">2017/05/22</div>
 		</div>
 		<div id="1" style="display: none;">
	 		<div class="shDTable" align="left">
	 			<div class="psyDetail" align="left">주문 번호</div>
	 			<div class="psyDetail" align="left">품명</div>
	 			<div class="psyDetail" align="left">가격</div>
	 			<div class="psyDetail" align="left">배송상태</div>
	 		</div>
	 		<div class="shDTable" align="left">
	 			<div class="psyDetail" align="left">주문 번호201705220001</div>
	 			<div class="psyDetail" align="left">태권도복 외 1개</div>
	 			<div class="psyDetail" align="left">30000</div>
	 			<div class="psyDetail" align="left">배송중</div>
	 		</div>
 		</div>
 		<div class="shDTables" align="left">
 			<div class="psyTitle" align="left" onclick="toggleFunc('2');">2017/05/22</div>
 		</div>
 		<div id="2" style="display: none;">
	 		<div class="shDTable" align="left">
	 			<div class="psyDetail" align="left">주문 번호</div>
	 			<div class="psyDetail" align="left">품명</div>
	 			<div class="psyDetail" align="left">가격</div>
	 			<div class="psyDetail" align="left">배송상태</div>
	 		</div>
	 		<div class="shDTable" align="left">
	 			<div class="psyDetail" align="left">주문 번호201705220001</div>
	 			<div class="psyDetail" align="left">태권도복 외 1개</div>
	 			<div class="psyDetail" align="left">30000</div>
	 			<div class="psyDetail" align="left">배송중</div>
	 		</div>
 		</div>
 		<div class="shDTables" align="left">
 			<div class="psyTitle" align="left" onclick="toggleFunc('3');">2017/05/22</div>
 		</div>
 		<div id="3" style="display: none;">
	 		<div class="shDTable" align="left">
	 			<div class="psyDetail" align="left">주문 번호</div>
	 			<div class="psyDetail" align="left">품명</div>
	 			<div class="psyDetail" align="left">가격</div>
	 			<div class="psyDetail" align="left">배송상태</div>
	 		</div>
	 		<div class="shDTable" align="left">
	 			<div class="psyDetail" align="left">주문 번호201705220001</div>
	 			<div class="psyDetail" align="left">태권도복 외 1개</div>
	 			<div class="psyDetail" align="left">30000</div>
	 			<div class="psyDetail" align="left">배송중</div>
	 		</div>
 		</div>
 	<a href="#" class="psyOrderDetailBtn" style="float: left;">운송장 번호 수정</a>
 	<a href="#" class="psyOrderDetailBtn" style="float: right;">목록</a>
 	</div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>
</html>
