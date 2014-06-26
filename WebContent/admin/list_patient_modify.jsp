 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%> 
 <%//@ page import="database.*" %>  
 <%@ include file="../check/index.jsp"%> 
 <%//@ include file="../check/checkAdmin.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 
	 <%@ include file="../include/tableCSS.jsp"%> 

  </head>

  <body>
 
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../sys/index.jsp?module=patient";
	String info = null;
	String type = request.getParameter("type");
	String patientID_str = request.getParameter("patientID");
	String radio_str = request.getParameter("radio"+patientID_str);
	if(null==type || patientID_str == null || radio_str == null){
%>

	<center>
		 	<div style="color:red"><big>修改用户状态信息出错！
				<br>正在返回管理页面，请稍后...</big>
			</div> 
	</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = '<%=url %>' ",1000);
			</script>
			
<%		
	}else{
		if(type.equals("edit")){ //编辑
			System.out.println("edit patient\n");
			 
				int patientID = Integer.parseInt(patientID_str);
				
				int radio = Integer.parseInt(radio_str);
				
				DeletePatientDao deletePatientDao = new DeletePatientDao();
				//int flag = 1;
				if(radio==1){
					deletePatientDao.modifyPatientStatus(patientID,1);
				}else if(radio==0){
					deletePatientDao.modifyPatientStatus(patientID,0);
				}
		}
		else if(type.equals("new")){ //新建
				}
	}
%>

	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>

</body>
</html>