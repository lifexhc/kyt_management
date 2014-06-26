 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@page import="database.*" %>
<%@page import="dao.*" %>
 
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
	String url = "../sys/index.jsp?module=xuetang";
	String info = null;
	String type = request.getParameter("type");
	String XueTangID_tostring = request.getParameter("XueTangId");
	if(null==type||type.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		if(type.equals("edit")){ //编辑
			System.out.println("edit\n");
			if(null==XueTangID_tostring||XueTangID_tostring.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%
			}
			else{
				int id = Integer.parseInt(XueTangID_tostring);
				XueTangDao xueTangDao = new XueTangDao();
				String radio = request.getParameter("XueTangRadio"+id);
				if(radio.equals("1")){
					xueTangDao.deleteXueTang(id);
				}else if(radio.equals("0")){
					//System.out.println("radio:" + radio);
				    xueTangDao.modifyXueTang(id,0);
				}
			}
		}
		else if(type.equals("new")){ //新建
			//TODO：判断非法用户名，是否同名
			String XueTangName = request.getParameter("XueTangNameNew");
			if(null==XueTangName||XueTangName.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%				
			}else{
				XueTangDao xueTangDao = new XueTangDao();
				xueTangDao.insertXueTang(XueTangName);
			}
		}
	}
%>

	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>

</body>
</html>