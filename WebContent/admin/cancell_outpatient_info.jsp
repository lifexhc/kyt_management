<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>取消成功</title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
   <%@ include file="../check/index.jsp"%> 
<style type="text/css">
</style>

</head>

<body>



	<div data-role="page">
		<div data-role="header">
			<table width="100%">
				<tr>
					<td width="33%" align="center">

						<!-- <div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="location.href='index.jsp'">返回</a>
						</div> -->

						<!-- <div id="backButton" style="width: 60px;"
							onclick="return_to_wechat_main()">返回</div> -->

					</td>
					<td align="center" width="34%"><a style="color: white;">取消预约</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>

		<div data-role="content">
		

				<%
				OutpatientDao dao = new OutpatientDao();
    
    request.setCharacterEncoding("utf-8");
    

    
	 long outpatient_doctor_id = Long.parseLong(request.getParameter("outpatient_doctor_id"));
	 
	// long doctor_id = Long.parseLong(request.getParameter("doctor_id"));
	 String type= request.getParameter("type");
	 
	
	 
	 HashMap hm = new HashMap();
	 hm.put("outpatient_doctor_id", outpatient_doctor_id);
	hm.put("type", type);
	 
	 
	
	 
	 
	 
	 dao.cancell_outpatient(hm);
	 
	 
	 
	 //发送成功预约的短信	
	/* ReservationSMS reservationSMS = new ReservationSMS();
		String msg = "招生在线-" + xuetang + "：" + name + "，" + gender_sms  + "，" +age  + "，" + mobile + "。";
		reservationSMS.run(msg,String.valueOf(mobile).toString());		
		 */
    %>
			
				<br>
		
				
			<% String url= "../sys/loginServlet" ; %>	
			<br><br>
			<center>
		 	<div style="color:red"><big>
				<br><!-- 正在返回主页面，请稍后... --></big>
			</div> 
			</center>
			<script language='javascript' type='text/javascript'>
				alert("操作成功！");
				window.location = '<%=url %>' ;
			</script>
				
		</div>

		<div data-role="footer" data-id="myfooter" data-position="fixed">

		</div>

	</div>

</body>
</html>