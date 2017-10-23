<!-- for Administrator -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="com.sports.dto.QADTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
QADTO rDTO = (QADTO)request.getAttribute("rDTO");

if (rDTO==null) {
	rDTO = new QADTO();
}

String ss_user_no1 = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_name1 = CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/html5/include/head.jsp" %>

<script type="text/javascript">

function doSubmit(f) {
	
	if (f.title.value == "") {
		
		alert("제목을 입력하시기 바랍니다.");
		f.title.focus();
		return false;
		
	}
	
	if (calBytes(f.title.value) > 100) {
		
		alert("제목은 최대 100Bytes까지만 입력 가능합니다.");
		f.title.focus();
		return false;
		
	}	
	
	var secretCheck = false;
	
	for (var i=0; i<f.secret_yn.length; i++) {
		
		if (f.secret_yn[i].checked) {
			secretCheck = true;
		}
		
	}
	
	if (secretCheck==false) {
		
		alert("비밀글 여부를 선택하시기 바랍니다.");
		f.secret_yn[0].focus();
		return false;
		
	}	
	
	if (f.contents.value == "") {
		
		alert("내용을 입력하시기 바랍니다.");
		f.contents.focus();
		return false;
		
	}	
	
	if (calBytes(f.contents.value) > 4000) {
		
		alert("내용은 최대 4000Bytes까지만 입력 가능합니다.");
		f.contents.focus();
		return false;
		
	}		
	
}

function calBytes(str) {
	
	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	
	for (i=0;i<strCnt;i++) {
		
		onechar = tmpStr.charAt(i);
		
		if (escape(onechar).length > 4) {
			
			tcount += 2;
			
		} else {
			
			tcount += 1;
			
		}
		
	}
	
	return tcount;
	
}

</script>

</head>

<body>

	<section id="wrapper" class="wrapper">

	<form name="f" method="post" action="/admin/QA/QAAnswerInsert.do" enctype="multipart/form-data" onsubmit="return doSubmit(this);">

	<input type="hidden" name="q_no" value="<%=CmmUtil.nvl(rDTO.getQ_no()) %>" />
	<input type="hidden" name="title" value="<%=CmmUtil.nvl(rDTO.getTitle()) %>" />
	<input type="hidden" name="secret_yn" value="<%=CmmUtil.nvl(rDTO.getSecret_yn()) %>" />
	<input type="hidden" name="reg_user_no" value="<%=CmmUtil.nvl(rDTO.getReg_user_no()) %>" />
	
	    <header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title"><p>Q&amp;A</p></div>
		</header>
	<%@include file="/html5/include/navBar.jsp" %>

		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
			
				<div class="list_wrap">
					<ul class="register_list">
						<li>
							<p class="blue_text">제목</p>
							<div><%=CmmUtil.nvl(rDTO.getTitle()) %></div>				
						</li>	
						<li>
							<p class="blue_text">비밀글 여부</p>
							<div>
								예 <input type="radio" name="secret_yn" value="1" <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getSecret_yn()), "1") %> disabled="disabled" style="MARGIN: 0px 3px 1px 0px; WIDTH: 13px; HEIGHT: 13px" />
								아니오 <input type="radio" name="secret_yn" value="2" <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getSecret_yn()), "2") %> disabled="disabled" style="MARGIN: 0px 3px 1px 0px; WIDTH: 13px; HEIGHT: 13px" />
							</div>
						</li>
						<li>
							<p class="blue_text">내용</p>
							<textarea name="contents" maxlength="2000" wrap="physical"></textarea>
						</li>
						<li>
							<p class="blue_text">첨부파일</p>
							<div><input type="file" name="qa_file" accept="image/*" /></div>
						</li>
					</ul>
				</div>
				
				<div class="btn-groub">
					<button class="col-2 blue-btn button" type="submit">등록</button>
					<button class="col-2 glay-btn button" onclick="location.href='/admin/QA/QAList.do';return false;">목록</button>
				</div>
	
			</div>
		</div>

	</form>	

  <%@include file="/html5/include/footer.jsp" %>
	</section>

</body>

</html>