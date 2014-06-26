<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center"><strong>编号</strong></td>
		<td align="center"><strong>姓名</strong></td>
		<td align="center"><strong>性别</strong></td>
		<td align="center"><strong>年龄</strong></td>
		<td align="center"><strong>手机</strong></td>
		<td align="center"><strong>状态</strong></td>
	</tr>

	<%
	UserDaoPatient userDaoPatient = new UserDaoPatient();
	userDaoPatient.getAllUserInfo_Patient();
	for(int i=1;i<=userDaoPatient.UserPatientNum;i++){
		
	%>

	<tr align="center" >
		<td align="center"><%=userDaoPatient.UserPatientIds[i] %></td>
		<td align="center"><%=userDaoPatient.UserPatientNames[i] %></td>
		<td align="center"><%=userDaoPatient.UserPatientGenders[i] %></td>
		<td align="center"><%=userDaoPatient.UserPatientAges[i] %></td>
		<td align="center"><%=userDaoPatient.UserPatientMobiles[i] %></td>
		<td align="center" >
			<%=(userDaoPatient.UserPatientDels[i]==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td>
	</tr>
	<%} %>
</table>
