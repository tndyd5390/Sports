<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<script>
var contents = "";
var certiCheck = false;
	$(function(){
		certiCheck = false;
		idSearch();
		
	})
	function idSearch(){
		contents = "";
		contents += "<form method='post' name='f' id='f' action='idSearch.do' onsubmit='return doSubmit(this)'>";
		contents += "<ul class='register_list'>";
		contents += "<li><p class='blue_text'>이름</p><input type='text' name='name' id='name'></li>";
		contents += "<li><p class='blue_text'>이메일</p>";
		contents += "<div class='input_btn_wrap'>";
		contents += "<input type='email' name='email' id='email'>";
		contents += "<input type='button' class='line-btn' onclick='return doCertify();' value='인증'></div>"
		contents += "</li>";
		contents += "<li><p class='blue_text'>인증번호</p><input type='text' name='code' id='code'></li>"
		contents += "<hr>";
		contents += "<li><center>";
		contents += "<button class='btn btn-primary width100'>확인</button>";
		contents += "</center></li>";
		contents += "</ul>";
		contents += "</form>";
		$('#list').html(contents);
	}
	function pwSearch(){
		contents = "";
		certiCheck = false;
		contents += "<form method='post' name='f' id='f' action='pwSearch.do' onsubmit='return doSubmit(this)'>";
		contents += "<ul class='register_list'>";
		contents += "<li><p class='blue_text'>아이디</p><input type='text' name='id' id='id'></li>";
		contents += "<li><p class='blue_text'>이름</p><input type='text' name='name' id='name'></li>";
		contents += "<li><p class='blue_text'>이메일</p>";
		contents += "<div class='input_btn_wrap'>";
		contents += "<input type='email' name='email' id='email'>";
		contents += "<input type='button' class='line-btn' onclick='return doCertify();' value='인증'></div>"
		contents += "</li>";
		contents += "<li><p class='blue_text'>인증번호</p><input type='text' name='code' id='code'></li>"
		contents += "<hr>";
		contents += "<li><center>";
		contents += "<button class='btn btn-primary width100'>확인</button>";
		contents += "</center></li>";
		contents += "</ul>";
		contents += "</form>";
		$('#list').html(contents);
	}
	
	function doSubmit(f){
		var email = $('#email');
		var name = $('#name');
		var code = $('#code');
		if(email.val()==""){
			alert('이메일을 입력해주세요');
			email.focus();
			return false;
		}else if(name.val()==""){
			alert('이름을 입력해주세요');
			name.focus();
			return false;
		}else if(code.val() == ""){
			alert('인증번호를 입력해주세요.');
			code.focus();
			return false;
		}else if(certiCheck == false){
			alert('인증번호를 발급 받아주세요.');
			code.focus();
			return false;
		}else{
			f.submit();
			return true;
		}
	}
	
	function doCertify(){
		var name = $('#name');
		var email = $('#email');
		if(name.val() == ""){
			alert('이름을 입력해주세요.');
			name.focus();
			return false;
		}else if(email.val()==""){
			alert('이메일을 입력해주세요.');
			email.focus();
			return false;
		}else{
			$.ajax({
				url : 'certify.do',
				method : 'post',
				data : {'email' : email.val(),
						'name' : name.val() },
				success : function(data){
					alert('인증번호가 전송되었습니다.');
					certiCheck = true;
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
				<p><a href="#" onclick="idSearch();">아이디</a> / <a href="#" onclick="pwSearch();">비밀번호</a> 찾기</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="list_wrap" id='list'>
				
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
	</section>
</body>
</html>
