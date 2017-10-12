<!-- for Administrator -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"
	import="com.sports.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>
<%
NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");

String user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String auth = CmmUtil.nvl((String)session.getAttribute("ss_user_auth"));


%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
	
<script type="text/javascript">

var auth = "<%=auth%>"

	function deleteConfirm() {
		
		
		if(confirm("작성한 게시글을 삭제하시겠습니까?")){
			location.href="/notice/NoticeDelete.do?notice_no=<%=CmmUtil.nvl(rDTO.getNotice_no())%>";
		}else{
			return false;
		}
	}
	
	
	
	function editConfirm() {
		
		
		location.href="/notice/NoticeEditInfo.do?notice_no=<%=rDTO.getNotice_no()%>";
	}
	
	
	
	function hiddenBox(){
		
		if( auth != 'A' ){
			document.getElementById("editId").style.display = "none";
			document.getElementById("deleteId").style.display = "none";
			}
		
	}
</script>

</head>

<body onload="hiddenBox();">

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
          <div class="content" style="min-height: 400px;">
            <%=CmmUtil.nvl(rDTO.getContents())%>
          </div>
         
          
        </div>
        <div class="btn-groub">
          <button class="col-3 deep-btn button" id="editId" onclick="javascript:editConfirm();return false;" >수정</button>
          <button class="col-3 blue-btn button" id="deleteId" onclick="javascript:deleteConfirm();return false;">삭제</button>
          <%if(!auth.equals("A")){ %>          
          <button class="col-3 glay-btn button" id="userButton" style="width:100%" onclick="location.href='/notice/NoticeList.do';return false;">목록</button>
          <%}else{ %>
          <button class="col-3 glay-btn button" id="adminButton" onclick="location.href='/notice/NoticeList.do';return false;">목록</button>
          <%} %>
        </div>
      </div>
    </div>
   

  </section>
 
    <%@include file="/html5/include/footer.jsp"%>
    
</body>

</html>