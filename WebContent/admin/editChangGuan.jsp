<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center" width="10%"><strong>场馆编号</strong></td>
		<td align="center" width="15%"><strong>场馆名</strong></td>
		<td align="center" width="35%"><strong>门诊科室</strong></td>
		<td align="center" width="20%"><strong>健康服务类</strong></td>
		<td align="center" width="10%"><strong>状&nbsp;态</strong></td>
		<td align="center" width="10%"><strong>编&nbsp;辑</strong></td>
	</tr>
<%
ChangGuanDao changGuanDao = new ChangGuanDao();
changGuanDao.getAllChangGuanInfo();
int changGuanNum = 0;
changGuanNum = changGuanDao.nums;

int ChangGuanId = 0;
int i=1;
for(i=1;i<=changGuanNum;i++){
	ChangGuanId = changGuanDao.ids[i];
%>
	<tr align="center" >
		<td align="center"><%=ChangGuanId %></td>
		<td align="center"><%=changGuanDao.names[i] %></td>
		<td align="center">
			<%=(changGuanDao.NeiKes[i]==1)?"中医内科、":"" %>
			<%=(changGuanDao.WaiKes[i]==1)?"中医外科、":"" %>
			<%=(changGuanDao.FuKes[i]==1)?"妇科、":"" %>
			<%=(changGuanDao.ErKes[i]==1)?"儿科、":"" %>
			<%=(changGuanDao.ZhenTuiKes[i]==1)?"针推科":"" %>
		</td>
		<td align="center"  style="word-break:break-all; word-wrap:break-word;">
			<%=(changGuanDao.PingGus[i]==1)?"健康评估、":"" %>
			<%=(changGuanDao.TiaoLis[i]==1)?"健康调理、":"" %>
			<%=(changGuanDao.ShaLongs[i]==1)?"健康沙龙、":"" %>
			<%=(changGuanDao.JiangZuos[i]==1)?"健康讲座":"" %>
		</td>
		<td align="center"  style="word-break:break-all; word-wrap:break-word;">
			<%=(changGuanDao.deletes[i]==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td>
		<td align="center" valign="middle" >
				
			<form class="form-horizontal" id="ChangGuanForm<%=ChangGuanId %>" method="post" action="../admin/editChangGuanInfo.jsp?type=edit&ChangGuanId=<%=ChangGuanId %>">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkChangGuan<%=ChangGuanId %>" href="#myModalContainerChangGuan<%=ChangGuanId %>" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerChangGuan<%=ChangGuanId %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelChangGuan<%=ChangGuanId %>" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelChangGuan<%=ChangGuanId %>" contenteditable="true">编辑场馆信息</h3>
			         </div>
			         
					<div class="modal-body">		

<script>
    function checkEditChangGuanInput(ChangGuanId)
    {

 	      var ChangGuanForm = document.getElementById("ChangGuanForm"+ChangGuanId);
 	     ChangGuanForm.submit(); 
   }
    function DeleteChangGuanChange(ChangGuanId){
		var message = null;
			var msg = document.getElementById("msgChangGuan"+ChangGuanId);
			var radioName = "ChangGuanRadio" + ChangGuanId;
		var delStatus = $('input:radio[name='+radioName+']:checked').val();
		//alert("delStatus:" +  delStatus);
		if(delStatus==1){
			message = "您选择了删除该场馆！";
  		 	  //alert("message:" +  message);
  			msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
		}else{
			message = " ";
  			msg.innerHTML = "<a style='color:white;'>" + message + "</a>";
		}
	
	}
</script>

					<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr style="color: #CC3300">
							<td align="left" width="55%" style="color:red">删除场馆:</td>
							<td align="center" width="45%">
							<table width="100%">
								<tr>
								<%
								if(changGuanDao.deletes[i]==1){
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="ChangGuanRadio<%=ChangGuanId %>" value="0" onchange="DeleteChangGuanChange(<%=ChangGuanId %>)" ></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="ChangGuanRadio<%=ChangGuanId %>" value="1" onchange="DeleteChangGuanChange(<%=ChangGuanId %>)"></td>
								<%
								}else{
								%>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" checked name="ChangGuanRadio<%=ChangGuanId %>" value="0" onchange="DeleteChangGuanChange(<%=ChangGuanId %>)"></td>
		
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="ChangGuanRadio<%=ChangGuanId %>" value="1" onchange="DeleteChangGuanChange(<%=ChangGuanId %>)"></td>
								
								<%} %>
									<td align="right" width="10%">&nbsp;</td>
								</tr>
							</table>
							</td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="55%">场馆名:</td>
							<td align="center" width="45%">
								<input style="height: 30px" type="text" name="ChangGuanName<%=ChangGuanId %>" id="ChangGuanName<%=ChangGuanId %>" style="width:90%;" value="<%=changGuanDao.names[i] %>" readonly/></td>
							<td width="1%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
			    			<td align="left" width="55%" valign="top">门诊科室:</td>
			    			<td align="center" width="45%">
			    				<table width="100%">
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.NeiKes[i]==1)?"checked":"" %> name="checkNeiKe<%=ChangGuanId %>"  value="1">中医内科
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.WaiKes[i]==1)?"checked":"" %> name="checkWaiKe<%=ChangGuanId %>"  value="1">中医外科
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.FuKes[i]==1)?"checked":"" %> name="checkFuKe<%=ChangGuanId %>"  value="1">妇&nbsp;&nbsp;科
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.ErKes[i]==1)?"checked":"" %> name="checkErKe<%=ChangGuanId %>"  value="1">儿&nbsp;&nbsp;科
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.ZhenTuiKes[i]==1)?"checked":"" %> name="checkZhenTuiKe<%=ChangGuanId %>" value="1">针推科
			    					</td></tr>
			    				</table>
			    			</td>
			    			<td width="1%" valign="top"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
			    		<tr>
			    			<td align="left" width="55%" valign="top">健康服务类目:</td>
			    			<td align="center" width="45%">
			    				<table width="100%">
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.PingGus[i]==1)?"checked":"" %> name="checkPingGu<%=ChangGuanId %>"  value="1">健康评估
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.TiaoLis[i]==1)?"checked":"" %> name="checkTiaoLi<%=ChangGuanId %>"  value="1">健康调理
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.ShaLongs[i]==1)?"checked":"" %> name="checkShaLong<%=ChangGuanId %>"  value="1">健康沙龙
			    					</td></tr>
			    					<tr><td width="100%" align="left">
			    							<input type="checkbox" <%=(changGuanDao.JiangZuos[i]==1)?"checked":"" %> name="checkJiangZuo<%=ChangGuanId %>"  value="1">健康讲座
			    					</td></tr>
			    				</table>
			    			</td>
			    			<td width="1%" valign="top"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
					</table>
					
					</div>
			         
			         <div class="modal-footer">
			         
			         <table width="95%">
			         	<tr>
			         		<td width="66%" align="center"  valign="top">&nbsp;
			         			<div id="msgChangGuan<%=ChangGuanId %>"></div>
			         		</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditChangGuanInput(<%=ChangGuanId %>)"/>
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
