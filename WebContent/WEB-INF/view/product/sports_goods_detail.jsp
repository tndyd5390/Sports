<%@page import="javax.swing.JComboBox.KeySelectionManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.sports.dto.ProdOptionDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil" %>
<%@ page import="com.sports.util.TextUtil" %>
<%@ page import="com.sports.dto.ProductInfoDTO" %>
<%
	ProductInfoDTO pDTO = (ProductInfoDTO) request.getAttribute("pDTO");
	if(pDTO == null){
		pDTO = new ProductInfoDTO();
	}
	Map<String, List<ProdOptionDTO>> pMap = (Map<String, List<ProdOptionDTO>>)request.getAttribute("pMap");
	if(pMap == null){
		pMap = new HashMap<String, List<ProdOptionDTO>>();
	}
	String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
<script type="text/javascript">

	function addComma(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function unComma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	function plItemCnt(){
		var qty = parseInt($('#prod_qty').val());
		if(qty<99){
			qty += 1;
			$('#prod_qty').val(qty);
			$('#prod_price').text(addComma(qty * <%=CmmUtil.nvl(pDTO.getProd_price())%>));
		}
	}
	function miItemCnt(){
		var qty = parseInt($('#prod_qty').val());
		if(qty>1){
			qty -= 1;
			$('#prod_qty').val(qty);
			$('#prod_price').text(addComma(qty * <%=CmmUtil.nvl(pDTO.getProd_price())%>));
		}
	}
	function addBasket(){
		var userNo = '<%=userNo%>';
		var prod_no = '<%=CmmUtil.nvl(pDTO.getProd_no())%>';
		var price = $('#prod_price').text();
		if(userNo == ""){
			alert("로그인을 해주세요");
			location.href="login.do";
		}else{
			var sel = document.getElementsByName('optSelect');
			var selectedItemArray = [];
			for(var i = 0 ;i< sel.length; i++){
				for(var j = 0; j < sel[i].options.length; j++){
					if(sel[i].options[j].selected == true){
						if(sel[i].options[j].value == "-1"){
							alert("옵션을 선택해 주세요");
							return;
						}
						selectedItemArray.push(sel[i].options[j].value);
					}
				}
			}
			$.ajax({
				url : "customer/addBasket.do",
				data : {
					'prod_no' : prod_no,
					'prod_qty' : document.getElementById('prod_qty').value,
					'opt_no' : selectedItemArray,
					'bsk_price' : unComma(price)
				},
				method : "post",
				success : function(data){
					var result = parseInt(data);
					if(result == 1){
						alert("장바구니에 담았습니다.");
					}else{
						alert("장바구니 담기에 실패했습니다.");
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
          <%
          	if(pMap.size() != 0){
          %>
            <p class="blue_text">옵션 선택</p>
            <div class="select_wrap">
                       <%
              Iterator<String> keys = pMap.keySet().iterator();
              while(keys.hasNext()){
				String key = keys.next();            	  
            %>
            	<select class="col-2" id="optSelect" name="optSelect">
                <option value="-1"><%=key + "선택" %></option>
            <%
            	List<ProdOptionDTO> pList = pMap.get(key);
            	for(ProdOptionDTO p : pList){
            %>
              		<option value="<%=p.getOpt_no() %>"><%=p.getOpt_name() %></option>
            <%
            	}
            %>
            </select>
            <%
              }
            %>      
            </div>
          <%
          }
          %>
            <p class="blue_text">수량</p>
            <div class="count_input">
              <a class="incr-btn" onclick='miItemCnt(); return false;'>–</a>
              <input class="quantity" id="prod_qty" type="text" value="1" readonly="true">
              <a class="incr-btn" onclick='plItemCnt(); return false;'>+</a>
            </div>
            <div class="price_wrap">총금액<span class="price" id="prod_price"><%=CmmUtil.nvl(TextUtil.addComma(pDTO.getProd_price())) %></span><span class="won">원</span></div>
          </div>
        </div>

        <div class="list_wrap">
          <h4 class="goods_detail_title">제품 상세정보</h4>
          <div class="detail_contents">
            <img src="<%=CmmUtil.nvl(pDTO.getDetail_src())%>" alt="thumb">
            <dl>
              <dt>제품특징</dt>
              <dd><%=CmmUtil.nvl(pDTO.getProd_contents()) %></dd>
              <dt>상품규격정보</dt>
              <dd>- 재질 : 폴리에스테르 65% + 면 35%<br>
            - 색상 : 검정/노랑/주황/빨강/파랑/밤색/보라</dd>
            </dl>

          </div>
        </div>

        <div class="btn-groub">
          <button class="col-2 blue-btn button">바로 구매</button>
          <button class="col-2 glay-btn button" onclick="addBasket();">장바구니 담기</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>