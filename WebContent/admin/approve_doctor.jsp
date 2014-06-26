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
	String url = "../sys/index.jsp?module=doctor";
	String info = null;
	String type = request.getParameter("type");
	String doctor_id_str = request.getParameter("doctor_id");
	String radio_str = request.getParameter("radio"+doctor_id_str);
	if(null==type || doctor_id_str == null || radio_str == null){
%>

	<center>
		 	<div style="color:red"><big>审核医生信息出错！
				<br>正在返回管理页面，请稍后...</big>
			</div> 
	</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = '<%=url %>' ",1000);
			</script>
			
<%		
	}else{
		if(type.equals("edit")){ //编辑
			System.out.println("edit\n");
			 
				long doctor_id = Long.parseLong(doctor_id_str);
				
				int radio = Integer.parseInt(radio_str);
				
				HashMap hm = new HashMap();
				hm.put("doctor_id", doctor_id);
				
				UserDao user_dao = new UserDao();
				//int flag = 1;
				if(radio==1){
					user_dao.approve_doctor(hm,1);
				}else if(radio==0){
					user_dao.approve_doctor(hm,0);
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