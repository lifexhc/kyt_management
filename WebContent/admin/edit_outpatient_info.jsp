
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

	for(var j=0;j<day.options.length;j++){
		
		if($("#day_temp").val()==day.options[j].value){
			day.options[j].selected = true;
		
		}
		}
	
for(var j=0;j<time.options.length;j++){
		
		if($("#time_temp").val()==time.options[j].value){
			time.options[j].selected = true;
		
		}
		}
		
		
for(var j=0;j<ampm.options.length;j++){
	
	if($("#ampm_temp").val()==ampm.options[j].value){
		ampm.options[j].selected = true;
	
	}
	}
		

	
});

</script>


</head>

<body onload="init();">
	<center>


		<form class="form-horizontal"
			id="shopForm" method="post"
			action="../admin/update_outpatient_info.jsp">
			
		
			
			<input id="amount_list" name="amount_list" type="hidden">
			
			
			<div class="view">
				<!-- Button to trigger modal -->
	<%
		request.setCharacterEncoding("utf-8");
		ReserveClinicDao edit_outpatient_dao = new ReserveClinicDao();
		long outpatient_id =0;
		String outpatient_id_str = request.getParameter("outpatient_id");
		if(outpatient_id_str != null){
			outpatient_id = Long.parseLong(outpatient_id_str);
		}
		HashMap hm = new HashMap();
		hm.put("outpatient_id", outpatient_id);
		
		edit_outpatient_dao.retrive_outpatient(hm);
		
		for(int i=0;i<edit_outpatient_dao.outpatient_id.size();i++){
		%>
		<input id="outpatient_id" name="outpatient_id" type="hidden" value="<%=edit_outpatient_dao.outpatient_id.get(i) %>">
		<input id="doctor_id" name="doctor_id" type="hidden" value="<%=edit_outpatient_dao.doctor_id.get(i) %>">
		<input id="day_temp" name="day_temp" type="hidden" value="<%=edit_outpatient_dao.outpatient_day.get(i) %>">
		<input id="ampm_temp" name="ampm_temp" type="hidden" value="<%=edit_outpatient_dao.ampm.get(i) %>">
			<input id="time_temp" name="time_temp" type="hidden" value="<%=edit_outpatient_dao.time.get(i) %>">
				<!-- Modal -->
				<div >
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabelShop"
							contenteditable="true">编辑出诊时间</h3>
					</div>

					<div class="modal-body">
						<table width="100%" align="center" border="0" cellpadding="0"
							cellspacing="0">

							<tr>
								<td align="left"><strong>场馆</strong></td>
								<td colspan="2">
								<input style="height: 30px"
									type="text" name="site" id="site" value="<%=edit_outpatient_dao.clinic_site.get(i) %>" readonly="readonly"
									/>
								</td>
							</tr>

							<tr>
								<td align="left"><strong>出诊类型</strong></td>
								<td colspan="2"><input style="height: 30px"
									type="text" name="type" id="type" value="<%=edit_outpatient_dao.outpatient_type.get(i) %>" readonly="readonly"
									/></td>

							</tr>

							<tr>
								<td align="left"><strong>科室</strong></td>
								<td colspan="2" align="left" >
									<input style="height: 30px"
									type="text" name="site" id="site" value="<%=edit_outpatient_dao.clinic_department.get(i)%>" readonly="readonly"
									/>
								</td>
							</tr>

							<tr>
								<td align="left"><strong>医生</strong></td>
								<td colspan="2"><input style="height: 30px"
									type="text" name="site" id="site" value="<%=edit_outpatient_dao.clinic_doctor_name.get(i)%>" readonly="readonly"
									/></td>

							</tr>
							
							

							<tr>
								<td align="left"><strong>出诊时间</strong></td>
								<td align="left" >
								<%-- <%=edit_outpatient_dao.outpatient_day.get(i) %><%=edit_outpatient_dao.ampm.get(i) %><%=edit_outpatient_dao.time.get(i) %>
								&nbsp;
								更新时间： --%>
								
								<SELECT  id = "day" name = "day">
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
								</td>
								</tr>
								
							
		


</script>
								
								
								
								<tr>
								<td align="left"><strong>预约限额</strong></td>
								
								
								
								<td>
								<input style="height: 30px"
									type="text" name="amount" id="amount" value = "<%=edit_outpatient_dao.amount.get(i) %>"
									/>							
								
								
								</td>
							</tr>
							
						
							
							



						</table>

					</div>

					<div class="modal-footer">

						<table width="95%">
							<tr>
								<td width="17%" align="center" valign="bottom"><input
									class="btn btn-primary" type="submit" value="更新"  onclick="return operate(1);"/></td>
								<td width="17%" align="center" valign="bottom">
									<button class="btn" data-dismiss="modal" contenteditable="true">取消</button>
								</td>
								
							</tr>
						</table>

					</div>
				</div>
				<%} %>
			</div>
		</form>

	</center>
</body>
</html>
