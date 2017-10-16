<!-- for Administrator -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"
	import="com.sports.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>

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
					<a href="#"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>

			<div class="page_title">
				<p>운송장번호 등록</p>
			</div>
		</header>

		<%@include file="/html5/include/navBar.jsp"%>


		<div class="container detail">
			<div class="wrap btn-wrap">

				<div class="list_wrap qna_detail"
					style="height: 100%;min-height: 350px;padding-right: 11px;padding-left: 8px;">
					<div style="width: 200px; height: 100%; margin: auto;">
						<img src="/html5/common/images/ic_delivery.png"
							style="width: 100%; margin-top: 20px">
					</div>
					<form>
					<div>	
						<center>	
						<div style="width:90%">
							<select style="margin-top: 20px;width: 100%;">
							<option selected>택배사를 선택해주세요</option>
							<option value="01">우체국 택배</option>
							<option value="02">이노지스</option>
							<option value="03">CJ대한통운</option>
							<option value="05">한진택배</option>
							<option value="08">현대택배</option>
							<option value="37">범한판토스</option>
							<option value="31">스카이로지스</option>
							<option value="06">로젠택배</option>
							</select>
						
							
							<input class="search type pw-search" type="text"
							placeholder="운송장 번호를 입력해 주세요" id="postnum"
							style="margin-top: 10px; margin-bottom: 10px;width: 100%;">
							<button class="btn btn-primary width100"
								style="margin-left: 3px; margin-right: 3px;margin-top:15px">등록</button>
							<button class="btn gray-primary width100"
								style="margin-left: 3px; margin-right: 3px;margin-top:15px;margin-bottom:30px;">뒤로</button>	
						</div>
						</center>
					</div>
					</form>		
				</div>

			</div>
		</div>


	</section>

	<%@include file="/html5/include/footer.jsp"%>

</body>

</html>