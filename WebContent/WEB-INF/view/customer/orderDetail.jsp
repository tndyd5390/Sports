 <%@page import="com.sports.util.TextUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="com.sports.dto.OrdProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.sports.dto.Order_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Order_infoDTO oDTO = (Order_infoDTO)request.getAttribute("oDTO");
	if(oDTO == null) oDTO = new Order_infoDTO();
	String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
%>
<!DOCTYPE html>
<html lang="ko">
<!-- 
	이 주석을 보는 개발자여....지금은 초사이어인으로 변신해야 할때!!!
-->
<head>
<%@include file="/html5/include/head.jsp" %>
<style type="text/css">
.shDTable {
	display: table;
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.shDTables {
	display: table;
	width: 100%;
	margin-top: 60px;
	margin-bottom: 10px;
}

.shCTitle {
	display: inline-block;
	width: 27%;
	color: #7f7f7f;
	font-weight: bold;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	height: 30px;
}

.shCDetail {
	display: inline-block;
	width: 75%;
	color: #000000;
	display: table-cell;
	font-weight: bold;
	height: 30px;
	vertical-align: middle;
	padding-left: 5px;
}

.shDelivey {
	background-color: #F2F2F2;
	margin-top: 5px;
	font-weight: bold;
	text-align: center;
	height: 40px;
	display: table-cell;
	vertical-align: middle;
	width: 10%;
	margin-bottom: 20px;
}

.shNDelivey {
	color: red;
	font-weight: bold;
	vertical-align: middle;
	margin: 0 auto;
	color: red;
	font-size: 20px;
	width: 100%;
}

a.psyOrderDetailBtn {
	width: 30%;
	height: 40px;
	top: 15px;
	right: 15px;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.8;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
	text-decoration: none;
	color: #fff;
	background-color: #5bc0de;
	border-color: #46b8da;
	margin-bottom: 16px;
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
        <p>주문 상세</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>
    <div class="container" align="center">
 		<div class="shDTables" align="left">
 			<div class="shCTitle" align="left">주문 번호</div>
 			<div class="shCDetail" align="left"><%=CmmUtil.nvl(oDTO.getTran_no()) %></div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">주문 날짜</div>
 			<div class="shCDetail" align="left"><%=CmmUtil.nvl(oDTO.getReg_dt()).substring(0, 10) %></div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">수령인</div>
 			<div class="shCDetail" align="left"><%=CmmUtil.nvl(oDTO.getRecipient()) %></div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">연락처</div>
 			<div class="shCDetail" align="left"><%=CmmUtil.nvl(oDTO.getTel()) %></div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">주문 내역</div>
 			<div class="shCDetail" align="left">
 			<%
 			List<OrdProductDTO> prodList = oDTO.getOrdProductList();
 			if(prodList == null) prodList = new ArrayList();
 			for(OrdProductDTO pDTO : prodList){
 			%>
 			<%=CmmUtil.nvl(pDTO.getProd_name()) %><br> 
 			<%
 			} 
 			%>
 			</div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">가격</div>
 			<div class="shCDetail" align="left"><%=CmmUtil.nvl(oDTO.getOrd_price()) %></div>
 		</div>
 		<div class="shDTable" align="left">
 			<div class="shCTitle" align="left">주소</div>
 			<div class="shCDetail" align="left"><%=CmmUtil.nvl(oDTO.getAddress()) + " " + CmmUtil.nvl(oDTO.getAddressDetail())%></div>
 		</div>
 		<div class="shDTable" align="left">


 			<div class="shCTitle" align="left">운송장 번호</div>
 			<div class="shCDetail" align="left">
 			<%
 			if("".equals(CmmUtil.nvl(oDTO.getInvoice_no()))){
 				out.println("운송장번호 입력이 필요합니다.");
 			}else{
 				out.println(oDTO.getInvoice_no());
 			}
 			%>
 			</div>
 		</div>
 		<a href="deliveryReg.do?tran_no=<%=CmmUtil.nvl(oDTO.getTran_no())%>" class="psyOrderDetailBtn">운송장 수정</a>
 	<%if(!"".equals(CmmUtil.nvl(oDTO.getInvoice_no()))){
 			String url = "delivery.do?invoice_no="+CmmUtil.nvl(oDTO.getInvoice_no())+"&deli_co_no="+CmmUtil.nvl(oDTO.getDeli_co_no())
 							+"&tran_no="+CmmUtil.nvl(oDTO.getTran_no());				
 			 %>
 		<a href="<%=url%>" class="psyOrderDetailBtn">배송조회</a>
 	
 	<%} %>
 		
 	<%if(userNo.equals("5")){ %>
 	
 	<a href="#" class="psyOrderDetailBtn">운송장 번호 수정</a>
 	
 	<%} %>
 	
 	<a href="#" class="psyOrderDetailBtn">목록</a>
 	</div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>
</html>
