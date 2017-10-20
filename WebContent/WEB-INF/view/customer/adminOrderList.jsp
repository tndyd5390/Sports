 <%@page import="java.util.ArrayList"%>
<%@page import="com.sports.dto.Order_infoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
	List<Order_infoDTO> oList = (List<Order_infoDTO>)request.getAttribute("oList");
	if(oList == null) oList = new ArrayList();
%>
<!DOCTYPE html>
<html lang="ko">
<!-- 
	여기는 
-->
<head>
<%@include file="/html5/include/head.jsp" %>
<style type="text/css">
.search input.psySearchText {
	width: 70%;
	padding: 5px 10px;
	float: left;
	margin-bottom: 10px;
}

a.psyOrderListSearchBtn {
	width: 25%;
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
    background-color: #1777CB;
    border-color: #46b8da;
    float: right;
}
.shDTable {
	display: table;
	width: 100%;
	margin-bottom: 10px;
}

.shDTables {
	display: table;
	width: 100%;
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
.psyTitle{
	background-color:#B9B9B9;
	border: 1px solid #B9B9B9;
	display: inline-block;
	width: 100%;
	color: #7f7f7f;
	font-weight: bold;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	height: 30px;
}
.psyDetail{
	border: 1px solid #B9B9B9;
	width: 25%;
	color: #000000;
	display: table-cell;
	font-weight: bold;
	height: 30px;
	vertical-align: middle;
	text-align: center;
	padding-left: 5px;
	word-break:break-all;
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
	width: 100%;
	height: 40px;
	top: 15px;
	right: 15px;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 10px;
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
	background-color: #1777CB;
	border-color: #46b8da;
	margin-bottom: 16px;
}
</style>	
<script type="text/javascript">
	function orderDetail(tranNo){
		console.log(tranNo);
		var form = document.createElement('form');
		form.setAttribute('action', 'orderDetail.do');
		form.setAttribute('method', "post");
		
		var input = document.createElement('input');
		input.setAttribute('type', 'hidden');
		input.setAttribute('name', "tranNo");
		input.setAttribute('value', tranNo);
		form.appendChild(input);
		
		document.body.appendChild(form);
		
		form.submit();
	}
 
	function toggleFunc(id){
		console.log(id);
		$.ajax({
			url : 'adminOrderListDoToggle.do',
			method : 'post',
			data : {'reg_dt' : id},
			success : function(data){
				console.log(data);
				var contents = "";
				contents += "<div class='shDTable' align='left'>";
				contents += "<div class='psyDetail' align='left'>주문 번호</div>";
				contents += "<div class='psyDetail' align='left'>품명</div>";
				contents += "<div class='psyDetail' align='left'>가격</div>";
				contents += "<div class='psyDetail' align='left'>수령인 이름</div>";
				contents += "</div>\n";
				$.each(data, function(key, value){
					var prodName = "";
					console.log("aaa" + value.ordProductList.length);
					if(value.ordProductList.length > 1){
						prodName = value.ordProductList[0]['prod_name'] + "외" + (value.ordProductList.length - 1) + "건";
					}else{
						prodName = value.ordProductList[0]['prod_name'];
					}
					console.log(prodName);
					contents += "<div class='shDTable' align='left' onclick='orderDetail(" + value.tran_no + ")'>";
					contents += "<div class='psyDetail' align='left'>" + value.tran_no + "</div>";
					contents += "<div class='psyDetail' align='left'>" + prodName + "</div>";
					contents += "<div class='psyDetail' align='left'>" + value.ord_price + "</div>";
					contents += "<div class='psyDetail' align='left'>" + value.recipient + "</div>";
					contents += "</div>";
				})
				$('#' + id).html(contents);
			}
		})
		$('#' + id).toggle();
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
        <p>주문 목록</p>
      </div>
    </header>
<%@include file="/html5/include/navBar.jsp" %>
    <div class="container detail" align="center">
		<%for(Order_infoDTO oDTO : oList){ %>
 		<div class="shDTables" align="left" style="margin-top:10px;">
 			<div class="psyTitle" align="left" onclick="toggleFunc('<%=CmmUtil.nvl(oDTO.getReg_dt())%>');"><%=CmmUtil.nvl(oDTO.getReg_dt())%></div>
 		</div>
 		<div id="<%=CmmUtil.nvl(oDTO.getReg_dt())%>" style="display: none;">
 		</div>
 		<%} %>
 	<a href="main.do" class="psyOrderDetailBtn" >메인으로</a>
 	</div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>
</html>
