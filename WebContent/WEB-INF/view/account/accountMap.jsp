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

    .wrap_map {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap_map * {padding: 0;margin: 0;}
    .wrap_map .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap_map .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .ellipssis {width:100%;font-size:11px;}



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
	
	function marker(){
		$.ajax({
			url : 'mapAcaList.do',
			method : 'post',
			success : function(data){
				var pos = new Array();
				var mk = "";
				$.each(data, function(key,value){
					var cont = "";
					cont += "<div class='wrap_map' id='overlay'>";
					cont += 	"<div class='info'>";
					cont += 		"<div class='title'>"+value.aca_name;
					cont += 		"</div>";
					cont += 		"<div class='body'>";
					cont += 			"<div class='img'>";
					cont += 				"<img src='http://cfile181.uf.daum.net/image/250649365602043421936D' width='73' height='70'>";
					cont += 			"</div>";
					cont += 			"<div class='desc'>";
					cont += 				"<div class='ellipssis'>"+value.aca_area2;
					cont += 				"</div>";
					cont += 			"</div>";
					cont += 		"</div>";
					cont += 	"</div>";
					cont += "</div>";
					mk = {content : cont, latlng : new daum.maps.LatLng(value.aca_lat, value.aca_lng)};	
					pos.push(mk);
				});
				for (var i = 0; i < pos.length; i ++) {
					var close = $('#close');
				    var marker = new daum.maps.Marker({
				        map: map, 
				        position: pos[i].latlng // 마커의 위치
				    });
				    // 마커에 표시할 인포윈도우를 생성합니다 
					var overlay = new daum.maps.CustomOverlay({
					    content: pos[i].content,
					    map: map,
					    position: pos[i].latlng,
					});
				    overlay.setMap(null);
				    daum.maps.event.addListener(marker, 'click', addOverlay(map, overlay));
				    
				    
				    
				}
				function addOverlay(map, overlay){
					return function(){
						if(overlay.getMap()){
							overlay.setMap(null);							
						}else{
							overlay.setMap(map);
						}
					}
				}
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
					<div id="map" style="width:100%; height:350px; margin-top:30px; margin-bottom:30px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57ab738bf80955cd4ef2006c6dabe851"></script>
				<script>
						var container = document.getElementById('map');
						var options = {
							center: new daum.maps.LatLng(37.544167, 126.73377),
							level: 3
						};
				
						var map = new daum.maps.Map(container, options);
						
						marker();
					</script> 
					
			</div>
		</div>

	</section>
	<%@include file="/html5/include/footer.jsp"%>
</body>

</html>