<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

	<table style="width:100%">
				<tr>

					<td width="150px" valign="top">
						<!-- 左侧菜单 -->
						<table  width="150px"  border="0" cellspacing="0" cellpadding="0"  id="menu">
							
							<tr>
								<td><div id="div-menu1" class="div-menusel"
										onclick="show_hidden('reservation','question','adminUser','doctor','patient','changguan','xuetang','beixuan','div-menu1');">
										预约管理</div></td>
							</tr>
							<tr>
								<td><div id="div-menu2" class="div-menu" 
								onclick="show_hidden('question','reservation','adminUser','doctor','patient','changguan','xuetang','beixuan','div-menu2');">
								问题列表</div></td>
							</tr>
							<tr>
								<td><div id="div-menu3" class="div-menu" 
								onclick="show_hidden('doctor','reservation','question','adminUser','patient','changguan','xuetang','beixuan','div-menu3');">
								医生管理</div></td>
							</tr>
							<tr>
								<td><div id="div-menu4" class="div-menu" 
								onclick="show_hidden('patient','reservation','question','adminUser','doctor','changguan','xuetang','beixuan','div-menu4');">
								患者管理</div></td>
							</tr>
							<tr>
								<td><div id="div-menu5" class="div-menu" 
								onclick="show_hidden('changguan','reservation','question','adminUser','doctor','patient','xuetang','beixuan','div-menu5');">
								场馆管理</div></td>
							</tr>
							<tr>
								<td><div id="div-menu6" class="div-menu"
								onclick="show_hidden('xuetang','reservation','question','adminUser','doctor','patient','changguan','beixuan','div-menu6');">
								学堂管理</div></td>
							</tr>
							<tr>
								<td><div id="div-menu7" class="div-menu" 
								onclick="show_hidden('adminUser','reservation','question','doctor','patient','changguan','xuetang','beixuan','div-menu7');">
								后台用户</div></td>
							</tr>
<!--							<tr>
								<td><div class=" btn btn-primary btn-block"
								onclick="show_hidden('beixuan','reservation','question','adminUser','doctor','patient','changguan','xuetang');">
								备用选项</div></td>
							</tr>-->
						</table>
					</td>

					<td width="auto" valign="top" style="border-left: 1px solid #c4c4c4;">
					
						<%//预约管理 %>
						<div id="reservation"  class="mian" >
						<script>
						
						$("#reservation").css("height",(document.body.clientHeight-65) +"px");
						   function getModuleParameter() {
							    var url = location.search; //获取url中"?"符后的字串
							    //alert("url:" + url);
							    var parameter = null;
							    if (url.indexOf("?")!= -1) {
							    	var pos = url.lastIndexOf("=");
							    	parameter = url.substring(pos+1,url.length);
							    	if(parameter!="reservation"){
							    		document.getElementById("reservation").style.display = "none";
							    	}
							    }
							    return parameter;
							}
							
							var module = getModuleParameter();
							
							
							//alert("module:" + module);
							$(document).ready(function(){
								
								if(module=="reservation"){
									document.getElementById("reservation").style.display = "block";
									
								}else if(module=="question"){
									document.getElementById("reservation").style.display = "none";
									document.getElementById("question").style.display = "block";
								}
								else if(module=="adminUser"){
									document.getElementById("reservation").style.display = "none";
									document.getElementById("adminUser").style.display = "block";
								}
								else if(module=="doctor"){
									document.getElementById("reservation").style.display = "none";
									document.getElementById("doctor").style.display = "block";
								}
								else if(module=="patient"){
									document.getElementById("reservation").style.display = "none";
									document.getElementById("patient").style.display = "block";
								}
								else if(module=="changguan"){
									document.getElementById("reservation").style.display = "none";
									document.getElementById("changguan").style.display = "block";
								}
								else if(module=="xuetang"){
									document.getElementById("reservation").style.display = "none";
									document.getElementById('xuetang').style.display = 'block';
									
								}
								else if(module=="beixuan"){
									$("#reservation").style.display = "none";
									$("#beixuan").style.display = "block";
								}
						 
						   });
						</script>
							<%@ include file="index_reservation_test.jsp"%>
						</div>
						
						<%//问题列表 %>
						<div id="question" style="display: none;"   class="mian">
							<%@ include file="../admin/list_question.jsp"%>
						</div>
						<script type="text/javascript">
							$("#question").css("height",(document.body.clientHeight-65) +"px");
						</script>
						
						<%//后台用户 %>
						<div id="adminUser" style="display: none;"   class="mian">
							<%@ include file="../admin/insertUser.jsp"%>
							<%@ include file="../admin/editUser.jsp"%>
						</div>
						<script type="text/javascript">
							$("#adminUser").css("height",(document.body.clientHeight-65) +"px");
						</script>
						
						<%//医生管理 %>
						<div id="doctor" style="display: none;"  class="mian">
						<%// %>
							<%@ include file="../admin/list_doctor.jsp"%>
						</div>	
						<script type="text/javascript">
							$("#doctor").css("height",(document.body.clientHeight-65) +"px");
						</script>
						
						<%//患者管理 %>
						<div id="patient" style="display: none;"  class="mian">
							<%// %>
							<%@ include file="../admin/list_patient.jsp"%>
						</div>	
						<script type="text/javascript">
							$("#patient").css("height",(document.body.clientHeight-65) +"px");
						</script>
						
						<%//场馆管理 %>
						<div id="changguan" style="display: none;"  class="mian">
							<%// %>
							<%@ include file="../admin/insertChangGuan.jsp"%>
							<%@ include file="../admin/editChangGuan.jsp"%>
						</div>	
						<script type="text/javascript">
							$("#changguan").css("height",(document.body.clientHeight-65) +"px");
						</script>
						
						<%//学堂管理 %>
						<div id="xuetang" style="display: none;"   class="mian">
						<%// %>
							<%@ include file="../admin/insertXueTang.jsp"%>
							<%@ include file="../admin/editXueTang.jsp"%>
						</div>	
						<script type="text/javascript">
							$("#xuetang").css("height",(document.body.clientHeight-65) +"px");
						</script>
						
						<%//备用选项 %>
						<div id="beixuan" style="display: none;"   class="mian">
						<%// %>
							此选项仅用于后续备用环节！
						</div>	
					
					</td>
				</tr>

			</table>