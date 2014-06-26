<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>

<%
request.setCharacterEncoding("utf-8");
loginedUserName = (String)session.getAttribute("loginedUserName");
loginRole = (String)session.getAttribute("role");
//String weixinID = request.getParameter("sid");
if(null==loginedUserName||loginedUserName.equals("")||null==loginRole||loginRole.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		location.href = '../index.jsp';
	</script>
<%	
}
%> 