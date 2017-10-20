 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
<script type="text/javascript">
	function doSubmit(){
		var f = document.getElementById('qaForm');
		var secretStatus;
		if(f.secret.value == 'y'){
			secretStatus = '비밀글로 등록됩니다.';
		}else{
			secretStatus = '공개글로 등록됩니다.';
		}
		
		if(f.title.value == ""){
			alert("제목을 입력해 주세요.");
			f.title.focus();
			return;
		}
		
		if(f.contents.value == ""){
			alert('내용을 입력해 주세요');
			f.contents.focus();
			return;
		}
		
		if(confirm(secretStatus)){
			f.submit();
		}
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
          <a href="/main.do"><h2 class="title">모두의 스포츠</h2></a>
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
	        <form action="/customer/qaRegProc.do" method="post" id="qaForm">
				<ul class="register_list">
	            <li>
	              <p class="blue_text">제목</p>
	              <input type="text" name="title">
	            </li>
	            <li>
	            <p class="blue_text">비밀글 여부</p>
				<div class="select_wrap">
					<select class="col-2" name="secret">
						<option value="n">공개글</option>
						<option value="y">비밀글</option>
					</select>
				</div>
				</li>
	            <li>
	              <p class="blue_text">내용</p>
	              <textarea name="contents"></textarea>
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
