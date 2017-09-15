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
		width: 21%;
		color: #7F7F7F;
		font-weight: bold;
		display: table-cell;
		vertical-align: middle;
		text-align: center;
	}
	.shCDetail{
		display: inline-block;
		width: 75%;
		color: #000000;
		font-weight: bold;
		margin-left: 5%;
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
        margin-top: 0px;
        padding-bottom: 20px;
        
    }
    #mainWrapper > ul > li:first-child {
        text-align: center;
        font-size:14pt;
        height:40px;
        vertical-align:middle;
        line-height:30px;
	}
    #ulTable {margin-top:0px;}
    
    #ulTable > li:first-child > ul > li {
        background-color:#c9c9c9;
        font-weight:bold;
        text-align:center;
	}
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
    #ulTable > li > ul > li:first-child               {width:44%;}
    #ulTable > li > ul > li:first-child +li           {width:28%;}
    #ulTable > li > ul > li:first-child +li+li        {width:28%;}

	#ulTable > li:nth-child(odd) {
	background-color: #E1E1E1;
	}
</style>

</head>

<body >
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
		
		<div class="page_title">
        	<p>배송 조회</p>
      	</div>
	</header>

<%@include file="/html5/include/navBar.jsp" %>

    <div class="container" align="center">

 
 		<div class="shDTables" align="left">
 			<div class="shCTitle" align="left">받는 사람</div>
 			<div class="shCDetail" align="left">김상훈</div>
 		</div>
 		
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">받는 주소</div>
 			<div class="shCDetail" align="left">경기도 의정부시 송현로87 송산주공 5단지</div>
 		</div>
 		
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">송장 번호</div>
 			<div class="shCDetail" align="left">13201002891320100289</div>
 		</div>
 		     
    <div class="shDelivey">
    	<p class="shNDelivey">배달출발 </p>
    </div>
    
    <div class="wrap search-wrap btn-wrap">
      <div id="mainWrapper">
        <ul>
            <li>
                <ul id ="ulTable">
                   
                    <li>
                        <ul>
                            <li>처리 일시</li>
                            <li>현재 위치</li>
                            <li>배송 상태</li>
                        </ul>
                    </li>
                    
<!-- ---------------------------------------------------------리스트 반복 시작-------------------------------------------------------- -->
                    
                    <li>
                        <ul>
                            <li>2016.09.28 08:37:11</li>
                            <li>읍내HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 07:25:10</li>
                            <li>옥천HUB</li>
                            <li>간선상차</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>형낭포장</li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>2016.09.28 06:21:41</li>
                            <li>옥천HUB</li>
                            <li>간선하차</li>
                        </ul>
                    </li>
<!-- ---------------------------------------------------------리스트 반복 끝-------------------------------------------------------- -->
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