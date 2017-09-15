 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 
	이 주석을 보는 개발자여....오늘도 피곤한 하루를 보내었나요???
-->
<head>
<%@include file="/html5/include/head.jsp" %>
<style type="text/css">
.shDTable{
		display: table;
		width: 100%;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.shDTables{
		display: table;
		width: 100%;
		margin-top: 60px;
		margin-bottom: 10px;
	}
	.shCTitle{
		display: inline-block;
		width: 27%;
		color: #7f7f7f;
		font-weight: bold;
		display: table-cell;
		vertical-align: middle;
		text-align: center;
		height: 30px;
	}
	.shCDetail{
		display: inline-block;
		width: 75%;
		color: #000000;
		display: table-cell;
		font-weight: bold;
		height: 30px;
		vertical-align: middle;
		padding-left: 5px;
	}
	.shDelivey{
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
	.shNDelivey{
		color: red;
		font-weight: bold;
		vertical-align: middle;
		margin: 0 auto;
		color: red;
		font-size: 20px;
		width: 100%;
		
	}
	a.psyOrderDetailBtn {
	width: 45%;
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
    margin-bottom: 16px;
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
        <p>주문 상세</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>
    <div class="container" align="center">
 		<div class="shDTables" align="left">
 			<div class="shCTitle" align="left">주문 번호</div>
 			<div class="shCDetail" align="left">63249687321</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">날짜</div>
 			<div class="shCDetail" align="left">2017/05/22(my birthday)</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">수령인</div>
 			<div class="shCDetail" align="left">장총명</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">연락처</div>
 			<div class="shCDetail" align="left">01057907883</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">주문 내역</div>
 			<div class="shCDetail" align="left">태권도복<br> 태권도 띠<br> 매트<br></div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">가격</div>
 			<div class="shCDetail" align="left">79,000</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">배송 상태</div>
 			<div class="shCDetail" align="left">i want go home</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">주소</div>
 			<div class="shCDetail" align="left">경기도 성남시 분당구 서현동 불정로 362 607동 701호</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">배송 메세지</div>
 			<div class="shCDetail" align="left">도복좀 깨끗한걸로 가져다 주세요</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">운송장 번호</div>
 			<div class="shCDetail" align="left">123456789</div>
 		</div>
 	<a href="#" class="psyOrderDetailBtn">운송장 번호 수정</a>
 	<a href="#" class="psyOrderDetailBtn">목록</a>
 	</div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>
</html>
