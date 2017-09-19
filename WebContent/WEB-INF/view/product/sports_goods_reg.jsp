
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp"%>
<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox .upload-name {
	width: 80%;
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	ppearance: none;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

.filebox.bs3-primary {
	width: 100%;
}
</style>
<script type="text/javascript">
	$(function() {
		var mainfileTarget = $('.filebox .upload-hidden');
		var detailfileTarget = $('#detail_file');
		
		mainfileTarget.on('change',function() {
					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split('\\').pop();
					}
					$(this).siblings('#main_label').val(filename);
				});
		
		detailfileTarget.on('change',function() {
			if (window.FileReader) {
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split(
						'\\').pop();
			}
			$(this).siblings('#detail_label').val(filename);
		});
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
					<a href="#"><h2 class="title">모두의 스포츠</h2></a>
				</div>
			</div>

			<div class="page_title">
				<p>스포츠 용품</p>
			</div>
		</header>
		<%@include file="/html5/include/navBar.jsp"%>
		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
				<div class="select_wrap">
					<select class="col-2">
						<option value="태권도">태권도</option>
						<option value="태권도">태권도</option>
					</select> <select class="col-2">
						<option value="태권도 띠">태권도 띠</option>
						<option value="사이즈">사이즈1</option>
					</select>
				</div>
					<div class="list_wrap">
						<ul class="register_list">
							<li>
								<p class="blue_text">제품사진</p>
								<div class="filebox bs3-primary">
									<input class="upload-name" value="파일선택" disabled="disabled" id="main_label">
									<label for="main_file">업로드</label> <input type="file" name="main_file" id="main_file" class="upload-hidden">
								</div>
							</li>
							<li>
								<p class="blue_text">제품명</p> <input type="text">
							</li>
							<li>
								<p class="blue_text">제품 가격</p> <input type="text">
							</li>
							<li>
								<p class="blue_text">제품 상세</p> <textarea></textarea>
								<div class="filebox bs3-primary">
									<input class="upload-name" value="파일선택" disabled="disabled" id="detail_label">
									<label for="detail_file">업로드</label> <input type="file"
										id="detail_file" name="detail_file" class="upload-hidden">
								</div>
							</li>
							<li>
								<p class="blue_text">옵션</p>
								<div class="input_btn_wrap">
									<input type="text" placeholder="옵션을 추가하세요">
									<button class="line-btn">등록/수정</button>
								</div>
							</li>
						</ul>

					</div>
					<div class="btn-groub">
						<button type="submit" class="col-2 blue-btn button">등록</button>
						<button type="button" class="col-2 glay-btn button">수정</button>
					</div>
			</div>
		</div>
		<%@include file="/html5/include/footer.jsp"%>
</body>

</html>
