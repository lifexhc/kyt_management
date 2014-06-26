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
		<td align="center"><strong>操作</strong></td>
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
		<td align="center" valign="middle" >
				
			<form class="form-horizontal" id="PatientForm<%=i %>" method="post" action="../admin/list_patient_modify.jsp?type=edit&patientID=<%=i %>">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkPatient<%=i %>" href="#myModalContainerPatient<%=i %>" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerPatient<%=i %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelPatient<%=i %>" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelPatient<%=i %>" contenteditable="true">修改用户状态信息</h3>
			         </div>
			         
					<div class="modal-body">
					<table width="58%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left" width="49%">姓&nbsp;&nbsp;名:</td>
							<td align="center" width="50%"><input style="height: 30px" type="text" style="width:90%;"
								value="<%=userDaoPatient.UserPatientNames[i] %>" readonly="readonly"/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
						</tr>
						<tr>
							<td align="left" width="49%">性&nbsp;&nbsp;别:</td>
							<td align="center" width="50%"><input style="height: 30px" type="text" style="width:90%;"
								value="<%=userDaoPatient.UserPatientGenders[i] %>" readonly="readonly"/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
						</tr>
						<tr>
							<td align="left" width="49%">年&nbsp;&nbsp;龄:</td>
							<td align="center" width="50%"><input style="height: 30px" type="text" style="width:90%;"
								value="<%=userDaoPatient.UserPatientAges[i] %>" readonly="readonly"/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
						</tr>
						<tr>
							<td align="left" width="49%">手&nbsp;&nbsp;机:</td>
							<td align="center" width="50%"><input style="height: 30px" type="text" style="width:90%;"
								value="<%=userDaoPatient.UserPatientMobiles[i] %>" readonly="readonly"/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
						</tr>
						<tr>
							<td align="left" width="49%"><p style="color: red;">状&nbsp;&nbsp;态:</p></td>
							<td align="center" width="50%">
								<table width="100%">
									<tr align="center">
										<td align="right" width="35%">正常</td>
										<td valign="middle" align="left" width="15%">
											<input type="radio" checked name="radio<%=i %>" value="0"></td>
			
										<td align="right" width="35%">禁用</td>
										<td valign="middle" align="left" width="15%">
											<input type="radio" name="radio<%=i %>" value="1"></td>
									</tr>
								</table>
							</td>									
						</tr>
					</table>
					
					</div>
			         
			         <div class="modal-footer">
			         <table width="95%">
			         	<tr>
			         		<td width="66%">&nbsp;</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="submit" value="保存设置" />
			           		</td>
			           	</tr>
			          </table>
			         </div>
			       </div>
			     </div>
			</form>

		</td> 
	</tr>
	<%} %>
</table>
