<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<table width="95%">
	<tr>
		<td>

<!--  	<form method="post" name="ASKSelectForm" id="ASKSelectForm" action="../sys/index.jsp" target="hidden_question_frame">-->
	  <form method="post" name="ASKSelectForm" id="ASKSelectForm" action="../sys/index.jsp?module=question" > 
	      <fieldset data-role="fieldcontain">
	      
<!--	 <form method="post" name="ASKModifyForm" id="ASKModifyForm" action="index.jsp">-->
<!--	      <fieldset data-role="fieldcontain">-->
		
	  	<%
		request.setCharacterEncoding("UTF-8");
		String url_question = "list_question.jsp";
		
	  	int qID = 0;
	  	ASKPatient askPatient_doctor = new ASKPatient();
		
		String ASKStatusTop = request.getParameter("ASKStatusTop");
		String ASKKeShiTop = request.getParameter("ASKKeShiTop");
		int  ASKStatusTop_radio = -1;
		int ASKKeShiTop_radio = 0;
		if(null==ASKStatusTop||ASKStatusTop.equals("")){ //全部问题
			if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
				askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
				ASKStatusTop_radio = -1;  
				ASKKeShiTop_radio = 0;
			}else{
				int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
				if(ASKKeShiTop_int==0){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
					ASKStatusTop_radio = -1;  
					ASKKeShiTop_radio = 0;
				}else if(ASKKeShiTop_int>0){
					askPatient_doctor.getAllQuestionInfos_Condition(-1,ASKKeShiTop_int);
					ASKStatusTop_radio = -1;  
					ASKKeShiTop_radio = ASKKeShiTop_int;
				}
			}
		}else{
			int ASKStatusTop_int = Integer.parseInt(ASKStatusTop);
			if(ASKStatusTop_int==-1){ //全部问题
				if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
					ASKStatusTop_radio = -1;  
					ASKKeShiTop_radio = 0;
				}else{
					int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
					if(ASKKeShiTop_int==0){ //全部科室
						askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
						ASKStatusTop_radio = -1;  
						ASKKeShiTop_radio = 0;
					}else if(ASKKeShiTop_int>0){
						askPatient_doctor.getAllQuestionInfos_Condition(-1,ASKKeShiTop_int);
						ASKStatusTop_radio = -1;  
						ASKKeShiTop_radio = ASKKeShiTop_int;
					}
				}
			}else if(ASKStatusTop_int>-1){
				if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,0);
					ASKStatusTop_radio = ASKStatusTop_int;  
					ASKKeShiTop_radio = 0;
				}else{
					int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
					if(ASKKeShiTop_int==0){ //全部科室
						askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,0);
						ASKStatusTop_radio = ASKStatusTop_int;  
						ASKKeShiTop_radio = 0;
					}else if(ASKKeShiTop_int>0){
						askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,ASKKeShiTop_int);
						ASKStatusTop_radio = ASKStatusTop_int;  
						ASKKeShiTop_radio = ASKKeShiTop_int;
					}
				}
			}
		}
		%>
		<%@ include file="../admin/list_question_topSelect.jsp"%> 
		<%
	  	int questionNum = askPatient_doctor.num_Condition;
	  	//System.out.println("num:" + qNum);
	  	if(questionNum==0){
	  	%>
	  		<link rel="stylesheet" href="../css/my.css" />
	  		<br><br>
	  		<center>
	  			<div style="width:90%" id="records" ><br><br><div style="color:red" >暂无此条件的相关提问！</div></div>
	  		</center>
	  		<br><br><br><br><br>
	  	<%	
	  	}else if(questionNum>0){
	  		%>
	  		<%
	  		int departmentID = 0;
		  	String departmentName = null;
		  	DepartmentDao departmentDao = new DepartmentDao();
	  		//for(int i=1;i<=questionNum;i++){//正序
	  		for(int i=questionNum;i>=1;i--){ //逆序
	  			//qID = i;
	  			qID = askPatient_doctor.ids_Condition[i];
	  			
	  			//问题删除判断
	  			DeleteQuestionDao deleteQuestionDao = new DeleteQuestionDao();
	  			int deleteFlag = 0;
	  			deleteFlag = deleteQuestionDao.IsQuestionExist(qID);
	  			if(deleteFlag==0){//未删除
	  			//判断完毕
	  				
		  			departmentID = askPatient_doctor.departments_Condition[i];
		  			departmentName = departmentDao.getDepartmentName(departmentID);
		  			int answerFlag =  askPatient_doctor.answered_flags_Condition[i];
		  			//System.out.println("qID:" + qID + "\n");
		  		%>
				
					 <link rel="stylesheet" href="../css/my.css" />
					
					<center>
					<div style="width:90%" id="records" >	
						<table width="100%">
							<tr>
								<td width="41%">提问日期： <%=askPatient_doctor.createDates_Condition[i] %></td>
								<td width="12%">性别：<%=askPatient_doctor.user_genders_Condition[i] %></td>
								<td width="12%">年龄：<%=askPatient_doctor.user_ages_Condition[i] %></td>
								<td width="8%"><img src="../img/child.png" border = "0px"  width="20px"/></td>
								<td width="12%"><%=departmentName %></td>
								<td width="15%" align="center">
								<%if(answerFlag==0){ %>
									<div id="reply_no" class="reply_no">未答复</div>
								<%}else if(answerFlag==1){ %>
									<div id="reply_yes" class="reply_yes">已答复</div>
								<%} %>
								</td>
							</tr>
						</table>
						<div align="left" id="questions"><%=askPatient_doctor.contents_Condition[i] %></div>
						<%
						String pic_path = askPatient_doctor.picture_paths_Condition[i];
						if((null==pic_path)||(pic_path.equals(""))){
							;
						}else{
							%>
							<center>
		  						<img src="<%=P_IMAGES %><%=pic_path %>" border = "0px" width="80%"/>
		  					</center>
							<%
						} 
						%>
						<%
						if(answerFlag==1){
							AnswerDao answerDao_Patient = new AnswerDao();
							answerDao_Patient.getAnswers_Given(qID);
							%>
							<div align="left"  id="answers">
								<%
								//System.out.println("answerDao_Patient.num_Given_Patient:" + answerDao_Patient.num_Given_Patient + "\n");
								for(int j=1;j<=answerDao_Patient.num_Given_Patient;j++){	
								%>
									<img src="../img/zhuanjiahuida.png" border = "0px"  width="25px"/>医生&nbsp;<a href="javascript:alert('编号为  <%=answerDao_Patient.answers_doctor_id_Given_Patient[j] %> 
									的医生 <%=answerDao_Patient.answers_doctor_name_Given_Patient[j] %> ，信息正在更新发布！')">
									<%=answerDao_Patient.answers_doctor_name_Given_Patient[j] %></a>&nbsp;答复&nbsp;：&nbsp;<%=answerDao_Patient.answers_Given_Patient[j] %><br>
								<%}
						 } %>
							</div>
						<br>
					</div>
			       	</center>
				       	      

			       
				</fieldset>
			</form>	
			<br>
			<%}
	  		}
	  	}
  	%>
<!--  			</fieldset>-->
<!--		  </form>-->
		  	<iframe name='hidden_question_frame' id="hidden_question_frame" style='display:none'></iframe>
  		</fieldset>
	</form>	
	
	</td>
</tr>
</table>
