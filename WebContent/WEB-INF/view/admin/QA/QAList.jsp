<!-- for Administrator -->

<%@ page import="com.sports.util.AES256Util"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="com.sports.dto.QADTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}

String ss_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_id =  CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
String ss_user_name =  CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
String ss_user_auth =  CmmUtil.nvl((String)session.getAttribute("ss_user_auth"));

System.out.println("ss_user_no: " + ss_user_no);

/*if (!ss_user_no.equals("5")) {
	response.sendRedirect("/main.do");
}*/

int access = 1;

if (ss_user_no.equals("")) {
	access = 2;
}
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>모두의 스포츠</title>
<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/html5/common/css/style.css">
<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/html5/common/js/jquery-ui.js"></script>
<script src="/html5/common/js/modernizr.custom.js"></script>
<!--[if lte IE 9]>
<script src="/html5/common/js/placeholders.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
    
<style>
	.list_wrap .list-groub .title span.hj-checkBox {
    padding-right: 5px;
    padding-left: 5px;
}

.search-wrap .search.type.hj-search {
    padding-left: 0px;
}
</style>    

<script type="text/javascript">

$(function() {
	
	var cnt = 6;
	var search ="";

//검색
$('#searchbox').keyup(function() {
	
	cnt = 6;
	search = $('#searchbox').val();
	
	$.ajax({
		
		url : "/admin/QA/QASearchList.do",
		method : "post",
		data : {'search' : search},
		datatype :	"json",
		success : function(data) {
			
			var contents ="";
			console.log(data)
			
			$.each(data,function (key,value) {
				
				var nw = value.new_yn;
				var lock = value.secret_yn;
				
				contents += "<li>";
				contents += "<div style='float:left'><input type='checkbox' name='deleteSelect' class='deleteSelect' value="+value.qa_no+" /></div>";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='/admin/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/admin/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				
				contents += "<p class='title'>";
				contents += "<span class='hj-checkBox'>"
				
				if (value.answer_yn == "Y") {
					contents += "<img src='/html5/common/images/ic_reply.png' alt='답글' class='ic_reply'>";
				}
				
				contents += value.title+"</span>";
				
				if (nw == 'Y') {	
					contents += "<img src='/html5/common/images/ic_new.png' alt='new' class='ic_new'>";
				}
				
				if (lock == '1') {
					contents += "<img src='/html5/common/images/ic_lock.png' class='ic_lock' alt='lock'>";
				}
				
				contents += "</p>";
				contents += "</a>"
				contents += "<p class='sub_text'>"
				
				if (value.answer_yn == 'Y') {
					contents += "관리자";
				} else {
					contents += value.user_name;
				}
				
				contents += "<span>"+value.reg_dt+"</span>"
				contents += "</p>";
				contents += "</li>";
				
			});
			
			$('#list_more').html(null);
			$('#list_more').append(contents);
			
			var dS = document.getElementsByClassName("deleteSelect");
			
			for (var i =0; i<dS.length; i++) {
				dS[i].style.display = "none";
			}
				
			document.getElementById("delete").style.display = "none";
			document.getElementById("all").style.display = "none";
			document.getElementById("alltext").style.display = "none";
			
			if (data.length < 6) {
				$("#addview").hide();
			}
			
			if (data.length >= 6) {
				$("#searchadd").html("<button class='add_btn' value='더보기' id='addview'>더보기</button>");
			}
			
		}
		
	});	//ajax closed
	
});	//"searchbox" function closed

<% if (rList.size() < 6) {%>
	$("#addview").hide();
<%} %>

//더보기
$("#addview").add("#searchadd").click(function() {
	
	$.ajax({

		url : "/admin/QA/QAReadMore.do",
		method : "post",
		data : {'cnt' : cnt, 'search' : search},
		dataType : "json",
		success : function(data) {
			
			var contents = "";
			console.log(data)
			
			$.each(data,function (key,value) {
				
				var nw = value.new_yn;
				var lock = value.secret_yn;
				
				contents += "<li>";
				contents += "<div style='float:left'><input type='checkbox' name='deleteSelect' class='deleteSelect' value=" + value.qa_no + " /></div>";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='/admin/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/admin/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				
				contents += "<p class='title'>"
				contents += "<span class='hj-checkBox'>"
				
				if (value.answer_yn == "Y") {
					contents += "<img src='/html5/common/images/ic_reply.png' alt='답글' class='ic_reply'>";
				}
				
				contents += value.title+"</span>";
				
				if (nw == 'Y') {	
					contents += "<img src='/html5/common/images/ic_new.png' alt='new' class='ic_new'>";
				}
				
				if (lock == '1') {
					contents += "<img src='/html5/common/images/ic_lock.png' class='ic_lock' alt='lock'>";
				}
					
				contents += "</p>"
				contents += "</a>"
				contents += "<p class='sub_text'>"
				
				if (value.answer_yn == 'Y') {
					contents += "관리자";
				} else {
					contents += value.user_name;
				}
				
				contents += "<span>"+value.reg_dt+"</span>";
				contents += "</p>";
				contents += "</li>"
				
			});
			
			$('#list_more').append(contents);
			
			if ((data).length<6) {
				$('#addview').remove();
			}
			
			var dS = document.getElementsByClassName("deleteSelect");
			
			for (var i =0; i<dS.length; i++) {
				dS[i].style.display = "none";
			}
				
			document.getElementById("delete").style.display = "none";
			document.getElementById("all").style.display = "none";
			document.getElementById("alltext").style.display = "none";
		}
	
	});	//ajax closed
	
	cnt += 6;
	
	if (search == "") {
		return false;
	}

});	//"addview" function closed

});	//jQuery function closed

