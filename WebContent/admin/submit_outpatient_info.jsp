<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
   <%@ include file="../check/index.jsp"%> 
<style type="text/css">
</style>

<script type="text/javascript">
//返回微信主界面  Will  5/19/2014
function return_to_wechat_main(){
		WeixinJSBridge.call('closeWindow');

}
</script>

</head>

<body>



	<div data-role="page">


		<div data-role="content">
			

				<%
   	OutpatientDao dao = new OutpatientDao();
    
    request.setCharacterEncoding("utf-8");
	 String site_id_str = request.getParameter("site");
	 //String name = request.getParameter("name");
	 
	 
	 if(site_id_str == null ){
		 
	%>
	<center>
			<div style="color:red"><big>禁止重复提交！
				<br>正在返回主页，请稍后...</big>
			</div>
			</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = '../sys/loginServlet' ",2000);
			</script>	 
		 	 
	<%	 
	 }else {
	/* 	 <td align="center" width=""><strong>场馆</strong></td>
			<td align="center" width=""><strong>类型</strong></td>
			<td align="center" width=""><strong>科室</strong></td>
			<td align="center" width=""><strong>医生</strong></td>
			<td align="center" width=""><strong>日期 -- 时段</strong></td>
			<td align="center" width=""><strong>星期</strong></td>					
			<td align="center" width=""><strong>操作</strong></td> */
	 
					//String  site= request.getParameter("site");
			long site_id = Long.parseLong(site_id_str);
	 String  type= request.getParameter("type");
	 String  department_id_str = request.getParameter("department");
	 
	 long department_id = 0;
	 if(department_id_str != null){
		 department_id = Long.parseLong(department_id_str);
	 }
	 
	 
	 String  doctor_name_str= request.getParameter("doctor_name");
	 long doctor_id = 0;
	 if(doctor_name_str != null){
		 doctor_id = Long.parseLong(doctor_name_str);
	 }
	 
	 
	 
	 String  day_array= request.getParameter("day_list");
	 String  ampm_array= request.getParameter("ampm_list");
	 String  time_array= request.getParameter("time_list");
	 String  amount_array= request.getParameter("amount_list");
	 
	 if (day_array==null || amount_array ==null || ampm_array ==null || time_array == null){
		 return ;
	 }
	 
	 
	 String day_list[] = day_array.split(",");
	 String ampm_list[] = ampm_array.split(",");
	 String time_list[] = time_array.split(",");
	 String amount_list[] = amount_array.split(",");
	 
	 
	 
	 HashMap hm = new HashMap();
	 hm.put("site_id", site_id);
	 hm.put("type", type);
	 hm.put("department_id", department_id);
	 hm.put("doctor_id", doctor_id);
	 hm.put("day_list", day_list);
	 hm.put("ampm_list", ampm_list);
	 hm.put("time_list", time_list);
	 hm.put("amount_list", amount_list);
	 
	 
	 dao.add_outpatient(hm);
	// dao.submit_reservation_xuetang(hm);
	 
	 
	 
	 //发送成功预约的短信	

		
    %>
			
				<br>
		

				
			<% 
	
				String url= "../sys/loginServlet" ;
				
			%>

			 <script language='javascript' type='text/javascript'>
				 //window.location.href = "<%=url%>";
				 window.opener.parent.document.location.reload();
                 window.close();
			</script>
		<%} %>		
		

		<div data-role="footer" data-id="myfooter" data-position="fixed">
		</div>

	</div>
	
	

</body>
</html>