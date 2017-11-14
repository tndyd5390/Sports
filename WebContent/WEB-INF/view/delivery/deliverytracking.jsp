<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.dto.DeliveryDTO"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>


<%	
	DeliveryDTO d = (DeliveryDTO)request.getAttribute("dDTO");
	List<DeliveryDTO> dList= (List<DeliveryDTO>)request.getAttribute("dList");	

	if(d == null){
		d = new DeliveryDTO();
	}
	
	if(dList == null){
		dList = new ArrayList<DeliveryDTO>();
	}
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
				<div class="shCDetail" align="left"><%=d.getReceiverName()%></div>
			</div>

			<div class="shDTable" align="left">
				<div class="shCTitle" align="left">받는 주소</div>
				<div class="shCDetail" align="left">
					<%
						if (d.getReceiverAddr().equals("")) {
					%>택배사에서 제공하지 않는 정보입니다.<%
						} else {
					%>
					<%=d.getReceiverAddr()%>
					<%
						}
					%>
				</div>
			</div>
			
			<div class="shDTable" align="left">
				<div class="shCTitle" align="left">택배사</div>
				<div class="shCDetail" align="left"><%=d.getCompany()%></div>
			</div>
			
			<div class="shDTable" align="left">
				<div class="shCTitle" align="left">송장 번호</div>
				<div class="shCDetail" align="left"><%=d.getInvoiceNo()%></div>
			</div>

			<div class="shDelivey">
				<p class="shNDelivey"><%=d.getKind()%></p>
					

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
								
								<%for(DeliveryDTO dd : dList){ %>
								<li>
									<ul id="ulTableDetail" style="line-height: 1.2em;">
										<li ><%=dd.getTimeString()%></li>
										<li><%=dd.getWhere()%></li>
										<li><%=dd.getDetailkind()%></li>
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
