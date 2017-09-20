<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
	설계 다시하자 
 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>

<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/common/css/style.css">
<!-- Styles : sanghoon Kim-->
<link rel="stylesheet" href="/html5/common/css/sangDelivery.css">
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

<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script src="/common/js/placeholders.min.js"></script>
<script src="/common/js/placeholders.min.js"></script>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script type="text/javascript">
	function func(){
		window.open("http://nexs.cjgls.com/web/info.jsp?slipno="+$("#cjInfo").val());
	}
</script>
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
    <button onclick="func();">asdfasdfaaa</button>
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