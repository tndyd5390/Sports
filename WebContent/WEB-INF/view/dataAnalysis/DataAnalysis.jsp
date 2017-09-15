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
</style>
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
		<p>연관성 분석</p>
	</div>
</header>
   
<%@include file="/html5/include/navBar.jsp" %>

 
<%@include file="/html5/include/footer.jsp" %>
</body>
</html>
