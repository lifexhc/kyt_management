<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/common.js"></script> 
	<table width="100%">
		<tr>

			<td width="120px" valign="top">
				<!-- 左侧菜单 -->
				<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
					
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('doctor','patient','question','yuyue');">
						医生管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('patient','doctor','question','yuyue');">
						患者管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('question','doctor','patient','yuyue');">
						问题列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('yuyue','doctor','patient','question');">
						预约列表</div></td>
					</tr>
				</table>
			</td>

			<td width="1100px" valign="top">
				
				<%//医生列表 %>
				<div id="doctor" >
					<%// %>
					<script>
				  
				   function getModuleParameter() {
					    var url = location.search; //获取url中"?"符后的字串
					    //alert("url:" + url);
					    var parameter = null;
					    if (url.indexOf("?")!= -1) {
					    	var pos = url.lastIndexOf("=");
					    	parameter = url.substring(pos+1,url.length);
					    	if(parameter!="doctor"){
					    		document.getElementById("doctor").style.display = "none";
					    	}
					    }
					    return parameter;
					}
					
					var module = getModuleParameter();
					
					//alert("module:" + module);
					$(document).ready(function(){
						if(module=="doctor"){
							document.getElementById("doctor").style.display = "block";
						}
						else if(module=="patient"){
							$("#doctor").style.display = "none";
							$("#patient").style.display = "block";
						}
						else if(module=="question"){
							$("#doctor").style.display = "none";
							$("#question").style.display = "block";
						}
						else if(module=="yuyue"){
							$("#doctor").style.display = "none";
							$("#yuyue").style.display = "block";
						}
				 
				   });
				</script>
					
					<%@ include file="../tiaolishi/list_doctor.jsp"%>
				</div>
				
				<%//患者管理 %>
				<div id="patient" style="display: none;"  >
				<%// %>
					<%@ include file="../tiaolishi/list_patient.jsp"%>
				</div>
				
				<%//问题列表 %>
				<div id="question" style="display: none;"  >
				<%// %>
					<%@ include file="../tiaolishi/list_question.jsp"%>
				</div>
				
				<%//预约列表 %>
				<div id="yuyue" style="display: none;"  >
				<%// %>
					<%@ include file="../tiaolishi/manage_reservation_record.jsp"%>
				</div>	
			
			</td>
		</tr>

	</table>