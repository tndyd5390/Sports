<!-- for Customer -->
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.AES256Util"%>
<%@ page import="com.sports.util.CmmUtil"
	import="com.sports.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>
<%
List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");
		
if (nList == null) {
	nList = new ArrayList<NoticeDTO>();
}

String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));
%>
<!-- 테스트 -->
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>모두의 스포츠</title>
<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/common/css/style.css">
<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script src="/common/js/placeholders.min.js"></script>
<!--[if lte IE 9]>
<script src="/common/js/placeholders.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
	
<script type="text/javascript">

		$(function() {
			var cnt = 6;
			var search ="";
	/*검색 기능*/
	// 검색어 아작스 시작
	$('#searchbox').keyup(function(){
		
		cnt = 6;
		search = $('#searchbox').val();
		
		
		$.ajax({
			url : "/customer/notice/search.do",
			data : {'search' : search },
			method : "post",
			datatype :	"json",
			success : function(data){
				var contents ="";
				$.each(data,function (key,value) { 
					var yn = value.notice_yn;
					var nw = value.new_yn;
					contents += "<li>";
		            contents += "<div style='float:left' ><input type='checkbox' name='checkbox' class='checkbox' value='"+value.notice_no+"'/></div>";
		            contents += "<a href='/customer/notice/NoticeInfo.do?notice_no="+value.notice_no+"'>";
		            contents += "<p class='title'>";
		      
		    	if (yn == '1') {
		            contents += "<span class='blue_text'>"+value.title+"</span>";
		        }else{
		        	contents += value.title;
		        }
		        
		        if (nw == 'Y'){ 
		            contents += "<img src='/common/images/ic_new.png' alt='new' class='ic_new'>";
		         } 
		            
		        	contents += "</p>";
		            contents += "<p class='sub_text'>"+value.user_name;
		            contents += "<span>"+value.reg_dt.substring(0, 10)+"</span></p>";
		            contents += "</a>";
		            contents += "</li>";
			});// 아작스 포이치 닫음
				
				$('#list_more').html(null);
				$('#list_more').append(contents);
				var dS = document.getElementsByClassName("checkbox");
				
				for (var i =0; i<dS.length; i++) {
					dS[i].style.display = "none";
				}
					
				document.getElementById("delete").style.display = "none";
				document.getElementById("all").style.display = "none";
				document.getElementById("alltext").style.display = "none";
				
				if ((data).length < 6) {//더보기 버튼 없애기
					$("#addview").hide();
				}
				if(data.length >= 6){
					$("#searchadd").html("<center> <div id='searchadd'><button class='add_btn' id='addview'>더보기</button></div></center>");
				}
			} //아작스 success 닫음
			
		});	//아작스 닫음
		
			
		
	}); 	//검색 이벤트 닫음
	
	/* 더보기 시작 */
	<%if (nList.size() < 6) {%>
	$("#addview").hide();
<%}%>
	$("#addview").add("#searchadd").click(function() {
									
									
									$.ajax({
										url : "/customer/notice/readMore.do",
										method : "post",
										data : {'cnt' : cnt , "search" : search},
										dataType : "json",
										success : function(data) {
											var contents = "";
											console.log(data)
											$.each(data,function(key, value) {
																var yn = value.notice_yn;
																var nw = value.new_yn;
																contents += "<li>";
													            contents += "<div style='float:left' ><input type='checkbox' name='checkbox' class='checkbox' value='"+value.notice_no+"'/></div>";
													            contents += "<a href='/customer/notice/NoticeInfo.do?notice_no="+value.notice_no+"'>";
													            contents += "<p class='title'>";
													      
													    	if (yn  == '1') {
													            contents += "<span class='blue_text'>"+value.title+"</span>";
													        }else{
													        	contents += value.title;
													        }
													        
													        if (nw == 'Y'){ 
													            contents += "<img src='/common/images/ic_new.png' alt='new' class='ic_new'>";
													         } 
													            
													        	contents += "</p>";
													            contents += "<p class='sub_text'>"+value.user_name;
													            contents += "<span>"+value.reg_dt.substring(0, 10)+"</span></p>";
													            contents += "</a>";
													            contents += "</li>";
											});

											$('#list_more').append(contents);
											if ((data).length < 6) {
												$('#addview').remove();
											}

											var dS = document
													.getElementsByClassName("checkbox");

											for (var i = 0; i < dS.length; i++) {
												dS[i].style.display = "none";
											}

											document.getElementById("delete").style.display = "none";
											document.getElementById("all").style.display = "none";
											document.getElementById("alltext").style.display = "none";
										} //성공 닫음
										}); //아작스 닫음
							cnt += 6;
							
							if (search == ""){//두번 실행 방지
								return false;
							}
						}); //더보기 클릭 이벤트 닫음
		})   //펑션 닫음

