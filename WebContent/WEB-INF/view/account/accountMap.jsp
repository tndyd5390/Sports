<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<link rel="stylesheet" href="/html5/common/css/acaMap.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57ab738bf80955cd4ef2006c6dabe851"></script>
<script type="text/javascript" src="/html5/common/js/acaMap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
var geoUrl = "//api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey=jWhVo4MUvN5PI3FRcP4aBaxWF4IyjFcUnas%2FZLsciiLO72jRn3nJ1x%2FqIRkjH8N89ATrj0pw7g9Rnod97MVsCw%3D%3D&numOfRows=10&pageSize=10&pageNo=1&startPage=1&MobileOS=ETC&MobileApp=AppTest";
	$(function(){
		geoCode_1();
		geoCode_2(2);
		$('#geoCode_1').on('change',function(){
			var code = $(this).val();
			var city = $('#geoCode_1 option:selected').text();
			geoCode_2(code);
			cityDN(city);
		});
		$('#geoCode_2').on('change',function(){
			var state = $('#geoCode_2 option:selected').val();
			stateDN(state);
			panTo($(this).val());
		})
		cityDN("인천");
		stateDN("계양구");
	});
</script>
</head>

<body>
	<section id="wrapper" class="wrapper">
		<header class="header">
			<div class="wrap">
				<div class="left_menu">
					<img src="html5/common/images/btn_gnb.png" alt="메뉴"
						id="c-button--slide-left" class="c-button">
				</div>
				<div class="logo">
					<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>

			<div class="page_title">
				<p>학원 위치 및 밀집도 확인</p>
			</div>
		</header>

		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div align="center">
				<div class="map_select">
					<span>지역</span> 
					<select id="geoCode_1">
					</select> 
					<select id="geoCode_2">
					</select> 
				</div>
				<div class="map_remarks">
					<img src="/html5/common/images/marker/1.png">
					<span>방문</span> <img src="/html5/common/images/marker/2.png">
					<span>미방문</span> <img src="/html5/common/images/marker/3.png">
					<span>거래중</span>
				</div>
				<div id="mapBody">
					<div id="map" style="width:100%; height:350px; margin-top:30px; margin-bottom:30px;"></div>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new daum.maps.LatLng(37.544167, 126.73377),
							level: 3
						};
						var map = new daum.maps.Map(container, options);
						marker();

						function panTo(code) {
							var x = "";
							var y = "";
							if(code == "강화군"){
								x = "37.746602";
								y = "126.487744";
							}else if(code == "계양구"){
								x = "37.537239";
								y = "126.737487";
							}else if(code == "남구"){
								x = "37.463376";
								y = "126.650317";
							}else if(code == "남동구"){
								x = "37.447316";
								y = "126.731870";
							}else if(code == "동구"){
								x = "37.473755";
								y = "126.643123";
							}else if(code == "부평구"){
								x = "37.507090";
								y = "126.721407";
							}else if(code == "서구"){
								x = "37.545487";
								y = "126.67603110000005";
							}else if(code == "연수구"){
								x = "37.507090";
								y = "126.721407";
							}else if(code == "옹진군"){
								x = "37.446633";
								y = "126.636436";
							}else if(code == "중구"){
								x = "37.473503";
								y = "126.621592";
							}	
							
						    var moveLatLon = new daum.maps.LatLng(x, y);
						    
						    map.panTo(moveLatLon);
						    
						}        
					</script> 
				</div>
				<div id="chartBody1" style='background-color : #ffffff;'>
					<div class="chartLabel" id="cityLabel"></div>
					<div id="city" style='max-width:400px;'></div>
					<div id="cityTable" class="table">
						<div class="tableHead" id="cityThead"></div>
						<div class="tableBody" id="cityTbody"></div>
					</div>
					<div class="chartLabel" id="stateLabel"></div>
					<div id="state" style='max-width:400px;'>
					</div>
					<div id="stateTable" class="table">
						<div class="tableHead" id="stateThead"></div>
						<div class="tableBody" id="stateTbody"></div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<%@include file="/html5/include/footer.jsp"%>
</body>

</html>