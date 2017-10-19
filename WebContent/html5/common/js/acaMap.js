	function geoCode_1(){
		$.ajax({
			url : geoUrl,
			dataType : 'json',
			success : function(data){
				var contents = "";
				var json = data.response.body.items.item;
				$.each(json, function(key, value){
					if(value.code==2){
						contents += "<option value="+value.code+" selected>"
						contents += value.name;
						contents += "</option>"

					}else{
						contents += "<option value="+value.code+">"
						contents += value.name;
						contents += "</option>"
					}
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
					if(value.name=="계양구"){
						contents += "<option selected>"
						contents += value.name;
						contents += "</option>";
					}else{
					contents += "<option>"
					contents += value.name;
					contents += "</option>";
					}
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
					cont += 				"<img src='/html5/common/images/marker/kakao.png' width='73' height='70'>";
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
	
	
	function stateDN(state){
		$('#state').html("<canvas id='statechart'></canvas>");
		var ctx = $('#statechart').get(0).getContext('2d');
		$.ajax({
			url : 'stateDoughnut.do',
			method : 'post',	
			data : {'state' : state},
			success : function(data){
				if(data != null){
				var tbody = "";
				var state = "";
				var arr = new Array();
				var arr1 = new Array();
				var arr2 = new Array();
				var count = 1;
				$.each(data, function(key, value){
					arr.push(value.percent);
					arr1.push(value.count);
					arr2.push(value.aca_event1);
					state = "<span class='accLabel'>"+value.aca_area2+" 종목별 학원 현황</span>";
					tbody += "<div class='tableRow'>";
					tbody += "<div class='sTableCell'>"+count+"</div>";
					tbody += "<div class='sTableCell'>"+value.aca_event1+"</div>";
					tbody += "<div class='sTableCell'>"+value.count+"개</div>";
					tbody += "<div class='sTableCell'>"+value.percent+"%</div>";
					tbody += "</div>";
					count ++;
				})
				stateThead();
				$('#stateTbody').html(tbody);
				$('#stateLabel').html(state);
				var myPieChart = new Chart(ctx,{
				    type: 'doughnut',
				    data: {
			            datasets: [{
			                data: arr,
			                backgroundColor: [
			                	'rgb(54, 162, 235)',
			                	'rgb(75, 192, 192)',
			                	'rgb(255, 99, 132)',
			                	'rgb(255, 205, 86)'
			                ]
			            },
			            {
			                data: arr1,
			                backgroundColor: [
			                	'rgb(70, 150, 210)',
			                	'rgb(90, 180, 185)',
			                	'rgb(255, 120, 115)',
			                	'rgb(255, 230, 80)'
			                ]
			            }
			            ],
			            labels: arr2
			        }
				});

			}
			}
		});
	}
	function cityDN(city){
		$('#city').html("<canvas id='citychart'></canvas>");
		var ctx = $('#citychart').get(0).getContext('2d');
		$.ajax({
			url : 'cityDoughnut.do',
			method : 'post',
			data : {'city' : city},
			success : function(data){
				var tbody = "";
				var city = "";
				var arr = new Array();
				var arr1 = new Array();
				var arr2 = new Array();
				var arr3 = new Array();
				var count = 1;
				$.each(data, function(key,value){
					arr.push(value.count);
					arr1.push(value.percent);
					arr2.push(value.density);
					arr3.push(value.aca_area2);
					city = "<span class='accLabel'>"+value.aca_area1+" 구별 학원 밀집도</span>";
					tbody += "<div class='tableRow'>"
					tbody += "<div class='cTableCell'>"+count+"</div>"
					tbody += "<div class='cTableCell'>"+value.aca_area2+"</div>"
					tbody += "<div class='cTableCell'>"+value.count+"개</div>"
					tbody += "<div class='cTableCell'>"+value.percent+"%</div>"
					tbody += "<div class='cTableCell'>"+value.density+"</div>"
					tbody += "</div>"
					count ++;
				})
				cityThead();
				$('#cityTbody').html(tbody);
				$('#cityLabel').html(city);
				var myPieChart = new Chart(ctx,{
				    type: 'doughnut',
				    data: {
			            datasets: [{
			                data: arr,
			                backgroundColor: [
			                	'rgb(54, 162, 235)',
			                	'rgb(75, 192, 192)',
			                	'rgb(255, 99, 132)',
			                	'rgb(255, 205, 86)'
			                ]
			            },
			            {
			                data: arr1,
			                backgroundColor: [
			                	'rgb(70, 150, 210)',
			                	'rgb(90, 180, 185)',
			                	'rgb(255, 120, 115)',
			                	'rgb(255, 230, 80)'
			                ]
			            }
			            ],
			            labels: arr3
			        }
				});
			}
		});
	}
	
	function cityThead(){
		var contents = "";
			contents += "<div class='cTableCell'>순위</div>";
			contents += "<div class='cTableCell'>지역</div>";
			contents += "<div class='cTableCell'>학원수</div>";
			contents += "<div class='cTableCell'>점유율</div>";
			contents += "<div class='cTableCell'>밀집도</div>";
			$('#cityThead').html(contents);
	}
	function stateThead(){
		var contents = "";
			contents += "<div class='sTableCell'>순위</div>";
			contents += "<div class='sTableCell'>종목</div>";
			contents += "<div class='sTableCell'>학원수</div>";
			contents += "<div class='sTableCell'>점유율</div>";
			$('#stateThead').html(contents);
	}