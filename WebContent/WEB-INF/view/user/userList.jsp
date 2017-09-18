<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<style>
</style>
<script>
var readMore = 10;

$(function(){
	userList();
})
function userList(){
	var contents ="";
	var more = "";
	$.ajax({
		url : 'userListProc.do',
		method : 'post',
		success : function(data){
			$.each(data, function(key, value){
				contents += "<ul class='col-5'>";
				contents += "<li><p><input type='checkbox' class='chkbox'></p></li>";
				contents += "<li><p>"+value.user_no+"</p></li>";
				contents += "<li><p><a href='userDetail.do?uNo="+value.user_no+"'>"+value.user_id+"</a></p></li>";
				contents += "<li><p>"+value.user_name+"</p></li>";
				contents += "<li><p>"+value.auth+"</p></li>";
				contents += "</ul>";
			})
			if(data[0].count>10){
			more += "<div class='more-type' id='more-type'>";
			more += "<a href='#' class='moremore' onclick='moreUserList(); return false;'>더보기</a>";
			more += "</div>";
			}
			$('#userList').html(contents);
			$('#more-div').html(more);
			contents="";
			more = "";
		}
	})
}
function moreUserList(){
	var contents ="";
	var more = "";
	$.ajax({
		url : 'moreUserListProc.do',
		method : 'post',
		data : {'readMore' : readMore},
		success : function(data){
			$.each(data, function(key, value){
				contents += "<ul class='col-5'>";
				contents += "<li><p><input type='checkbox' class='chkbox'></p></li>";
				contents += "<li><p>"+value.user_no+"</p></li>";
				contents += "<li><p><a href='userDetail.do?uNo="+value.user_no+"'>"+value.user_id+"</a></p></li>";
				contents += "<li><p>"+value.user_name+"</p></li>";
				contents += "<li><p>"+value.auth+"</p></li>";
				contents += "</ul>";
			})
			if(data[0].count>10){
			more += "<div class='more-type' id='more-type'>";
			more += "<a href='#' class='moremore' onclick='moreUserList(); return false;'>더보기</a>";
			more += "</div>";
			}
			$('#userList').append(contents);
			$('#more-div').html(more);
			contents="";
			more = "";
			readMore += 10;		
		}
	})
}
function doSearch(){
	var contents ="";
	var more = "";
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
						contents += "<li><p><a href='userDetail.do?uNo="+value.user_no+"'>"+value.user_id+"</a></p></li>";
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
					<ul class="menulist">
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
			<div id="more-div">
			<!-- 	<div class="more-type">
				<a href="#" class="moremore">더보기</a>
			</div> -->
			</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>
</html>