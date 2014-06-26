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
	String url = "../sys";
	String info = null;

	String doctor_id_str = request.getParameter("doctor_id");

	if(doctor_id_str == null ){
%>

	<center>
		 	<div style="color:red"><big>场馆分配信息出错！
				<br>正在返回管理页面，请稍后...</big>
			</div> 
	</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = '<%=url %>' ",1000);
			</script>
			
<%		
	}else{
		
			 
				long doctor_id = Long.parseLong(doctor_id_str);
				String site = request.getParameter("site");
				long site_id = 0;
				if(site!=null){
					site_id = Long.parseLong(site);
				}
				
				
				
				
				
				HashMap hm = new HashMap();
				hm.put("doctor_id", doctor_id);
				hm.put("site_id", site_id);
				
				UserDao user_dao = new UserDao();
				
				user_dao.assign_site_for_doctor(hm);
				
				
		}
	
	
%>
<% 
	
				String url2= "../sys/loginServlet" ;
				
			%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url2%>";
	</script>

</body>
</html>