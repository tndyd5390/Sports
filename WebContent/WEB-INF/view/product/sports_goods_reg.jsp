<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sports.dto.ProductInfoDTO" %>
<%@ page import="com.sports.util.CmmUtil" %>
<%
if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_user_no")))) response.sendRedirect("pleaseLogin.do");
	List<ProductInfoDTO> pList = (List) request.getAttribute("pList");
%>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<script src="/html5/common/js/depth.js"></script>
<script type="text/javascript">
	$(function() {
		optList();
		var parents = $('#parents_depth option:selected').val();
		selected(parents);
		selectDepth();
		inputFile();
	});
</script>
</head>
<body>
	<section id="wrapper" class="wrapper">
		<header class="header">
			<div class="wrap">
				<div class="left_menu">
					<img src="html5/common/images/btn_gnb.png" alt="메뉴"
						id="c-button--slide-left" class="c-button">
				</div>
				<div class="logo">
					<a href="/main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>
			<div class="page_title">
				<p>스포츠 용품</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
		<form name="f" id="f" action="productRegProc.do" method="post" enctype="multipart/form-data" >
			<div class="wrap search-wrap btn-wrap">
				<div class="select_wrap">
					<select class="col-2" id="parents_depth">
					<%for(ProductInfoDTO pDTO : pList){%>
						<option value="<%=CmmUtil.nvl(pDTO.getCategory_no())%>"><%=CmmUtil.nvl(pDTO.getCategory_name()) %></option>					
					<%}%>
					</select> 
					<select class="col-2" id="child_depth" name="category_no">
					</select>
				</div>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">제품사진</p>
								<div class="filebox bs3-primary">
									<input class="upload-name" value="파일선택" disabled="disabled" id="main_label">
									<label for="main_file">업로드</label> <input type="file" name="files" id="main_file" class="upload-hidden">
								</div>
							</li>
							<li>
								<p class="blue_text">제품명</p> <input type="text" name="product_name">
							</li>
							<li>
								<p class="blue_text">제품 가격</p> <input type="text" name="product_price">
							</li>
							<li>
								<p class="blue_text">제품 상세</p> <textarea name="product_contents"></textarea>
								<div class="filebox bs3-primary">
									<input class="upload-name" value="파일선택" disabled="disabled" id="detail_label">
									<label for="detail_file">업로드</label> <input type="file"
										id="detail_file" name="files" class="upload-hidden">
								</div>
							</li>
							<li>
								<p class="blue_text">옵션</p>
								<div class="select_wrap">
									<select class="select-80" id="optParents" name="opt_parents">
										<option value="0" selected>선택하세요</option>
									</select>
									<button type="button" class="select-btn" onclick='return optAdd()'>추가</button>
								</div> 
								<div id="opt_list">
								</div>
							</li>
						</ul>

					</div>
					<div class="btn-groub">
						<button type="submit" class="col-2 blue-btn button">등록</button>
						<button type="button" class="col-2 glay-btn button">수정</button>
					</div>
			</div>
		</form>	
		</div>
		<%@include file="/html5/include/footer.jsp"%>
		</section>
</body>
</html>
