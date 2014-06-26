
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title><%=sysName %></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/tableCSS.jsp"%>
<%@ include file="../include/custom.jsp"%>
<style>
.div-menu
{
	color: #313131;
	text-align: center;
	font-size: 15px;
	cursor: pointer;
	height: 35px;
	line-height: 35px;
}
.div-menu:hover
{
	color: #d8a14f;
	background: #e8e8e8;
}
.div-menusel
{
	border-right: 3px solid #b30f0e;
	color: #d8a14f;
	font-weight: 700;
	background: #e8e8e8;
	
	text-align: center;
	font-size: 15px;
	cursor: pointer;
	height: 35px;
	line-height: 35px;
}
.mian
{
	height: 500px;
	overflow: auto;
}
</style>

</head>

<body>
	<%@ include file="../check/index.jsp"%>

	
	<script language='javascript' type='text/javascript'>
	function jumpOut(){
		location.href = '../exit/index.jsp';
	}
	</script>
	
		<div>
			<table align="right" width="100%" style="background: #fee6c2;background: #fee6c2;height: 60px;border-bottom: 1px solid #754401;">
				<tr>
					<td width="100px">
						<img src="../img/kyt.png" style="height: 50px;margin-left: 50px;"/>
					<td>
					<td align="left">
					
						<span style='color: #351515;font-size: 35px;font-family: 华文新魏;'><%=sysName %></span>
					</td>
					<td width="200px" align="right" style='color: #351515;font-size:20px;font-family: 华文新魏;'>欢迎&nbsp;,&nbsp;<%=loginedUserName %>!&nbsp;&nbsp;
					</td>
					<td width="120px" align="left"><a class="btn btn-warning" contenteditable="true"
						onclick="jumpOut()">退出</a>&nbsp;</td>
				</tr>
			</table>
		</div>
		<br><br>
	<br>
		<center>
		<div style="width:100%" >

		
		<%
		String role_string = loginRole;
		if(null==role_string||role_string.equals("")){
		%>
			<script language='javascript' type='text/javascript'>
				location.href = '../index.jsp';
			</script>
		<%
		}else{
			int role = Integer.parseInt(role_string);
			if(role==0){
			%>
				<%@ include file="../common/index.jsp"%>
			<%	
			}else if(role==1){
			%>
				<%@ include file="admin.jsp"%>
			<%				
			}else if(role==2){
			%>
				<%@ include file="../tiaolishi/index.jsp"%>
			<%				
			}
			else if(role>GROUP_INTERVAL){
				role = role - GROUP_INTERVAL;//场馆id
				%>
				<%@ include file="../changguan/index.jsp"%>
				<%
			}
		}
		%>
			

		</div>
	</center>

</body>
</html>