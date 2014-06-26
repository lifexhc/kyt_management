<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<!--<form class="form-horizontal" id="financialForm" method="post" action="../sys/index.jsp">-->
<form class="form-horizontal" id="XueTangForm" method="post" action="../admin/editXueTangInfo.jsp?type=new">
	<div class="view"> 
       <!-- Button to trigger modal --> 
       <div align="right">
       		<a id="myModalLinkXueTang" href="#myModalContainerXueTang" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">新建学堂</a> 
		</div>
       <!-- Modal -->
       <div id="myModalContainerXueTang" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelXueTang" aria-hidden="true">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
           <h3 id="myModalLabelXueTang" contenteditable="true">新建学堂</h3>
         </div>
         <div class="modal-body" style="line-height:200%" >
         
 <script>
    function checkNewXueTangInput()
    {
	   var XueTangNameNew = document.getElementById("XueTangNameNew").value;
	   var message = null;
	   var msg = document.getElementById("msgXueTang");
	   var flag = 1;
	   var right = 1;
	   var ifFlag = 1;	   
	   if(null==XueTangNameNew||XueTangNameNew == ""){
			  flag = 0;
			  right = 0;
		 	  message = "请输入正确的学堂名！";
		 	  //alert(message);
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(right==1){
		   <%
		   XueTangDao xueTangDaoNew = new XueTangDao();
		   xueTangDaoNew.getAllXueTangName();
		   //int i=1;
		   for(int j=1;j<=xueTangDaoNew.name_nums;j++){
		   %>
			   if((ifFlag==1) &&( XueTangNameNew == '<%=xueTangDaoNew.name_infos[j] %>' ))
				{
					flag = 0;
					ifFlag = 0;
					message = "学堂名有冲突，请重新输入！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
					//break;
			   	}
		   <%}%>
	   }
	   if(flag==1){
	      var XueTangNewForm = document.getElementById("XueTangForm");
	      XueTangNewForm.submit(); 
	   }
    }

</script>
         
         	<table  width="60%" align="center" border="0" cellpadding="1" cellspacing="1">
	    		<tr>
	    			<td align="left" width="49%" >学&nbsp;堂&nbsp;名:</td>
	    			<td align="center" width="50%">
	    				<input style="height:30px" type="text" id="XueTangNameNew" name="XueTangNameNew" style="width:80%;" value=""/>
	    			</td>
	    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
			</table>
		
         </div>
         <div class="modal-footer">
         
         <table width="95%">
         	<tr>
         		<td width="66%" align="center"  valign="top">&nbsp;
         			<div id="msgXueTang"></div>
         		</td>
         		<td width="17%" align="center"  valign="bottom">
          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
          		</td>
				<td width="17%" align="center"  valign="bottom">
           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkNewXueTangInput()"/>
           		</td>
           	</tr>
          </table>

         </div>
       </div>
     </div>
</form>
