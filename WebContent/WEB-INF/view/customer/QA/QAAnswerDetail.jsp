<!-- for Customer -->

<%@ page import="com.sports.util.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil" %>
<%@ page import="com.sports.dto.QADTO" %>
<%@ page import="java.util.ArrayList" %>		
<%@ page import="java.util.List" %>
<%
QADTO rDTO = (QADTO)request.getAttribute("rDTO");

if (rDTO==null) {
	rDTO = new QADTO();
}

String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
String ss_user_No = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_Name = CmmUtil.nvl((String)session.getAttribute("ss_user_name"));

%>
<!DOCTYPE html>
<html lang="ko">

<head>

<%@include file="/html5/include/head.jsp" %>

<script type="text/javascript">

function doList() {
	location.href="/customer/QA/QAList.do";
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

<%@include file="/html5/include/navBar.jsp" %>
	
		<div class="container detail">
			<div class="wrap btn-wrap">
			
				<div class="list_wrap qna_detail">
					<div class="top">	
						<p class="title"><%=CmmUtil.nvl(rDTO.getTitle())%></p>
						<p class="sub_text">관리자<span><%=CmmUtil.nvl(rDTO.getReg_dt())%></span></p>
					</div>
          			<div class="content">
          				<%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br>") %>
          				<br />
          				<img alt="" src="<%="/upload/qa_file/" + rDTO.getFile_name() %>" style="width:100%; height:100%">
          			</div>
				</div>
        		<div class="btn-groub">
					<button class="col-3 glay-btn button" onclick="javascript:doList();return false;"></button>
					<button class="col-3 glay-btn button" onclick="javascript:doList();return false;">목록</button>
					<button class="col-3 glay-btn button" onclick="javascript:doList();return false;"></button>
				</div>	

			</div>
		</div>
	

	</form>	
		
	</section>
 <%@include file="/html5/include/footer.jsp" %>
	  
</body>

</html>