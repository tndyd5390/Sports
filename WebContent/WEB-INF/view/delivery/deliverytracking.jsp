<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
	String result = CmmUtil.nvl((String) request.getAttribute("result"));//컨트롤러에서 받은 json데이터의 String형태
	String code = CmmUtil.nvl((String) request.getAttribute("code"));//컨트롤러에서 받은 택배사 코드
	String company = "";//택배사 이름 초기화

	if (code.equals("01")) {
		company = "우체국택배";
	} else if (code.equals("02")) {
		company = "이노지스";
	} else if (code.equals("04")) {
		company = "CJ대한통운";
	} else if (code.equals("05")) {
		company = "한진택배";
	} else if (code.equals("08")) {
		company = "현대택배";
	} else if (code.equals("37")) {
		company = "범한판토스";
	} else if (code.equals("31")) {
		company = "스카이로지스";
	} else if (code.equals("06")) {
		company = "로젠택배";
	}
%>


<%
	JSONParser parser = new JSONParser();//Json파서 생성
	Object obj = parser.parse(result);//String 데이터를 Object로 파서

	System.out.println("obj : " + obj);

	JSONObject jsonObj = (JSONObject) obj; // Object데이터를 Json 데이터로 파서

	System.out.println("jsonObj : " + jsonObj);

	String invoiceNo = CmmUtil.nvl((String) jsonObj.get("invoiceNo"));//송장번호
	String itemName = CmmUtil.nvl((String) jsonObj.get("itemName"));//상품명
	String completeYN = CmmUtil.nvl((String) jsonObj.get("completeYN"));//배송완료여부
	String receiverName = CmmUtil.nvl((String) jsonObj.get("receiverName"));//받는 사람
	String receiverAddr = CmmUtil.nvl((String) jsonObj.get("receiverAddr"));//주소

	JSONArray trackingDetails = (JSONArray) jsonObj.get("trackingDetails");//배열 형태의 json데이터를 JsonArray 로 생성
	
	JSONObject lastDeatail = (JSONObject)jsonObj.get("lastDetail");//Object 형태의 
	
	String kind = CmmUtil.nvl((String)lastDeatail.get("kind"));
	
	System.out.println("kind : "+kind);
	System.out.println("trackingDetails : " + trackingDetails);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>

<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/html5/common/css/style.css">
<!-- Styles : sanghoon Kim-->
<link rel="stylesheet" href="/html5/common/css/sangDelivery.css?ver2">
<!-- JavaScirpt Sorcemap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/html5/common/js/jquery-ui.js"></script>
<!--[if lte IE 9]>
<script src="/common/js/bootstrap-theme.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- JavaScirpt Sorcemap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/html5/common/js/jquery-ui.js"></script>
<!-- <script src="/html5/common/js/bootstrap-theme.min.js"></script>
<script src="/html5/common/js/bootstrap-theme.min.js"></script> -->
<script src="/html5/common/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	   var max_h=0;
	   $("#ulTableDetail li").each(function(){
	 var h = parseInt($(this).css("height"));
	    if(max_h<h){ max_h = h; }
	   });
	   $("#ulTableDetail li").each(function(){
	 $(this).css({height:max_h});
	   });
	  });


</script>

<style>

a.psyOrderDetailBtn {
	width: 100%;
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
					<img src="/html5/common/images/btn_gnb.png" alt="메뉴"
						id="c-button--slide-left" class="c-button">
				</div>
				<div class="logo">
					<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>

			<div class="page_title">
				<p>배송 조회</p>
			</div>
		</header>

		<%@include file="/html5/include/navBar.jsp"%>

		<div class="container" align="center">

			<div class="shDTables" align="left">
				<div class="shCTitle" align="left">받는 사람</div>
				<div class="shCDetail" align="left"><%=receiverName%></div>
			</div>

			<div class="shDTable" align="left">
				<div class="shCTitle" align="left">받는 주소</div>
				<div class="shCDetail" align="left">
					<%
						if (receiverAddr.equals("")) {
					%>택배사에서 제공하지 않는 정보입니다.<%
						} else {
					%>
					<%=receiverAddr%>
					<%
						}
					%>
				</div>
			</div>
			
			<div class="shDTable" align="left">
				<div class="shCTitle" align="left">택배사</div>
				<div class="shCDetail" align="left"><%=company%></div>
			</div>
			
			<div class="shDTable" align="left">
				<div class="shCTitle" align="left">송장 번호</div>
				<div class="shCDetail" align="left"><%=invoiceNo%></div>
			</div>

			<div class="shDelivey">
				<p class="shNDelivey"><%=kind %></p>
					

			</div>
			<button onclick="func();"></button>
			<div class="wrap search-wrap btn-wrap" style="margin-bottom: 50px;">
				<div id="mainWrapper">
	
					
				 <ul>
						<li>
							<ul id="ulTable">

								<li>
									<ul>
										<li>처리 일시</li>
										<li>현재 위치</li>
										<li>배송 상태</li>
									</ul>
								</li>
								<%
									for (int i = 0; i < trackingDetails.size(); i++) {
										JSONObject order = (JSONObject) trackingDetails.get(i);
								%>

								<li>
									<ul id="ulTableDetail" style="line-height: 1.2em;">
										<li ><%=order.get("timeString").toString().substring(0, 10)%></li>
										<li><%=order.get("where")%></li>
										<li><%=order.get("kind")%></li>
									</ul>
								</li>
								<%
									}
								%>
							</ul>
						</li>
					</ul> 
				</div>
			</div>
				<a class="psyOrderDetailBtn" href="/orderDetail.do?tranNo=<%=(String)request.getAttribute("tran_no")%>">돌아가기</a>		
		</div>
	</section>
	<%@include file="/html5/include/footer.jsp"%>
</body>

</html>

<!-- asd -->