<%@page import="com.sports.dto.AcademyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<AcademyDTO> aList = (List<AcademyDTO>)request.getAttribute("aList");
if(aList == null){
	aList = new ArrayList<AcademyDTO>();
}
%>
<script type="text/javascript">
	/* $(function() {
		var cnt = 6;
		var search = ""; */
	/*검색 기능*/
	//검색어 아작스 시작
	/* $('#searchbox').keyup(function(){
		cnt = 6;
		search = $('#searchbox').val();
		
		$.ajax({
			url : "search.do:",
			data : {'search' : search},
			method : "post",
			datatype : "json",
			success : function(data){
				var contents = "";
				$.each(data, function (key, value) {
					contents += "<li>";
					contents += "<ul>";
					contents += "<li><a href='accountDetail.do?aca_no="+value.aca_no+"'>"+aca_name+"</a></li>";
                	contents += "<li>"+aca_ceo+"</li>";
                	contents +=	"<li>"+tel+"</li>";
                	contents +=	"<li>"+aca_area2+"</li>";
                	contents += "</ul>";
                	contents += "</li>";
				}); //아작스 포이치 닫음
				
				$('#list_more').html(null);
				$('#list_more').append(contents);
				
				if ((data).length < 6) {//더보기 버튼 없애기
					$("#addview").hide();
				}
				if(data.length >= 6){
					$("#searchadd").html("<center> <div id='searchadd'><button class='add_btn' id='addview'>더보기</button></div></center>");
				}
			} //아작스 success 닫음
		}); //아작스 닫음
		
	}); */ //검색이벤트 닫음
	
	/* 더보기 시작 */
		var cnt = 6;
	function moreview() {
		var search = ""; 
		
		$.ajax({
			url : "readMore.do",
			method : "post",
			data : {'cnt' : cnt, "search" : search},
			dataType : "json",
			success : function(data) {
				var contents = "";
				console.log(data)
				$.each(data, function(key, value) {
					contents += "<li>";
					contents += "<ul>";
					contents += "<li><a href='accountDetail.do?aca_no="+value.aca_no+"'>"+value.aca_name+"</a></li>";
                	contents += "<li>"+value.aca_ceo+"</li>";
                	contents +=	"<li>"+value.tel+"</li>";
                	contents +=	"<li>"+value.aca_area2+"</li>";
					contents += "</ul>";
					contents += "</li>";
				});
				
				$('#ulTable').append(contents);
				if ((data).length < 6 ) {
					$('#addview').remove();
				}
				
			} //성공
		}); //아작스 닫음
		cnt += 6;
		
		if (search == "") { //두번 실행 방지
			return false;
		}
	}
	
	/* }) //function 닫음 */


</script>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>
<!-- Styles : sanghoon Kim-->
<link rel="stylesheet" href="/html5/common/css/sangAccount.css">

</head>

<body >
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
        	<p>거래처관리</p>
      	</div>
	</header>

<%@include file="/html5/include/navBar.jsp" %>
	<div class="container detail">
    <div align="center">
		<select class="shSelect">
        	<option value=""> 서울 </option>
        	<option value=""> 경기도 </option>
        	<option value=""> 강원도 </option>
        	<option value=""> 충청북도 </option>
        	<option value=""> 충청남도 </option>
        	<option value=""> 경상북도 </option>
        	<option value=""> 전라북도 </option>
        	<option value=""> 전라남도 </option>
        	<option value=""> 경상남도 </option>
        	
    	</select>
    	
    	<select class="shSelect">
        	<option value=""> hi </option>
        	<option value="">  </option>
        	<option value=""> 돌려요 </option>
        	<option value=""> .....ㅎ </option>
    	</select>
    
    <input type="text" class="shInputText" id="searchbox">
    <button class="shBtn">검색</button>
    
    


      <div id="mainWrapper">
        <ul>
            <li>
                <ul id ="ulTable">
                   
                    <li>
                        <ul>
                            <li>거래처명</li>
                            <li>대표자명</li>
                            <li>전화번호</li>
                            <li>위치</li>
                        </ul>
                    </li>
                    <%
                    	for (AcademyDTO aDTO : aList) {
                    %>
                    <li>
                    	<ul>
                    		<li><a href="accountDetail.do?aca_no=<%=CmmUtil.nvl(aDTO.getAca_no()) %>"><%=CmmUtil.nvl(aDTO.getAca_name()) %></a></li>
                    		<li><%=CmmUtil.nvl(aDTO.getAca_ceo()) %></li>
                    		<li><%=CmmUtil.nvl(aDTO.getTel()) %></li>
                    		<li><%=CmmUtil.nvl(aDTO.getAca_area2()) %></li>
                    	</ul>
                    </li>
                    <%} %>
                </ul>
            </li>
        </ul>
        </div>
    <%if (aList.size() >= 6){ %>
    <div id="searchadd"><button class="add_btn" id="addview" onclick="moreview()">더보기</button></div>
    <%} %>
    </div>
	<div align="center">
		<a href="accountReg.do"><button class="btn btn-primary width100">등록</button></a>
	</div>
    </div>
    
    </section>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>