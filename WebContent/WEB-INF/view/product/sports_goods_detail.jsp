<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil" %>
<%@ page import="com.sports.dto.ProductInfoDTO" %>
<%
	ProductInfoDTO pDTO = (ProductInfoDTO) request.getAttribute("pDTO");
	String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
<script type="text/javascript">
	function addBasket(prod_no){
		var userNo = '<%=userNo%>';
		if(userNo == ""){
			alert("로그인을 해주세요");
			location.href="login.do";
		}else{
			$.ajax({
				url : "customer/addBasket.do",
				data : {
					'prod_no' : prod_no,
					'prod_qty' : document.getElementById('prod_qty').value
				},
				method : "post",
				dataType : "json",
				success : function(data){
					if(data == 1){
						alert("장바구니에 추가되었습니다.");
					}else if(data == 2){
						alert("장바구니에 추가 실패했습니다");
					}else{
						alert("로그인을 해주세요");
						location.href="#";
					}
				},
				error:function(x,e){
					if(x.status==0){
			            alert('네트워크가 정상적으로 동작하지 않습니다.');
			            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
			            }else if(x.status==404){
			            alert('페이지를 찾을수가 없습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(x.status==500){
			            alert('서버에서 오류가 발생했습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(e=='parsererror'){
			            alert('json파싱에 실패했습니다.');
			            }else if(e=='timeout'){
			            alert('응답 요청 시간이 지났습니다.');
			            }else {
			            alert('Unknow Error.n'+x.responseText);
			            }
			    }
			});
		}
	}
</script>
</head>
<body>
  <section id="wrapper" class="wrapper">
       <header class="header">
      <div class="wrap">
        <div class="left_menu">
          <img src="html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
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
      <div class="wrap btn-wrap">

        <div class="list_wrap">
          <div class="goods_detail">
            <div class="thumb">
              <img src="<%=CmmUtil.nvl(pDTO.getMain_src())%>" alt="thumb">
            </div>
            <div class="info">
              <p class="title"><%=CmmUtil.nvl(pDTO.getProd_name())%></p>
              <p class="sub_text">배송비 2,500원 (50,000원 이상 무료배송)</p>
            </div>
          </div>
          <div class="goods_option">
            <p class="blue_text">옵션 선택</p>
            <div class="select_wrap">
              <select class="col-2">
              <option value="색상선택">색상선택</option>
              <option value="빨강">빨강</option>
              </select>
              <select class="col-2">
                <option value="선택">사이즈선택</option>
                <option value="사이즈">사이즈1</option>
              </select>
            </div>

            <p class="blue_text">수량</p>
            <div class="count_input">
              <a class="incr-btn">–</a>
              <input class="quantity" id="prod_qty" type="text" value="1" readonly="true">
              <a class="incr-btn">+</a>
            </div>
            <div class="price_wrap">총금액<span class="price">33,000</span><span class="won">원</span></div>
          </div>
        </div>

        <div class="list_wrap">
          <h4 class="goods_detail_title">제품 상세정보</h4>
          <div class="detail_contents">
            <img src="<%=CmmUtil.nvl(pDTO.getDetail_src())%>" alt="thumb">
            <dl>
              <dt>제품특징</dt>
              <dd>훈련을 위한 기본 장비로써 가볍고 터칭감이 뛰어나 다양한 훈련에 적합한 제품입니다.
            내구성이 뛰어난 소재로 제작이 되어 더욱 실용적입니다.</dd>
              <dt>상품규격정보</dt>
              <dd>- 재질 : 폴리에스테르 65% + 면 35%<br>
            - 색상 : 검정/노랑/주황/빨강/파랑/밤색/보라</dd>
            </dl>

          </div>
        </div>

        <div class="btn-groub">
          <button class="col-2 blue-btn button">바로 구매</button>
          <button class="col-2 glay-btn button" onclick="addBasket('<%=CmmUtil.nvl(pDTO.getProd_no()) %>');">장바구니 담기</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
