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
		margin-top: 30px;
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
        width: 98%;
        margin: 0 auto;
        text-align: center;
        margin-top: 0px;
        padding-bottom: 20px;
        padding-top: 10px;
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
        font-size:7pt;
        border-bottom:1px solid silver;
        vertical-align:baseline;
	}    
    #ulTable > li > ul > li:first-child               {width:25%;}
    #ulTable > li > ul > li:first-child +li           {width:20%;}
    #ulTable > li > ul > li:first-child +li+li        {width:25%;}
    #ulTable > li > ul > li:first-child +li+li+li     {width:30%;}

	#ulTable > li:nth-child(odd) {
	background-color: #E1E1E1;
	}
	
.shSelect{
    width: 49%;
    height: 30px;
    padding-left: 10px;
    font-size: 9px;
    color: #006fff;
    border: 1px solid #006fff;
    border-radius: 3px;
    display: inline-block;
    margin-top: 10px;
}

.shInputText {
    border: 1px solid #006fff;
    border-radius: 4px;
    margin-top: 10px;
    font-size: 9px;
    height: 30px;
    width: 70%;
    display: inline-block;
}

.shBtn {
  border-radius: 4px;
  color: #ffffff;
  font-size: 9px;
  background: #3498db;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  height: 30px;
  width: 28%;
  margin-top: 10px;
}

.shBtn:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
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
        	<p>거래처관리</p>
      	</div>
	</header>

<%@include file="/html5/include/navBar.jsp" %>
	<div class="container detail">
    <div align="center">
		<select class="shSelect">
        	<option value=""> 서울 </option>
        	<option value=""> 경기도 </option>
        	<option value=""> 강원도 </option>
        	<option value=""> 충청북도 </option>
        	<option value=""> 충청남도 </option>
        	<option value=""> 경상북도 </option>
        	<option value=""> 전라북도 </option>
        	<option value=""> 전라남도 </option>
        	<option value=""> 경상남도 </option>
        	
    	</select>
    	
    	<select class="shSelect">
        	<option value=""> hi </option>
        	<option value="">  </option>
        	<option value=""> 돌려요 </option>
        	<option value=""> .....ㅎ </option>
    	</select>
    
    <input type="text" class="shInputText">
    <button class="shBtn">검색</button>
    
    


      <div id="mainWrapper">
        <ul>
            <li>
                <ul id ="ulTable">
                   
                    <li>
                        <ul>
                            <li>거래처명</li>
                            <li>대표자명</li>
                            <li>전화번호</li>
                            <li>위치</li>
                        </ul>
                    </li>
<!-- ------------------------------------------------------------------------------------리스트 반복 시작----------------------------------------------------------------------  -->
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
                    
                    <li>
                        <ul>
                            <li>비룡태권도</li>
                            <li>김상훈</li>
                            <li>010-9598-9408</li>
                            <li>서울시 강서구</li>
                        </ul>
                    </li>
<!-- ------------------------------------------------------------------------------------리스트 반복 끝----------------------------------------------------------------------  -->
                </ul>
            </li>
        </ul>

    
    
    
    
    
    
        </div>
    <button class="add_btn" id="addview">더보기</button>
    </div>
    </div>
    
    
    
    
    </section>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>