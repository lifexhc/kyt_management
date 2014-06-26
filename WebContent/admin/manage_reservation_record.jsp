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
					<td align="center" width=""><strong>用户姓名</strong></td>
					<td align="center" width=""><strong>手机号</strong></td>
					<td align="center" width=""><strong>预约时间</strong></td>
					<td align="center" width=""><strong>状态</strong></td>					
					<td align="center" width=""><strong>操作</strong></td>
					
				</tr>				
						<%
					ReserveClinicDao reservation_dao = new ReserveClinicDao();
						
						reservation_dao.retrive_patient_reservation();
					for(int i=0;i<reservation_dao.clinic_reservation_id.size();i++){
					
					%>
							<tr style="height: 40px; line-height: 40px;">
								<td align="center"><%=reservation_dao.clinic_site.get(i) %>
								<td align="center"><%=reservation_dao.clinic_type.get(i)%></td>
								<td align="center"><%=reservation_dao.clinic_department.get(i)%></td>
								<td align="center"><%=reservation_dao.user_name.get(i)%></td>							
								<td align="center"><%=reservation_dao.clinic_doctor_name.get(i)%></td>
								<td align="center"><%=reservation_dao.user_mobile.get(i)%></td>	
								<td align="center"><%=reservation_dao.date.get(i) %><%=reservation_dao.day.get(i) %><%=reservation_dao.ampm.get(i) %><%=reservation_dao.time.get(i) %></td>
								<td align="center"><%=reservation_dao.clinic_treat_text.get(i) %></td>
								
							
								<td>
								<a id="submit_adjust_link"  onclick="return show_confirm('确认取消预约？');" href="../admin/set_reservation_status.jsp?type=cancel&clinic_reservation_id=<%=reservation_dao.clinic_reservation_id.get(i) %>" ><big>取消</big></a>
								<a id="submit_adjust_link"  onclick="return show_confirm('确认设置为爽约？');" href="../admin/set_reservation_status.jsp?type=unvisited&clinic_reservation_id=<%=reservation_dao.clinic_reservation_id.get(i) %>" ><big>爽约</big></a>
								<a id="submit_adjust_link"  onclick="return show_confirm('确认设置为履约？');" href="../admin/set_reservation_status.jsp?type=visited&clinic_reservation_id=<%=reservation_dao.clinic_reservation_id.get(i) %>" ><big>履约</big></a>
								<%-- 	<% if(reservation_dao.status.get(i) == 0){ %>
								
									<a id="submit_adjust_link"  onclick="return show_confirm('确认恢复停诊？');" href="../admin/cancell_outpatient_info.jsp?type=enable&outpatient_doctor_id=<%=reservation_dao.outpatient_doctor_id.get(i) %>" ><big>取消</big></a>
									<%} else { %>
									<a id="submit_adjust_link"  onclick="return show_confirm('确认恢复停诊？');" href="../admin/cancell_outpatient_info.jsp?type=disable&outpatient_doctor_id=<%=reservation_dao.outpatient_doctor_id.get(i) %>" ><big>爽约</big></a>
									
									
									<a
										onclick="ShowModalWithResult('../admin/edit_outpatient_info.jsp?outpatient_id=<%=reservation_dao.outpatient_id.get(i) %>','600px','800px');return false">编辑
									</a>
									<%}%> --%>
									
								</td>

							</tr>
					<%} %>	
			
</table>