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
	String url = "../sys/index.jsp?module=changguan";
	String info = null;
	String type = request.getParameter("type");
	String ChangGuanId_tostring = request.getParameter("ChangGuanId");
	if(null==type||type.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		if(type.equals("edit")){ //编辑
			System.out.println("edit\n");
			if(null==ChangGuanId_tostring||ChangGuanId_tostring.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%
			}
			else{
				int id = Integer.parseInt(ChangGuanId_tostring);
				ChangGuanDao changGuanDao = new ChangGuanDao(); 
				String radio = request.getParameter("ChangGuanRadio"+id);
				if(radio.equals("1")){
					changGuanDao.deleteChangGuan(id);
				}else if(radio.equals("0")){
					int NeiKe = 0;
					int WaiKe = 0;
					int FuKe = 0;
					int ErKe = 0;
					int ZhenTuiKe = 0;
					int PingGu = 0;
					int TiaoLi = 0;
					int ShaLong = 0;
					int JiangZuo = 0;
					
					String NeiKe_string = request.getParameter("checkNeiKe"+id);
					String WaiKe_string = request.getParameter("checkWaiKe"+id);
					String FuKe_string = request.getParameter("checkFuKe"+id);
					String ErKe_string = request.getParameter("checkErKe"+id);
					String ZhenTuiKe_string = request.getParameter("checkZhenTuiKe"+id);
					
					String PingGu_string = request.getParameter("checkPingGu"+id);
					String TiaoLi_string = request.getParameter("checkTiaoLi"+id);
					String ShaLong_string = request.getParameter("checkShaLong"+id);
					String JiangZuo_string = request.getParameter("checkJiangZuo"+id);
					
					/*
					System.out.println("NeiKe_string:" + NeiKe_string + "WaiKe_string: "+ WaiKe_string 
							+ "FuKe_string:" + FuKe_string + "ErKe_string: " + ErKe_string 
							+ "ZhenTuiKe_string:" + ZhenTuiKe_string);
					System.out.println("PingGu_string: " + PingGu_string + "TiaoLi_string:"+ TiaoLi_string 
							+ "ShaLong_string:" + ShaLong_string + "JiangZuo_string:" + JiangZuo_string);
					*/
					if(null==NeiKe_string||NeiKe_string.equals("")){
						NeiKe = 0;
					}else if(NeiKe_string.equals("1")){
						NeiKe = 1;
					}
					if(null==WaiKe_string||WaiKe_string.equals("")){
						WaiKe = 0;
					}else if(WaiKe_string.equals("1")){
						WaiKe = 1;
					}
					if(null==FuKe_string||FuKe_string.equals("")){
						FuKe = 0;
					}else if(FuKe_string.equals("1")){
						FuKe = 1;
					}
					if(null==ErKe_string||ErKe_string.equals("")){
						ErKe = 0;
					}else if(ErKe_string.equals("1")){
						ErKe = 1;
					}
					if(null==ZhenTuiKe_string||ZhenTuiKe_string.equals("")){
						ZhenTuiKe = 0;
					}else if(ZhenTuiKe_string.equals("1")){
						ZhenTuiKe = 1;
					}
					
					if(null==PingGu_string||PingGu_string.equals("")){
						PingGu = 0;
					}else if(PingGu_string.equals("1")){
						PingGu = 1;
					}
					if(null==TiaoLi_string||TiaoLi_string.equals("")){
						TiaoLi = 0;
					}else if(TiaoLi_string.equals("1")){
						TiaoLi = 1;
					}
					if(null==ShaLong_string||ShaLong_string.equals("")){
						ShaLong = 0;
					}else if(ShaLong_string.equals("1")){
						ShaLong = 1;
					}
					if(null==JiangZuo_string||JiangZuo_string.equals("")){
						JiangZuo = 0;
					}else if(JiangZuo_string.equals("1")){
						JiangZuo = 1;
					}
					changGuanDao.modifyChangGuan(id, NeiKe, WaiKe, FuKe, ErKe, ZhenTuiKe, PingGu, TiaoLi, ShaLong, JiangZuo, 0);
				}
			}
		}
		else if(type.equals("new")){ //新建
			//TODO：判断非法用户名，是否同名
			String ChangGuanName = request.getParameter("ChangGuanNameNew");
			if(null==ChangGuanName||ChangGuanName.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%				
			}else{
				int NeiKe = 0;
				int WaiKe = 0;
				int FuKe = 0;
				int ErKe = 0;
				int ZhenTuiKe = 0;
				int PingGu = 0;
				int TiaoLi = 0;
				int ShaLong = 0;
				int JiangZuo = 0;
				
				String NeiKe_string = request.getParameter("checkNeiKe");
				String WaiKe_string = request.getParameter("checkWaiKe");
				String FuKe_string = request.getParameter("checkFuKe");
				String ErKe_string = request.getParameter("checkErKe");
				String ZhenTuiKe_string = request.getParameter("checkZhenTuiKe");
				
				String PingGu_string = request.getParameter("checkPingGu");
				String TiaoLi_string = request.getParameter("checkTiaoLi");
				String ShaLong_string = request.getParameter("checkShaLong");
				String JiangZuo_string = request.getParameter("checkJiangZuo");
				
				/*
				System.out.println("NeiKe_string:" + NeiKe_string + "WaiKe_string: "+ WaiKe_string 
						+ "FuKe_string:" + FuKe_string + "ErKe_string: " + ErKe_string 
						+ "ZhenTuiKe_string:" + ZhenTuiKe_string);
				System.out.println("PingGu_string: " + PingGu_string + "TiaoLi_string:"+ TiaoLi_string 
						+ "ShaLong_string:" + ShaLong_string + "JiangZuo_string:" + JiangZuo_string);
				*/
				
				if(null==NeiKe_string||NeiKe_string.equals("")){
					NeiKe = 0;
				}else if(NeiKe_string.equals("1")){
					NeiKe = 1;
				}
				if(null==WaiKe_string||WaiKe_string.equals("")){
					WaiKe = 0;
				}else if(WaiKe_string.equals("1")){
					WaiKe = 1;
				}
				if(null==FuKe_string||FuKe_string.equals("")){
					FuKe = 0;
				}else if(FuKe_string.equals("1")){
					FuKe = 1;
				}
				if(null==ErKe_string||ErKe_string.equals("")){
					ErKe = 0;
				}else if(ErKe_string.equals("1")){
					ErKe = 1;
				}
				if(null==ZhenTuiKe_string||ZhenTuiKe_string.equals("")){
					ZhenTuiKe = 0;
				}else if(ZhenTuiKe_string.equals("1")){
					ZhenTuiKe = 1;
				}
				
				if(null==PingGu_string||PingGu_string.equals("")){
					PingGu = 0;
				}else if(PingGu_string.equals("1")){
					PingGu = 1;
				}
				if(null==TiaoLi_string||TiaoLi_string.equals("")){
					TiaoLi = 0;
				}else if(TiaoLi_string.equals("1")){
					TiaoLi = 1;
				}
				if(null==ShaLong_string||ShaLong_string.equals("")){
					ShaLong = 0;
				}else if(ShaLong_string.equals("1")){
					ShaLong = 1;
				}
				if(null==JiangZuo_string||JiangZuo_string.equals("")){
					JiangZuo = 0;
				}else if(JiangZuo_string.equals("1")){
					JiangZuo = 1;
				}
				ChangGuanDao changGuanDao = new ChangGuanDao();
				changGuanDao.insertChangGuan(ChangGuanName, NeiKe, WaiKe, FuKe, ErKe, ZhenTuiKe, PingGu, TiaoLi, ShaLong, JiangZuo);
				// System.out.println("username:" + name + "\npw:" + pw + "\nnickname:" + nickname +"\ntel:" 
				//		+ tel + "\nemail:" + email + "\nauthority:" + auth + "\n");
			}
		}
	}
%>

	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>

</body>
</html>