<!-- for Customer -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil" %>
<%@ page import="com.sports.dto.QADTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
QADTO rDTO = (QADTO)request.getAttribute("rDTO");

List<QADTO> rList = (List<QADTO>) request.getAttribute("rList");

if (rDTO==null) {
	rDTO = new QADTO();
}

String ss_user_No = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_Name = CmmUtil.nvl((String)session.getAttribute("ss_user_name"));

int access = 1; 

if (CmmUtil.nvl((String)session.getAttribute("ss_user_no")).equals(CmmUtil.nvl(rDTO.getReg_user_no()))) {
	access = 2;
}
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/html5/include/head.jsp" %>

<script type="text/javascript">

function doOnload() {
	
	if ("<%=access%>"=="1") {
		
		alert("본인이 작성한 게시글만 수정 가능합니다.");
		location.href="/customer/QA/QAList.do";
		
	}
	
}

function doSubmit(f) {
	
	if (f.title.value == "") {
		
		alert("제목을 입력하시기 바랍니다.");
		f.title.focus();
		return false;
		
	}
	
	if (calBytes(f.title.value) > 200) {
		
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
	
	for (i=0; i<strCnt; i++) {
		
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

<body onload="doOnload();">

	<section id="wrapper" class="wrapper">	

	<form name="f" method="post" action="/customer/QA/QAUpdate.do" enctype="multipart/form-data" onsubmit="return doSubmit(this);">

	<input type="hidden" name="qa_no" value="<%=CmmUtil.nvl(request.getParameter("qa_no")) %>" />

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
							<div><input type="text" name="title" maxlength="50" value="<%=CmmUtil.nvl(rDTO.getTitle()) %>" /></div>				
						</li>	
						<li>
							<p class="blue_text">비밀글 여부</p>
							<div>
								예 <input type="radio" name="secret_yn" value="1" <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getSecret_yn()), "1") %> style="MARGIN: 0px 3px 1px 0px; WIDTH: 13px; HEIGHT: 13px" />
								아니오 <input type="radio" name="secret_yn" value="2" <%=CmmUtil.checked(CmmUtil.nvl(rDTO.getSecret_yn()), "2") %> style="MARGIN: 0px 3px 1px 0px; WIDTH: 13px; HEIGHT: 13px" />
							</div>
						</li>
						<li>
							<p class="blue_text">내용</p>
							<textarea name="contents" maxlength="2000" wrap="physical"><%=CmmUtil.nvl(rDTO.getContents()).replaceAll("<br>", "\r\n") %></textarea>
						</li>
						<li>
							<p class="blue_text">첨부파일</p>
							<div><input type="file" name="qa_file" accept="image/*" value=<%=CmmUtil.nvl(rDTO.getFile_org_name()) %> /></div>
						</li>
					</ul>
				</div>
				
				<div class="btn-groub">
					<button class="col-2 blue-btn button" type="submit">수정</button>
					<button class="col-2 glay-btn button" onclick="location.href='/customer/QA/QADetail.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>';return false;">이전으로</button>
				</div>					

			</div>
		</div>
	
	</form>	

	</section>
   <%@include file="/html5/include/footer.jsp" %>
</body>

</html>