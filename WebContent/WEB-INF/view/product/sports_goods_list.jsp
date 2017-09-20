<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.sports.util.CmmUtil" %>
<%@ page import = "com.sports.dto.ProductInfoDTO" %>
<%
	List<ProductInfoDTO> pList = (List) request.getAttribute("pList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
<style>
div.col-2-group{
	margin-top :10px;
	width : 100%;
	height: 40px;
}
div.col-2-group a{
	display: inline-block;
 	width : 50%;
 	height: 100%;
 	font-size : 20px;
 	text-align : center;
 	line-height: 42px;
}
div.col-2-group a:nth-child(1){
	border-right : 2px solid #F5F5F5;
	background-color : #1777CB;
	color : #fff;
}
div.col-2-group a:nth-child(2){
	border-left : 2px solid #F5F5F5;
	background-color : #9E9E9E;
	color : #fff;
}

</style>
<script type="text/javascript">
	$(function(){
		prodList();
		
	});
	function prodReg(){
		location.href="productReg.do";
	}
	function prodDetail(pNo){
		location.href="productDetail.do?pNo="+pNo
	}
	
	function prodList(){
		var contents = "";
		$.ajax({
			url : 'productAll.do',
			method : 'post',
			success : function(data){
				$.each(data, function(key, value){
					contents += "<li>";
					contents += "<a href='#' onclick='prodDetail("+value.prod_no+"); return false;'>";
					contents += "<div class='thumb'>";
					contents += "<img src='"+value.src_filename+"' alt='thumb'>";
					contents += "</div>";
					contents += "<div class='info'>";
					contents += "<p class='title'>"+value.prod_name+"</p>";
					contents += "<p class='price edit'>"+value.prod_price+"</p>"
					contents += "</div>"
					contents += "</a>";
					contents += "</li>";
				});
				$('#goods_list').html(contents);
			}
		});
	}
	
	function prodSelect(pNo){
		var contents = "";
		$.ajax({
			url : 'productSelect.do',
			method : 'post',
			data : {'pNo' : pNo},
			success : function(data){
				$.each(data, function(key, value){
					contents += "<li>";
					contents += "<a href='#' onclick='prodDetail("+value.prod_no+"); return false;'>";
					contents += "<div class='thumb'>";
					contents += "<img src='"+value.src_filename+"' alt='thumb'>";
					contents += "</div>";
					contents += "<div class='info'>";
					contents += "<p class='title'>"+value.prod_name+"</p>";
					contents += "<p class='price edit'>"+value.prod_price+"</p>"
					contents += "</div>"
					contents += "</a>";
					contents += "</li>";
				});
				$('#goods_list').html(contents);
			}
		});
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
      <div class="wrap search-wrap">
        <div class="search array">
          <button class="array-btn"><img src="html5/common/images/ic_array.png" alt="정렬이미지"></button>
          <input type="text" placeholder="검색하세요">
          <button class="blue btn">검색</button>
        </div>

        <div class="list_wrap">
          <ul class="sports_list">
          	<li><a href="#" onclick="prodList()">전체</a></li>
          <%for(ProductInfoDTO pDTO : pList){%>
			<li><a href="#" onclick="prodSelect(<%=CmmUtil.nvl(pDTO.getCategory_no())%>)"><%=CmmUtil.nvl(pDTO.getCategory_name())%></a></li>
          <% }%>
		 </ul>
        </div>
        <div class="goods_list_wrap">
          <ul class="goods_list" id="goods_list">
<!--             <li>
              <a href="#">
              <div class="thumb">
                <img src="html5/common/images/sample01.png" alt="thumb">
              </div>
              <div class="info">
                <p class="title">한국스포츠 KSD 태권도 품 도복 (아동) TKD POOM Uniform (Child) </p>
                <p class="price register">30,000원</p>
              </div>
              </a>
            </li>
            <li>
              <a href="#">
              <div class="thumb">
                <img src="html5/common/images/sample02.png" alt="thumb">
              </div>
              <div class="info">
                <p class="title">한국스포츠 KSD 태권도 품 도복 (아동) TKD POOM Uniform (Child) </p>
                <p class="price edit">30,000원</p>
                </div>
              </a>
             </li>
 -->         
 			</ul>
          <div id ="more-div">
          	<div class="more-type">
				<a href="#" class="moremore">더보기</a>
			</div>
			<div class="col-2-group">
				<a href="#" onclick="prodReg(); return false;">등록</a>
				<a href="#" >삭제</a>
			</div>
          </div>
        </div>
        </div>
      </div>
    </section>
 <%@include file="/html5/include/footer.jsp" %>
</body>

</html>
