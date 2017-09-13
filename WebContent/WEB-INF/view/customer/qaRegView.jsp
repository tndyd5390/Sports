 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
<script type="text/javascript">
	function doSubmit(){
		var f = document.getElementById('qaForm');
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
        <p>스포츠 용품</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>


    <div class="container detail">
      <div class="wrap search-wrap btn-wrap">
        <div class="list_wrap">
	        <form action="#" method="post" id="qaForm">
				<div class="select_wrap">
					<select class="col-2">
						<option value="태권도">태권도</option>
						<option value="태권도">태권도</option>
					</select>
				</div>
				<ul class="register_list">
	            <li>
	              <p class="blue_text">제품명</p>
	              <input type="text" name="#">
	            </li>
	            <li>
	              <p class="blue_text">제품 상세</p>
	              <textarea name="#"></textarea>
	            </li>
	          </ul>
			</form>
        </div>
        <div class="btn-groub">
          <button class="col-2 blue-btn button" onclick="doSubmit();">등록</button>
          <button class="col-2 glay-btn button">목록</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
