 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
ul.list-groub li .checkbox {
    width:20px;
    height:20px;
    top:7px;
}

.list_wrap .list-groub p.chy-title{
	margin:0 0 0px;
	padding-bottom:0px;
}

div.chy-margin{
	margin-left:7px;
}

p.chy-text{
	margin:0 0 0px;
}

span.chy-price{
	float: right;
	font-size: 20px;
	font-weight: bold;
	color: black;
}

a.chy-btn{
	height :25px;
	width: 70px;
	font-size: 11px;
	border-radius: 0px;
}

p.chy-count{
	float:right;
	display:inline;
	clear:right;
}

span.chy-plus {
    font-size: 17px;
    font-weight: bold;
    color: #1777CB;
}

li.chy-head{
	background-color: white;
}

div.chy-result{
	width: 100%;
	height:50px;
	border:1px solid #9E9E9E;
	border-radius: 10px;
}

p.chy-totalPrice{
	font-weight: bold;
	color: #9E9E9E;
}

span.chy-totalPrice2{
	float: right;
}

p.chy-payPrice{
	font-size: 17px;
	font-weight: bold;
	color:black;
}

span.chy-payPrice2{
	float:right;
	color:#1777CB;
}
div.chy-wrap{
	margin-bottom:0px;
}

.container div.chy-wrap2 {
    padding: 0px; 
    padding-bottom:80px;
}

span.chy-plus2{
	padding-right: 10px;
}

.list_wrap .notice,.psyNotice{
	height: 135px;
}
</style>
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

	<div class="page_title">
		<p>장바구니</p>
	</div>
</header>
   
<%@include file="/html5/include/navBar.jsp" %>

    <div class="container detail">
      <div class="wrap chy-wrap2 search-wrap btn-wrap">
        <div class="list_wrap chy-wrap">
          <ul class="list-groub">
          	<li class="chy-head">
          		<input type="checkbox" class="checkbox">
          		<div class="chy-margin">
          		<a class="btn btn-primary chy-btn" style="display:inline;">선택 삭제</a>
          		</div>
          	</li>
            <li class="notice psyNotice">
              	<input type="checkbox" class="checkbox">
              	<div class="chy-margin">
                	<p class="title chy-title">태권도띠 도복띠/합기도띠/무술띠</p>
                	<p class="sub_text">옵션 : 색상 빨강 / 사이즈 M<span class="chy-price">3,500원</span></p>
            		<a class="btn btn-default chy-btn" style="display: inline;">삭제</a>
            		<p class="chy-count">수량 : 3 <a class="btn btn-default" style="display: inline;"><span class="glyphicon-plus chy-plus"></span></a><a class="btn btn-default" style="display: inline;"><span class="glyphicon-minus chy-plus"></span></a></p>
            	</div>	
            </li>
            <li class="notice psyNotice">
              	<input type="checkbox" class="checkbox">
              	<div class="chy-margin">
                	<p class="title chy-title">태권도띠 도복띠/합기도띠/무술띠</p>
                	<p class="sub_text">옵션 : 색상 빨강 / 사이즈 M<span class="chy-price">3,500원</span></p>
            		<a class="btn btn-default chy-btn" style="display: inline;">삭제</a>
            		<p class="chy-count">수량 : 3 <a class="btn btn-default" style="display: inline;"><span class="glyphicon-plus chy-plus"></span></a><a class="btn btn-default" style="display: inline;"><span class="glyphicon-minus chy-plus"></span></a></p>
            	</div>	
            </li>
            <li class="notice psyNotice">
              	<input type="checkbox" class="checkbox">
              	<div class="chy-margin">
                	<p class="title chy-title">태권도띠 도복띠/합기도띠/무술띠</p>
                	<p class="sub_text">옵션 : 색상 빨강 / 사이즈 M<span class="chy-price">3,500원</span></p>
            		<a class="btn btn-default chy-btn" style="display: inline;">삭제</a>
            		<p class="chy-count">수량 : 3 <a class="btn btn-default" style="display: inline;"><span class="glyphicon-plus chy-plus"></span></a><a class="btn btn-default" style="display: inline;"><span class="glyphicon-minus chy-plus"></span></a></p>
            	</div>	
            </li>
            <li class="notice psyNotice">
              	<input type="checkbox" class="checkbox">
              	<div class="chy-margin">
                	<p class="title chy-title">태권도띠 도복띠/합기도띠/무술띠</p>
                	<p class="sub_text">옵션 : 색상 빨강 / 사이즈 M<span class="chy-price">3,500원</span></p>
            		<a class="btn btn-default chy-btn" style="display: inline;">삭제</a>
            		<p class="chy-count">수량 : 3 <a class="btn btn-default" style="display: inline;"><span class="glyphicon-plus chy-plus"></span></a><a class="btn btn-default" style="display: inline;"><span class="glyphicon-minus chy-plus"></span></a></p>
            	</div>	
            </li>
            <li class="chy-bottom">
            	<p class="chy-totalPrice">총 상품가격<span class="chy-totalPrice2">12,000원</span></p>
            	<p class="chy-totalPrice">총 배송비<span class="chy-totalPrice2"><span class="glyphicon-plus chy-plus2"></span>3,000원</span></p>
            	<p class="chy-payPrice">총 결제 예상금액 <span class="chy-payPrice2">15,000원</span></p>
            </li>
          </ul>
        </div>
        <div class="btn-groub">
          <button class="blue-btn button" style="width:100%">구매하기</button>
        </div>
      </div>
    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>
</html>
