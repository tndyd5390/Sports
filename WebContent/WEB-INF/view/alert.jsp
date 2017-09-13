<%@page import="com.sports.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
%>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>
