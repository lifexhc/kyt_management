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
    String outpatient_id_str = request.getParameter("outpatient_id");
    long outpatient_id =0;
	if(outpatient_id_str != null){
		outpatient_id = Long.parseLong(outpatient_id_str);
	}
	 //String name = request.getParameter("name");
	 
	 
	 if(outpatient_id == 0 ){
		 
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
		
	 
	 
	 String  day= request.getParameter("day");
	 String  ampm= request.getParameter("ampm");
	 String  time= request.getParameter("time");
	 String  amount_str= request.getParameter("amount");
	 
	 String  type= request.getParameter("type");
	 
	 
	 
	int amount =0;
	if(amount_str != null){
		amount = Integer.parseInt(amount_str);
	}
	 

	 String doctor_id_str = request.getParameter("doctor_id");
	    long doctor_id =0;
		if(doctor_id_str != null){
			doctor_id = Long.parseLong(doctor_id_str);
		}

	 
	 
	 
	 HashMap hm = new HashMap();
	 hm.put("outpatient_id", outpatient_id);
	 hm.put("doctor_id", doctor_id);

	 hm.put("day", day);
	 hm.put("ampm", ampm);
	 hm.put("time", time);
	 hm.put("amount", amount);
	 hm.put("type",type);
	 
	 
	 dao.update_outpatient(hm);
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