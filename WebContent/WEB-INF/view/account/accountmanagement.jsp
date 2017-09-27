<%@page import="com.sports.dto.AcademyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<AcademyDTO> aList = (List<AcademyDTO>)request.getAttribute("aList");
if(aList == null){
	aList = new ArrayList<AcademyDTO>();
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>

<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/html5/common/css/style.css">
<!-- Styles : sanghoon Kim-->
<link rel="stylesheet" href="/html5/common/css/sangAccount.css">
<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/html5/common/js/jquery-ui.js"></script>
<!-- 
<script src="/common/js/placeholders.min.js"></script> -->
<!--[if lte IE 9]>
<script src="/html5/common/js/placeholders.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

</head>

<body >
  <section id="wrapper" class="wrapper">
  	<header class="header">
		<div class="wrap">
			<div class="left_menu">
				<img src="html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
			</div>
			<div class="logo">
				<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
			</div>
		</div>
		
		<div class="page_title">
        	<p>거래처관리</p>
      	</div>
	</header>

<%@include file="/html5/include/navBar.jsp" %>
	<div class="container detail">
    <div align="center">
		<select class="shSelect">
        	<option value=""> 서울 </option>
        	<option value=""> 경기도 </option>
        	<option value=""> 강원도 </option>
        	<option value=""> 충청북도 </option>
        	<option value=""> 충청남도 </option>
        	<option value=""> 경상북도 </option>
        	<option value=""> 전라북도 </option>
        	<option value=""> 전라남도 </option>
        	<option value=""> 경상남도 </option>
        	
    	</select>
    	
    	<select class="shSelect">
        	<option value=""> hi </option>
        	<option value="">  </option>
        	<option value=""> 돌려요 </option>
        	<option value=""> .....ㅎ </option>
    	</select>
    
    <input type="text" class="shInputText">
    <button class="shBtn">검색</button>
    
    


      <div id="mainWrapper">
        <ul>
            <li>
                <ul id ="ulTable">
                   
                    <li>
                        <ul>
                            <li>거래처명</li>
                            <li>대표자명</li>
                            <li>전화번호</li>
                            <li>위치</li>
                        </ul>
                    </li>
                    <%
                    	for (AcademyDTO aDTO : aList) {
                    %>
                    <li>
                    	<ul>
                    		<li><%=CmmUtil.nvl(aDTO.getAca_name()) %></li>
                    		<li><%=CmmUtil.nvl(aDTO.getAca_ceo()) %></li>
                    		<li><%=CmmUtil.nvl(aDTO.getTel()) %></li>
                    		<li><%=CmmUtil.nvl(aDTO.getAca_area1()) %></li>
                    	</ul>
                    </li>
                    <%} %>
                </ul>
            </li>
        </ul>
        </div>
    <button class="add_btn" id="addview">더보기</button>
    </div>
			<div class="col-2-group">
				<a href="#" onclick="prodReg(); return false;">등록</a>
			</div>
    </div>
    
    </section>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>