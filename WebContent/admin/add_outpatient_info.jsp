
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title><%=sysName%></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/tableCSS.jsp"%>
<%@ include file="../include/custom.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	/*Retrieve the frequently used partitions when clikcing the textarea  zzhengxi   4/20/2014*/
	$("#department").change(function(){
		var site = $("#site").val();
		var department = $("#department").val();
		
		if(site == "0" || department =="0" ){
			alert("请选择场馆和科室！");
			return;
		}
		
		
		//alert("focused!");
		$.ajax({
			type: 'post',
			url: 'retrieve_doctor',
			dataType: 'text',
			data:{//发送给数据库的数据
				site: site,
				department: department
				   },
			success: function(data){
				var values = [];
				values = data;
				
				values = values.substr(1, values.length-2);
				
				//var requestList = data.substr(1, data.length-2);
				var list = new Array();	
				list = values.split(', ');
				
				
				var doctor_id  = list[0];
				var dcotor_name  = list[1];
				
				doctor_id = doctor_id.substr(1, doctor_id.length-2);
				dcotor_name = dcotor_name.substr(1, dcotor_name.length-2);
				
				var doctor_id_list =  new Array();	
				doctor_id_list = doctor_id.split(",");
				
				var doctor_name_list =  new Array();	
				doctor_name_list = dcotor_name.split(",");
				
				
				
				var systemanmes_option_nodes = "";
				
				for(var i = 0; i<doctor_name_list.length; i++){					
					var tempStr = "<option value=" + doctor_id_list[i] + " >"  + doctor_name_list[i] + "</option>";
					systemanmes_option_nodes  += tempStr;							                     
				}
				
				$("#doctor_name").html(systemanmes_option_nodes);
				
				/* var requestList = data.substr(1, data.length-2);
				var list = new Array();	
				list = requestList.split(', ');
				var systemanmes_li_nodes = "";
				for(var i = 0; i<list.length; i++){					
						var tempStr = "<li id='systemanmes_li' onmousedown=" + "getValue('systext'," +"'" + list[i] + "');" + "showAndHide('List1','hide'); >"
						+ list[i]
						+"</li>"
						systemanmes_li_nodes  += tempStr;							                     
				}
				
				

				showAndHide('List1','show'); */
			},
			error: function(text) {

			}
		});	
	});
		
		$("#site").change(function(){
			var site = $("#site").val();
			var department = $("#department").val();
			
			if(site == "0" || department =="0" ){
				alert("请选择场馆和科室！");
				return;
			}
			
			
			//alert("focused!");
			$.ajax({
				type: 'post',
				url: 'retrieve_doctor',
				dataType: 'text',
				data:{//发送给数据库的数据
					site: site,
					department: department
					   },
				success: function(data){
					var values = [];
					values = data;
					
					values = values.substr(1, values.length-2);
					
					//var requestList = data.substr(1, data.length-2);
					var list = new Array();	
					list = values.split(', ');
					
					
					var doctor_id  = list[0];
					var dcotor_name  = list[1];
					
					doctor_id = doctor_id.substr(1, doctor_id.length-2);
					dcotor_name = dcotor_name.substr(1, dcotor_name.length-2);
					
					var doctor_id_list =  new Array();	
					doctor_id_list = doctor_id.split(",");
					
					var doctor_name_list =  new Array();	
					doctor_name_list = dcotor_name.split(",");
					
					
					
					var systemanmes_option_nodes = "";
					
					for(var i = 0; i<doctor_name_list.length; i++){					
						var tempStr = "<option value=" + doctor_id_list[i] + " >"  + doctor_name_list[i] + "</option>";
						systemanmes_option_nodes  += tempStr;							                     
					}
					
					$("#doctor_name").html(systemanmes_option_nodes);
					
					/* var requestList = data.substr(1, data.length-2);
					var list = new Array();	
					list = requestList.split(', ');
					var systemanmes_li_nodes = "";
					for(var i = 0; i<list.length; i++){					
							var tempStr = "<li id='systemanmes_li' onmousedown=" + "getValue('systext'," +"'" + list[i] + "');" + "showAndHide('List1','hide'); >"
							+ list[i]
							+"</li>"
							systemanmes_li_nodes  += tempStr;							                     
					}
					
					

					showAndHide('List1','show'); */
				},
				error: function(text) {

				}
			});	
		
		
		
		

   });
	
});

</script>


</head>

