 <%@page import="com.sports.dto.UserDTO"%>
<%@page import="com.sports.dto.Basket_OptionDTO"%>
<%@page import="com.sports.util.TextUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sports.dto.BasketDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
	
	List<BasketDTO> bList = (List<BasketDTO>)request.getAttribute("bList");
	if(bList == null)bList = new ArrayList<BasketDTO>();
	
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
	if(uDTO == null) uDTO = new UserDTO();
	
	for(BasketDTO bDTO : bList){
		if(bDTO.getBskOptList() == null){
			bDTO.setBskOptList(new ArrayList());
		}
	}
	int totalProdPrice = (Integer)request.getAttribute("totalProdPriceFromView");
	//파라미터로 보낼 상품명
	String prodName = "";
	if(bList.size() != 0){
		if(bList.size() == 1){
			prodName = bList.get(0).getProd_name();
		}else{
			prodName = bList.get(0).getProd_name() + "외" + (bList.size()-1) + "건";
		}
	}
	//파라미터로 보낼 상품 수량
	int qty = 0;
	for(BasketDTO bDTO : bList){
		qty += Integer.parseInt(bDTO.getProd_qty());
	}
	
	//파라미터로 보낼 고객 이름
	String userName = CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
	String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
%>
<!DOCTYPE html>
<html lang="ko">
<!-- 이 주석을 본다면 개발자겠지???우리 모두 화이팅 합시다ㅠㅠ -->
<head>
<%@include file="/html5/include/head.jsp" %>
<script type="text/javascript" src="https://pg.paynuri.com/js/jquery-dateFormat.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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
<script type="text/javascript">
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	
	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;
	
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postCode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address').value = fullAddr;
	
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('addressDetail').focus();
	        }
	    }).open();
	}

	$(function(){
		//현재일자 삽입.
		var today = $.format.date(new Date(), "yyMMdd");
		$('#SALE_DATE').val(today);
	
		// 거래번호 생성 
		var tranNo = $.format.date(new Date(), "yyyyMMddHHmmss");
		$('#TRAN_NO').val(tranNo);
	
		//IE라서 한글이 깨질때
		//var agent = navigator.userAgent.toLowerCase();
		/* if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			if (form.canHaveHTML) { // IE일경우 form 태그의 accept-charset 속성이 안먹힐수 있으므로 한글 깨짐 현상이 지속 될경우 주석을 풀어서 사용 하시면 됩니다.
		        document.charset = form.acceptCharset;
			}
		} */
	});

	function agreementForAll(agree){
		if(agree.checked == true){
			var agreement = document.getElementsByName('agreement');
			for(var i = 0 ; i < agreement.length; i++){
				agreement[i].checked = true;
			}
		}else{
			var agreement = document.getElementsByName('agreement');
			for(var i = 0 ; i < agreement.length; i++){
				agreement[i].checked = false;
			}
		}
	}
	
	function agreementCheckBoxControll(agreement){
		if(agreement.checked == false){
			document.getElementById('allAgreementCheck').checked = false;
		}
		var checkBox = document.getElementsByName('agreement');
		var cnt = 0;
		for(var i = 0 ; i< checkBox.length; i++){
			if(checkBox[i].checked == true){
				cnt++;
			}
		}
		if(cnt == checkBox.length){
			document.getElementById('allAgreementCheck').checked = true;
		}
	}
	
	function checkBoxIsAllSelected(){
		var result = true;
		var agreement = document.getElementsByName('agreement');
		for(var i = 0 ; i < agreement.length; i++){
				console.log(agreement[i].checked);
			if(agreement[i].checked == false){
				result = false;
			}
		}
		return result;
	}
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	
	function doOrder(){
		var tranTypeRadio = document.getElementsByName('TRAN_TYPE');
		if(!checkBoxIsAllSelected()){
			alert('약관에 동의해 주세요.');
			return;
		}
		var form = document.getElementById('frmPayment');
		
		if(form.TRAN_TYPE.value == ""){
			alert("결제 방식을 선택해 주세요");
			return;
		}
		
		if(form.recipient.value == ""){
			alert('수령인을 입력해 주세요');
			form.recipient.focus();
			return;
		}
		
		if(form.tel.value == ""){
			alert('연락처를 입력해주세요');
			form.contactNumber.focus();
			return;
		}
		
		if(form.postCode.value == ""){
			alert('우편번호를 입력해 주세요');
			return;
		}
		
		if(form.address.value == ""){
			alert('주소를 입력해 주세요.');
			return;
		}
		
		if(form.addressDetail.value == ""){
			alert("상세 주소를 입력해 주세요");
			return;
		}
		
		//etc_data1에는 수령할 사람의 정보를 전달 한다.json을 만드어 여분의 데이터를 전달 한다.
		var etcInfo1 = new Object();
		etcInfo1.recipient = form.recipient.value;
		etcInfo1.tel = form.tel.value;
		etcInfo1.message = form.message.value;
		etcInfo1.postCode = form.postCode.value;
		etcInfo1.address = form.address.value;
		etcInfo1.addressDetail = form.addressDetail.value;
		etcInfo1.regUserNo = '<%=userNo%>'
		var etcJSON1 = JSON.stringify(etcInfo1);
		form.ETC_DATA1.value = etcJSON1;
		console.log(form.ETC_DATA1.value);
		//etc_data2 에는 물품의 정보를 전달 한다.
		var etcArray2 = new Array();
		<%
		for(BasketDTO bDTO : bList){
		%>
		var etcInfo2 = new Object();
		etcInfo2['bsk_no'] = '<%=bDTO.getBsk_no()%>';
		etcArray2.push(etcInfo2);
		<%
		}
		%>
		var etcJSON2 = new Object();
		etcJSON2.bsk_no = etcArray2;
		form.ETC_DATA2.value = JSON.stringify(etcJSON2);
		console.log(form.ETC_DATA2.value);
		<%-- var optObject;
		var optArray;
		var etcArray2 = new Array();
		<%
		for(BasketDTO bDTO : bList){
		%>
			var etcInfo2 = new Object();
			optArray = new Array();
			etcInfo2['bsk_no'] = '<%=bDTO.getBsk_no()%>';
			etcInfo2['prod_no'] = '<%=bDTO.getProd_no()%>';
			etcInfo2['prod_name'] = '<%=bDTO.getProd_name()%>';
			<%
			for(int i = 0; i < bDTO.getBskOptList().size(); i++){
				Basket_OptionDTO bOptDTO = bDTO.getBskOptList().get(i);
			%>
				optObject = new Object();
				optObject['opt_kind'] = '<%=bOptDTO.getOpt_kind()%>';
				optObject['opt_name'] = '<%=bOptDTO.getOpt_name()%>';
				optObject['opt_no'] = '<%=bOptDTO.getOpt_no()%>';
				optArray.push(optObject);
			<%
			}
			%>
			etcInfo2['ord_option'] = optArray;
			etcArray2.push(etcInfo2);
		<%
		}
		%>
		var etcJSON2 = new Object();
		etcJSON2.bsk_option = etcArray2;
		form.ETC_DATA2.value = JSON.stringify(etcJSON2);
		console.log(form.ETC_DATA2.value); --%>
		if(confirm('화면의 정보대로 결제가 진행 됩니다. 결제 하시겠습니까???')){
			form.submit();
		}
	}

