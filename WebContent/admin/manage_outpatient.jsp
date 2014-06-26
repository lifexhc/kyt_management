<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<script type="text/javascript">
	//取消预约时的确认  Will 6/16/2014
	function show_confirm(msg) 
{ 
 return confirm(msg); 

} 
	</script>

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
					<td align="center" width=""><strong>场馆</strong></td>
					<td align="center" width=""><strong>类型</strong></td>
					<td align="center" width=""><strong>科室</strong></td>
					<td align="center" width=""><strong>医生</strong></td>
					<td align="center" width=""><strong>出诊时间</strong></td>
					<td align="center" width=""><strong>预约剩余数</strong></td>					
					<td align="center" width=""><strong>操作</strong></td>
					
				</tr>				
						<%
					ReserveClinicDao outpatient_dao = new ReserveClinicDao();
						HashMap hm = new HashMap();
						outpatient_dao.retrive_outpatient(hm);
					for(int i=0;i<outpatient_dao.outpatient_id.size();i++){
				
					
					%>
							<tr style="height: 40px; line-height: 40px;">
								<td align="center"><%=outpatient_dao.clinic_site.get(i) %>
								<td align="center"><%=outpatient_dao.outpatient_type.get(i)%></td>
								<td align="center"><%=outpatient_dao.clinic_department.get(i)%></td>
								<td align="center"><%=outpatient_dao.clinic_doctor_name.get(i)%></td>
								<td align="center"><%=outpatient_dao.outpatient_day.get(i) %><%=outpatient_dao.ampm.get(i) %><%=outpatient_dao.time.get(i) %></td>
								<td align="center"><%=outpatient_dao.amount.get(i) %></td>
								
							
								<td>
									<% if(outpatient_dao.status.get(i) == 0){ %>
									<!-- <div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >已停诊
									</div> -->
									<a id="submit_adjust_link"  onclick="return show_confirm('确认恢复停诊？');" href="../admin/cancell_outpatient_info.jsp?type=enable&outpatient_doctor_id=<%=outpatient_dao.outpatient_doctor_id.get(i) %>" ><big>恢复停诊</big></a>
									<%} else { %>
									<a id="submit_adjust_link"  onclick="return show_confirm('确认恢复停诊？');" href="../admin/cancell_outpatient_info.jsp?type=disable&outpatient_doctor_id=<%=outpatient_dao.outpatient_doctor_id.get(i) %>" ><big>停诊</big></a>
									<%-- <a
										onclick="set_reservation_specific_doctor_value('<%=outpatient_dao.outpatient_id.get(i) %>');show_hidden('reservation_specific_doctor');show_hidden('reservation_patient_sickinfo');">停诊
									</a> --%>
									<a
										onclick="ShowModalWithResult('../admin/edit_outpatient_info.jsp?outpatient_id=<%=outpatient_dao.outpatient_id.get(i) %>','600px','800px');return false">编辑
									</a>
									<%}%>
									
								</td>

							</tr>
					<%} %>	
			
</table>