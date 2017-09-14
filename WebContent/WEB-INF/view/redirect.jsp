<%@page import="com.sports.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
%>
<script type="text/javascript">
	<%if(!msg.equals("")){%>
		alert('<%=msg%>');
	<%}%>
	location.href = "<%=url %>";
</script>