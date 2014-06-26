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
	  		<form method="post" name="HiddenForm" id="HiddenForm" action="index.jsp" >
				<fieldset data-role="fieldcontain">
				</fieldset>
			</form>	
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
				  	<form class="form-horizontal" method="post" name="ASKForm<%=qID %>" id="ASKForm<%=qID %>" action="../admin/list_question_answer.jsp?qID=<%=qID %>" >
					      <fieldset data-role="fieldcontain">
				
					 <link rel="stylesheet" href="../css/my.css" />
					<div class="view"> 
	
					<script >
						function AnswerSubmit(qID){
							//alert("qID:" + qID);			  			
				  			var AnswerText = document.getElementById("AnswerText"+qID).value;
				  			AnswerText = AnswerText.replace(/(^\s*)/g,"");//删除左边的空格
				  			//alert("AnswerText:" + AnswerText);
				  			var message = null;
				  			var msg = document.getElementById("msgQuestion"+qID);
				  		    var flag = 1;
				  		   if(null==AnswerText||AnswerText==""){
				  			  flag = 0;
				  		 	  message = "请输入对患者问题的答复！";
				  		 	  //alert("message:" +  message);
				  			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
					  	  }
				  		 if(flag==1){
				  			message = "";
				  		 	  //alert("message:" +  message);
				  			msg.innerHTML = "<a style='color:white;'>" + message + "</a>";
				  			var AnswerForm = document.getElementById("ASKForm"+qID);
				  			AnswerForm.submit(); 
				  		 }
					  	}
	
						function DeleteSubmit(qID){
							//alert("qID:" + qID);
				  			var radioName = "QuestionDelRadio" + qID;
							var delStatus = $('input:radio[name='+radioName+']:checked').val();
							var message = null;
				  			var msg = document.getElementById("msgQuestionDel"+qID);
							//alert("delStatus:" +  delStatus);
							if(delStatus==1){
	
								var DeleteForm = document.getElementById("ASKForm"+qID);
								DeleteForm.submit(); 
							}else{
								message = "如需删除，请勾选“删除”！";
					  		 	  //alert("message:" +  message);
					  			msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
							}
						}
	
						function DeleteQuestionChange(qID){
							var message = null;
				  			var msg = document.getElementById("msgQuestionDel"+qID);
				  			var radioName = "QuestionDelRadio" + qID;
							var delStatus = $('input:radio[name='+radioName+']:checked').val();
							//alert("delStatus:" +  delStatus);
							if(delStatus==1){
								message = "您选择了删除该患者的提问！";
					  		 	  //alert("message:" +  message);
					  			msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
							}else{
								message = " ";
					  			msg.innerHTML = "<a style='color:white;'>" + message + "</a>";
							}
						
						}
					</script>
					
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
					<!-- Button to trigger modal --> 
					       <table width="70%">
								<tr>
									<td align="center" width="50%">
					      				<a style="width:90%" id="myModalLinkQuestion<%=qID %>" href="#myModalContainerQuestion<%=qID %>" role="button" class="btn btn-primary" data-toggle="modal">
					       				回&nbsp;&nbsp;&nbsp;&nbsp;答	</a> 
					       			</td>
									<td align="center" width="50%">
		<!--								<div id="delete_questiion" class="delete_questiion" onclick="DeleteSubmit(<%//=qID %>)">删除</div>-->
										<a style="width:90%" id="myModalLinkQuestionDel<%=qID %>" href="#myModalContainerQuestionDel<%=qID %>" role="button" class="btn btn-warning" data-toggle="modal">
					       				删&nbsp;&nbsp;&nbsp;&nbsp;除	</a>
									</td>
								</tr>
							</table>
					</div>
			       	</center>
				       	
				   </div>
				       
				       <!--Question Modal -->
				       <div id="myModalContainerQuestion<%=qID %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelQuestion<%=qID %>" aria-hidden="true">
				         <div class="modal-header">
				           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				           <h3 id="myModalLabelQuestion<%=qID %>" contenteditable="true">回答患者提问</h3>
				         </div>
				         
						<div class="modal-body">
						<center>
					  		<div style="width:90%" id="records" >	
					  		
								<table width="100%">
									<tr>
										<td width="32%">提问日期： <%=askPatient_doctor.createDates_Condition[i] %></td>
										<td width="15%">性别：<%=askPatient_doctor.user_genders_Condition[i] %></td>
										<td width="15%">年龄：<%=askPatient_doctor.user_ages_Condition[i] %></td>
										<td width="8%"><img src="../img/child.png" border = "0px"  width="20px"/></td>
										<td width="15%"><%=departmentName %></td>
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
							</div>
							<br>
							<textarea style="min-height:150px;width:95%" name="AnswerText<%=qID %>" id="AnswerText<%=qID %>" wrap=virtual value=""
								placeholder="请输入回复内容">
							</textarea>
						</center>
						</div>
				         
				         <div class="modal-footer">
				         <table width="95%">
				         	<tr>
				         		<td width="66%" align="center" valign="top">&nbsp;
				         			<div id="msgQuestion<%=qID %>"></div>
				         		</td>
				         		<td width="17%" align="center"  valign="bottom">
				          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
				          		</td>
								<td width="17%" align="center"  valign="bottom">
				           			<input class="btn btn-primary" type="button" value="提交答案"  onclick="AnswerSubmit(<%=qID %>)"/>
				           		</td>
				           	</tr>
				          </table>
				         </div>
				       </div>
				       <!--Question Modal End-->
				       
				       <!--QuestionDel Modal -->
				       <div id="myModalContainerQuestionDel<%=qID %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelQuestionDel<%=qID %>" aria-hidden="true">
				         <div class="modal-header">
				           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				           <h3 id="myModalLabelQuestionDel<%=qID %>" contenteditable="true">删除患者提问</h3>
				         </div>
				         
						<div class="modal-body">
						<center>
					  		<div style="width:90%" id="records" >	
								<table width="100%">
									<tr>
										<td width="32%">提问日期： <%=askPatient_doctor.createDates_Condition[i] %></td>
										<td width="15%">性别：<%=askPatient_doctor.user_genders_Condition[i] %></td>
										<td width="15%">年龄：<%=askPatient_doctor.user_ages_Condition[i] %></td>
										<td width="8%"><img src="../img/child.png" border = "0px"  width="20px"/></td>
										<td width="15%"><%=departmentName %></td>
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
							</div>
							<br>
							<input type="hidden" id="QuestionStatusDel" name="QuestionStatusDel" value="QuestionStatusDel"/>
							<div style="color:red">是否删除该患者提问：</div>
							<table width="90%">
								<tr>
									<td align="right" width="25%">否</td>
									<td valign="middle" align="left" width="20%">
											<input type="radio" checked name="QuestionDelRadio<%=qID %>" value="0" onchange="DeleteQuestionChange(<%=qID %>)">
									</td>
									<td align="right" width="25%">是</td>
									<td valign="middle" align="left" width="20%">
										<input type="radio" name="QuestionDelRadio<%=qID %>" value="1" onchange="DeleteQuestionChange(<%=qID %>)">
									</td>
								</tr>
							</table>
						</center>
						</div>
				         
				         <div class="modal-footer">
				         <table width="95%">
				         	<tr>
				         		<td width="66%" align="center" valign="top">&nbsp;
				         			<div id="msgQuestionDel<%=qID %>"></div>
				         		</td>
				         		<td width="17%" align="center"  valign="bottom">
				          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
				          		</td>
								<td width="17%" align="center"  valign="bottom">
				           			<input class="btn btn-primary" type="button" value="删除问题"  onclick="DeleteSubmit(<%=qID %>)"/>
				           		</td>
				           	</tr>
				          </table>
				         </div>
				       </div>
				       <!--QuestionDel Modal End-->
			       
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
