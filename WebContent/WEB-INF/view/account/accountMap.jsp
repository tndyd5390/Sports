<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
 <link rel="stylesheet" href="/html5/common/css/acaMap.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57ab738bf80955cd4ef2006c6dabe851"></script>
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
	
	function doVisit(aNo){
		var visit = 'y';
		$.ajax({
			url : 'updateAcaVisit.do',
			method: 'post',
			data : {'aNo' : aNo , 'visit' : visit},
			success : function(data){
				if(data == 1){
					window.location.reload()
				}else{
					alert("다시 시도해주세요.");
				}
			}
		});
	}
	function doTrade(aNo){
		var visit = 't';
		$.ajax({
			url : 'updateAcaVisit.do',
			method: 'post',
			data : {'aNo' : aNo , 'visit' : visit},
			success :  function(data){
				if(data == 1){
					window.location.reload()
				}else{
					alert("다시 시도해주세요.");
				}
			}
		});
	}
	
	
	function marker(){
		var visit = "/html5/common/images/marker/1.png";
		var novisit = "/html5/common/images/marker/2.png";
		var trading = "/html5/common/images/marker/3.png";
		var imageSize = new daum.maps.Size(44, 49);
		var imageOprion = {offset: new daum.maps.Point(27, 69)};
		$.ajax({
			url : 'mapAcaList.do',
			method : 'post',
			success : function(data){
				var pos = new Array();
				var mk = "";
				var image = "";
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
					cont += 				"<div class='ellipssis'>"+value.aca_area2+" "+value.aca_area3;
					cont += 				"</div>";
					cont +=					"<div> Tel. "+value.tel;
					cont += 				"</div>";
					cont += 				"<div>";
					if(value.aca_visit=="n"){
						image = novisit;
						cont += 					"<input type='button' value='방문' onclick='doVisit("+value.aca_no+")'>";
						cont += 					"<input type='button' value='거래' onclick='doTrade("+value.aca_no+")'>";
					}else if(value.aca_visit=="y"){
						image = visit;
						cont +=						"<input type='button' value='거래' onclick='doTrade("+value.aca_no+")'>";
					}else{
						image = trading						
					}
					cont += 				"</div>";
					cont += 			"</div>";
					cont += 		"</div>";
					cont += 	"</div>";
					cont += "</div>";
					mk = {content : cont, latlng : new daum.maps.LatLng(value.aca_lat, value.aca_lng), markerImage : new daum.maps.MarkerImage(image, imageSize, imageOprion)};	
					pos.push(mk);
				});
				for (var i = 0; i < pos.length; i ++) {
					var close = $('#close');
				    var marker = new daum.maps.Marker({
				        map: map, 
				        position: pos[i].latlng, // 마커의 위치
				        image : pos[i].markerImage
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
					</script> 
				</div>
				<div id="chartBody">
					<div id="goo">
						
					</div>
				</div>
			</div>
		</div>

	</section>
	<%@include file="/html5/include/footer.jsp"%>
</body>

</html>