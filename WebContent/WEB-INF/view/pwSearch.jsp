<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.sports.dto.UserDTO" %>
<%@ page import = "com.sports.util.CmmUtil" %>
<% UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<script>
function doSubmit(f){
	var password = $('#password');
	var passwordCheck = $('#passwordCheck');
	if(passwordCheck.val() == ""){
		alert("비밀번호를 입력해주세요.");
		id.focus();
		return false;
	}else if(passwordCheck.val()==""){
		alert("비밀번호 재확인을 입력해주세요.");
		password.focus();
		return false;
	}else if(password.val()!=passwordCheck.val()){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
		return false;		
	}else{
		if(confirm("변경 하시겠습니까?")){
			f.submit();
			return true;
		}else{
			return false;
		}
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
				<p>비밀번호 변경</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="list_wrap">
				<form method="post" name="f" id="f" action="pwSearchProc.do" onsubmit="return doSubmit(this)">
				<input type="hidden" name="uNo" value="<%=CmmUtil.nvl(uDTO.getUser_no())%>">
					<ul class="register_list">
						<li>
							<p class="blue_text">비밀번호</p> <input type="password" name="password" id="password">
						</li>
						<li>
							<p class="blue_text">비밀번호 재확인</p> <input type="password" name="passwordCheck" id="passwordCheck">
						</li>
						<li>
							<center>
								<button class="btn btn-primary width100">비밀번호 변경</button>
							</center>
						</li>
					</ul>
				</form>
				</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>
</html>
