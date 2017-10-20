 <%@page import="com.sports.util.TextUtil"%>
<%@page import="com.sports.dto.Basket_OptionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sports.dto.BasketDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
	List<BasketDTO> bList = (List<BasketDTO>)request.getAttribute("bList");
	int totalProdPrice = 0;
	if(bList == null){
		bList = new ArrayList<BasketDTO>();
	}
	if(bList.size() == 0){
		response.sendRedirect("noBasketItem.do");
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
ul.list-groub li .checkbox {
    width:20px;
    height:20px;
    top:7px;
}

.list_wrap .list-groub p.chy-title{
	margin:0 0 0px;
	padding-bottom:0px;
}

div.chy-margin{
	margin-left:7px;
}

p.chy-text{
	margin:0 0 0px;
}

span.chy-price{
	float: right;
	font-size: 20px;
	font-weight: bold;
	color: black;
}

a.chy-btn{
	height :25px;
	width: 70px;
	font-size: 11px;
	border-radius: 0px;
	float: right;
}

p.chy-count{
	float:right;
	display:grid;
	clear:right;
}

span.chy-plus {
    font-size: 17px;
    font-weight: bold;
    color: #1777CB;
}

li.chy-head{
	background-color: white;
}

div.chy-result{
	width: 100%;
	height:50px;
	border:1px solid #9E9E9E;
	border-radius: 10px;
}

p.chy-totalPrice{
	font-weight: bold;
	color: #9E9E9E;
}

span.chy-totalPrice2{
	float: right;
}

p.chy-payPrice{
	font-size: 17px;
	font-weight: bold;
	color:black;
}

span.chy-payPrice2{
	float:right;
	color:#1777CB;
}
div.chy-wrap{
	margin-bottom:0px;
}

.container div.chy-wrap2 {
    padding: 0px; 
    padding-bottom:80px;
}

span.chy-plus2{
	padding-right: 10px;
}

.list_wrap .notice,.psyNotice{
	height: 135px;
}
</style>
<%@include file="/html5/include/head.jsp" %>
<script type="text/javascript">
	function doSettlement(){
		var totalProdPrice = $('#totalProdPrice').text();
		totalProdPrice = unComma(totalProdPrice.slice(0, -1));

		var params = {
			'userNo' : '<%=(String)session.getAttribute("ss_user_no")%>',
			'totalProdPrice' : totalProdPrice
		};

		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "customerOrderView.do");
		
		for(var key in params){
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);
			form.appendChild(hiddenField);
		}
		document.body.appendChild(form);
		form.submit();
	}
	
	function addComma(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function unComma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	function customerBasketDeleteOne(bskNo){
		var totalProdPrice = 0;
		$.ajax({
			url : "customerBasketDeleteOne.do",
			data : {
				'bskNo' : bskNo
			},
			method : "post",
			success : function(data){
				console.log(data);
				var contents = "";
				$.each(data, function(key, value){
					totalProdPrice += parseInt(value.bsk_price);
					contents += "<li class='notice psyNotice'>";
					contents += "<p class='title chy-title'>" + value.prod_name + "</p>"; 
					var optionString = "옵션 : ";
					if(value.bskOptList.length > 0){
						if(value.bskOptList.length == 1){
							optionString = value.bskOptList[0].opt_kind + "&nbsp;&nbsp;" + value.bskOptList[0].opt_name;
						}else{
							optionString = value.bskOptList[0].opt_kind + "&nbsp;&nbsp;" + value.bskOptList[0].opt_name;
							for(var i = 1; i< value.bskOptList.length; i++){
								optionString = optionString + "&nbsp;,&nbsp;" + value.bskOptList[i].opt_kind + "&nbsp;&nbsp;" + value.bskOptList[i].opt_name; 
							}
						}
					}
					contents += "<p class='sub_text'>" + optionString + "<span class='chy-price'>" + value.bsk_price + "</span></p>";
					contents += "<p class='chy-count'>수량 : " + value.prod_qty;
					contents += "<a class='btn btn-default chy-btn' style='display: inline;' onclick='customerBasketDeleteOne(" + value.bsk_no + ");'>삭제</a>";
					contents += "</div>";
					contents += "</li>";
				})
				contents += "<li class='chy-bottom'>";
				contents += "<p class='chy-totalPrice'>총 상품가격<span class='chy-totalPrice2'>" + addComma(totalProdPrice) + "원</span></p>";
				contents += "<p class='chy-totalPrice'>총 배송비<span class='chy-totalPrice2'><span class='glyphicon-plus chy-plus2'></span>3,000원</span></p>";
				contents += "<p class='chy-payPrice'>총 결제 예상금액 <span class='chy-payPrice2' id='totalProdPrice'>" + addComma(totalProdPrice + 3000) + "원</span></p>";
				contents += "</li>";
				$('#forAjax').html(contents);
			}
		})
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
		<p>장바구니</p>
	</div>
</header>
   
<%@include file="/html5/include/navBar.jsp" %>

    <div class="container detail">
      <div class="wrap chy-wrap2 search-wrap btn-wrap">
        <div class="list_wrap chy-wrap">
          <ul class="list-groub" id="forAjax">
          	<%
          	for(BasketDTO bDTO : bList){
          		String optionString = "";
          		totalProdPrice += Integer.parseInt(bDTO.getBsk_price());
          	%>
            <li class="notice psyNotice">
              	<div class="chy-margin">
                	<p class="title chy-title"><%=bDTO.getProd_name() %></p>
                	<%
                	if(bDTO.getBskOptList().size() > 0){
                		optionString += "옵션 : ";
                		if(bDTO.getBskOptList().size() ==1){
		                	optionString += bDTO.getBskOptList().get(0).getOpt_kind() + "&nbsp;&nbsp;" + bDTO.getBskOptList().get(0).getOpt_name();
                		}else{
                			List<Basket_OptionDTO> boList = bDTO.getBskOptList();
                			optionString += boList.get(0).getOpt_kind() + "&nbsp;&nbsp;" + boList.get(0).getOpt_name();
                			for(int i = 1 ; i< boList.size() ; i++){
                				optionString = optionString + "&nbsp;,&nbsp;" + boList.get(i).getOpt_kind() + "&nbsp;&nbsp;" + boList.get(i).getOpt_name();
                			}
                		}
                	}
                	%>
                	<p class="sub_text"><%=optionString %><span class="chy-price"><%=bDTO.getBsk_price() %></span></p>
            		<p class="chy-count">수량 : <%=bDTO.getProd_qty() %> 
            		<a class="btn btn-default chy-btn" style="display: inline;" onclick="customerBasketDeleteOne(<%=bDTO.getBsk_no()%>);">삭제</a>
            	</div>	
            </li>
            <%} %>
            <li class="chy-bottom">
            	<p class="chy-totalPrice">총 상품가격<span class="chy-totalPrice2"><%=TextUtil.addComma(totalProdPrice) %>원</span></p>
            	<p class="chy-totalPrice">총 배송비<span class="chy-totalPrice2"><span class="glyphicon-plus chy-plus2"></span>3,000원</span></p>
            	<p class="chy-payPrice">총 결제 예상금액 <span class="chy-payPrice2" id="totalProdPrice"><%=TextUtil.addComma(totalProdPrice + 3000) %>원</span></p>
            </li>
          </ul>
        </div>
        <div class="btn-groub">
        <%if(bList.size() != 0){ %>
          <button class="blue-btn button" style="width:100%" onclick="doSettlement();">구매하기</button>
        <%} %>
        </div>
      </div>
    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>
</html>