//질문 상세 이동
function doDetail(qa_no) {
	location.href="/admin/QA/QADetail.do?qa_no=" + qa_no;
}

//답글 상세 이동
function doAnswerDetail(qa_no, answer_yn) {
	location.href="/admin/QA/QAAnswerDetail.do?qa_no=" + qa_no;
}

//글쓰기 로그인
function doReg() {
	
	if ("<%=access %>" == 2) {

			alert("로그인을 하시기 바랍니다.");

		} else {

			location.href = "/admin/QA/QAReg.do";

		}

	}

	//체크박스 숨겨놓기
	function hiddenCheckbox() {

		var dS = document.getElementsByClassName("deleteSelect");

		for (var i = 0; i < dS.length; i++) {
			dS[i].style.display = "none";
		}

		document.getElementById("delete").style.display = "none";
		document.getElementById("all").style.display = "none";
		document.getElementById("alltext").style.display = "none";

	}

	//편집버튼 누르면 체크박스 뜸
	function edit(f) {

		cbox = f.deleteSelect;

		var dS = document.getElementsByClassName("deleteSelect");

		for (var i = 0; i < dS.length; i++) {

			if (dS[i].style.display == "none") {

				dS[i].style.display = "";

			} else {

				if (dS[i].style.display == "") {
					dS[i].style.display = "none";
				}

			}

		}

		if (cbox.length) {

			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = "";
			}

		} else {

			cbox.checked = "";

		}

		f.all.checked = "";

		if (document.getElementById("delete").style.display == "") {

			document.getElementById("delete").style.display = "none";
			document.getElementById("all").style.display = "none";
			document.getElementById("alltext").style.display = "none";

			return;

		}

		document.getElementById("delete").style.display = "";
		document.getElementById("all").style.display = "";
		document.getElementById("alltext").style.display = "";

	}

	//체크박스 전체 선택
	function allCheck(f) {

		cbox = f.deleteSelect;

		if (cbox.length) {

			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = f.all.checked;
			}

		} else {

			cbox.checked = f.all.checked;

		}

	}

	//체크박스 선택된 게시글 삭제
	function deleteConfirm(f) {

		if (confirm("선택된 게시글을 삭제하시겠습니까?")) {

			document.getElementById("f").submit();

		} else {

			return;
		}

	}
</script>

</head>

