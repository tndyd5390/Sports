<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/html5/common/css/analysis.css" type="text/css">
<title>유저 장바구니 분석</title>
<%@include file="/html5/include/head.jsp"%>
<script	src="/html5/common/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
$(function() {
		basketQuarter();
		bQD();
		basketYear();
		bYD();
		$('#chy-yearLeft').click(function() {
			$('#chy-years').text(parseInt($('#chy-years').text()) - 1);
			basketYear();
			bYD();
			return false;
		})
		$('#chy-yearRight').click(function() {
			$('#chy-years').text(parseInt($('#chy-years').text()) + 1);
			basketYear();
			bYD();
			return false;
		})
		$('#chy-countLeft').click(function() {
			if ($('#chy-count').text() != "1")
				$('#chy-count').text(parseInt($('#chy-count').text()) - 1);
			basketQuarter();
			bQD();
			return false;
		})
		$('#chy-countRight').click(function() {
			if ($('#chy-count').text() != "4")
				$('#chy-count').text(parseInt($('#chy-count').text()) + 1);
			basketQuarter();
			bQD();
			return false;
		})
		$('#datepicker1').on("change",function(){
			var day = $('#datepicker1').val();
			$('#thead_date').html("qwewqe");
			basketDay();
			bDD();
		})
	});
	function basketDay(){
		$('#dayBody').html("<canvas id='myChart'></canvas>");
		var date = $('#datepicker1').val();
		var ctx = $('#myChart').get(0).getContext('2d');
		$.ajax({
			url : 'basketDay.do',
			method : 'post',
			data : {'date' : date},
			success : function(rs){
				var contents = "";
				var dt = "";
				var d1 = "";
				var arr = new Array();
				var arr1 = new Array();
				$.each(rs, function(key, value){
					dt = value.prod_name;
					dt1 = value.sum;
					arr.push(dt);
					arr1.push(dt1);
				});
				if(rs.length!=0){
					var myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: arr,
					        datasets: [{
					            label: '갯수',
					            data: arr1,
					            backgroundColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
					            borderColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
					            borderWidth : 1
					        }]
					    },
					    options: {
	                        responsive: true,
					    	maintainAspectRatio: false,
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero:true
					                }
					            }]
					        }
					    }
					});
				tbodyDate(arr);
				}else{
					$('#dayBody').html("<canvas id='myChart'></canvas>");
					$('#thead').html("");
					$('#tbody').html("");
				}
			}
		})
	}
	function bDD(){
		$('#bDBody').html("<center><canvas id='dayDoughnut' style='max-width:300px; max-height:295px;'></canvas></center>");
		var date = $('#datepicker1').val();
		var ctx1 = $('#dayDoughnut').get(0).getContext('2d');
		$.ajax({
			url : 'basketDayDoughnut.do',
			method : 'post',
			data : {'date' : date},
			success : function(data){
				var arr1 = new Array();
				var arr2 = new Array();
				var arr3 = new Array();
				$.each(data, function(key,value){
					arr1.push(value.percent);
					arr2.push(value.category_name);
					arr3.push(value.sum);
				});
				
				var myPieChart = new Chart(ctx1,{
				    type: 'doughnut',
				    data: {
			            datasets: [{
			                data: arr1,
			                backgroundColor: [
			                	'rgb(54, 162, 235)',
			                	'rgb(75, 192, 192)',
			                	'rgb(255, 99, 132)',
			                	'rgb(255, 205, 86)'
			                ]
			            },
			            {
			                data: arr3,
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
		})			
	}

	function basketQuarter(){
		$('#qtBody').html("<canvas id='quarterChart'></canvas>");
		var quarter = $('#chy-count').text();
		var ctx = $('#quarterChart').get(0).getContext('2d');
		$.ajax({
			url : 'basketQuarter.do',
			method : 'post',
			data : {'quarter' : quarter},
			success : function(rs){
				var contents = "";
				var dt = "";
				var d1 = "";
				var arr = new Array();
				var arr1 = new Array();
				$.each(rs, function(key, value){
					dt = value.prod_name;
					dt1 = value.sum;
					arr.push(dt);
					arr1.push(dt1);
				});
				if(rs.length!=0){
					var myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: arr,
					        datasets: [{
					            label: '갯수',
					            data: arr1,
					            backgroundColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
					            borderColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
					            borderWidth : 1
					        }]
					    },
					    options: {
	                        responsive: true,
					    	maintainAspectRatio: false,
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero:true 
					                }
					            }]
					        }
					    }
					});
				tbodyQuarter(arr);
				}else{
					$('#qtBody').html("<canvas id='quarterChart'></canvas>");
					$('#thead').html("");
					$('#tbody').html("");
				}
			}
		})
	}
	function bQD(){
		$('#bQDBody').html("<center><canvas id='quarterDoughnut' style='max-width:300px; max-height:295px;'></canvas></center>");
		var quarter = $('#chy-count').text();
		var ctx1 = $('#quarterDoughnut').get(0).getContext('2d');
		$.ajax({
			url : 'basketQuarterDoughnut.do',
			method : 'post',
			data : {'quarter' : quarter},
			success : function(data){
				var arr1 = new Array();
				var arr2 = new Array();
				var arr3 = new Array();
				$.each(data, function(key,value){
					arr1.push(value.percent);
					arr2.push(value.category_name);
					arr3.push(value.sum);
				});
				
				var myPieChart = new Chart(ctx1,{
				    type: 'doughnut',
				    data: {
			            datasets: [{
			                data: arr1,
			                backgroundColor: [
			                	'rgb(54, 162, 235)',
			                	'rgb(75, 192, 192)',
			                	'rgb(255, 99, 132)',
			                	'rgb(255, 205, 86)'
			                ]
			            },
			            {
			                data: arr3,
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
		})			
	}
	function basketYear(){
		$('#yrBody').html("<canvas id='yearChart'></canvas>");
		var year = $('#chy-years').text();
		var ctx = $('#yearChart').get(0).getContext('2d');
		$.ajax({
			url : 'basketYear.do',
			method : 'post',
			data : {'year' : year},
			success : function(rs){
				var contents = "";
				var dt = "";
				var d1 = "";
				var arr = new Array();
				var arr1 = new Array();
				$.each(rs, function(key, value){
					dt = value.prod_name;
					dt1 = value.sum;
					arr.push(dt);
					arr1.push(dt1);
				});
				if(rs.length!=0){
					var myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: arr,
					        datasets: [{
					            label: '갯수',
					            data: arr1,
					            backgroundColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
					            borderColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
					            borderWidth : 1
					        }]
					    },
					    options: {
	                        responsive: true,
					    	maintainAspectRatio: false,
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero:true 
					                }
					            }]
					        }
					    }
					});
				tbodyYear(arr);
				}else{
					$('#yrBody').html("<canvas id='yearChart'></canvas>");
					$('#thead-year').html("");
					$('#tbody-year').html("");
				}
			}
		})
	}
	
	function bYD(){
		$('#yDBody').html("<center><canvas id='yearDoughnut' style='max-width:300px; max-height:295px;'></canvas></center>");
		var year = $('#chy-years').text();
		var ctx1 = $('#yearDoughnut').get(0).getContext('2d');
		$.ajax({
			url : 'basketYearDoughnut.do',
			method : 'post',
			data : {'year' : year},
			success : function(data){
				var arr1 = new Array();
				var arr2 = new Array();
				var arr3 = new Array();
				$.each(data, function(key,value){
					arr1.push(value.percent);
					arr2.push(value.category_name);
					arr3.push(value.sum);
				});
				var myPieChart = new Chart(ctx1,{
				    type: 'doughnut',
				    data: {
			            datasets: [{
			                data: arr1,
			                backgroundColor: [
			                	'rgb(54, 162, 235)',
			                	'rgb(75, 192, 192)',
			                	'rgb(255, 99, 132)',
			                	'rgb(255, 205, 86)'
			                ]
			            },
			            {
			                data: arr3,
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
		})			
	}

	
	function tbodyDate(dt){
		var day = $('#datepicker1').val();
		var contents = "<div class='chy-TableCell'>품목</div>"
		var thead = "<div class='chy-TableCell' id='thead_date'>"+day.substring(5,day.length)+"</div>"
		for(var i =0; i<3;i++){
			if(dt[i]!=null){
				contents += "<div class='chy-TableCell'>";
				contents += dt[i];
				contents += "</div>";
			}else{
				contents += "<div class='chy-TableCell'>";
				contents += "없음";
				contents += "</div>";
			}
			thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"
		}
		$('#thead-date').html(thead);
		$('#tbody-date').html(contents);
	}
	function tbodyQuarter(dt){
		var quarter = $('#chy-count').text();
		var thead = "<div class='chy-TableCell' id='thead_quarter'>"+quarter+"분기</div>"
		var contents = "<div class='chy-TableCell'>품목</div>"
			for(var i =0; i<3;i++){
				if(dt[i]!=null){
					contents += "<div class='chy-TableCell'>";
					contents += dt[i];
					contents += "</div>";
				}else{
					contents += "<div class='chy-TableCell'>";
					contents += "없음";
					contents += "</div>";
				}
				thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"
			}
			$('#thead-quarter').html(thead);
			$('#tbody-quarter').html(contents);

	}
	function tbodyYear(dt){
		var year = $('#chy-years').text();
		var thead = "<div class='chy-TableCell' id='thead_year'>"+year+"</div>"
		var contents = "<div class='chy-TableCell'>품목</div>"
			for(var i =0; i<3;i++){
				if(dt[i]!=null){
					contents += "<div class='chy-TableCell'>";
					contents += dt[i];
					contents += "</div>";
				}else{
					contents += "<div class='chy-TableCell'>";
					contents += "없음";
					contents += "</div>";
				}
				thead += "<div class='chy-TableCell'>"+(i+1)+"위</div>"
			}
			$('#thead-year').html(thead);
			$('#tbody-year').html(contents);
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
					<a href="/main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>
			<div class="page_title">
				<p>장바구니 분석</p>
			</div>
		</header>
	</section>
	<%@include file="/html5/include/navBar.jsp"%>
	<section>
		<div class="container detail chy-bottom">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="true">일별</a></li>
				<li role="presentation" class=""><a href="#profile"
					role="tab" id="profile-tab" data-toggle="tab"
					aria-controls="profile" aria-expanded="false">분기별</a></li>
				<li role="presentation" class=""><a href="#year"
					role="tab" id="year-tab" data-toggle="tab" aria-controls="year"
					aria-expanded="false">연별</a></li>
			</ul>
			<div class="chy-select">
				<select style="width:150px;">
					<option>장바구니 분석</option>
					<option>데이터 분석</option>
				</select>
			</div>
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade active in" id="home"
					aria-labelledby="home-tab">
					<h2 class="chy-chartHeader" style="margin-top:30px; margin-bottom:20px;">
						<input type="date" class="chy-headerWeek" id="datepicker1">				
<!-- 						<span class="chy-headerWeek" id="chy-headerWeek">DATE</span>
						<input type="button" class="btn btn-success chy-btnSuccess" id="datepicker1" value="DATE">
 -->					</h2>
					<div class="chy-chartBody" id="dayBody">
						<!-- 여기에 차트 -->
					</div>
					<div class="chy-chartBody" id='bDBody'><!-- 차트넣으면됨 -->
					
					</div>
					
					<!--  테이블시작 -->
					<div class="chy-Table">
						<!-- 테이블헤드 -->
						<div class="chy-TableHead">
							<!-- tr -->
							<div class="chy-TableRow" id="thead-date">
								<!-- td -->
								<!-- <div class="chy-TableCell" id="thead_date"></div>
								<div class="chy-TableCell">1위</div>
								<div class="chy-TableCell">2위</div>
								<div class="chy-TableCell">3위</div> --> 
							</div>
						</div>	
						<!-- 테이블 바디 -->
						<div class="chy-TableBody">
							<div class="chy-TableRow" id="tbody-date">
							</div>						
						</div>
					</div>				
				
				</div>
				<div role="tabpanel" class="tab-pane fade" id="profile"
					aria-labelledby="profile-tab">
					<h2 class="chy-chartHeader">
						<a href="#" id="chy-countLeft">&#60;</a><span class="chy-year"><span
							id="chy-count">1</span>분기</span><a href="#" id="chy-countRight">&#62;</a>
					</h2>
					<div class="chy-chartBody" id='qtBody'><!-- 차트넣으면됨 -->
				
					</div>
					<div class="chy-chartBody" id='bQDBody'><!-- 차트넣으면됨 -->
					
					</div>
						<!--  테이블 시작 -->
						<div class="chy-Table">
						<div class="chy-TableHead" id="thead-quarter">

						</div>	
						<div class="chy-TableBody" id="tbody-quarter">
							
						</div>
					</div>			
				</div>
				<div role="tabpanel" class="tab-pane fade" id="year"
					aria-labelledby="year-tab">
					<h2 class="chy-chartHeader">
						<a id="chy-yearLeft" href="#">&#60;</a><span class="chy-year"><span
							id="chy-years">2017</span>년</span><a id="chy-yearRight" href="#">&#62;</a>
					</h2>
					<div class="chy-chartBody" id="yrBody">
					
					</div>
					<div class="chy-chartBody" id='yDBody'><!-- 차트넣으면됨 -->

					</div>
					
					<div class="chy-Table">
						<div class="chy-TableHead" id="thead-year">

						</div>	
						<div class="chy-TableBody" id="tbody-year">
							<!-- <div class="chy-TableRow">
								<div class="chy-TableCell">
									1
								</div>
								<div class="chy-TableCell">
									태권도띠(85%)
								</div>
								<div class="chy-TableCell">
									태권도복(78%)
								</div>
								<div class="chy-TableCell">
									격파운송판(33%)
								</div>
							</div>-->	
						</div>
					</div>			
				</div>
			</div>
		</div>
	</section>
	<section>
		<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>
</html>