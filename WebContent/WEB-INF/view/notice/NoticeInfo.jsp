<!-- for Administrator -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"
	import="com.sports.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>
<%
NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");

String user_no = CmmUtil.nvl((String)session.getAttribute("user_no")); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
	
<script type="text/javascript">

var user_no = "<%=user_no%>";
	
	function deleteConfirm() {
		var user_no =	"<%=CmmUtil.nvl(user_no)%>";
		
		
		if(confirm("작성한 게시글을 삭제하시겠습니까?")){
			location.href="/notice/NoticeDelete.do?notice_no=<%=CmmUtil.nvl(rDTO.getNotice_no())%>";
		}else{
			return false;
		}
	}
	
	function editConfirm() {
		var user_no =	"<%=CmmUtil.nvl(user_no)%>";
		
		
		location.href="/notice/NoticeEditInfo.do?notice_no=<%=rDTO.getNotice_no()%>";
	}
	
</script>

</head>

<body>

  <section id="wrapper" class="wrapper">
  
    <header class="header">
	<div class="wrap">
		<div class="left_menu">
			<img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
		</div>
		<div class="logo">
			<a href="#"><h2 class="title">모두의 스포츠</h2></a>
		</div>
	</div>

	<div class="page_title">
		<p>공지사항</p>
	</div>
</header>

    <%@include file="/html5/include/navBar.jsp"%>


    <div class="container detail">
      <div class="wrap btn-wrap">
      
        <div class="list_wrap qna_detail">
        
          <div class="top">
            <p class="title"><%=CmmUtil.nvl(rDTO.getTitle())%></p>
            <p class="sub_text"><%=CmmUtil.nvl(rDTO.getUser_name())%><span><%=CmmUtil.nvl(rDTO.getReg_dt())%></span></p>
          </div>
          <div class="content">
            <%=CmmUtil.nvl(rDTO.getContents())%>
          </div>
         
          
        </div>
        <div class="btn-groub">
          <button class="col-3 deep-btn button" onclick="javascript:editConfirm();return false;" >수정</button>
          <button class="col-3 blue-btn button" onclick="javascript:deleteConfirm();return false;">삭제</button>
          <button class="col-3 glay-btn button" onclick="location.href='/notice/NoticeList.do';return false;">목록</button>
        </div>
      </div>
    </div>
   
    <%@include file="/html5/include/footer.jsp"%>

  </section>
  <div id="c-mask" class="c-mask"></div>
  <script src="/html5/common/js/classie.js"></script>
  <script src="/html5/common/js/common.js"></script>
</body>

</html>