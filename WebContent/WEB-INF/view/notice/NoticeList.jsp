<!-- for Administrator -->
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.sports.util.AES256Util"%>
<%@ page import="com.sports.util.CmmUtil"%>
<%@ page import="com.sports.dto.NoticeDTO"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<%
List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");

if (nList == null) {
	nList = new ArrayList<NoticeDTO>();
}

String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));
%>

<script type="text/javascript">

		$(function() {
			var cnt = 6;
			var search ="";
	/*검색 기능*/
	// 검색어 아작스 시작
	$('#searchbox').keyup(function(){
		
		cnt = 6;
		search = $('#searchbox').val();
		
		
		$.ajax({
			url : "/notice/search.do",
			data : {'search' : search },
			method : "post",
			datatype :	"json",
			success : function(data){
				var contents ="";
				$.each(data,function (key,value) { 
					var yn = value.notice_yn;
					var nw = value.new_yn;
					contents += "<li>";
		            contents += "<div style='float:left' ><input type='checkbox' name='checkbox' class='checkbox' value='"+value.notice_no+"'/></div>";
		            contents += "<a href='/notice/NoticeInfo.do?notice_no="+value.notice_no+"'>";
		            contents += "<p class='title'>";
		      
		    	if (yn == '1') {
		            contents += "<span class='blue_text'>"+value.title+"</span>";
		        }else{
		        	contents += value.title;
		        }
		        
		        if (nw == 'Y'){ 
		            contents += "<img src='/html5/common/images/ic_new.png' alt='new' class='ic_new'>";
		         } 
		            
		        	contents += "</p>";
		            contents += "<p class='sub_text'>"+value.user_name;
		            contents += "<span>"+value.reg_dt.substring(0, 10)+"</span></p>";
		            contents += "</a>";
		            contents += "</li>";
			});// 아작스 포이치 닫음
				
				$('#list_more').html(null);
				$('#list_more').append(contents);
				var dS = document.getElementsByClassName("checkbox");
				
				for (var i =0; i<dS.length; i++) {
					dS[i].style.display = "none";
				}
					
				document.getElementById("delete").style.display = "none";
				document.getElementById("all").style.display = "none";
				document.getElementById("alltext").style.display = "none";
				
				if ((data).length < 6) {//더보기 버튼 없애기
					$("#addview").hide();
				}
				if(data.length >= 6){
					$("#searchadd").html("<center> <div id='searchadd'><button class='add_btn' id='addview'>더보기</button></div></center>");
				}
			} //아작스 success 닫음
			
		});	//아작스 닫음
		
			
		
	}); 	//검색 이벤트 닫음
	
	/* 더보기 시작 */
	<%if (nList.size() < 6) {%>
	$("#addview").hide();
<%}%>
	$("#addview").add("#searchadd").click(function() {
									
									$.ajax({
										url : "/notice/readMore.do",
										method : "post",
										data : {'cnt' : cnt , "search" : search},
										dataType : "json",
										success : function(data) {
											var contents = "";
											console.log(data)
											$.each(data,function(key, value) {
																var yn = value.notice_yn;
																var nw = value.new_yn;
																contents += "<li>";
													            contents += "<div style='float:left' ><input type='checkbox' name='checkbox' class='checkbox' value='"+value.notice_no+"'/></div>";
													            contents += "<a href='/notice/NoticeInfo.do?notice_no="+value.notice_no+"'>";
													            contents += "<p class='title'>";
													      
													    	if (yn  == '1') {
													            contents += "<span class='blue_text'>"+value.title+"</span>";
													        }else{
													        	contents += value.title;
													        }
													        
													        if (nw == 'Y'){ 
													            contents += "<img src='/html5/common/images/ic_new.png' alt='new' class='ic_new'>";
													         } 
													            
													        	contents += "</p>";
													            contents += "<p class='sub_text'>"+value.user_name;
													            contents += "<span>"+value.reg_dt.substring(0, 10)+"</span></p>";
													            contents += "</a>";
													            contents += "</li>";
											});

											$('#list_more').append(contents);
											if ((data).length < 6) {
												$('#addview').remove();
											}

											var dS = document
													.getElementsByClassName("checkbox");

											for (var i = 0; i < dS.length; i++) {
												dS[i].style.display = "none";
											}

											document.getElementById("delete").style.display = "none";
											document.getElementById("all").style.display = "none";
											document.getElementById("alltext").style.display = "none";
										} //성공 닫음
										}); //아작스 닫음
							cnt += 6;
							
							if (search == ""){//두번 실행 방지
								return false;
							}
						}); //더보기 클릭 이벤트 닫음
		})   //펑션 닫음



	
	
	
	/*  편집 삭제 버튼 숨기기 */
	function hiddenCheckbox() {
	
		
			
		var dS = document.getElementsByClassName("checkbox");

		for (var i = 0; i < dS.length; i++) {
			dS[i].style.display = "none";
		}

		document.getElementById("delete").style.display = "none";
		document.getElementById("all").style.display = "none";
		document.getElementById("alltext").style.display = "none";
		
	}
	
	/* 작성하기 유효성검사 */
	function reg(){
		var user_no =	"<%=CmmUtil.nvl(user_no)%>";
		/* if(user_no != "10000001"){
		alert("관리자만 가능합니다.");
		return false;
		} */
		
		location.href="/notice/NoticeReg.do";
	}
	
	/* 체크박스 기능 활성화 비활성화*/
	function edit(f) {
		var user_no =	"<%=CmmUtil.nvl(user_no)%>";
		/* if(user_no != "10000001"){
			alert("관리자만 가능합니다.");
			return false;
		} */
		
		
		cbox = f.checkbox;

		var dS = document.getElementsByClassName("checkbox");

		for (var i = 0; i < dS.length; i++) {
			if (dS[i].style.display == "none") {
				dS[i].style.display = "";

			} else {
				if (dS[i].style.display == "") {
					dS[i].style.display = "none";
				}
			}
		}

		if (cbox.length) { // 여러 개일 경우
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = "";
			}
		} else { // 한 개일 경우
			cbox.checked = "";
		}

		f.all.checked = "";

		
		
		if (document.getElementById("delete").style.display == "") {

			document.getElementById("delete").style.display = "none";
			document.getElementById("all").style.display = "none";
			document.getElementById("alltext").style.display = "none";

			return false;
		}

		document.getElementById("delete").style.display = "";
		document.getElementById("all").style.display = "";
		document.getElementById("alltext").style.display = "";
		
		
	}

	function deleteConfirm() {
		
		var user_no =	"<%=CmmUtil.nvl(user_no)%>";//관리자만 삭제가능
		alert("user_no :"+user_no);
		/* if(user_no != "10000001"){
			alert("관리자만 가능합니다.");
			return false;
		} */
		
		if (confirm("선택된 게시글을 삭제하시겠습니까?")) {
			document.getElementById("f").submit();
		} else {
			return;
		}

	}

	function allCheck(f) {

		cbox = f.checkbox;

		if (cbox.length) { // 여러 개일 경우
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = f.all.checked;
			}
		} else { // 한 개일 경우
			cbox.checked = f.all.checked;
		}
	}
	
