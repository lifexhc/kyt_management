<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<!--<form class="form-horizontal" id="financialForm" method="post" action="../sys/index.jsp">-->
<form class="form-horizontal" id="ChangGuanForm" method="post" action="../admin/editChangGuanInfo.jsp?type=new">
	<div class="view"> 
       <!-- Button to trigger modal --> 
       <div align="right">
       <a id="myModalLinkChangGuan" href="#myModalContainerChangGuan" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">新建场馆</a> 
       </div>
       <!-- Modal -->
       <div id="myModalContainerChangGuan" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelChangGuan" aria-hidden="true">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h3 id="myModalLabelChangGuan" contenteditable="true">新建场馆</h3>
         </div>
         <div class="modal-body" style="line-height:200%" >
         
 <script>
    function checkNewChangGuanInput()
    {
	   var ChangGuanNameNew = document.getElementById("ChangGuanNameNew").value;
	   var message = null;
	   var msg = document.getElementById("msgChangGuan");
	   var flag = 1;
	   var right = 1;
	   var ifFlag = 1;	   
	   if(null==ChangGuanNameNew||ChangGuanNameNew == ""){
			  flag = 0;
			  right = 0;
		 	  message = "请输入正确的场馆名！";
		 	  //alert(message);
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(right==1){
		   <%
		   //ChangGuan
		   ChangGuanDao  changGuanDaoNew = new ChangGuanDao();
		   changGuanDaoNew.getAllChangGuanName();
		   //int i=1;
		   for(int i=1;i<=changGuanDaoNew.name_nums;i++){
		   %>
			   if((ifFlag==1) &&( ChangGuanNameNew == '<%=changGuanDaoNew.name_infos[i] %>' ))
				{
					flag = 0;
					ifFlag = 0;
					message = "场馆名有冲突，请重新输入！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
					//break;
			   	}
		   <%}%>
	   }
	   if(flag==1){
	      var ChangGuanNewForm = document.getElementById("ChangGuanForm");
	      ChangGuanNewForm.submit(); 
	   }
    }

</script>
         
         	<table  width="70%" align="center" border="0" cellpadding="1" cellspacing="1">
	    		<tr>
	    			<td align="left" width="55%" >场馆名称:</td>
	    			<td align="center" width="45%">
	    				<input style="height:30px" type="text" id="ChangGuanNameNew" name="ChangGuanNameNew" style="width:90%;" value=""/>
	    			</td>
	    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
	    		<tr>
	    			<td align="left" width="55%" valign="top">门诊科室:</td>
	    			<td align="center" width="45%">
	    				<table width="100%">
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkNeiKe"  value="1">中医内科
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkWaiKe"  value="1">中医外科
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkFuKe"  value="1">妇&nbsp;&nbsp;科
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkErKe"  value="1">儿&nbsp;&nbsp;科
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkZhenTuiKe" value="1">针推科
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
	    							<input type="checkbox" name="checkPingGu"  value="1">健康评估
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkTiaoLi"  value="1">健康调理
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkShaLong"  value="1">健康沙龙
	    					</td></tr>
	    					<tr><td width="100%" align="left">
	    							<input type="checkbox" name="checkJiangZuo"  value="1">健康讲座
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
         			<div id="msgChangGuan"></div>
         		</td>
         		<td width="17%" align="center"  valign="bottom">
          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
          		</td>
				<td width="17%" align="center"  valign="bottom">
           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkNewChangGuanInput()"/>
           		</td>
           	</tr>
          </table>

         </div>
       </div>
     </div>
</form>
