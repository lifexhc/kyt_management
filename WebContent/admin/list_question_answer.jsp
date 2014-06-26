<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<%@page import="dao.*" %>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
</style>

</head>

<%@ include file="/check/index.jsp"%> 
<%//@ include file="/check/checkAdmin.jsp"%>  
  
 <body>
  	
	<%
	
	request.setCharacterEncoding("UTF-8");
 	String url = "../sys/index.jsp?module=question";

	String qID = request.getParameter("qID");

	if(null==qID||qID.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
				window.location = "<%=url %>";
		</script>
		<%	
  	}else{
	  	// TODO  管理员ID
  		int USERID = 0;
  		
  		String QuestionDelRadio = request.getParameter("QuestionDelRadio"+qID);
  		
  		//System.out.println("QuestionDelRadio:" + QuestionDelRadio);
  		int qID_int = Integer.parseInt(qID);
  		
  		
  		if(QuestionDelRadio.equals("1")){//删除
			
  			DeleteQuestionDao deleteQuestionDao = new DeleteQuestionDao();
  			deleteQuestionDao.insertDelQuestion(qID_int,USERID);
  			//System.out.println("delete");
  			%>
			  	<br>
			  	<div style="color:<%=sysFontColor %>">您已成功删除问题！</div><br>
			  <%

  		}else{//回复
  	  		String AnswerText = request.getParameter("AnswerText"+qID);
  	  		if(null==AnswerText||AnswerText.equals("")){
  				%>
  				<script language='javascript' type='text/javascript'>
  						window.location = "<%=url %>";
  				</script>
  				<%	
  		  	}else{
  		  		AnswerDao answerDao = new AnswerDao();
  		  		//System.out.println("AnswerText:" + AnswerText + "\nuserID:" + userID + "\nqID_int:" + qID_int);
  		  		answerDao.insertAnswer(AnswerText,USERID,qID_int);
  		  		ASKPatient askPatient = new ASKPatient();
  		  		askPatient.modifyQuestion(qID_int);
  		  	%>
  			  	<div>您对上述问题给出的回复是：</div><br>
  			  	<div style="color:<%=sysFontColor %>"><%=AnswerText %></div><br>
  			  	<div>感谢您对患者的关心，祝您身体健康！</div>
  			  <%	
  			  }
  		}
  		%>
  		<br>
  		<div style="color:<%=sysFontColor %>">正在返回首页，请稍后...</div><br>
		 <script language='javascript' type='text/javascript'>
				window.location = "<%=url %>";
		</script>
	  	<%
  	}
%>

  </body>
</html>