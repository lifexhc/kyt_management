
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title><%=sysName %></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/tableCSS.jsp"%>
<%@ include file="../include/custom.jsp"%>
<style>
.div-menu
{
	color: #313131;
	text-align: center;
	font-size: 15px;
	cursor: pointer;
	height: 35px;
	line-height: 35px;
}
.div-menu:hover
{
	color: #d8a14f;
	background: #e8e8e8;
}
.div-menusel
{
	border-right: 3px solid #b30f0e;
	color: #d8a14f;
	font-weight: 700;
	background: #e8e8e8;
	
	text-align: center;
	font-size: 15px;
	cursor: pointer;
	height: 35px;
	line-height: 35px;
}
.mian
{
	height: 500px;
	overflow: auto;
}
</style>

</head>

<body>
	<%@ include file="../check/index.jsp"%>

	
	<script language='javascript' type='text/javascript'>
	function jumpOut(){
		location.href = '../exit/index.jsp';
	}
	</script>
	
		<div>
			<table align="right" width="100%" style="background: #fee6c2;background: #fee6c2;height: 60px;border-bottom: 1px solid #754401;">
				<tr>
					<td width="100px">
						<img src="../img/kyt.png" style="height: 50px;margin-left: 50px;"/>
					<td>
					<td align="left">
					
						<span style='color: #351515;font-size: 35px;font-family: 华文新魏;'><%=sysName %></span>
					</td>
					<td width="200px" align="right" style='color: #351515;font-size:20px;font-family: 华文新魏;'>欢迎&nbsp;,&nbsp;<%=loginedUserName %>!&nbsp;&nbsp;
					</td>
					<td width="120px" align="left"><a class="btn btn-warning" contenteditable="true"
						onclick="jumpOut()">退出</a>&nbsp;</td>
				</tr>
			</table>
		</div>
		<br><br>
	
		<center>
		<div style="width:100%" >
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
=======
		<div style="width: 1220px;" >
		<%
		String role_string = loginRole;
		if(null==role_string||role_string.equals("")){
		%>
			<script language='javascript' type='text/javascript'>
				location.href = '../index.jsp';
			</script>
		<%
		}else{
			int role = Integer.parseInt(role_string);
			if(role==0){
			%>
				<%@ include file="common.jsp"%>
			<%	
			}else if(role==1){
			%>
				<%@ include file="admin.jsp"%>
			<%				
			}else if(role>GROUP_INTERVAL){
				role = role - GROUP_INTERVAL;//场馆id
				ChangGuanDao changGuanDao = new ChangGuanDao();
				String name = changGuanDao.getChangGuanName_by_id(role);
				%>
				<%@ include file="changguan.jsp"%>
				<%
			}
		}
		%>
			

		</div>
	</center>

</body>
</html>