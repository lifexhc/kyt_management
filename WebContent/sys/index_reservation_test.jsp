<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@page import="database.*"%>


<!-- 右侧 -->
<table width="90%">
	<tr>
		<!-- 右侧菜单 -->
		<td>
			<table>
				<tr>
					<!-- <td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('reservation_category_manage','outpatient_time_manage','reservation_record_manage','','','','','');">
								预约类目管理</div></td> -->
					<td><div class=" btn btn-primary btn-block" style="width: 120px;"
							onclick="show_hidden('outpatient_time_manage','reservation_category_manage','reservation_record_manage','','','','','');">
							出诊时间管理</div></td>
					<td><div class=" btn btn-primary btn-block" style="width: 120px;"
							onclick="show_hidden('reservation_record_manage','outpatient_time_manage','reservation_category_manage','','','','','');">
							预约记录管理</div></td>

				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<!-- 右侧内容 -->
		<td>
			<%-- <div id="reservation_category_manage" style="display:none ;">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										style='border-collapse: collapse; table-layout: fixed;' >
										<tr height="19" style='height: 14.25pt;'>
											<td height="19" width="72"
												style='height: 14.25pt; width: 54.00pt;'>场馆</td>
											<td width="341" style='width: 255.75pt;'>门诊科室</td>
											<td width="163" style='width: 122.25pt;'>健康服务类目</td>
											<td width="72" style='width: 54.00pt;'><a
												id="submit_adjust_link" onclick="return show_confirm();"
												href="../my_reservation/cancell_reservation.jsp?type=adjust&clinic_reservation_normal_id=\%>"><big>添加场馆</big></a>


											</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' >望京馆</td>
											<td >中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" >健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td >修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' >展览路馆</td>
											<td >中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" >健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td >修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="19" style='height: 14.25pt;'>
											<td height="19" style='height: 14.25pt;' >五棵松馆</td>
											<td >中医内科、中医外科、妇科、儿科、针推科</td>
											<td />
											<td >修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>
										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' >三里屯SOH<span
												style='display: none;'>O馆</span></td>
											<td >中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" >健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td >修改 删除</td>
										</tr>
										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>
									</table>
									
									



									<table width="648" border="0" cellpadding="0" cellspacing="0"
										style='width: 486.00pt; border-collapse: collapse; table-layout: fixed;'>
										<tr height="19" style='height: 14.25pt;'>
											<td height="19" width="72"
												style='height: 14.25pt; width: 54.00pt;'>招生在线</td>
											<td width="72" style='width: 54.00pt;'><a
												id="submit_adjust_link" onclick="return show_confirm();"
												href="../my_reservation/cancell_reservation.jsp?type=adjust&clinic_reservation_normal_id=\%>"><big>添加学堂</big></a>


											</td>
										</tr>

										<tr>
											<td colspan="2"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td >科普学堂</td>

											<td >修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td >紫禁学堂</td>

											<td >修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor %>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td >国医学堂</td>

											<td >修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor %>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td >翰林学堂</td>

											<td >修改 删除</td>
										</tr>
									</table>

									</div> --%>


			<div id="outpatient_time_manage" style="display:;">
				<!-- <table 
										style='width: 486.00pt; border-collapse: collapse; table-layout: fixed;'> -->
				<table>

					<tr>
						<td><select id="site" name="site">
								<option selected value="0">选择场馆</option>
								<option value="望京馆">望京馆</option>
								<option value="五棵松馆">五棵松馆</option>
								<option value="展览路馆">展览路馆</option>
								<option value="三里屯SOHO馆">三里屯SOHO馆</option>
						</select></td>

						<td><SELECT id="u18">
								<OPTION selected value="选择科室">选择科室</OPTION>
								<OPTION value="中医内科">中医内科</OPTION>
								<OPTION value="中医外科">中医外科</OPTION>
								<OPTION value="妇科">妇科</OPTION>
								<OPTION value="儿科">儿科</OPTION>
								<OPTION value="针推科">针推科</OPTION>
						</SELECT></td>

						<td><select id="site" name="site">
								<option selected value="0">选择时间</option>
								<option value="周一上午9:30-11:30">周一上午9:30-11:30</option>
						</select></td>

						<td><INPUT id="u92" type=text value="医生姓名" class="u92">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="查询">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="删除">
						<td>
						<!-- <td><INPUT id="u94" type="submit" class="u94" value="添加排期"
							onclick="ShowModalWithResult('../admin/add_outpatient_info.jsp?type=add','600px','800px');;return false"" >
						<td> -->
					</tr>

					<tr>
						<td colspan="7"><%@ include
								file="../admin/manage_outpatient.jsp"%>

						</td>

					</tr>

					<tr>
						<td colspan="7"><hr color="<%=sysFontColor%>"></td>
					</tr>


				</table>



			</div>


			
			<div id="reservation_record_manage" style="display:none;">
				<!-- <table 
										style='width: 486.00pt; border-collapse: collapse; table-layout: fixed;'> -->
				<table>

					<tr>
						<td><select id="site" name="site">
								<option selected value="0">选择场馆</option>
								<option value="望京馆">望京馆</option>
								<option value="五棵松馆">五棵松馆</option>
								<option value="展览路馆">展览路馆</option>
								<option value="三里屯SOHO馆">三里屯SOHO馆</option>
						</select></td>

						<td><SELECT id="u18">
								<OPTION selected value="选择科室">选择科室</OPTION>
								<OPTION value="中医内科">中医内科</OPTION>
								<OPTION value="中医外科">中医外科</OPTION>
								<OPTION value="妇科">妇科</OPTION>
								<OPTION value="儿科">儿科</OPTION>
								<OPTION value="针推科">针推科</OPTION>
						</SELECT></td>

						<td><select id="site" name="site">
								<option selected value="0">选择时间</option>
								<option value="周一上午9:30-11:30">周一上午9:30-11:30</option>
						</select></td>

						<td><INPUT id="u92" type=text value="医生姓名" class="u92">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="取消">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="履约">
						<td>
						<td><INPUT id="u94" type="submit" class="u94" value="爽约"
							>
						<td>
					</tr>

					<tr>
						<td colspan="7"><%@ include
								file="../admin/manage_reservation_record.jsp"%>

						</td>

					</tr>

					<tr>
						<td colspan="7"><hr color="<%=sysFontColor%>"></td>
					</tr>


				</table>



			</div>
			



		</td>

	</tr>
</table>
