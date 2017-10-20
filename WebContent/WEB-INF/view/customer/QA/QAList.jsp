<!-- for Customer -->

<%@ page import="com.sports.util.AES256Util"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="com.sports.dto.QADTO"%>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>  
<%@ page import="java.util.Date"%>  
<%@ page import="java.text.SimpleDateFormat"%>
<%
List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}

String ss_user_No = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
String ss_user_Id =  CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
String ss_user_Name =  CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
String ss_user_Auth =  CmmUtil.nvl((String)session.getAttribute("ss_user_auth"));


int access = 1;

if (ss_user_No.equals("")) {
	access = 2;
}
%>   
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="/html5/include/head.jsp" %>

<style>
	.list_wrap .list-groub .title span.hj-checkBox {
    padding-right: 5px;
    padding-left: 5px;
}

.search-wrap .search.type.hj-search {
    padding-left: 0px;
}
</style>

<script type="text/javascript">

$(function() {
	
	var cnt = 6;
	var search ="";

//검색
$('#searchbox').keyup(function() {
		
	cnt = 6;
	search = $('#searchbox').val();
		
	$.ajax({
			
		url : "/customer/QA/QASearchList.do",
		method : "post",
		data : {'search' : search},
		datatype :	"json",
		success : function(data) {
				
			var contents ="";
			console.log(data)
				
			$.each(data,function (key,value) {
					
				var nw = value.new_yn;
				var lock = value.secret_yn;				
					
				contents += "<li>";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='javascript:doAnswerDetail("+value.qa_no+","+value.secret_yn+","+value.reg_user_no+");'>"
				} else {
					contents += "<a href='javascript:doDetail("+value.qa_no+","+value.secret_yn+","+value.reg_user_no+");'>"
				}
				
				contents += "<p class='title'>";
				contents += "<span class='hj-checkBox'>"
				
				if (value.answer_yn == "Y") {
					contents += "<img src='/html5/common/images/ic_reply.png' alt='답글' class='ic_reply'>";
				}
				
				contents += value.title+"</span>";
				
				if (nw == 'Y') {	
					contents += "<img src='/html5/common/images/ic_new.png' alt='new' class='ic_new'>";
				}
				
				if (lock == '1') {
					contents += "<img src='/html5/common/images/ic_lock.png' class='ic_lock' alt='lock'>";
				}
				
				contents += "</p>";
				contents += "</a>"
				contents += "<p class='sub_text'>"+value.user_name+"<span>"+value.reg_dt+"</span></p>";
				contents += "</li>";
					
			});
				
			$('#list_more').html(null);
			$('#list_more').append(contents);
			
			if ((data).length < 6) {
				$("#addview").hide();
			}
				
			if (data.length >= 6) {
				$("#searchadd").html("<button class='add_btn' value='더보기' id='addview'>더보기</button>");
			}
				
		}
			
	});	//ajax closed
		
});	//"searchbox" function closed
	
<% if (rList.size() < 6) {%>
	$("#addview").hide();
<%} %>

//더보기
$("#addview").add("#searchadd").click(function() {
	
	$.ajax({

		url : "/customer/QA/QAReadMore.do",
		method : "post",
		data : {'cnt' : cnt, 'search' : search},
		dataType : "json",
		success : function(data) {
			
			var contents = "";
			console.log(data)
			
			$.each(data,function (key,value) {
				
				var nw = value.new_yn;
				var lock = value.secret_yn;
				
				contents += "<li>";
				
				if (value.answer_yn == "Y") {
					<%--contents += "<a href='/customer/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";--%>
					contents += "<a href='javascript:doAnswerDetail("+value.qa_no+","+value.secret_yn+","+value.reg_user_no+");'>"
				
				} else {
					<%--contents += "<a href='/customer/QA/QADetail.do?qa_no="+value.qa_no+"'>";--%>
					contents += "<a href='javascript:doDetail("+value.qa_no+","+value.secret_yn+","+value.reg_user_no+");'>"
				}
				
				contents += "<p class='title'>"
				contents += "<span class='hj-checkBox'>"
				
				if (value.answer_yn == "Y") {
					contents += "<img src='/html5/common/images/ic_reply.png' alt='답글' class='ic_reply'>";
				}
				
				contents += value.title+"</span>";
				
				if (nw == 'Y') {	
					contents += "<img src='/html5/common/images/ic_new.png' alt='new' class='ic_new'>";
				}
				
				if (lock == '1') {
					contents += "<img src='/html5/common/images/ic_lock.png' class='ic_lock' alt='lock'>";
				}
				
				contents += "</p>"
				contents += "</a>"
				contents += "<p class='sub_text'>"+value.user_name+"<span>"+value.reg_dt+"</span></p>";
				contents += "</li>"
				
			});
			
			$('#list_more').append(contents);
			
			if ((data).length<6) {
				$('#addview').remove();
			}
			
		}
	
	});	//ajax closed
	
	cnt += 6;
	
});	//"addview" function closed

});	//jQuery function closed