</script>
</head>
<body>
  <section id="wrapper" class="wrapper">
       <header class="header">
      <div class="wrap">
        <div class="left_menu">
          <img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--sl ide-left" class="c-button">
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
        <!-- https://pg.paynuri.com/paymentgateway/mobile/reqPay.do -->
        	<!-- <form action="https://pg.paynuri.com/paymentgateway/mobile/reqPay.do" method="post" id="orderForm"> -->
        	<form method="post" name="frmPayment" id="frmPayment" action="https://pg.paynuri.com/paymentgateway/mobile/reqPay.do" accept-charset="euc-kr" target="_self">
        		<!-- 모든 결제의 공통 파라미터 작성 ==============================================================================================================-->
        		<!-- 가맹점 번호       	-->	<input type="hidden" id="STOREID" name="STOREID" value="1500000088"/>
        		<!-- 가맹점 key   	-->	<input type="hidden" id="CRYPTO_KEY" name="CRYPTO_KEY" value="AF866C9C429290750A6D4255590C0328" />
        		<!-- 가맹점 명           	-->	<input type="hidden" id="STORE_NAME" name="STORE_NAME" value="페이누리쇼핑몰" />
        		<!-- 가맹점 로고        	-->	<input type="hidden" id="STORE_LOGO" name="STORE_LOGO" value="https://demo.paynuri.com/images/logo_shop.png" />
        		<!-- 사업자 번호        	-->	<input type="hidden" id="BUSINESS_NO" name="BUSINESS_NO" value="1068621229" />
        		<!-- 가맹점 주문 번호 	-->	<input type="hidden" id="TRAN_NO" name="TRAN_NO" size=20 maxlength=20 />
        		<!-- 상품명         !!	-->	<input type="hidden" id="GOODS_NAME" name="GOODS_NAME" value="<%=prodName %>" size=15 maxlength=20 />
        		<!-- 결제금액	 !!	--> <input type="hidden" id="AMT" name="AMT" value="1004" size=8 />
        		<!-- 상품 갯수	 !!	--> <input type="hidden" id="QUANTITY" name="QUANTITY" value="<%=qty%>" size=3 maxlength=3/>
        		<!-- 거래 일자	 !!	--> <input type="hidden" id="SALE_DATE" name="SALE_DATE" size=8 maxlength=6 />
        		<!-- 고객명	 !! --> <input type="hidden" id="CUSTOMER_NAME" name="CUSTOMER_NAME" value="<%=userName %>" size=30 maxlength=100 />
        		<!-- 리턴 URL	 !! --> <input type="hidden" id="RETURN_URL" name="RETURN_URL" value="http://tmaxxsports.com/orderSuccess.do" size=30 maxlength=100 />
        		<!-- 결제성공URL !	--> <input type="hidden" id="COMPLETE_URL" name="COMPLETE_URL" value="http://tmaxxsports.com/orderSuccessView.do?userNo=<%=CmmUtil.nvl(userNo)%>" size=30 maxlength=100 />
        		<!-- 결제취소URL !	--> <input type="hidden" id="FAIL_URL" name="FAIL_URL" value="http://tmaxxsports.com/orderCancel.do" size=30 maxlength=100 />
        		<!-- 여분의 데이터 1	--> <input type="hidden" id="ETC_DATA1" name="ETC_DATA1"/>
        		<!-- 여분의 데이터 2	--> <input type="hidden" id="ETC_DATA2" name="ETC_DATA2"/>
        		<!-- 여분의 데이터 3	--> <input type="hidden" id="ETC_DATA3" name="ETC_DATA3"/>
        		<!-- 모든 결제의 공통 파라미터 작성 ==============================================================================================================-->
        		
        		<!-- 계좌 이체에 필요한 파라미터     ==============================================================================================================-->
        		<!-- 계좌이체통장정보!--> <input type="hidden" id="TX_USER_DEFINE" name="TX_USER_DEFINE" value="주니어헤럴^1048106004^주니어헤럴드^027270114" />
        		<!-- 계좌 이체에 필요한 파라미터     ==============================================================================================================-->
        		
        		<!-- 가상 계좌에 필요한 파라미터     ==============================================================================================================-->
        		<!-- 입금통보 URL	!--> <input type="hidden" id="NOTICE_URL" name="NOTICE_URL" value="https://tmaxxsports.com/noticeOfPayment.do" size=30 maxlength=100 />
        		<!-- 가상 계좌에 필요한 파라미터     ==============================================================================================================-->
        		
        		<!-- 휴대폰 결제에 필요한 파라미터     ==============================================================================================================-->
        		<!-- 상품구분 URL	--> <input type="hidden" id="PRODUCTTYPE" name="PRODUCTTYPE" value="1"/>
        		<!-- 휴대폰 결제에 필요한 파라미터     ==============================================================================================================-->
	        	<h5>&nbsp;&nbsp;주문자 정보 입력</h5>
	        	<hr>
				<ul class="register_list" style="padding: 7px;">
		            <li class="psyLi">
		              <p class="psyOrderView blue_text">수령인</p>
		              <input type="text" name="recipient" value="<%=CmmUtil.nvl(uDTO.getUser_name())%>">
		            </li>
		            <li class="psyLi">
		            <p class="psyOrderView blue_text">연락처</p>
						<input type="text" name="tel" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="<%=CmmUtil.nvl(uDTO.getTel())%>">
					</li>
		           <li class="psyLi">
		            <p class="psyOrderView blue_text">주소</p>
						<input type="text" name="postCode" id="postCode" style="width: 50%;" placeholder="우편번호" readonly="readonly" value="<%=CmmUtil.nvl(uDTO.getPostcode())%>" onclick="sample6_execDaumPostcode();">
							<a href="#" class="btn btn-info psyATagButton" onclick="sample6_execDaumPostcode();">우편 번호 검색</a>
					</li>
					<li class="psyLi">
						<input type="text" name="address" id="address" placeholder="주소" readonly="readonly" value="<%=TextUtil.exchangeEscape(CmmUtil.nvl(uDTO.getAddress1()))%>">
					</li>
					<li class="psyLi">
						<input type="text" name="addressDetail" id="addressDetail" placeholder="상세 주소" value="<%=TextUtil.exchangeEscape(CmmUtil.nvl(uDTO.getAddress2()))%>">
					</li>
					<li class="psyLi">
		            <p class="psyOrderView blue_text">배송 메세지</p>
						<textarea placeholder="EX) 부재시 경비실에 맏겨주세요" name="message"></textarea>
					</li>
	          </ul>
	          <h5 class="psyBlue_text">&nbsp;&nbsp;주문 상품</h5>
	          <hr>
	          <%for(BasketDTO bDTO : bList){ %>
	          <ul class="register_list" style="padding: 7px;">
	          	<li class="psyLi">
					<p class="psyOrderItemLeft"><%=bDTO.getProd_name()%></p>
					<p class="psyOrderItemLeft"><%=CmmUtil.nvl(bDTO.getProd_qty()) + "개"%></p>
					<p class="psyOrderItemRight"><%=TextUtil.addComma(CmmUtil.nvl(bDTO.getBsk_price())) + "원"%></p>
				</li>
	          </ul>
	          <%} %>
	          <ul class="register_list" style="padding: 7px;">
	          	<li class="psyLi">
					<p class="psyOrderItemLeft">택배비</p>
					<p class="psyOrderItemRight">3,000원</p>
				</li>
	          </ul>
	          <hr>
	          <ul class="register_list" style="margin-bottom: 0px; padding: 7px;">
	          	<li class="psyLi">
					<p class="psyOrderItemLeft" style="font-size: 17px;">
						<b>최종 결제 금액</b>
					</p>
					<p class="psyOrderItemRight" style="font-size: 17px;">
						<b><%=TextUtil.addComma(totalProdPrice) + "원"%></b>
					</p>
				</li>
	          </ul>
	          <hr>
	          <ul class="register_list" style="margin-bottom: 0px; padding: 7px;">
	          	<li class="psyLi">
	          		<div class="psyMadeByDivTr">
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="CARD" style="width: 10%;">신용/체크카드</div>
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="VRTL" style="width: 10%;">무통장 입금</div>
	          		</div>
	          		<div class="psyMadeByDivTr">
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="PHON" style="width: 10%;">휴대폰 결제</div>
	          			<div class="psyMadeByDivTd"><input type="radio" name="TRAN_TYPE" value="BANK" style="width: 10%;">실시간 계좌이체</div>
	          		</div>
	          	</li>
	          </ul>
	          <hr>
	          <ul class="register_list" style="margin-bottom: 0px; padding: 7px;">
	          	<li>
					<input type="checkbox" onclick="agreementForAll(this);" id="allAgreementCheck"> 전체 동의(만 14세 이상 구매 가능)
				</li>
				<li class="psyLi">
					<textarea class="psyTermsTextarea" readonly="readonly">약관 어쩌구 저쩌구</textarea>
				</li>
				<li>
					<input type="checkbox" name="agreement" onclick="agreementCheckBoxControll(this);"> 결제 약관 동의(필수)
				</li>
				<li class="psyLi">
					<textarea class="psyTermsTextarea" readonly="readonly">약관 어쩌구 저쩌구</textarea>
				</li>
				<li>
					<input type="checkbox" name="agreement" onclick="agreementCheckBoxControll(this);"> 구매 약관 동의(필수)
				</li>
	          </ul>
        </form>
        </div>
        <div class="btn-groub">
          <button type="button" class="col-2 blue-btn button" onclick="doOrder();">결제하기</button>
          <button type="button" class="col-2 glay-btn button">취소하기</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
