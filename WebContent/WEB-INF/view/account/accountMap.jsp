<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<style>
.map_select {
	margin-top: 30px;
	font-size: 15px;
	font-style: bold;
}

.map_select span {
	margin-left: 50px;
	margin-right: 20px;
}

.map_select select {
	width: 80px;
}

.map_remarks {
	margin-top: 30px;
	background-color: #ffffff;
}

.map_remarks img {
	width: 40px;
}
.mainWrapper{
	margin-top : 30px;
}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=OtsTFLJcXGVYGVcEbrwy"></script>
<script>
var geoUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey=jWhVo4MUvN5PI3FRcP4aBaxWF4IyjFcUnas%2FZLsciiLO72jRn3nJ1x%2FqIRkjH8N89ATrj0pw7g9Rnod97MVsCw%3D%3D&numOfRows=10&pageSize=10&pageNo=1&startPage=1&MobileOS=ETC&MobileApp=AppTest";
	$(function(){
		geoCode_1();
		geoCode_2(1);
		$('#geoCode_1').on('change',function(){
			var code = $(this).val();
			geoCode_2(code);
		});
		
	});
	function geoCode_1(){
		$.ajax({
			url : geoUrl,
			dataType : 'json',
			success : function(data){
				var contents = "";
				var json = data.response.body.items.item;
				$.each(json, function(key, value){
					contents += "<option value="+value.code+">"
					contents += value.name;
					contents += "</option>"
				});
				$('#geoCode_1').html(contents);
			}
		});
	}
	function geoCode_2(code){
		$.ajax({
			url : geoUrl+"&areaCode="+code,
			dataType : 'json',
			success : function(data){
				var contents = "";
				var json = data.response.body.items.item;
				if(json.code == 1){
					contents += "<option>";
					contents += "없음";
					contents += "</option>";
				}else{
				$.each(json, function(key, value){
					contents += "<option value="+value.code+">"
					contents += value.name;
					contents += "</option>";
				});
				}
				$('#geoCode_2').html(contents);
			}
		});
	}
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
					<span>지역별</span> 
					<select id="geoCode_1">
					</select> 
					<select id="geoCode_2">
					</select> 
					<span>종목별</span> 
					<select>
						<option>서울</option>
						<option>경기</option>
					</select> 
					<select>
						<option>강남구</option>
						<option>강북구</option>
					</select>
				</div>
				<div class="map_remarks">
					<img
						src="https://lh3.googleusercontent.com/UMB2HRRRAAzXAEaCM9Gg-baCaDx_1RTXHscW5k2Ge3P4KP4mwTt2m6oyEHBWex3c4SxU=w300">
					<span>방문</span> <img
						src="https://lh3.googleusercontent.com/UMB2HRRRAAzXAEaCM9Gg-baCaDx_1RTXHscW5k2Ge3P4KP4mwTt2m6oyEHBWex3c4SxU=w300">
					<span>미방문</span> <img
						src="https://lh3.googleusercontent.com/UMB2HRRRAAzXAEaCM9Gg-baCaDx_1RTXHscW5k2Ge3P4KP4mwTt2m6oyEHBWex3c4SxU=w300">
					<span>거래중</span>
				</div>
				<div id="mainWrapper" style="width:100%; height:300px; margin-top:30px; margin-bottom:30px;"></div>
				<script>
					var mapOptions = {
						center : new naver.maps.LatLng(37.3595704, 127.105399),
						zoom : 10
					};
					var map = new naver.maps.Map('mainWrapper', mapOptions);
				</script>
			</div>
		</div>

	</section>
	<%@include file="/html5/include/footer.jsp"%>
</body>

</html>