<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/changguan.js"></script> 
	<table width="100%">
		<tr>

			<td width="120px" valign="top">
				<!-- 左侧菜单 -->
				<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('changguan','doctor','patient','question','yuyue');">
						场馆管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('doctor','changguan','patient','question','yuyue');">
						医生管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('patient','doctor','changguan','question','yuyue');">
						患者管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('question','doctor','changguan','patient','yuyue');">
						问题列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('yuyue','doctor','changguan','patient','question');">
						预约列表</div></td>
					</tr>
				</table>
			</td>

			<td width="1100px" valign="top">
				
				<%//场馆管理 %>
				<div id="changguan" >
					<%// %>
					<script>
				  
				   function getModuleParameter() {
					    var url = location.search; //获取url中"?"符后的字串
					    //alert("url:" + url);
					    var parameter = null;
					    if (url.indexOf("?")!= -1) {
					    	var pos = url.lastIndexOf("=");
					    	parameter = url.substring(pos+1,url.length);
					    	if(parameter!="changguan"){
					    		document.getElementById("changguan").style.display = "none";
					    	}
					    }
					    return parameter;
					}
					
					var module = getModuleParameter();
					
					//alert("module:" + module);
					$(document).ready(function(){
						if(module=="changguan"){
							document.getElementById("changguan").style.display = "block";
						}
						else if(module=="doctor"){
							document.getElementById("changguan").style.display = "none";
							document.getElementById("doctor").style.display = "block";
						}
						else if(module=="patient"){
							$("#changguan").style.display = "none";
							$("#patient").style.display = "block";
						}
						else if(module=="question"){
							$("#changguan").style.display = "none";
							$("#question").style.display = "block";
						}
						else if(module=="yuyue"){
							$("#changguan").style.display = "none";
							$("#yuyue").style.display = "block";
						}
				 
				   });
				</script>
					
					<%@ include file="../changguan/editChangGuan.jsp"%>
				</div>	
				
				<%//医生管理 %>
				<div id="doctor" style="display: none;" >
				<%// %>
					<%@ include file="../changguan/list_doctor.jsp"%>
				</div>	
				
				<%//患者管理 %>
				<div id="patient" style="display: none;"  >
				<%// %>
					<%@ include file="../changguan/list_patient.jsp"%>
				</div>
				
				<%//问题列表 %>
				<div id="question" style="display: none;"  >
				<%// %>
					<%@ include file="../changguan/list_question.jsp"%>
				</div>
				
				<%//预约列表 %>
				<div id="yuyue" style="display: none;"  >
				<%// %>
					<%@ include file="../changguan/manage_reservation_record.jsp"%>
				</div>	
			
			</td>
		</tr>

	</table>