//질문 상세 이동
function doDetail(qa_no, secret_yn, reg_user_no) {
	
	var ss_user_no = "<%=ss_user_No %>";
	
	if (reg_user_no != ss_user_no && secret_yn == 1) {
		
		alert('비밀글입니다.');
		return;
		
	}
	
	location.href="/customer/QA/QADetail.do?qa_no=" + qa_no;
	
}

//답글 상세 이동
function doAnswerDetail(qa_no, secret_yn, reg_user_no, parent_user_no) {
	
	console.log("1");
	var ss_user_no = "<%=ss_user_No %>";
	console.log("ss_user_no : " + ss_user_no);
	console.log("parent_user_no : " + parent_user_no);
	var q_no 
	
	console.log("2");
	console.log("reg_user_no: " + reg_user_no);
	console.log("ss_user_no: " + ss_user_no);
	console.log("secret_yn: " + secret_yn);
	
	if (parent_user_no != ss_user_no && secret_yn == 1) {
		
		alert('비밀글입니다.');
		return;
		
	}
	
	location.href="/customer/QA/QAAnswerDetail.do?qa_no=" + qa_no;
	
}

//글쓰기 로그인
function doReg() {
	
	if ("<%=access %>"==2) {
		
		alert("로그인을 하시기 바랍니다.");
	
	} else {
		
		location.href="/customer/QA/QAReg.do";
		
	}
	
}

</script>

</head>

<body>

	<section id="wrapper" class="wrapper">
	
	    <header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title"><p>Q&amp;A</p></div>
		</header>
<%@include file="/html5/include/navBar.jsp" %>

		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
			
				<div class="search type hj-search">
					<input type="text" placeholder="글 제목을 입력해주세요." id="searchbox" style="width:100%" />
				</div>
	
				<div class="list_wrap">
					<ul class="list-groub" id="list_more">
						<%
							for (QADTO rDTO : rList) {
		
							if (rDTO==null) {
								rDTO = new QADTO();
							}
						%>
			            <li>
							<% if (CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")) {%>
							
								<a href="javascript:doAnswerDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>','<%=CmmUtil.nvl(rDTO.getSecret_yn())%>','<%=CmmUtil.nvl(rDTO.getReg_user_no())%>','<%=CmmUtil.nvl(rDTO.getParent_user_no())%>');">
								
								<p class="title">
								
								<img src="/html5/common/images/ic_reply.png" alt="답글" class="ic_reply">
				
								<span><%=CmmUtil.nvl(rDTO.getTitle()) %></span>
								
								<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {%>
									<img src="/html5/common/images/ic_lock.png" class="ic_lock" alt="lock">
								<%} %>
					
								<% if (CmmUtil.nvl(rDTO.getNew_yn()).equals("Y")) {%>
									<img src="/html5/common/images/ic_new.png" alt="new" class="ic_new">
								<%} %>
								
								</p>
								
								</a>
								
							<%} else {%>
								
								<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>','<%=CmmUtil.nvl(rDTO.getSecret_yn())%>','<%=CmmUtil.nvl(rDTO.getReg_user_no())%>');">
								
								<p class="title">
								
								<span><%=CmmUtil.nvl(rDTO.getTitle()) %></span>
								
								<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {%>
									<img src="/html5/common/images/ic_lock.png" class="ic_lock" alt="lock">
								<%} %>
								
								<% if (CmmUtil.nvl(rDTO.getNew_yn()).equals("Y")) {%>
									<img src="/html5/common/images/ic_new.png" alt="new" class="ic_new">
								<%} %>
								
								</p>
								
								</a>
								
							<%} %>
								
							<p class="sub_text"><%=CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")?"운영자":CmmUtil.nvl(rDTO.getUser_name()) %><span><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10)) %></span></p>
			            </li>
						<%
						}
						%>
		          	</ul>
					<div id="searchadd"><button class="add_btn" value="더보기" id="addview">더보기</button></div>
		        </div>
			            			
		        <div class="btn-groub">
		        	<% if (!ss_user_no.equals("")) {%>
					<button class="col-3 glay-btn button" onclick="javascript:doReg();return false;"></button>
					<button class="col-3 glay-btn button" onclick="javascript:doReg();return false;">작성하기</button>
					<button class="col-3 glay-btn button" onclick="javascript:doReg();return false;"></button>				
					<%} %>
				</div>
		        
			</div>
		</div>
	
	</form>	

	</section>
 <%@include file="/html5/include/footer.jsp" %>
  
</body>

</html>