<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<style>
.more-type{
	background : #1777cb;
	height : 40px;
	text-align : center;
}
.moremore{
	display: inline-block;
	width:100%;
	height: 100%;
	color : #fff;
	font-size : 20px;
	line-height: 42px;
}
.menu_list>li {
  background: #1777cb;
  text-align: center;
}
.menu_list>li ul {
  background: #fff;
  font-size: 0;
  text-align: left;
}
.menu_list>li ul li {
  display: inline-block;
}
.menu_list>li ul.theader li {
  text-align: center;
  width: 26.6%;
  height: 36px;
  border-bottom: 1px solid #ffffff;
  border-right: 1px solid #ffffff;
  background-color : #1777cb;
}
.menu_list>li ul.theader li:nth-child(1) {
  text-align: center;
  width: 10%;
  height: 36px;
}
.menu_list>li ul.theader li:nth-child(2) {
  text-align: center;
  width: 10%;
  height: 36px;
}
.menu_list>li ul.theader li p {
  font-size: 15px;
  color: #ffffff;
  line-height: 36px;
  display: inline-block;
}
.menu_list>li ul.col-5 li {
  text-align: center;
  width: 26.6%;
  height: 36px;
  border-bottom: 1px solid #bcbcbc;
  border-right: 1px solid #bcbcbc;
}
.menu_list>li ul.col-5 li:nth-child(1) {
  text-align: center;
  width: 10%;
  height: 36px;
}
.menu_list>li ul.col-5 li:nth-child(2) {
  text-align: center;
  width: 10%;
  height: 36px;
}
.menu_list>li ul.col-5 li p {
  font-size: 15px;
  color: #222;
  line-height: 36px;
  display: inline-block;
}
.menu_list>li input.chkbox {
	width : 17px;
	height : 17px;
}
@media screen and (max-width: 413px) {
	.menu_list>li ul.theader li p{
		font-size: 12px;
	}
	.menu_list>li ul.col-5 li p{
		font-size: 11px;
	}
}
</style>
<script>
$(function(){
	
	userList();
})
function userList(){
	var contents ="";
	$.ajax({
		url : 'userListProc.do',
		method : 'post',
		success : function(data){
			$.each(data, function(key, value){
				contents += "<ul class='col-5'>";
				contents += "<li><p><input type='checkbox' class='chkbox'></p></li>";
				contents += "<li><p>"+value.user_no+"</p></li>";
				contents += "<li><p><a href='#'>"+value.user_id+"</a></p></li>";
				contents += "<li><p>"+value.user_name+"</p></li>";
				contents += "<li><p>"+value.auth+"</p></li>";
				contents += "</ul>";
			})
			$('#userList').html(contents);
			contents="";
		}
	})
}
function doSearch(){
	var contents ="";
	var searchType = $('#searchType').val();
	var searchValue = $('#searchValue').val();
	if(searchValue == ""){
		userList()
	}else{
	$.ajax({
		url : 'userListSearch.do',
		method : 'post',
		data : {'type' : searchType,
				'value' : searchValue},
		success : function(data){
					$.each(data, function(key, value){
						contents += "<ul class='col-5'>";
						contents += "<li><p><input type='checkbox' class='chkbox'></p></li>";
						contents += "<li><p>"+value.user_no+"</p></li>";
						contents += "<li><p><a href='#'>"+value.user_id+"</a></p></li>";
						contents += "<li><p>"+value.user_name+"</p></li>";
						contents += "<li><p>"+value.auth+"</p></li>";
						contents += "</ul>";
					})
					$('#userList').html(contents);
					contents="";					
			}
	})
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
					<a href="main.do"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>

			<div class="page_title">
				<p>회원 관리</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="search type">
					<select class="search_type" id="searchType">
						<option value="name">이름</option>
						<option value="id">아이디</option>
					</select> <input type="text" id="searchValue" onkeyup="doSearch()">
				</div>
				<div>
					<ul class="menu_list">
						<li>
							<ul class="theader">
								<li>
									<p>
										<input type="checkbox" class="chkbox">
									</p>
								</li>
								<li><p>번호</p></li>
								<li><p>ID</p></li>
								<li><p>이름</p></li>
								<li><p>권한</p></li>								
							</ul>
<!-- 							<ul class="col-5">
								<li><p><input type="checkbox" class="chkbox"></p></li>
								<li><p>1</p></li>
								<li><p><a href="#">kopokangseo</a></p></li>
								<li><p>데이터분석</p></li>
								<li><p>운영자</p></li>
							</ul>
 -->						<div id="userList">
 
							</div>
 						</li>
					</ul>
				</div>
			<div class="more-type">
				<a href="#" class="moremore">더보기</a>
			</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>
</html>