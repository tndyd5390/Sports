<%@page import="com.sports.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url %>";
</script>