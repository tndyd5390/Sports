 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 이 주석을 본다면 개발자겠지???우리 모두 화이팅 합시다ㅠㅠ -->
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
<style type="text/css">

hr {
	margin-top: 0px;
	margin-bottom: 0px;
}

.register_list li .psyOrderView {
	line-height: 25px;
	height: 10px;
	padding-bottom: 5px;
	display: block;
}

p.psyOrderItemLeft {
	padding-top: 5px;
	padding-left: 10px;
	display: inline-block;
	font-size: 15px;
	text-align: right;
	margin-bottom: 0;
}

p.psyOrderItemRight {
	padding-top: 5px;
	display: inline-block;
	font-size: 15px;
	text-align: right;
	margin-bottom: 0;
	float: right;
}

div.psyMadeByDivTr {
	display: table;
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
}

div.psyMadeByDivTd {
	display: inline-block;
	width: 50%;
	color: #7F7F7F;
	font-weight: bold;
	display: table-cell;
}

.register_list li.psyLi {
	font-size: 14px;
	position: relative;
	padding-bottom: 5px;
}

a.psyATagButton {
	width: 45%; 
	float: right; 
	height:40px; 
}
h5.psyBlue_text{
	color: #1777cb;
}
ul > li > input[type=checkbox]{
	width: 5%;
	margin-bottom: 3px;
}

ul > li > textarea.psyTermsTextarea{
	margin-bottom: -5px;
}
</style>	
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
	        <form action="/customer/qaRegProc.do" method="post" id="qaForm">
	        	<h5>&nbsp;&nbsp;주문자 정보 입력</h5>
	        	<hr>
				<ul class="register_list" style="padding: 7px;">
		            <li class="psyLi">
		              <p class="psyOrderView blue_text">수령인</p>
		              <input type="text" name="title">
		            </li>
		            <li class="psyLi">
		            <p class="psyOrderView blue_text">연락처</p>
						<input type="text" name="title">
					</li>
		           <li class="psyLi">
		            <p class="psyOrderView blue_text">주소</p>
						<input type="text" name="title" style="width: 50%;" placeholder="우편번호" readonly="readonly"><a href="#" class="btn btn-info psyATagButton" >우편 번호 검색</a>
					</li>
					<li class="psyLi">
						<input type="text" name="title" placeholder="주소" readonly="readonly">
					</li>
					<li class="psyLi">
						<input type="text" name="title" placeholder="상세 주소">
					</li>
					<li class="psyLi">
		            <p class="psyOrderView blue_text">배송 메세지</p>
						<textarea placeholder="EX) 부재시 경비실에 맏겨주세요"></textarea>
					</li>
	          </ul>
	          <h5 class="psyBlue_text">&nbsp;&nbsp;주문 상품</h5>
	          <hr>
	          <ul class="register_list" style="padding: 7px;">
	          	<li class="psyLi">
					<p class="psyOrderItemLeft">체육복</p><p class="psyOrderItemLeft">1개</p><p class="psyOrderItemRight">3000원</p>
				</li>
	          </ul>
	          <hr>
	          <ul class="register_list" style="margin-bottom: 0px; padding: 7px;">
	          	<li class="psyLi">
					<p class="psyOrderItemLeft" style="font-size: 17px;"><b>최종 결제 금액</b></p><p class="psyOrderItemRight" style="font-size: 17px;"><b>3000원</b></p>
				</li>
	          </ul>
	          <hr>
	          <ul class="register_list" style="margin-bottom: 0px; padding: 7px;">
	          	<li class="psyLi">
	          		<div class="psyMadeByDivTr">
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="" style="width: 10%;">신용/체크카드</div>
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="" style="width: 10%;">무통장 입금</div>
	          		</div>
	          		<div class="psyMadeByDivTr">
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="" style="width: 10%;">휴대폰 결제</div>
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="" style="width: 10%;">실시간 계좌이체</div>
	          		</div>
	          	</li>
	          </ul>
	          <hr>
	          <ul class="register_list" style="margin-bottom: 0px; padding: 7px;">
	          	<li>
					<input type="checkbox" name="#"> 전체 동의(만 14세 이상 구매 가능)
				</li>
				<li class="psyLi">
					<textarea class="psyTermsTextarea" readonly="readonly">약관 어쩌구 저쩌구</textarea>
				</li>
				<li>
					<input type="checkbox" name="#"> 결제 약관 동의(필수)
				</li>
				<li class="psyLi">
					<textarea class="psyTermsTextarea" readonly="readonly">약관 어쩌구 저쩌구</textarea>
				</li>
				<li>
					<input type="checkbox" name="#"> 구매 약관 동의(필수)
				</li>
	          </ul>
			</form>
        </div>
        <div class="btn-groub">
          <button class="col-2 blue-btn button" onclick="doSubmit();">결제하기</button>
          <button class="col-2 glay-btn button">취소하기</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
