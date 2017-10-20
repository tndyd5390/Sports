<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/html5/common/css/analysis.css" type="text/css">
<%@include file="/html5/include/head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#chy-monthsLeft').click(function() {
			if ($('#chy-month').text() != "1")
				$('#chy-month').text(parseInt($('#chy-month').text()) - 1);
		})
		$('#chy-monthsRight').click(function() {
			if ($('#chy-month').text() != "12")
				$('#chy-month').text(parseInt($('#chy-month').text()) + 1);
		})
		$('#chy-yearLeft').click(function() {
			$('#chy-years').text(parseInt($('#chy-years').text()) - 1);
		})
		$('#chy-yearRight').click(function() {
			$('#chy-years').text(parseInt($('#chy-years').text()) + 1);
		})
		$('#chy-countLeft').click(function() {
			if ($('#chy-count').text() != "1")
				$('#chy-count').text(parseInt($('#chy-count').text()) - 1);
		})
		$('#chy-countRight').click(function() {
			if ($('#chy-count').text() != "4")
				$('#chy-count').text(parseInt($('#chy-count').text()) + 1);
		})
	})
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
				<p>연관성 분석</p>
			</div>
		</header>
	</section>
	<%@include file="/html5/include/navBar.jsp"%>
	<section>
		<div class="container detail chy-bottom">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a data-target="#home"
					id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="true">월별</a></li>
				<li role="presentation" class=""><a data-target="#profile"
					role="tab" id="profile-tab" data-toggle="tab"
					aria-controls="profile" aria-expanded="false">분기별</a></li>
				<li role="presentation" class=""><a data-target="#year"
					role="tab" id="year-tab" data-toggle="tab" aria-controls="year"
					aria-expanded="false">연도별</a></li>
			</ul>
			<div class="chy-select">
				<select>
					<option>연관성 분석</option>
					<option>군집 분석</option>
					<option>K-means 분석</option>
					<option>데이터 분석</option>
				</select>
			</div>
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade active in" id="home"
					aria-labelledby="home-tab">
					<h2 class="chy-chartHeader">
						<a id="chy-monthsLeft" href="#">&#60;</a><span class="chy-year"><span
							id="chy-month">6</span>월</span><a id="chy-monthsRight" href="#">&#62;</a>
					</h2>
					<div class="chy-chartBody">
						<!-- 여기에 차트 -->
					</div>
					<!--  테이블시작 -->
					<div class="chy-Table">
						<!-- 테이블헤드 -->
						<div class="chy-TableHead">
							<!-- tr -->
							<div class="chy-TableRow">
								<!-- td -->
								<div class="chy-TableCell">
									6월
								</div>
								<div class="chy-TableCell">
									태권도복
								</div>
								<div class="chy-TableCell">
									태권도화
								</div>
								<div class="chy-TableCell">
									운동매트
								</div>
							</div>	
						</div>	
						<!-- 테이블 바디 -->
						<div class="chy-TableBody">
							<div class="chy-TableRow">
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
							</div>						
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									2
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
							</div>						
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									3
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
					<div class="chy-chartBody"><!-- 차트넣으면됨 --></div>
						<!--  테이블 시작 -->
						<div class="chy-Table">
						<div class="chy-TableHead">
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									1분기
								</div>
								<div class="chy-TableCell">
									태권도복
								</div>
								<div class="chy-TableCell">
									태권도화
								</div>
								<div class="chy-TableCell">
									운동매트
								</div>
							</div>	
						</div>	
						<div class="chy-TableBody">
							<div class="chy-TableRow">
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
							</div>						
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									2
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
							</div>						
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									3
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
							</div>						
						</div>
					</div>			
				</div>
				<div role="tabpanel" class="tab-pane fade" id="year"
					aria-labelledby="year-tab">
					<h2 class="chy-chartHeader">
						<a id="chy-yearLeft" href="#">&#60;</a><span class="chy-year"><span
							id="chy-years">2017</span>년</span><a id="chy-yearRight" href="#">&#62;</a>
					</h2>
					<div class="chy-chartBody"></div>
						<div class="chy-Table">
						<div class="chy-TableHead">
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									2017년
								</div>
								<div class="chy-TableCell">
									태권도복
								</div>
								<div class="chy-TableCell">
									태권도화
								</div>
								<div class="chy-TableCell">
									운동매트
								</div>
							</div>	
						</div>	
						<div class="chy-TableBody">
							<div class="chy-TableRow">
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
							</div>						
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									2
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
							</div>						
							<div class="chy-TableRow">
								<div class="chy-TableCell">
									3
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
							</div>						
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
