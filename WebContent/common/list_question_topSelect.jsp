<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
	
	 <link rel="stylesheet" href="../css/ask_doctor.css" />
  	<script src="../js/ask_doctor.js"></script>
	
  	<table width="100%">
  		<tr>
			<td align="center" width="50%"> 
  			<div id="InputBorderHH" align="center" onclick="SelectStatusTop()">
				<div id="SelectedStatusTop" style="display:none"></div>
				<div id="SelectStatusAttentionTop">&nbsp;&nbsp;&nbsp;&nbsp;
					<%=ASKStatusTop_radio==-1?"全部问题":"" %>
					<%=ASKStatusTop_radio==1?"已回答":"" %>
					<%=ASKStatusTop_radio==0?"未回答":"" %>
					&nbsp;&nbsp;
				<img src="../img/down.png" border = "0px"  width="20px"/></div>
	    	</div>
			</td>
			<td align="center" width="50%"> 
			<div id="InputBorderHH" align="center" onclick="SelectKeShiTop()">
				<div id="SelectedKeShiTop" style="display:none"></div>
				<div id="SelectKeShiAttentionTop">&nbsp;&nbsp;&nbsp;&nbsp;
					<%=ASKKeShiTop_radio==0?"全部科室":"" %>
					<%=ASKKeShiTop_radio==1?"中医内科":"" %>
					<%=ASKKeShiTop_radio==2?"中医外科":"" %>
					<%=ASKKeShiTop_radio==3?"妇&nbsp;&nbsp;科":"" %>
					<%=ASKKeShiTop_radio==4?"儿&nbsp;&nbsp;科":"" %>
					<%=ASKKeShiTop_radio==5?"针推科":"" %>
					<%=ASKKeShiTop_radio==6?"男&nbsp;&nbsp;科":"" %>
				&nbsp;&nbsp;
				<img src="../img/down.png" border = "0px"  width="20px"/></div>
	    	</div>
			</td>
		</tr>
	</table>

	
	<div id="SelectKeShiTop" class="SelectKeShiTop" >
		<table width="100%" cellpadding="0" cellspacing="0px"  border="0">
			<tr>
				<td align="center" width="70%">全部科室</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==0?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="0" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%" border="0"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0">
			<tr height="30px">
				<td align="center" width="70%" height="30px">中医内科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==1?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="1" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%" border="0"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0">
			<tr height="30px">
				<td align="center" width="70%" height="30px">中医外科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==2?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="2" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%" border="0"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  border="0">
			<tr>
				<td align="center" width="70%" height="30px">妇&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==3?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="3" onclick="KeshiChanged();">
				</td>
			</tr>
		</table> 
		<table width="100%" border="0"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0" >
			<tr height="30px">
				<td align="center" width="70%" height="30px">儿&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==4?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="4" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%" border="0"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  border="0">
			<tr>
				<td align="center" width="70%" height="30px">针推科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==5?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="5" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">男&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKKeShiTop_radio==6?"checked":"" %> name="ASKKeShiTop" id="ASKKeShiTop" value="6" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
	</div>
		
	<div id="SelectStatusTop" class="SelectStatusTop" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">全部问题</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKStatusTop_radio==-1?"checked":"" %> name="ASKStatusTop" id="ASKStatusTop" value="-1" onclick="StatusChanged();" >
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">已回答</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKStatusTop_radio==1?"checked":"" %> name="ASKStatusTop" id="ASKStatusTop" value="1" onclick="StatusChanged();" >
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">未回答</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" <%=ASKStatusTop_radio==0?"checked":"" %> name="ASKStatusTop" id="ASKStatusTop" value="0" onclick="StatusChanged();">
				</td>
			</tr>
		</table>
	</div>
	