<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%>
<%//@ include file="../check/checkAdmin.jsp"%>  

<form class="form-horizontal" id="userForm" method="post" action="../admin/editUserInfo.jsp?type=new">

	<div class="view" style="width:100%"> 
       <!-- Button to trigger modal --> 
       <div align="right">
       <a id="myModalLinkUser" href="#myModalContainerUser" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">新建用户</a> 
       </div>
       <!-- Modal -->
       <div id="myModalContainerUser" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUser" aria-hidden="true">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h3 style="float: left;margin: 10px;" id="myModalLabelUser" contenteditable="true">新建用户</h3>
         </div>
         <div style="width:100%" class="modal-body" style="line-height:200%" >
         
 <script>
    function checkNewUserInput()
    {
	   var usernameNew = document.getElementById("usernameNew").value;
	   var passwordNew = document.getElementById("passwordNew").value;
	   var telephoneNew = document.getElementById("telephoneNew").value;
	   var message = null;
	   var msg = document.getElementById("msgUserNew");
	   var flag = 1;
	   var right = 1;
	   var ifFlag = 1;	   
	   if(null==usernameNew||usernameNew == "" || null==passwordNew||passwordNew == ""){
			  flag = 0;
			  right = 0;
		 	  message = "请输入正确的用户名和密码！";
		 	 // alert(message);
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(null==telephoneNew||telephoneNew == ""){
			  flag = 0;
			  right = 0;
		 	  message = "请输入正确的电话！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(right==1){
		   <%
		   UserDao userAdminDaoNew = new UserDao();
		   userAdminDaoNew.getAllUserNames();
		   //int i=1;
		   for(int i=1;i<=userAdminDaoNew.UserNum;i++){
			  // System.out.println(i + " : " + userAdminDaoNew.UserNames[i] + "\n");
		   %>
			   if((ifFlag==1) &&( usernameNew == '<%=userAdminDaoNew.UserNames[i] %>' ))
				{
				    //alert(usernameNew);
					flag = 0;
					ifFlag = 0;
					message = "用户名有冲突，请重新输入！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
					//alert(message);
					//break;
			   	}
		   <%}%>
	   }
	   if(flag==1){
	      //var addrForm = document.forms("addrForm");
	      var userNewForm = document.getElementById("userForm");
	      userNewForm.submit(); 
	   }
    }

</script>
         
<!--			           <p contenteditable="true">显示信息-->
				<div style="line-height:200%;color:red">用户名、密码与权限，此三项为必填项！</div>
           	    <table  width="58%" align="center" border="0" cellpadding="1" cellspacing="1">
			    		<tr width="100%" >
			    			<td align="left" width="25%" >用户名:</td>
			    			<td align="center" width="70%">
			    				<input style="height:30px" type="text" id="usernameNew" name="usernameNew" style="width:90%;" value=""/>
			    			</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
			    		<tr>
			    			<td align="left" width="25%" >密 &nbsp;码:</td>
			    			<td align="center" width="70%">
			    				<input style="height:30px" type="password" id="passwordNew" name="passwordNew" style="width:90%;" value=""/>
			    			</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
			    		<tr>
			    			<td align="left" width="25%">电 &nbsp;话:</td>
			    			<td align="center" width="70%">
			    				<input style="height:30px" type="text" id="telephoneNew" name="telephoneNew" style="width:90%;" value=""/>
			    			</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
			    		<tr>
			    			<td valign="middle" align="left" width="25%">权 &nbsp;限:</td>
			    			<td align="center" width="70%">
			    			
			    				<select name="authorityNew" id="authorityNew">	
<!--									<option value="firstOption">《请选择权限分类》 </option>-->
									<option value="0" selected>普通管理员</option>
									<option value="2" >调理师</option>
									<%
									ChangGuanDao UserChangGuanDaoNew = new ChangGuanDao();
									UserChangGuanDaoNew.getAllChangGuanName();
									int num = UserChangGuanDaoNew.name_nums;
									for(int i=1;i<=num;i++){
									%>
										<option value="<%=UserChangGuanDaoNew.name_info_ids[i]+GROUP_INTERVAL %>" ><%=UserChangGuanDaoNew.name_infos[i] %></option>
									<%} %>
									<option value="1" >超级管理员</option>
								</select>
							</td>
			    			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
			    		</tr>
				</table>
<!--			           </p>-->
<!--		<div id="msgUserNew"></div>-->
         </div>
         <div class="modal-footer">
         <table width="95%">
         	<tr>
         		<td width="66%" align="center"  valign="top">&nbsp;
         			<div id="msgUserNew"></div>
         		</td>
         		<td width="17%" align="center" valign="bottom">
          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
          		</td>
				<td width="17%" align="center" valign="bottom">
           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkNewUserInput()"/>
           		</td>
           	</tr>
          </table>
         </div>
       </div>
     </div>
</form>