 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/html5/include/head.jsp" %>

</head>
<body>
  <section id="wrapper" class="wrapper">
     <header class="header">
  <div class="wrap">
	<div class="header-btn left">
		<img src="html5/common/images/btn-back.png" alt="뒤로가기">
	</div>
  <div class="logo">
		<a href="#"><h2 class="title">모두의 스포츠</h2></a>
	</div>
  <div class="header-btn right">
    <img src="html5/common/images/btn-close.png" alt="닫기">
  </div>
  </div>
</header>
<%@include file="/html5/include/navBar.jsp" %>

    <div class="container">
      <div class="wrap search-wrap">
        <div class="search">
          <input type="text" placeholder="동입력">
          <button class="blue btn">검색</button>
        </div>
        <div class="result">
          <p class="info">총 <span>336</span>건의 주소가 검색되었습니다.</p>
          <div class="list_wrap">
            <ul class="list-groub address_list">
              <li>
                <div class="street">
                  <p class="address_catagory">도로명</p>
                  <p class="address_text">서울특별시 강서구 우장산로<br> 49-28(내발산동, 바로맨션)</p>
                </div>
                <div class="number">
                  <p class="address_catagory">지번</p>
                  <p class="address_text">서울특별시 강서구 우장산로<br> 49-28(내발산동, 바로맨션)</p>
                </div>
                <p class="zip_code">07647</p>
              </li>
              <li>
                <div class="street">
                  <p class="address_catagory">도로명</p>
                  <p class="address_text">서울특별시 강서구 우장산로<br> 49-28(내발산동, 바로맨션)</p>
                </div>
                <div class="number">
                  <p class="address_catagory">지번</p>
                  <p class="address_text">서울특별시 강서구 우장산로<br> 49-28(내발산동, 바로맨션)</p>
                </div>
                <p class="zip_code">07647</p>
              </li>
              <li>
                <div class="street">
                  <p class="address_catagory">도로명</p>
                  <p class="address_text">서울특별시 강서구 우장산로<br> 49-28(내발산동, 바로맨션)</p>
                </div>
                <div class="number">
                  <p class="address_catagory">지번</p>
                  <p class="address_text">서울특별시 강서구 우장산로<br> 49-28(내발산동, 바로맨션)</p>
                </div>
                <p class="zip_code">07647</p>
              </li>
            </ul>
            <button class="add_btn">더보기</button>
          </div>
        </div>
      </div>
    </div>
<%@include file="/html5/include/footer.jsp" %>
</body>

</html>
