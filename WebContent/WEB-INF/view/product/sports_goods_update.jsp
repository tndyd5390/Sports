<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sports.dto.ProductInfoDTO"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.sports.dto.ProdOptionDTO"%>
<%@ page import="java.util.Map"%>

<%
	List<ProductInfoDTO> pList = (List) request.getAttribute("pList");
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
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>

<script src="/html5/common/js/depth.js"></script>
<script type="text/javascript">
	$(function() {
		var parents = $('#parents_depth option:selected').val();
		UpSelected(parents, <%=CmmUtil.nvl(pDTO.getCategory_no())%>);
		selectDepth();
		inputFile();
		optList();
	});
	function optAlert(){
		alert("옵션은 추가 및 삭제만 가능합니다.");		
	}
	
	function delOptAjax(obj){
		if(confirm("삭제 하시겠습니까?")){
			var index = $('#opt_list [name=btn]').index(obj);
			$.ajax({
				url : 'deleteOpt.do',
				method : 'post',
				data : {'optNo' : $('#opt_no').eq(index).val()},
				success : function(data){
					console.log(data);
					$('#opt_list [name=opt_child]').eq(index).remove();
				}
			});
			return true;
		}else{
			return false;			
		}
	}

	
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
					<a href="#"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>
			<div class="page_title">
				<p>스포츠 용품</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<form name="f" id="f" action="productUpdateProc.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="pNo" value="<%=CmmUtil.nvl(pDTO.getProd_no()) %>">
				<div class="wrap search-wrap btn-wrap">
					<div class="select_wrap">
						<select class="col-2" id="parents_depth">
							<%
								for (ProductInfoDTO ppDTO : pList) {
							%>
							<option value="<%=CmmUtil.nvl(ppDTO.getCategory_no())%>" <%=CmmUtil.select(ppDTO.getCategory_no(), pDTO.getParents_no())%>><%=CmmUtil.nvl(ppDTO.getCategory_name())%></option>
							<%
								}
							%>
						</select> <select class="col-2" id="child_depth" name="category_no">
						</select>
					</div>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">제품사진</p>
								<div class="filebox bs3-primary">
									<input class="upload-name" value="<%=CmmUtil.nvl(pDTO.getMain_org_name()) %>" disabled="disabled"
										id="main_label"> <label for="main_file">업로드</label> <input
										type="file" name="files" id="main_file" class="upload-hidden">
									<input type="hidden" name="mainFileNo" value="<%=CmmUtil.nvl(pDTO.getMain_file_no()) %>">
									<input type="hidden" name="mainFileSrc" value="<%=CmmUtil.nvl(pDTO.getMain_src()) %>">
								</div>
							</li>
							<li>
								<p class="blue_text">제품명</p> <input type="text"
								name="product_name" value="<%=CmmUtil.nvl(pDTO.getProd_name())%>">
							</li>
							<li>
								<p class="blue_text">제품 가격</p> <input type="text"
								name="product_price" value="<%=CmmUtil.nvl(pDTO.getProd_price())%>">
							</li>
							<li>
								<p class="blue_text">제품 상세</p> <textarea name="product_contents"><%=CmmUtil.nvl(pDTO.getProd_contents())%></textarea>
								<div class="filebox bs3-primary">
									<input class="upload-name" value="<%=CmmUtil.nvl(pDTO.getDetail_org_name()) %>" disabled="disabled"
										id="detail_label"> <label for="detail_file">업로드</label>
									<input type="file" id="detail_file" name="files"
										class="upload-hidden">
									<input type="hidden" name="detailFileNo" value="<%=CmmUtil.nvl(pDTO.getDetail_file_no()) %>">
									<input type="hidden" name="detailFileSrc" value="<%=CmmUtil.nvl(pDTO.getDetail_src()) %>">
								</div>
							</li>
							<li>
									<p class="blue_text">옵션</p>
									<div class="select_wrap">
										<select class="select-80" id="optParents" name="code_no">
											<option value="0" selected>선택하세요</option>
										</select>
										<button type="button" class="select-btn" onclick='return optAdd()'>추가</button>
									</div> 
								<%
									if(pMap.size() == 0){
										
								%>
									<div id="opt_list">
									</div>
								<%
									}else{
								%>
									<div id="opt_list">
									<%
						              Iterator<String> keys = pMap.keySet().iterator();
						              while(keys.hasNext()){
									  String key = keys.next();        
						              List<ProdOptionDTO> poList = pMap.get(key);
						              for(ProdOptionDTO p : poList){
									%>
											<div class='input_btn_wrap' name='opt_child'>
												<input type="text" name="opt_name" value="<%=CmmUtil.nvl(p.getOpt_name())%>" onclick="optAlert()" readonly>
												<input type="text" name="opt_price" value="<%=CmmUtil.zero(p.getOpt_price()) %>" onclick="optAlert()" readonly><button type="button" class='opt-line-btn' name='btn' onclick='return delOptAjax(this)'>제거</button>
												<input type="hidden" name="opt_no" id="opt_no" value="<%=CmmUtil.nvl(p.getOpt_no())%>">
												
											</div>
									<%	}
						              }
									%>
									</div>
								<%
									}
								%>				
							
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
