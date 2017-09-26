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
<script src="html5/common/js/prodDetail.js"></script>
</head>
<body>
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
              <a class="incr-btn" onclick='miItemCnt(<%=CmmUtil.nvl(pDTO.getProd_price())%>); return false;'>–</a>
              <input class="quantity" id="prod_qty" type="text" value="1" readonly="true">
              <a class="incr-btn" onclick='plItemCnt(<%=CmmUtil.nvl(pDTO.getProd_price())%>); return false;'>+</a>
            </div>
            <div class="price_wrap">총금액<span class="price" id="prod_price"><%=CmmUtil.nvl(TextUtil.addComma(pDTO.getProd_price())) %></span><span class="won">원</span></div>
          </div>
        </div>

        <div class="list_wrap">
          <h4 class="goods_detail_title">제품 상세정보</h4>
          <div class="detail_contents">
            <img src="<%=CmmUtil.nvl(pDTO.getDetail_src())%>">
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
        <div class="btn-groub">
          <button class="col-2 blue-btn button" onclick="updateProd(<%=CmmUtil.nvl(pDTO.getProd_no())%>);">수정</button>
          <button class="col-2 glay-btn button" onclick="return deleteProd(<%=CmmUtil.nvl(pDTO.getProd_no())%>);">삭제</button>
        </div>
      </div>
    </div>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>