<body>
	<center>


		<form class="form-horizontal"
			id="shopForm" method="post"
			action="../admin/submit_outpatient_info.jsp">
			
			<input id="day_list" name="day_list" type="hidden">
			<input id="ampm_list" name="ampm_list" type="hidden">
			<input id="time_list" name="time_list" type="hidden">
			<input id="amount_list" name="amount_list" type="hidden">
			
			
			<div class="view">
				<!-- Button to trigger modal -->

				<!-- Modal -->
				<div >
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabelShop"
							contenteditable="true">添加排期</h3>
					</div>

					<div class="modal-body">
						<table width="100%" align="center" border="0" cellpadding="0"
							cellspacing="0">

							<tr>
								<td align="left"><strong>场馆</strong></td>
								<td colspan="2"><select id="site" name="site">
								<OPTION selected="" value="0">选择场馆</OPTION>
										<%
		request.setCharacterEncoding("utf-8");
		ReserveClinicDao site_dao = new ReserveClinicDao();

		site_dao.retrive_sites();

		for (int i = 0; i < site_dao.site_id.size(); i++) {
	%>
	<option value='<%=site_dao.site_id.get(i) %>'"><%=site_dao.site_name.get(i) %></option>
	
									
										<%} %>
								</select></td>
							</tr>

							<tr>
								<td align="left"><strong>出诊类型</strong></td>
								<td colspan="2"><SELECT name="type">
										<OPTION selected value="0">选择类型</OPTION>
										<OPTION value="门诊">门诊</OPTION>
										<OPTION value="健康服务">健康服务</OPTION>
										</SELECT></td>

							</tr>

							<tr>
								<td align="left"><strong>科室</strong></td>
								<td colspan="2" align="left" ><SELECT name="department"  id="department">
										<OPTION selected="" value="0">选择科室</OPTION>
											<%
	
		site_dao.retrive_department();

		for (int i = 0; i < site_dao.department_id.size(); i++) {
	%>
	<option value='<%=site_dao.department_id.get(i) %>'"><%=site_dao.department_name.get(i) %></option>
	
									
										<%} %>
									<!-- 	<OPTION value="中医内科">中医内科</OPTION>
										<OPTION value="中医外科">中医外科</OPTION>
										<OPTION value="妇科">妇科</OPTION>
										<OPTION value="儿科">儿科</OPTION>
										<OPTION value="针推科">针推科</OPTION>
										<OPTION value="健康调理">健康调理</OPTION>
										<OPTION value="健康评估">健康评估</OPTION>
										<OPTION value="健康讲座">健康讲座</OPTION>
										<OPTION value="健康沙龙">健康沙龙</OPTION> -->
								</SELECT></td>
							</tr>

							<tr>
								<td align="left"><strong>医生</strong></td>
								<td colspan="2"><SELECT name="doctor_name" id="doctor_name">
									
										</SELECT></td>

							</tr>
							
							<!-- 
								<tr>
							<td width="10%" class="lbTitle table_td">
								专家
							</td>
							<td width="40%" class="table_td" colspan="3"
								style="font-size: 12px">
								姓名&nbsp;&nbsp;&nbsp;
								<input type="text" id="expert" name="appraiseExpert.expert" size="40%"
									readonly="true" title="@#@T请选择专家姓名" />
								<input name="button" type="button" id="selectUser"
									onclick="selectExpert(1);" value="选择" />
								<input onClick="addExpert()" type="button" value="新增" name="add" />
								
								<input name="button" type="button" id="deleteExpert"
									onclick="editExpert(1)" value="修改" />
									
								<s:hidden name="appraiseExpert.expertid" id="expertid" />
							</td>
						</tr>
 -->



						
							
							
							
						
						
						<script type="text/javascript">
							//var conWorkCount=0;//记录当前权利内容的组数,累计相加，不减少。
							var conExpertCount=0;
							//添加一组合同作品的信息
													
							
							
							/*专家*/
							//添加一组合同作品的信息
							function addExpert(rightBaseInfo)
							{
								var expert_div = document.getElementById("expert_div");						  					
								var tempDiv=expert_div.cloneNode(true);	
								tempDiv.style.display="block";	
								IterateNode2(tempDiv,rightBaseInfo);																			
								expert_div.parentNode.appendChild(tempDiv);	
								conExpertCount++; 
								return tempDiv;
							}
							
							//添加一组合同作品的信息
							function IterateNode2(node,obj)
							{
							   switch(node.name)
									{
										
										case "day_1":
											node.name="day" + conExpertCount;
											node.id="day" + conExpertCount;
											if(obj!=null)
												node.value=obj.day;
											break;
									   case "ampm_1":
									       node.name="ampm" + conExpertCount;
									       node.id="ampm" + conExpertCount;
										   if(obj!=null)
												node.value=obj.ampm;
											break;	
									   case "time_1":
									       node.name="time" + conExpertCount;
									       node.id="time" + conExpertCount;
										   if(obj!=null)
												node.value=obj.time;
											break;	
											
									   case "amount_1":
									       node.name="amount" + conExpertCount;
									       node.id="amount" + conExpertCount;
										   if(obj!=null)
												node.value=obj.amount;
											break;	
											
									}	
								var childrens = node.childNodes;
								if(childrens == null ||	typeof(childrens) == "undefined" ||	childrens.length == 0) return; 
								for(var i=0;i<childrens.length;i++)
								{
									IterateNode2(childrens[i],obj);
								}
							}
							
							//删除一组合同作品信息(this)
							function delExpert(e)
							{
								if(conExpertCount==0)
								{
									alert("最少要填写一个专家姓名!");
									return;
								}				
								var expert_div =e.parentNode.parentNode.parentNode;
								expert_div.parentNode.removeChild(expert_div);	
								conExpertCount--;
							}
							
							
							function operate(secItem){
								var flag = 0;
								var day_list = $("#day").val();
								var ampm_list = $("#ampm").val();
								var time_list = $("#time").val();
								var amount_list = $("#amount").val();
								var i = 0;
								while(flag < conExpertCount){
									if($("#day" + i) !=null && typeof($("#day" + i)) != "undefined" && typeof($("#day" + i).val()) != "undefined"){
										day_list += "," + $("#day" + i).val();
										ampm_list += "," + $("#ampm" + i).val();
										time_list += "," + $("#time" + i).val();										
										amount_list += "," + $("#amount" + i).val();
										flag++;
									}
									i++;
									
									
								}	
								
								$("#day_list").val(day_list);
								$("#ampm_list").val(ampm_list);
								$("#time_list").val(time_list);
								$("#amount_list").val(amount_list);
								
							
								//confirm("确认操作？");
								if(window.confirm("确认添加？")==true){
									thisForm.operation.value =secItem;
									thisForm.submit();
									
									
								}
								return false;
							
							}
							</script>

						
						
						

							<tr>
								<td align="left"><strong>出诊时间</strong></td>
								<td align="left" ><SELECT  id = "day" name = "day">
										<OPTION selected value="周一">周一</OPTION>
										<OPTION  value="周二">周二</OPTION>
										<OPTION value="周三">周三</OPTION>
										<OPTION value="周四">周四</OPTION>
										<OPTION value="周五">周五</OPTION>
										<OPTION value="周六">周六</OPTION>
										<OPTION value="周日">周日</OPTION>
								</SELECT>
								<SELECT  id = "ampm" name = "ampm">
										<OPTION selected value="上午">上午</OPTION>
										<OPTION value="下午">下午</OPTION>										
								</SELECT>
								
								<SELECT  id = "time" name = "time">
										<OPTION selected value="8:30-10:00">8:30-10:00</OPTION>
										<OPTION value="10:00-11:30">10:00-11：30</OPTION>
										<OPTION value="13:30-15:00">13:30-15:00</OPTION>
										<OPTION value="15:00-16:30">15:00-16:30</OPTION>
								</SELECT>
								
								预约限额
								<input style="height: 30px"
									type="text" name="amount" id="amount"
									/>
								
								<input onClick="addExpert()" type="button" value="+" name="add" />
								
								</td>
							</tr>
							
							<tr style="width: 100%">
							<td class="lbTitle table_td" width="10%">
								&nbsp;
							</td>
							<td colspan="3" style="padding: 0px;">
								<div id="expert_div" name="expert_div" style="display: none">
									
									<table id="table_2" cellSpacing=0 cellPadding=0; width="100%"
										align=center border=0>
										<tr>
											<td class="table_td" width="40%" colspan="3"
												style="font-size: 12px">
												<!-- 姓名&nbsp;&nbsp;&nbsp;
												<input type="text" name="expert1" cssStyle="WIDTH:30%" checkLength="18"/> -->
												
												<SELECT  id = "day_1" name = "day_1">
										<OPTION selected value="周一">周一</OPTION>
										<OPTION  value="周二">周二</OPTION>
										<OPTION value="周三">周三</OPTION>
										<OPTION value="周四">周四</OPTION>
										<OPTION value="周五">周五</OPTION>
										<OPTION value="周六">周六</OPTION>
										<OPTION value="周日">周日</OPTION>
								</SELECT>
								<SELECT  id = "ampm_1" name = "ampm_1">
										<OPTION selected value="上午">上午</OPTION>
										<OPTION value="下午">下午</OPTION>										
								</SELECT>
								
								<SELECT  id = "time_1" name = "time_1">
										<OPTION selected value="8:30-10:00">8:30-10:00</OPTION>
										<OPTION value="10:00-11:30">10:00-11:30</OPTION>
										<OPTION value="13:30-15:00">13:30-15:00</OPTION>
										<OPTION value="15:00-16:30">15:00-16:30</OPTION>
										
								</SELECT>
								
								预约限额
								<input style="height: 30px"
									type="text" name="amount_1" id="amoun_1"
									/>
												
												<input onClick="delExpert(this)" type="button" value="-"
													name="add" checkLength="18" />
											<!-- 	<input type="text"  name="expertId" style="display:none" /> -->
												&nbsp;
											</td>
										</tr>
									</table>
								</div>
							</td>
							</tr>
							
							
						<!-- 	<tr>
								<td align="left"><strong>预约限额</strong></td>
								<td colspan="2" align="left"><input style="height: 30px"
									type="text" name="amount" id="amount"
									style="width:90%;" /></td>
							</tr>
							 -->
							
							
							



						</table>

					</div>

					<div class="modal-footer">

						<table width="95%">
							<tr>
								<td width="17%" align="center" valign="bottom"><input
									class="btn btn-primary" type="submit" value="添加"  onclick="return operate(1);"/></td>
								<td width="17%" align="center" valign="bottom">
									<button class="btn" data-dismiss="modal" contenteditable="true">取消</button>
								</td>
								
							</tr>
						</table>

					</div>
				</div>
			</div>
		</form>

	</center>
</body>
</html>