</script>
	
</head>

<body>

	<section id="wrapper" class="wrapper">
  
		<header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title"><p>공지사항</p></div>
		</header>

		<nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">
			<div class="profile">
				<p><img src="/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
				<button class="c-menu__close"><img src="/common/images/menu/cancel.png" alt="닫기"></button>
				<div class="login_wrap"><a href="#">로그인</a><a href="#">회원가입</a></div>
			</div>
			<ul class="menu_list">
				<li><a href="#">주문관리</a></li>
				<li>
					<a href="#">학원관리</a>
					<ul class="col-2">
						<li><a href="#">학원 밀집도 정보</a></li>
						<li><a href="#">거래처 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">매출 분석 정보</a>
					<ul class="col-3">
						<li><a href="#"><img src="/common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
						<li><a href="#"><img src="/common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
						<li><a href="#"><img src="/common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
					</ul>
				</li>
				<li>
					<a href="#">스포츠 용품 리스트 관리</a>
					<ul class="col-2 more">
						<li><a href="#"><img src="/common/images/menu/ic_01.png" class="icon">전체상품</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_02.png" class="icon">태권도</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_03.png" class="icon">합기도</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_04.png" class="icon">검도</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_05.png" class="icon">복싱, MMA</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_06.png" class="icon">스포츠의류</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_07.png" class="icon">스포츠용품(구기)</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_08.png" class="icon">네트&amp;골대</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_09.png" class="icon">휘트니스</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_10.png" class="icon">학교체육용품</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_11.png" class="icon">체육대회용품</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_12.png" class="icon">측정용품&amp;호각</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_13.png" class="icon">펌프</a></li>
		        		<li><a href="#"><img src="/common/images/menu/ic_13.png" class="icon">정리용품</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터 관리</a>
					<ul class="col-2">
						<li><a href="/admin/notice/NoticeList.do">공지사항 관리</a></li>
						<li><a href="/admin/QA/QAList.do">Q&amp;A 관리</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
			
				<div class="search type"><input type="text" placeholder="제목입력" id="searchbox" style="width:200px" /></div>
	
				<div class="list_wrap" >
					<ul class="list-groub" id="list_more">
						<%
							for (NoticeDTO nDTO : nList) {
						%>
						<li>
							<a href="/customer/notice/NoticeInfo.do?notice_no=<%=nDTO.getNotice_no()%>">
              				
              				<p class="title">
              				
              				<% if (CmmUtil.nvl(nDTO.getNotice_yn()).equals("1")) {%>
								<span class="blue_text"><%=CmmUtil.nvl(nDTO.getTitle())%></span>
                			<%} else {%>
                				<span><%=CmmUtil.nvl(nDTO.getTitle())%></span>
                			<%} %>
                			
                			<% if (CmmUtil.nvl(nDTO.getNew_yn()).equals("Y")) {%>
                				<img src="/common/images/ic_new.png" alt="new" class="ic_new">
                			<%} %>
                			
                			</p>
                			
                			</a>
                
                			<p class="sub_text"><%=CmmUtil.nvl(nDTO.getUser_name())%><span><%=CmmUtil.nvl(nDTO.getReg_dt().substring(0, 10))%></span></p>
						</li>
						<%
						}
						%>
          			</ul>
          			<div id="searchadd"><button class="add_btn" id="addview">더보기</button></div>
          		</div>        		
          		
			</div>
	    </div>
	    
	    <footer class="footer">
			<a href="#"><img src="/common/images/ic_kakao.png" alt="카카오톡" class="kakao"></a>
	    	<div class="company_info">
				<p>대표이사 : 장명훈 ㅣ 대표번호 : 010-9057-6156</p>
				<p>사업자등록번호 : 567-36-00142</p>
				<p>통신판매업신고 : 2017-인천서구-0309호</p>
				<p>인천시 서구 보도진로 18번길 12(가좌동) 진성테크2층</p>
				<p>Copyright © <strong>모두의 스포츠</strong> All rights reserved. </p>
			</div>
		</footer>

	</section>
	
	<div id="c-mask" class="c-mask"></div>
	<script src="/common/js/classie.js"></script>
	<script src="/common/js/common.js"></script>
	
</body>

</html>