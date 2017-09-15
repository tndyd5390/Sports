
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
h2.chy-chartHeader {
	text-align: center;
}

span.chy-year {
	font-size: 40px;
	color: #1F4E79;
	margin: 20px 20px 0px;
}

div.chy-chartBody {
	border-top: 2px solid #BFBFBF;
	border-bottom: 2px solid #BFBFBF;
	width: 100%;
	height: 300px;
	margin-bottom: 30px;
	background-color: #ECF0F4;
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 0px;
	margin-bottom: 20px;
}

#ulTable>li:first-child>ul>li {
	background-color: #EEEFEF;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
	margin-bottom: 20px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 9pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
	background-color: white;
}

#ulTable>li>ul>li:first-child {
	width: 7%;
}

#ulTable>li>ul>li:first-child+li {
	width: 31%;
}

#ulTable>li>ul>li:first-child+li+li {
	width: 31%;
}

#ulTable>li>ul>li:first-child+li+li+li {
	width: 31%;
}

div.chy-select {
	height: 35px;
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
}

div.chy-select select {
	float: right;
}

div.chy-bottom {
	padding-bottom: 30px;
}

div.chy-table {
	display: table;
}

div.chy-table-row {
	display: table-row;
}

.chy-td {
	display: table-cell;
}

.chy-th {
	display: table-cell;
	background-color: #EEEFEF;
	font-weight: bold;
	border-bottom: 1px solid;
}

@media screen and (max-width: 320px) {
	#ulTable>li>ul>li {
		font-size: 8px;
	}
}
</style>
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
					<a href="#"><h2 class="title">모두의 스포츠</h2></a>
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
					<div class="chy-chartBody"></div>
					<div id="mainWrapper">
						<ul>
							<li>
								<ul id="ulTable">
									<li>
										<ul>
											<li>일</li>
											<li>태권도복</li>
											<li>태권도화</li>
											<li>운용매트</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>1</li>
											<li>태권도띠(85%)</li>
											<li>태권도복(78%)</li>
											<li>격파운송판(33%)</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>2</li>
											<li>태권도화(74%)</li>
											<li>태권도띠(49%)</li>
											<li>발차기매트(22%)</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>3</li>
											<li>헤드기어(38%)</li>
											<li>격파용송판(38%)</li>
											<li>격투용샌드백(17%)</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="profile"
					aria-labelledby="profile-tab">
					<h2 class="chy-chartHeader">
						<a href="#" id="chy-countLeft">&#60;</a><span class="chy-year"><span
							id="chy-count">1</span>분기</span><a href="#" id="chy-countRight">&#62;</a>
					</h2>
					<div class="chy-chartBody"></div>
					<div id="mainWrapper">
						<ul>
							<li>
								<ul id="ulTable">
									<li>
										<ul>
											<li>월</li>
											<li>태권도복</li>
											<li>태권도화</li>
											<li>운용매트</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>1</li>
											<li>태권도띠(85%)</li>
											<li>태권도복(78%)</li>
											<li>격파운송판(33%)</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>2</li>
											<li>태권도화(74%)</li>
											<li>태권도띠(49%)</li>
											<li>발차기매트(22%)</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>3</li>
											<li>헤드기어(38%)</li>
											<li>격파용송판(38%)</li>
											<li>격투용샌드백(17%)</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="year"
					aria-labelledby="year-tab">
					<h2 class="chy-chartHeader">
						<a id="chy-yearLeft" href="#">&#60;</a><span class="chy-year"><span
							id="chy-years">2017</span>년</span><a id="chy-yearRight" href="#">&#62;</a>
					</h2>
					<div class="chy-chartBody"></div>
					<div id="mainWrapper">
						<ul>
							<li>
								<ul id="ulTable">
									<li>
										<ul>
											<li>월</li>
											<li>태권도복</li>
											<li>태권도화</li>
											<li>운용매트</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>1</li>
											<li>태권도띠(85%)</li>
											<li>태권도복(78%)</li>
											<li>격파운송판(33%)</li>
										</ul>
									</li>

									<li>
										<ul>
											<li>2</li>
											<li>태권도띠(85%)</li>
											<li>태권도복(78%)</li>
											<li>격파운송판(33%)</li>
										</ul>
									</li>
									<li>
										<ul>
											<li>3</li>
											<li>태권도띠(85%)</li>
											<li>태권도복(78%)</li>
											<li>격파운송판(33%)</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="chy-table">
				<div class="chy-table-row">
					<div class="chy-th">
						일
					</div>
					<div class="chy-th">
						태권도복
					</div>
					<div class="chy-th" >
						태권도화
					</div>
					<div class="chy-th">
						운용매트
					</div>
				</div>
				<div class="chy-table-row">
					<div class="chy-td">
					</div>
					<div class="chy-td">
					</div>
					<div class="chy-td">
					</div>
					<div class="chy-td">
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
