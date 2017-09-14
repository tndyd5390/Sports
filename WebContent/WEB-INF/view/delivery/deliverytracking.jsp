<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>

<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/common/css/style.css">
<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script src="/common/js/placeholders.min.js"></script>
<!--[if lte IE 9]>
<script src="/common/js/placeholders.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<style type="text/css">

	.shTitle{
	color: #7F7F7F;
	display: inline-block;
	font-weight: bold;
	margin: 0 0 -10px;
	margin-top: 10px;
	}
	
	.shDetail{
	margin-left: 20px;
	display: inline-block;
	font-weight: bold;
	margin: 0 0 -10px;
	}
	
	.shDetails{
	display: inline-block;
	font-weight: bold;
	margin: 0 0 -10px;
	}
	
	.shTitles{
	color: #7F7F7F;
	display: inline-block;
	font-weight: bold;
	margin: 0 0 -10px;
	}
	
</style>

</head>

<body>
  <section id="wrapper" class="wrapper">
    <header class="header">
		<div class="wrap">
			<div class="left_menu">
				<img src="html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
			</div>
			<div class="logo">
				<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
			</div>
		</div>
	</header>

<%@include file="/html5/include/navBar.jsp" %>

    <div class="container">
 
 		<div style="display: table; width: 100%; margin-top: 10px; margin-bottom: 10px;">
 		<div style="display: inline-block; width: 21%; color: #7F7F7F; font-weight: bold; display: table-cell; vertical-align: middle; text-align: center;">받는 사람</div>
 		<div style="display: inline-block; width: 75%; color: #000000; font-weight: bold; margin-left: 5%">김상훈</div>
 		</div>
 		
 		<div style="display: table; width: 100%; margin-top: 10px; margin-bottom: 10px;">
 		<div style="display: inline-block; width: 21%; color: #7F7F7F; font-weight: bold; display: table-cell; vertical-align: middle; text-align: center;">받는 주소</div>
 		<div style="display: inline-block; width: 75%; color: #000000; font-weight: bold; margin-left: 5%">경기도 의정부시 송현로87 송산주공 5단지</div>
 		</div>
 		
 		<div style="display: table; width: 100%; margin-top: 10px; margin-bottom: 10px;">
 		<div style="display: inline-block; width: 21%; color: #7F7F7F; font-weight: bold; display: table-cell; vertical-align: middle; text-align: center;">송장 번호</div>
 		<div style="display: inline-block; width: 75%; color: #000000; font-weight: bold; margin-left: 5%">13201002891320100289</div>
 		</div>
 		     
    </div>
    
    
    </section>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>