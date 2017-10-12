<!-- for Administrator -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"
	import="com.sports.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>
<%
NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>

<script type="text/javascript">

	function doSubmit(f) {

		if (f.title.value == "") {

			alert("제목을 입력하시기 바랍니다.");
			f.title.focus();
			return false;

		}

		if (f.contents.value == "") {

			alert("내용을 입력하시기 바랍니다.");
			f.contents.focus();
			return false;

		}

		if (calBytes(f.title.value) > 100) {

			alert("제목은 최대 100Bytes까지만 입력 가능합니다.");
			f.title.focus();
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

		for (i = 0; i < strCnt; i++) {

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

<form method='post' action="/notice/NoticeUpdate.do">

<input type="hidden" name="notice_no" value="<%=CmmUtil.nvl(request.getParameter("notice_no")) %>" />

	<div class="container detail">
   		<div class="wrap search-wrap btn-wrap">
   		
        	<div class="list_wrap">
				<ul class="register_list">
            		<li>
              			<p class="blue_text">제목</p>
              			<div><input type="text" name="title" maxlength="50" value="<%=CmmUtil.nvl(rDTO.getTitle())%>"></div>
            		</li>
            		<li>
            			<p class="blue_text">중요 공지글 여부</p>
            			<%String notice_yn = rDTO.getNotice_yn(); %>
            			<div>
            				예 <input	type="radio" name="notice_yn" value="1" <%=CmmUtil.checked(notice_yn, "1")%> style="MARGIN: 0px 3px 1px 0px; WIDTH: 13px; HEIGHT: 13px" />
            				아니오 <input type="radio" name="notice_yn" value="2" <%=CmmUtil.checked(notice_yn, "2")%> style="MARGIN: 0px 3px 1px 0px; WIDTH: 13px; HEIGHT: 13px" />
 						</div>         
            		</li>
            		<li>
            			<%
						String contents = rDTO.getContents();
						contents = contents.replace("<br>", "\r\n");//줄바꿈 변환
						%>
              			<p class="blue_text" >내용</p>
              			<textarea name="contents" maxlenghth="2000" wrap="physical" style="height: 350px;"><%=contents%></textarea>
            		</li>
          		</ul>
        	</div>
        
			<div class="btn-groub">
				<button class="col-2 blue-btn button" type="submit">수정</button>
          		<button class="col-2 glay-btn button" onclick="location.href='/notice/NoticeInfo.do?notice_no=<%=rDTO.getNotice_no()%>';return false;">이전으로</button>
        	</div>
        	
		</div>
	</div> 

</form>
 
    <%@include file="/html5/include/footer.jsp"%>

	</section>
	
	<div id="c-mask" class="c-mask"></div>
	<script src="/html5/common/js/classie.js"></script>
	<script src="/html5/common/js/common.js"></script>
	
</body>

</html>