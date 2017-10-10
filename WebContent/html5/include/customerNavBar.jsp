 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import = "com.sports.util.CmmUtil" %>
 <%
 	String ss_user_no =  CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
 	String ss_user_id =  CmmUtil.nvl((String)session.getAttribute("ss_user_id"));
 	String ss_user_name =  CmmUtil.nvl((String)session.getAttribute("ss_user_name"));
 %>
   