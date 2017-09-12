<%@page import="com.sports.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String user_id = CmmUtil.nvl((String)session.getAttribute("user_id"));
	String auth = CmmUtil.nvl((String)session.getAttribute("auth"));
%>
<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/main.do">모두의 스포츠</a> 
            </div>
  <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;" id="nowDate">2017년 6월 23일
  <%if(user_id.equals("")){ %>
  <a href="/user/user_login.do" class="btn btn-danger square-btn-adjust">Login</a> </div>
  <%}else{ %>
  <a href="/user/user_logout.do" class="btn btn-danger square-btn-adjust">Logout</a> </div>
  <% }%>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="/assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					<!-- 우리가 사용할 메뉴 시작  -->
					
					<!--  회원관리 -->
					<%if(auth.equals("A")){ %>
					<li>
                        <a href="/admin/user/user_list.do"><i class="fa fa-desktop fa-3x"></i> 회원관리</a>
                    </li>
                    <%} %>
                    
                    <!--  권한관리 -->
                    <li>
                        <a  href="ui1.do"><i class="fa fa-desktop fa-3x"></i> 권한관리</a>
                    </li>
                    
                    <!--주문관리-->
                      <li>
                        <a href="table.do"><i class="fa fa-table fa-3x"></i> 주문관리</a>
                    </li>
                    
                    <!--학원관리-->
                    <li>
                        <a  href="/accountmanagement.do"><i class="fa fa-table fa-3x"></i> 학원관리</a>
                    </li>
                    
                    <!--스포츠용품리스트관리  -->
                    <li>
                        <a href="/admin/ProductInfo/List.do"><i class="fa fa-table fa-3x"></i> 스포츠 용품 리스트 관리</a>
                    </li>
                    
					<!--매출분석정보-->
					<li>
                        <a   href="chart1.do"><i class="fa fa-bar-chart-o fa-3x"></i> 매출분석정보</a>
                    </li>
                    
                  
					
					   <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> 커뮤니티 관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/admin/notice/NoticeList.do">공지사항</a>
                            </li>
                            <li>
                                <a href="<%=auth.equals("A")?"/admin/QA/QAList.do":"/customer/QA/QAList.do" %>">Q&A</a>
                            </li>
                         </ul>
                        </li>
                </ul>
               
            </div>
            
        </nav>  