</script>
	
</head>

<body onload="javascript:hiddenCheckbox();">

	<section id="wrapper" class="wrapper">
  	
  	<form name="f" id="f" method="post" action="/notice/NoticeCheckboxDelete.do"><!-- 폼 태그 시작 -->
      
    	<header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/html5/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title" style=" float: left; width: 33%;"><span class="sub_text" onclick="javascript:deleteConfirm();" id="delete">삭제하기</span>&nbsp;</div>
			<div class="page_title" style=" float: left; width: 33%;"><p>공지사항</p></div>
			<div class="page_title" style=" float: left; width: 33%;"></div>
		</header>

    	<%@include file="/html5/include/navBar.jsp"%>

    	<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
			
				<div class="search type"><input type="text" placeholder="제목 입력" id="searchbox" style="width:200px" /></div>
        		
        		<div class="list_wrap" >
          			<ul class="list-groub" id="list_more">
						<%
							for (NoticeDTO nDTO : nList) {
						%>
            			<li>
            				<div style="float:left"><input type="checkbox" name="checkbox" class="checkbox" value="<%=nDTO.getNotice_no()%>" /></div>
              				
              				<a href="/notice/NoticeInfo.do?notice_no=<%=CmmUtil.nvl(nDTO.getNotice_no())%>">
              				
              				<p class="title">
              				
              				<% if (CmmUtil.nvl(nDTO.getNotice_yn()).equals("1")) {%>
                				<span class="blue_text"><%=nDTO.getTitle()%></span>
                			<%} else {%>
                				<span><%=nDTO.getTitle()%></span>
                			<%} %>
                			
                			<% if (CmmUtil.nvl(nDTO.getNew_yn()).equals("Y")) {%>
                				<img src="/html5/common/images/ic_new.png" alt="new" class="ic_new">
                			<%} %>
                			
                			</p>
                			
                			</a>
                
                			<p class="sub_text"><%=CmmUtil.nvl(nDTO.getUser_name())%><span><%=CmmUtil.nvl(nDTO.getReg_dt().substring(0, 10))%></span></p>
            			</li>
          				<%
						}
          				%>
					</ul>
          			<label class="all_select" id="alltext" ><input type="checkbox" name="all" id="all" onclick="allCheck(this.form);" />모두 선택하기</label>
          			<div id="searchadd"><button class="add_btn" id="addview">더보기</button></div>
        		</div>
        		
        		<div class="btn-groub">
					<button class="col-2 blue-btn button" onclick="javascript:edit(this.form);return false;">편집하기</button>
					<button type="button" class="col-2 glay-btn button" onclick="javascript:reg();return false;">작성하기</button>
				</div>
				
			</div>
		</div>

	    <%@include file="/html5/include/footer.jsp"%>
		
	</form>
	
	</section>
	
	<div id="c-mask" class="c-mask"></div>
	<script src="/html5/common/js/classie.js"></script>
	<script src="/html5/common/js/common.js"></script>
	
</body>

</html>