<body onload="javascript:hiddenCheckbox();">

	<section id="wrapper" class="wrapper">

		<form name="f" id="f" method="post"
			action="/admin/QA/QACheckboxDelete.do">

		<header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title" style=" float: left; width: 33%;"><span class="sub_text" id="delete" onclick="javascript:deleteConfirm(this.form);">삭제하기</span>&nbsp;</div>
			<div class="page_title" style=" float: left; width: 33%;"><p>Q&amp;A</p></div>
			<div class="page_title" style=" float: left; width: 33%;"></div>
		</header>
		
		<nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">
			<div class="profile">
			<% if(ss_user_no.equals("")) {%>
				<p><img src="/html5/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
				<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
				<div class="login_wrap"><a href="/login.do">로그인</a><a href="/userReg.do">회원가입</a></div>
			<%} else {%>
				<p><img src="/html5/common/images/menu/user.png" class="photo"><%=ss_user_name %>님 안녕하세요.</p>
				<button class="c-menu__close"><img src="/html5/common/images/menu/cancel.png" alt="닫기"></button>
				<div class="logout_wrap"><a href="/logout.do">로그아웃</a></div>
			<%} %>
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
						<li><a href="/admin/sale/list.do"><img src="/html5/common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
						<li><a href="#"><img src="/html5/common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
						<li><a href="#"><img src="/html5/common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
					</ul>
				</li>
				<li>
					<a href="#">스포츠 용품 리스트 관리</a>
					<ul class="col-2 more">
						<li><a href="#"><img src="/html5/common/images/menu/ic_01.png" class="icon">전체상품</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_02.png" class="icon">태권도</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_03.png" class="icon">합기도</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_04.png" class="icon">검도</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_05.png" class="icon">복싱, MMA</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_06.png" class="icon">스포츠의류</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_07.png" class="icon">스포츠용품(구기)</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_08.png" class="icon">네트&amp;골대</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_09.png" class="icon">휘트니스</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_10.png" class="icon">학교체육용품</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_11.png" class="icon">체육대회용품</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_12.png" class="icon">측정용품&amp;호각</a></li>
						<li><a href="#"><img src="/html5/common/images/menu/ic_13.png" class="icon">펌프</a></li>
		        		<li><a href="#"><img src="/html5/common/images/menu/ic_13.png" class="icon">정리용품</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터 관리</a>
					<ul class="col-2">
						<li><a href="/admin/notice/NoticeList.do">공지사항 관리</a></li>
						<li>
						<% if (ss_user_no.equals("5")) {%>
							<a href="/admin/QA/QAList.do">Q&amp;A 관리</a>
						<%} else {%>
							<a href="/customer/QA/QAList.do">Q&amp;A</a>
						<%} %>
						</li>
					</ul>
				</li>
			</ul>
		</nav>

			<div class="container detail">
				<div class="wrap search-wrap btn-wrap">

					<div class="search type hj-search">
						<input type="text" placeholder="글 제목을 입력해주세요." id="searchbox"
							style="width: 100%" />
					</div>

					<div class="list_wrap">
						<ul class="list-groub" id="list_more">
							<%
								for (QADTO rDTO : rList) {

									if (rDTO == null) {
										rDTO = new QADTO();
									}
							%>
							<li>
								<div style="float: left">
									<input type="checkbox" name="deleteSelect" class="deleteSelect"
										value="<%=rDTO.getQa_no()%>" />
								</div>
								<% if (CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")) {%>
 									<a href="javascript:doAnswerDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');">

									<p class="title">

										<span class="hj-checkBox"><img src="/html5/common/images/ic_reply.png" alt="답글"
											class="ic_reply"><%=CmmUtil.nvl(rDTO.getTitle())%></span>

										<%
											if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
										%>
										<img src="/html5/common/images/ic_lock.png" class="ic_lock"
											alt="lock">
										<%
											}
										%>

										<%
											if (CmmUtil.nvl(rDTO.getNew_yn()).equals("Y")) {
										%>
										<img src="/html5/common/images/ic_new.png" alt="new"
											class="ic_new">
										<%
											}
										%>

									</p>

									</a>
								<%} else {%>
									<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');">

									<p class="title">

										<span class="hj-checkBox"><%=CmmUtil.nvl(rDTO.getTitle())%></span>

										<%
											if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
										%>
										<img src="/html5/common/images/ic_lock.png" class="ic_lock"
											alt="lock">
										<%
											}
										%>

										<%
											if (CmmUtil.nvl(rDTO.getNew_yn()).equals("Y")) {
										%>
										<img src="/html5/common/images/ic_new.png" alt="new"
											class="ic_new">
										<%
											}
										%>

									</p>

									</a>
								<%}%>
								<p class="sub_text"><%=CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y") ? "관리자" : CmmUtil.nvl(rDTO.getUser_name())%><span><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10))%></span></p>
							</li>
							<%
							}
							%>
						</ul>
						<label class="all_select" id="alltext"><input
							type="checkbox" name="all" id="all"
							onclick="allCheck(this.form);" />전체 선택</label>
						<div id="searchadd">
							<button class="add_btn" value="더보기" id="addview">더보기</button>
						</div>
					</div>

					<div class="btn-groub">
						<% if (ss_user_no.equals("5")) {%>
						<button class="col-2 blue-btn button"
							onclick="javascript:edit(this.form);return false;">편집하기</button>
						<button class="col-2 glay-btn button"
							onclick="javascript:doReg();return false;">작성하기</button>
						<%} %>
					</div>

				</div>
			</div>

		<footer class="footer">
    	<a href="#">
      		<img src="/html5/common/images/ic_kakao.png" alt="카카오톡" class="kakao">
    	</a>
    	<div class="company_info">
      		<p>대표이사 : 장명훈 ㅣ 대표번호 : 010-9057-6156</p>
      		<p>사업자등록번호 : 567-36-00142</p>
      		<p>통신판매업신고 : 2017-인천서구-0309호</p>
      		<p>인천시 서구 보도진로 18번길 12(가좌동) 진성테크2층</p>
      		<p>Copyright © <strong>모두의 스포츠</strong> All rights reserved. </p>
    	</div>
		</footer>

	</form>

	</section>
	
	<div id="c-mask" class="c-mask"></div>
	<script src="/html5/common/js/classie.js"></script>
	<script src="/html5/common/js/common.js"></script>

</body>

</html>