<!-- for Administrator -->

<%@ page import="com.sports.util.AES256Util"%>
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

String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
String ss_user_no1 = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_name1 = CmmUtil.nvl((String)session.getAttribute("ss_user_name"));

int access = 1;

if (ss_user_no1.equals("")) {
	
	access = 3;
	
} else if (ss_user_no1.equals(CmmUtil.nvl(rDTO.getReg_user_no()))) {
	
	access = 2;
	
}

System.out.println("ss_user_no: " + CmmUtil.nvl(rDTO.getReg_user_no()));
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

<script type="text/javascript">

function doReply() {
	
	if ("<%=access%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
	
	} else {
		
		location.href="/admin/QA/QAAnswerReg.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>&answer_yn=<%=CmmUtil.nvl(rDTO.getAnswer_yn())%>";
		
	}
	
}

function doDelete() {
	
	if ("<%=access%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
		
	} else {
		
		if (confirm("작성한 게시글을 삭제하시겠습니까?")) {
			location.href="/admin/QA/QADelete.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>&q_no=<%=CmmUtil.nvl(rDTO.getQ_no())%>";
		}
		
	}
	
}

function doList() {
	location.href="/admin/QA/QAList.do";
}

</script>
	
</head>

<body>

	<section id="wrapper" class="wrapper">
		
	<form name="f" id="f" method="post">	
	
	    <header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title"><p>Q&amp;A</p></div>
		</header>
		
<%@include file="/html5/include/footer.jsp" %>


		<div class="container detail">
			<div class="wrap btn-wrap">
			
				<div class="list_wrap qna_detail">
					<div class="top">
						<p class="title"><%=CmmUtil.nvl(rDTO.getTitle())%></p>
						<p class="sub_text"><%=CmmUtil.nvl(rDTO.getUser_name())%><span><%=CmmUtil.nvl(rDTO.getReg_dt())%></span></p>
					</div>
          			<div class="content">
          				<%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br>") %>
          				<br />
          				<img alt="" src="<%="/upload/qa_file/" + rDTO.getFile_name() %>" style="width:100%; height:100%">
          			</div>          			
				</div>
        		<div class="btn-groub">
					<button class="col-3 deep-btn button" onclick="javascript:doReply();return false;">답글</button>
					<button class="col-3 blue-btn button" onclick="javascript:doDelete();return false;">삭제</button>
					<button class="col-3 glay-btn button" onclick="javascript:doList();return false;">목록</button>
				</div>
				
			</div>
		</div>

	</form>	
		
<%@include file="/html5/include/footer.jsp" %>
	</section>
</body>

</html>