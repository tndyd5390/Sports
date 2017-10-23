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
if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}

String ss_user_no1 = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_id1 =  CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
String ss_user_name1 =  CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
String ss_user_auth1 =  CmmUtil.nvl((String)session.getAttribute("ss_user_auth"));


if (!ss_user_no1.equals("5")) {
	response.sendRedirect("/main.do");
}

int access = 1;

if (ss_user_no1.equals("")) {
	access = 2;
}
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<%@include file="/html5/include/head.jsp" %>

    
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
					contents += "운영자";
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
					contents += "운영자";
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

		<header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title" style=" float: left; width: 33%;"><span class="sub_text" id="delete" onclick="javascript:deleteConfirm(this.form);">삭제하기</span>&nbsp;</div>
			<div class="page_title" style=" float: left; width: 33%;"><p>Q&amp;A</p></div>
			<div class="page_title" style=" float: left; width: 33%;"></div>
		</header>
<%@include file="/html5/include/navBar.jsp" %>

		<form name="f" id="f" method="post" action="/admin/QA/QACheckboxDelete.do">

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
								<p class="sub_text"><%=CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y") ? "운영자" : CmmUtil.nvl(rDTO.getUser_name())%><span><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10))%></span></p>
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

	</form>

<%@include file="/html5/include/footer.jsp" %>
	</section>
</body>

</html>