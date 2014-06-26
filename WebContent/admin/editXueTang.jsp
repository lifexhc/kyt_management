<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center" width ="15%"><strong>学堂编号</strong></td>
		<td align="center" width ="55%"><strong>学堂名</strong></td>
		<td align="center" width ="15%"><strong>状&nbsp;态</strong></td>
		<td align="center" width ="15%"><strong>编&nbsp;辑</strong></td>
	</tr>
<%
XueTangDao xueTangDao = new XueTangDao();
xueTangDao.getAllXueTangInfo();
int XueTangNum = 0;
XueTangNum = xueTangDao.nums;

int XueTangId = 0;
int k=1;
for(k=1;k<=XueTangNum;k++){
	XueTangId = xueTangDao.ids[k];
	
%>
	<tr align="center" >
		<td align="center"><%=XueTangId %></td>
		<td align="center"><%=xueTangDao.names[k] %></td>
		<td align="center" >
			<%=(xueTangDao.deletes[k]==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td>
		<td align="center" valign="middle" >
				
			<form class="form-horizontal" id="XueTangForm<%=XueTangId %>" method="post" action="../admin/editXueTangInfo.jsp?type=edit&XueTangId=<%=XueTangId %>">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkXueTang<%=XueTangId %>" href="#myModalContainerXueTang<%=XueTangId %>" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerXueTang<%=XueTangId %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelXueTang<%=XueTangId %>" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelXueTang<%=XueTangId %>" contenteditable="true">编辑学堂信息</h3>
			         </div>
			         
					<div class="modal-body">		

<script>
    function checkEditXueTangInput(XueTangId)
    {

 	      var XueTangForm = document.getElementById("XueTangForm"+XueTangId);
 	     XueTangForm.submit(); 
   }

    function DeleteXueTangChange(XueTangId){
		var message = null;
			var msg = document.getElementById("msgXueTang"+XueTangId);
			var radioName = "XueTangRadio" + XueTangId;
		var delStatus = $('input:radio[name='+radioName+']:checked').val();
		//alert("delStatus:" +  delStatus);
		if(delStatus==1){
			message = "您选择了删除该学堂！";
  		 	  //alert("message:" +  message);
  			msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
		}else{
			message = " ";
  			msg.innerHTML = "<a style='color:white;'>" + message + "</a>";
		}
	
	}

</script>

					<table width="65%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr style="color: #CC3300">
							<td align="left" width="55%" style="color:red">删除学堂:</td>
							<td align="center" width="45%">
							<table width="100%">
								<tr>
								<%
								if(xueTangDao.deletes[k]==1){
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="XueTangRadio<%=XueTangId %>" value="0" onchange="DeleteXueTangChange(<%=XueTangId %>)"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="XueTangRadio<%=XueTangId %>" value="1" onchange="DeleteXueTangChange(<%=XueTangId %>)"></td>
								<%
								}else{
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="XueTangRadio<%=XueTangId %>" value="0" onchange="DeleteXueTangChange(<%=XueTangId %>)"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="XueTangRadio<%=XueTangId %>" value="1" onchange="DeleteXueTangChange(<%=XueTangId %>)"></td>
								
								<%} %>
									<td align="right" width="10%">&nbsp;</td>
								</tr>
							</table>
							</td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="55%">学堂名:</td>
							<td align="center" width="45%">
								<input style="height: 30px" type="text" name="XueTangName<%=XueTangId %>" id="XueTangName<%=XueTangId %>" style="width:90%;" value="<%=xueTangDao.names[k] %>" readonly/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
					</table>
					
					</div>
			         
			         <div class="modal-footer">
			         
			         <table width="95%">
			         	<tr>
			         		<td width="66%" align="center"  valign="top">&nbsp;
			         			<div id="msgXueTang<%=XueTangId %>"></div>
			         		</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditXueTangInput(<%=XueTangId %>)"/>
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
