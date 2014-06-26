<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>

<%
request.setCharacterEncoding("utf-8");
loginRole = (String)session.getAttribute("role");

if(null==loginRole||loginRole.equals("")){
%>
<script language='javascript' type='text/javascript'>
	window.location = "../index.jsp";
</script>

<%	
}
%> 